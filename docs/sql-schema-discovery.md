# SQL Schema Discovery Guide

This guide defines the first documentation pass for a database schema. The goal is to collect enough structured information about schemas, tables, columns, constraints, relationships, indexes, and existing routines to safely design stored procedures or targeted SQL queries.

## Inputs needed

Before running discovery queries, identify:

- Database platform and version.
- Target database name.
- Read-only connection method.
- Schemas to include or exclude.
- Any sensitive tables or columns that require masking in exported documentation.

The first discovery script in this repository targets SQL Server:

- [`sql/sqlserver/schema_inventory.sql`](../sql/sqlserver/schema_inventory.sql)

## How to run the SQL Server inventory

1. Connect to the target database with a read-only account.
2. Open `sql/sqlserver/schema_inventory.sql` in SQL Server Management Studio, Azure Data Studio, or another SQL Server client.
3. Confirm the active database context is the database to document.
4. Run each section and export result sets as CSV, Excel, or Markdown tables.
5. Attach the exported result sets to the schema documentation.

The script is read-only. It queries SQL Server catalog and dynamic management views to describe the database shape without changing data.

## Documentation checklist

Use the query output to produce a schema inventory with these sections.

### Database overview

- Database name, collation, compatibility level, and recovery model.
- Major schemas and ownership.
- Approximate table row counts and storage size.

### Tables and views

For each table or view, document:

- Schema and object name.
- Object type.
- Business purpose, if known.
- Approximate row count for tables.
- Notes about lifecycle, archival behavior, or external ownership.

### Columns

For each column, document:

- Name and ordinal position.
- Data type, length, precision, and scale.
- Nullability.
- Default value.
- Identity or computed-column behavior.
- Sensitive-data classification, if known.
- Business meaning.

### Keys and relationships

For each table, document:

- Primary key columns.
- Foreign key relationships.
- Unique constraints.
- Check constraints.
- Cascade update or delete behavior.

### Indexes

For each index, document:

- Key columns and included columns.
- Uniqueness.
- Filter predicate, if any.
- Whether the index supports a known query pattern.

### Stored procedures and functions

For each routine, document:

- Schema and object name.
- Routine type.
- Parameters, data types, defaults, and output flags.
- Dependencies on tables, views, functions, or other procedures.
- Current business purpose, if known.

## Questions to answer before writing new SQL

- Which table is the source of truth for the entity being queried or changed?
- What columns define uniqueness?
- Which relationships must be joined, and are they required or optional?
- Which filters should always be applied for tenant, status, date range, or soft deletes?
- Are there existing routines that already implement related business rules?
- Which indexes support the intended access pattern?
- What data should never be returned directly because it is sensitive?

## Recommended output format

Start from [`schema-document-template.md`](schema-document-template.md). Create one section per schema and one subsection per table. Keep generated catalog output separate from hand-written business notes so the automated inventory can be refreshed without overwriting analysis.
