## Char
show character set;
SET NAMES utf8;
\xF0\x9D\x8C\x86

- USE UTF8MB4 -
SET CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

4 ways
mysqld --character-set-server=utf8 --collation-server=utf8_unicode_ci
ALTER DATABASE database_name CHARACTER SET character_set_name COLLATE collation_name;
CREATE TABLE table_name() CHARACTER SET character_set_name COLLATE collation_name
column_name [CHAR | VARCHAR | TEXT] (length) CHARACTER SET character_set_name COLLATE collation_name

## Check
view WITH CHECK OPTION

## Déc
ALTER TABLE <table> MODIFY cost DECIMAL(19,4) zerofill; -- <15>digit.0000

## Events
!!! NO USE OF OUTSIDE TEMPORARY TABLES FOR EVENTS !!!

## Encrypt
https://dev.mysql.com/doc/refman/5.7/en/encryption-functions.html
16 * (trunc(string_length / 16) + 1)
INSERT INTO t VALUES (1,AES_ENCRYPT('text',UNHEX('F3229A0B371ED2D9441B830D21A390C3')));
INSERT INTO t VALUES (1,AES_ENCRYPT('text', UNHEX(SHA2('My secret passphrase',512))));

SET block_encryption_mode = 'aes-256-cbc';
mysql> SET @key_str = SHA2('My secret passphrase',512);
mysql> SET @init_vector = RANDOM_BYTES(16);
mysql> SET @crypt_str = AES_ENCRYPT('text',@key_str,@init_vector);
mysql> SELECT AES_DECRYPT(@crypt_str,@key_str,@init_vector);

## Index
key | index: sorted       - unique no duplicate        - primary key: not null      - cardinality: how often value is represented
DROP INDEX index_name ON table_name [algo{DEFAULT|INPLACE|COPY} | lock{DEFAULT|NONE|SHARED|EXCLUSIVE}];

CREATE TABLE t( a INT NOT NULL, b INT NOT NULL, INDEX a_asc_b_desc (a ASC, b DESC));

Mysql8:
SELECT select_list FROM table_name USE INDEX(index_list) WHERE condition;

## Foreign
Disable foreign key checks e.g.,

    when you import data from a CSV file into a table
    drop tables with foreign keys...

SET foreign_key_checks = 0;

Display constraints
select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'yourTableName';

## Fulltext
ALTER TABLE <table> ADD FULLTEXT(productline);

SELECT productName, productLine FROM products
WHERE MATCH(<column>) AGAINST('<termes_to_search>' IN NATURAL LANGUAGE MODE);
      or
WHERE MATCH(<column>) AGAINST('<+termes> -<noterm1*> -<noterm2>' IN BOOLEAN MODE);  --WITH QUERY EXPANSION
Like: Row by row and discard unmatched (lot of time with big data)
Fulltext: Create separate table with only indexes, more space but fast search

## Join
FROM customers INNER JOIN payments USING (customerNumber)
FROM customers INNER JOIN payments ON customers.customerNumber = payments.customerNumber

## Procédures
SHOW PROCEDURE STATUS WHERE db = <db>;
SELECT  routine_name FROM information_schema.routines WHERE routine_type = 'PROCEDURE' AND routine_schema = '<db>';

show create procedure <procedure>;

## Query
EXPLAIN SELECT * FROM customers WHERE contactFirstName LIKE 'A%' OR contactLastName LIKE 'A%';

## Time
SET time_zone = '+03:00';
SET @dt =  NOW();
SELECT DATE(@dt) FROM xx WHERE DATE(created_at) = '2015-11-05'; --with timestamp

SELECT @dt start, DATE_SUB(@dt, INTERVAL 1 SECOND) '1 second before'  --DATEDIFF(NOW(), dt)

SELECT CURRENT_TIME(), ADDTIME(CURRENT_TIME(), 023000),
DATE_FORMAT(CURDATE(), '%m/%d/%Y') today;
TIME_FORMAT(start_at, '%h:%i %p') start_at,

ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

## Vue
CREATE (algorithm=merge) VIEW customerOrderStats (customerName , orderCount) AS
SELECT customerName, COUNT(orderNumber)FROM
        customers
            INNER JOIN
        orders USING (customerNumber)
    GROUP BY customerName;
  
- - - - - - -

## Check
mysqlcheck -u root -p --auto-repair --optimize --all-databases

## Cloning
create table newone like customers; -- only structure
CREATE TABLE tbl_new AS SELECT * FROM customers; -- all

## Config
[mysql]
default-character-set=utf8

SELECT @@table_open_cache;

## Dump
mysqldump --user=<username> --password=<password> --result-file=<path_to_backup_file> --databases <database_name> [--skip-dump-date]
mysqldump --user=root --password=Supe!rPass1 --result-file=c:\backup\employees.sql classicmodels employees
mysql>source c:\backup\mydb.sql

SHOW FULL TABLES; SHOW TABLES WHERE expression; SHOW TABLES IN mysql LIKE 'time%';
DESCRIBE orders;
SHOW FULL COLUMNS FROM database_name.table_name; SHOW COLUMNS FROM table_name IN database_name;

-- Detailled rows
SHOW COLUMNS FROM <table>\G
show engine innodb status\G

## First chars
SUBSTRING(StudentName,1,5)
LEFT(Studentname,5)

## Like
Select * from Student where studentname like 'ami_'

## Perf
ANALYZE TABLE payments; OPTIMIZE TABLE test; CHECK TABLE test; REPAIR TABLE test;

mysqlcheck -u root -p --auto-repair --check --optimize --all-databases
mysqlslap -u root -p --verbose --create-schema=classicmodels --query="SELECT * FROM test;" --iterations=10 --concurrency=50

https://github.com/major/MySQLTuner-perl
ref: https://severalnines.com/database-blog/mysql-performance-cheat-sheet
