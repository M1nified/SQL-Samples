# PostgreSQL Cheatsheet - ALTER

## Table

[https://www.postgresql.org/docs/9.1/static/sql-altertable.html](https://www.postgresql.org/docs/9.1/static/sql-altertable.html)

```sql
ALTER TABLE current_table_name
  RENAME TO new_table_name;
```

### Column

```sql
ALTER TABLE table_name_1
  RENAME COLUMN current_column_name TO new_column_name;
```

```sql
ALTER TABLE table_name_1
  ADD COLUMN new_column_name_1 integer,
  DROP COLUMN column_to_drop_name_1 RESTRICT,
  ALTER COLUMN column_to_modify_name_1 TYPE number(5,2), -- automatic cast assumed
  ALTER COLUMN column_to_modify_name_2 SET NOT NULL;
```


Alter column `column_to_modify_name_1 integer` to `column_to_modify_name_1 TIMESTAMP`, which is not an automatic cast:
```sql
ALTER TABLE table_name_1
  ALTER COLUMN column_to_modify_name_1 SET DATA TYPE TIMESTAMP WITH TIME ZONE
  USING
    TIMESTAMP WITH TIME ZONE 'epoch' + column_to_modify_name_1 * interval '1 second',
  ALTER ...;
```

### Key

```sql
ALTER TABLE table_name_1
  ADD PRIMARY KEY ( column_name_1 ),
  ADD FOREIGN KEY ( column_name_2 ) REFERENCES table_name_2 ( column_in_tn2_name_1 ) MATCH FULL;
```