#usecase1

mysql> CREATE DATABASE AddressBook_Service;
Query OK, 1 row affected (0.02 sec)

mysql> USE AddressBook_Service;
Database changed
mysql> SELECT DATABASE();
+---------------------+
| DATABASE()          |
+---------------------+
| addressbook_service |
+---------------------+
1 row in set (0.00 sec)

#usecase2

mysql> CREATE TABLE addressBook
    -> (
    -> firstName VARCHAR(100) NOT NULL,
    -> lastName VARCHAR(100) NOT NULL,
    -> address VARCHAR(100) NOT NULL,
    -> city VARCHAR(100) NOT NULL,
    -> state VARCHAR(100) NOT NULL,
    -> zipCode INT unsigned NOT NULL,
    -> phoneNumber BIGINT NOT NULL,
    -> email VARCHAR(100) NOT NULL,
    -> PRIMARY KEY (firstName)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> DESCRIBE addressBook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(100) | NO   | PRI | NULL    |       |
| lastName    | varchar(100) | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| city        | varchar(100) | NO   |     | NULL    |       |
| state       | varchar(100) | NO   |     | NULL    |       |
| zipCode     | int unsigned | NO   |     | NULL    |       |
| phoneNumber | bigint       | NO   |     | NULL    |       |
| email       | varchar(100) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.04 sec)

#usecase3

mysql> INSERT INTO addressBook VALUES
    -> ('Nishi','Gautam','Mayr Resident','Lko','Uttar Pradesh',4578,9843218975,'nishi123@gmail.com'),
    -> ('Joey','Joe','Abcdef','Abc','ABC',7878,9875929865,'Joey123@gmail.com'),
    -> ('Monica','Mon','ZCXCNd','Xyz','XYZ',7953,9869869866,'Monica123@gmail.com'),
    -> ('Pheebs','Regina','hjgdfa','Mno','MNO',9806,7859429793,'Pheebs123@gmail.com'),
    -> ('Chandler','Bong','Pkhda','Pqr','PQR',9862,8791824823,'Bong123@gmail.com');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

#usecase4

mysql> UPDATE addressBook
    -> SET zipCode = 9832
    -> WHERE firstName = 'Pheebs';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

#usecase5

mysql> DELETE FROM addressBook
    -> WHERE firstName = 'Nishi';
Query OK, 1 row affected (0.01 sec)

#usecase6

mysql> SELECT * FROM addressBook
    -> WHERE city = 'Abc';
+-----------+----------+---------+------+-------+---------+-------------+-------------------+
| firstName | lastName | address | city | state | zipCode | phoneNumber | email             |
+-----------+----------+---------+------+-------+---------+-------------+-------------------+
| Joey      | Joe      | Abcdef  | Abc  | ABC   |    7878 |  9875929865 | Joey123@gmail.com |
+-----------+----------+---------+------+-------+---------+-------------+-------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM addressBook
    -> WHERE state = 'PQR';
+-----------+----------+---------+------+-------+---------+-------------+-------------------+
| firstName | lastName | address | city | state | zipCode | phoneNumber | email             |
+-----------+----------+---------+------+-------+---------+-------------+-------------------+
| Chandler  | Bong     | Pkhda   | Pqr  | PQR   |    9862 |  8791824823 | Bong123@gmail.com |
+-----------+----------+---------+------+-------+---------+-------------+-------------------+
1 row in set (0.00 sec)

#usecase7

mysql> SELECT city, COUNT(city) FROM addressBook GROUP BY city;
+------+-------------+
| city | COUNT(city) |
+------+-------------+
| Pqr  |           1 |
| Abc  |           1 |
| Xyz  |           1 |
| Mno  |           1 |
+------+-------------+
4 rows in set (0.01 sec)

mysql> SELECT city, COUNT(state) FROM addressBook GROUP BY state;
+------+--------------+
| city | COUNT(state) |
+------+--------------+
| Pqr  |            1 |
| Abc  |            1 |
| Xyz  |            1 |
| Mno  |            1 |
+------+--------------+
4 rows in set (0.00 sec)

#usecase8

mysql> SELECT * FROM addressBook WHERE city = 'Xyz' ORDER BY firstName;
+-----------+----------+---------+------+-------+---------+-------------+---------------------+
| firstName | lastName | address | city | state | zipCode | phoneNumber | email               |
+-----------+----------+---------+------+-------+---------+-------------+---------------------+
| Monica    | Mon      | ZCXCNd  | Xyz  | XYZ   |    7953 |  9869869866 | Monica123@gmail.com |
+-----------+----------+---------+------+-------+---------+-------------+---------------------+
1 row in set (0.00 sec)

#usecsae9

mysql> ALTER TABLE addressBook ADD addressBookName VARCHAR(100) AFTER email;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE addressBook ADD addressBookType VARCHAR(100) AFTER addressBookName;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE addressBook SET addressBookName = 'AddressBook 1' WHERE firstName = 'Monica';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE addressBook SET addressBookType = 'FRIENDS' WHERE firstName = 'Monica';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE addressBook SET addressBookName = 'AddressBook 2' WHERE firstName = 'Joey';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE addressBook SET addressBookType = 'FAMILY' WHERE firstName = 'Joey';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

#usecase10

mysql> SELECT addressBookType, count(*) FROM addressBook GROUP BY addressBookType;
+-----------------+----------+
| addressBookType | count(*) |
+-----------------+----------+
| NULL            |        2 |
| FAMILY          |        1 |
| FRIENDS         |        1 |
+-----------------+----------+
3 rows in set (0.00 sec)
