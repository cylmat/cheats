### Cli

```
mysql> source \home\user\Desktop\test.sql;
mysql -h hostname -u user database < path/to/test.sql
```

### dump

```
mysqldump -p -h host.azure.com -u username database_name > db_dump.sql
```

direct migration
```
mysqldump -pPasssss -h host.azure.com -u username database_name | mysql -h hostname -u user -pPawwww database2
```

### Procédures stockées / Fct

```
SELECT * FROM information_schema.routines

SHOW FUNCTION STATUS like 'uuid_to_ouuid'
```

### Remote docker connection

```
docker run --rm -it mysql-client --image=mysql /bin/bash
# inside pod:
mysql --default-character-set=utf8 -h myhost -u "user" -ppass
```

```
kubectl run --rm -it mysql-client --image=mysql:5.7 /bin/bash
```

### Create user

mysql -u root -e "
```
CREATE DATABASE IF NOT EXISTS db CHARACTER SET UTF8;
CREATE USER 'user'@'%' IDENTIFIED BY 'pass';
ALTER USER 'user'@'%' IDENTIFIED BY 'new_pass';
GRANT ALL PRIVILEGES ON db.* TO 'user'@'%';
FLUSH PRIVILEGES;
```
"

### change data !

```
-- CHANGE HERE "SELECT FROM" TO "UPDATE mydb.indicator isi"
SELECT
isi.id AS indicator_id,
isi.industrial_process_id AS current_process_id,
ip_new.id AS new_process_id
FROM mydb.indicator isi
JOIN mydb.indicator_type it ON isi.indicator_type_id = it.id
JOIN mydb.process ip_old ON isi.process_id = ip_old.id
JOIN mydb.unit iu_old ON ip_old.unit_id = iu_old.id
JOIN mydb.process ip_new
JOIN mydb.unit iu_new ON ip_new.unit_id = iu_new.id
-- ADD HERE "SET isi.industrial_process_id = ip_new.id"
WHERE it.code = '0054'
AND iu_old.unit_number = 1
AND iu_old.unit_type_code = 'PLANT'
AND ip_old.process_type_code = 'PLANT'
AND iu_old.site_id = 'e8134a72'
AND iu_new.unit_number = 1
AND iu_new.unit_type_code = 'LINE'
AND ip_new.process_type_code = 'CD'
AND iu_new.site_id = 'e8134a72';
```

### delete sql

```
DELETE isi
FROM indicator isi
JOIN sites.indicator_type it ON isi.indicator_type_id = it.id
WHERE iu.industrial_site_id = '20584b83'
AND it.code LIKE 'C%';
```
