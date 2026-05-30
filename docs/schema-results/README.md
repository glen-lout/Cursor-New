# Schema Results

This folder stores raw tab-separated schema discovery exports for the `TCR1` database.

| File | Description |
| --- | --- |
| `database_overview.tsv` | Database name, compatibility level, collation, recovery model, and create date. |
| `schemas.tsv` | Database schemas and owners. |
| `columns.tsv` | Column metadata from all three uploaded column chunks. |
| `primary_keys.tsv` | Primary key constraints and key columns. |
| `foreign_keys.tsv` | Foreign key relationships, referential actions, and trust/disabled status. |
| `indexes.tsv` | Index definitions, uniqueness, filters, key columns, and included columns. |
| `check_constraints.tsv` | Check constraint definitions and trust/disabled status. |
| `routine_parameters.tsv` | Stored procedure and function parameter metadata. |
| `routine_dependencies.tsv` | Routine, trigger, and SQL expression dependency metadata. Partial: chunk 1 of 4 has been imported. |

See [`../tcr1-schema-results-summary.md`](../tcr1-schema-results-summary.md) for a generated summary of these exports.
