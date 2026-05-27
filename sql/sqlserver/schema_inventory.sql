/*
SQL Server schema inventory

Run this script against the database that needs documentation. The queries are
read-only and return catalog metadata for documenting table structure,
relationships, indexes, and routines before writing stored procedures or
targeted SQL queries.
*/

SET NOCOUNT ON;

/* 1. Database overview */
SELECT
    DB_NAME() AS database_name,
    d.compatibility_level,
    d.collation_name,
    d.recovery_model_desc,
    d.create_date
FROM sys.databases AS d
WHERE d.database_id = DB_ID();

/* 2. Schemas */
SELECT
    s.name AS schema_name,
    USER_NAME(s.principal_id) AS owner_name
FROM sys.schemas AS s
WHERE s.name NOT IN ('db_accessadmin', 'db_backupoperator', 'db_datareader', 'db_datawriter',
                     'db_ddladmin', 'db_denydatareader', 'db_denydatawriter', 'db_owner',
                     'db_securityadmin', 'guest', 'INFORMATION_SCHEMA', 'sys')
ORDER BY s.name;

/* 3. Tables, views, approximate row counts, and storage */
SELECT
    sch.name AS schema_name,
    obj.name AS object_name,
    obj.type_desc AS object_type,
    SUM(CASE WHEN ps.index_id IN (0, 1) THEN ps.row_count ELSE 0 END) AS approximate_row_count,
    SUM(ps.reserved_page_count) * 8 AS reserved_kb,
    SUM(ps.used_page_count) * 8 AS used_kb
FROM sys.objects AS obj
INNER JOIN sys.schemas AS sch
    ON sch.schema_id = obj.schema_id
LEFT JOIN sys.dm_db_partition_stats AS ps
    ON ps.object_id = obj.object_id
WHERE obj.type IN ('U', 'V')
  AND obj.is_ms_shipped = 0
GROUP BY
    sch.name,
    obj.name,
    obj.type_desc
ORDER BY
    sch.name,
    obj.name;

/* 4. Columns */
SELECT
    sch.name AS schema_name,
    obj.name AS object_name,
    obj.type_desc AS object_type,
    col.column_id,
    col.name AS column_name,
    typ.name AS data_type,
    CASE
        WHEN typ.name IN ('nchar', 'nvarchar') AND col.max_length > 0 THEN col.max_length / 2
        WHEN typ.name IN ('char', 'varchar', 'binary', 'varbinary') THEN col.max_length
        ELSE NULL
    END AS character_or_binary_length,
    col.precision,
    col.scale,
    col.is_nullable,
    col.is_identity,
    col.is_computed,
    def.definition AS default_definition,
    cmp.definition AS computed_definition,
    col.collation_name
FROM sys.objects AS obj
INNER JOIN sys.schemas AS sch
    ON sch.schema_id = obj.schema_id
INNER JOIN sys.columns AS col
    ON col.object_id = obj.object_id
INNER JOIN sys.types AS typ
    ON typ.user_type_id = col.user_type_id
LEFT JOIN sys.default_constraints AS def
    ON def.parent_object_id = col.object_id
   AND def.parent_column_id = col.column_id
LEFT JOIN sys.computed_columns AS cmp
    ON cmp.object_id = col.object_id
   AND cmp.column_id = col.column_id
WHERE obj.type IN ('U', 'V')
  AND obj.is_ms_shipped = 0
ORDER BY
    sch.name,
    obj.name,
    col.column_id;

/* 5. Primary keys and unique constraints */
SELECT
    sch.name AS schema_name,
    tbl.name AS table_name,
    kc.name AS constraint_name,
    kc.type_desc AS constraint_type,
    STRING_AGG(col.name, ', ') WITHIN GROUP (ORDER BY ic.key_ordinal) AS key_columns
FROM sys.key_constraints AS kc
INNER JOIN sys.tables AS tbl
    ON tbl.object_id = kc.parent_object_id
INNER JOIN sys.schemas AS sch
    ON sch.schema_id = tbl.schema_id
INNER JOIN sys.index_columns AS ic
    ON ic.object_id = kc.parent_object_id
   AND ic.index_id = kc.unique_index_id
INNER JOIN sys.columns AS col
    ON col.object_id = ic.object_id
   AND col.column_id = ic.column_id
WHERE tbl.is_ms_shipped = 0
GROUP BY
    sch.name,
    tbl.name,
    kc.name,
    kc.type_desc
ORDER BY
    sch.name,
    tbl.name,
    kc.type_desc,
    kc.name;

/* 6. Foreign keys */
SELECT
    fk.name AS foreign_key_name,
    parent_sch.name AS parent_schema_name,
    parent_tbl.name AS parent_table_name,
    STRING_AGG(parent_col.name, ', ') WITHIN GROUP (ORDER BY fkc.constraint_column_id) AS parent_columns,
    referenced_sch.name AS referenced_schema_name,
    referenced_tbl.name AS referenced_table_name,
    STRING_AGG(referenced_col.name, ', ') WITHIN GROUP (ORDER BY fkc.constraint_column_id) AS referenced_columns,
    fk.update_referential_action_desc,
    fk.delete_referential_action_desc,
    fk.is_disabled,
    fk.is_not_trusted
FROM sys.foreign_keys AS fk
INNER JOIN sys.tables AS parent_tbl
    ON parent_tbl.object_id = fk.parent_object_id
INNER JOIN sys.schemas AS parent_sch
    ON parent_sch.schema_id = parent_tbl.schema_id
