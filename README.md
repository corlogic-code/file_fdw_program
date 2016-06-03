# file_fdw_program

[![PGXN version](https://badge.fury.io/pg/file_fdw_program.svg)](https://badge.fury.io/pg/file_fdw_program)

file_fdw_program is an extension that provides a file_fdw-like foreign data wrapper, but which can read from an external command via the `program` option.

This code is also a patch currently pending for the file_fdw contrib module in 10.0.

## USAGE
For function documentation and examples, see the [file_fdw_program.md file](doc/file_fdw_program.md).

## INSTALLATION

Requirements: PostgreSQL 9.2 or greater.

In the directory where you downloaded file_fdw_program, run

```bash
make && make install
```

Log into PostgreSQL.

Run the following command:

```sql
CREATE EXTENSION file_fdw_program;
```

## UPGRADE

Run "make && make install" same as above to put the script files and libraries in place. Then run the following in PostgreSQL itself:

```sql
ALTER EXTENSION file_fdw_program UPDATE TO '<latest version>';
```
