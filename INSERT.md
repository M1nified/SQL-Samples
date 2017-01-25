# PostgreSQL Cheatsheet - INSERT

[https://www.postgresql.org/docs/9.2/static/sql-insert.html](https://www.postgresql.org/docs/9.2/static/sql-insert.html)

## Syntax

```sql
[ WITH [ RECURSIVE ] with_query [, ...] ]
INSERT INTO table_name [ ( column_name [, ...] ) ]
    { DEFAULT VALUES | VALUES ( { expression | DEFAULT } [, ...] ) [, ...] | query }
    [ RETURNING * | output_expression [ [ AS ] output_name ] [, ...] ]
```

## Examples

```sql
INSERT INTO table_name
VALUES
(
  value_for_column_1,
  value_for_column_2
);
```

```sql
INSERT INTO table_name
(
  column_name_1,
  column_name_3
)
VALUES 
(
  value_for_column_1,
  value_for_column_3
)
```

```sql
INSERT INTO table_name_1
SELECT
  value_1 AS column_name_1,
  value_2 AS column_name_2
FROM
  table_name_2
WHERE
  value_3 < 10;
