### Cli

```
mysql> source \home\user\Desktop\test.sql;
mysql -h hostname -u user database < path/to/test.sql
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
