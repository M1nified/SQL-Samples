# PostgreSQL Cheatsheet - Privileges

Privileges:
- ALL PRIVILEGES
- CONNECT
- CREATE
- DELETE
- EXECUTE
- INSERT
- REFERENCE
- SELECT
- TEMPORARY | TEMP
- TRIGGER
- TRUNCATE
- UPDATE
- USAGE

Actions on privileges:
- ALTER
- DROP
- GRANT
- REVOKE


## DROP

## GRANT

```sql
GRANT INSERT, UPDATE ON table_name_1 TO user_name_1;
GRANT SELECT ON table_name_1 TO PUBLIC;
GRANT ALL PRIVILEGES ON table_name_2 TO user_name_2;
```

```sql
GRANT role_name_1 TO user_name_1;
```

```sql
GRANT ALL PRIVILEGES
  ON ALL TABLES IN SCHEMA schema_name_1
  TO user_name_1;
```

```sql
GRANT ALL PRIVILEGES
  ON table_name_1
  TO user_name_1
  WITH GRANT OPTION;
```

## REVOKE

```sql
REVOKE ALL PRIVILEGES ON table_name_1 FROM PUBLIC;
REVOLE INSERT ON table_name_1 FROM user_name_1;
```

```sql
REVOKE role_name_1 FROM user_name_1;
```

# PostgreSQL Cheatsheet - Users

```sql
CREATE USER new_user_name_1;
DROP USER user_to_be_removed_1;
```

```sql
SELECT user_name_1 FROM pg_user;
```