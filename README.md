# Cursor-New

This repository contains documentation and SQL assets for discovering and documenting a database schema before writing stored procedures or application queries.

## SQL schema discovery

- Start with the [schema discovery guide](docs/sql-schema-discovery.md).
- Run the SQL Server inventory script in [`sql/sqlserver/schema_inventory.sql`](sql/sqlserver/schema_inventory.sql) against the target database.
- Use the [schema documentation template](docs/schema-document-template.md) to document tables, columns, keys, relationships, indexes, and existing stored procedures before designing new database logic.