INNER JOIN sys.tables AS referenced_tbl
    ON referenced_tbl.object_id = fk.referenced_object_id
INNER JOIN sys.schemas AS referenced_sch
    ON referenced_sch.schema_id = referenced_tbl.schema_id
INNER JOIN sys.foreign_key_columns AS fkc
    ON fkc.constraint_object_id = fk.object_id
INNER JOIN sys.columns AS parent_col
    ON parent_col.object_id = fkc.parent_object_id
   AND parent_col.column_id = fkc.parent_column_id
INNER JOIN sys.columns AS referenced_col
    ON referenced_col.object_id = fkc.referenced_object_id
   AND referenced_col.column_id = fkc.referenced_column_id
WHERE parent_tbl.is_ms_shipped = 0
GROUP BY
    fk.name,
    parent_sch.name,
    parent_tbl.name,
    referenced_sch.name,
    referenced_tbl.name,
    fk.update_referential_action_desc,
    fk.delete_referential_action_desc,
    fk.is_disabled,
    fk.is_not_trusted
ORDER BY
    parent_sch.name,
    parent_tbl.name,
    fk.name;

/* 7. Check constraints */
SELECT
    sch.name AS schema_name,
    tbl.name AS table_name,
    chk.name AS check_constraint_name,
    chk.definition,
    chk.is_disabled,
    chk.is_not_trusted
FROM sys.check_constraints AS chk
INNER JOIN sys.tables AS tbl
    ON tbl.object_id = chk.parent_object_id
INNER JOIN sys.schemas AS sch
    ON sch.schema_id = tbl.schema_id
WHERE tbl.is_ms_shipped = 0
ORDER BY
    sch.name,
    tbl.name,
    chk.name;

/* 8. Indexes */
SELECT
    sch.name AS schema_name,
    tbl.name AS table_name,
    idx.name AS index_name,
    idx.type_desc AS index_type,
    idx.is_unique,
    idx.is_primary_key,
    idx.is_unique_constraint,
    idx.has_filter,
    idx.filter_definition,
    STRING_AGG(CASE WHEN ic.is_included_column = 0 THEN col.name END, ', ')
        WITHIN GROUP (ORDER BY ic.key_ordinal, ic.index_column_id) AS key_columns,
    STRING_AGG(CASE WHEN ic.is_included_column = 1 THEN col.name END, ', ')
        WITHIN GROUP (ORDER BY ic.index_column_id) AS included_columns
FROM sys.indexes AS idx
INNER JOIN sys.tables AS tbl
    ON tbl.object_id = idx.object_id
INNER JOIN sys.schemas AS sch
    ON sch.schema_id = tbl.schema_id
INNER JOIN sys.index_columns AS ic
    ON ic.object_id = idx.object_id
   AND ic.index_id = idx.index_id
INNER JOIN sys.columns AS col
    ON col.object_id = ic.object_id
   AND col.column_id = ic.column_id
WHERE tbl.is_ms_shipped = 0
  AND idx.index_id > 0
  AND idx.is_hypothetical = 0
GROUP BY
    sch.name,
    tbl.name,
    idx.name,
    idx.type_desc,
    idx.is_unique,
    idx.is_primary_key,
    idx.is_unique_constraint,
    idx.has_filter,
    idx.filter_definition
ORDER BY
    sch.name,
    tbl.name,
    idx.name;

/* 9. Stored procedures, functions, and parameters */
SELECT
    sch.name AS schema_name,
    obj.name AS routine_name,
    obj.type_desc AS routine_type,
    prm.parameter_id,
    prm.name AS parameter_name,
    typ.name AS data_type,
    CASE
        WHEN typ.name IN ('nchar', 'nvarchar') AND prm.max_length > 0 THEN prm.max_length / 2
        WHEN typ.name IN ('char', 'varchar', 'binary', 'varbinary') THEN prm.max_length
        ELSE NULL
    END AS character_or_binary_length,
    prm.precision,
    prm.scale,
    prm.is_output,
    prm.has_default_value,
    prm.default_value
FROM sys.objects AS obj
INNER JOIN sys.schemas AS sch
    ON sch.schema_id = obj.schema_id
LEFT JOIN sys.parameters AS prm
    ON prm.object_id = obj.object_id
LEFT JOIN sys.types AS typ
    ON typ.user_type_id = prm.user_type_id
WHERE obj.type IN ('P', 'FN', 'IF', 'TF')
  AND obj.is_ms_shipped = 0
ORDER BY
    sch.name,
    obj.name,
    prm.parameter_id;

/* 10. Routine dependencies */
SELECT
    referencing_sch.name AS referencing_schema_name,
    referencing_obj.name AS referencing_object_name,
    referencing_obj.type_desc AS referencing_object_type,
    dep.referenced_schema_name,
    dep.referenced_entity_name,
    referenced_obj.type_desc AS referenced_object_type
FROM sys.sql_expression_dependencies AS dep
INNER JOIN sys.objects AS referencing_obj
    ON referencing_obj.object_id = dep.referencing_id
INNER JOIN sys.schemas AS referencing_sch
    ON referencing_sch.schema_id = referencing_obj.schema_id
LEFT JOIN sys.objects AS referenced_obj
    ON referenced_obj.object_id = dep.referenced_id
WHERE referencing_obj.is_ms_shipped = 0
ORDER BY
    referencing_sch.name,
    referencing_obj.name,
    dep.referenced_schema_name,
    dep.referenced_entity_name;
