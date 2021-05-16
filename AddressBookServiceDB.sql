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

#usecase11

mysql> INSERT INTO addressBook VALUES
    -> ('Ross','Tron','QWYT','NYC','Yui',12543,9874327392,'ross123@gmail.com','AddressBook 3','FRIENDS');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO addressBook VALUES
    -> ('Rach','Gren','IOPS','NYC','Yukl',8943,9878737703,'greenr123@gmail.com','AddressBook 4','FAMILY');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM addressBook;
+-----------+----------+---------+------+-------+---------+-------------+---------------------+-----------------+-----------------+
| firstName | lastName | address | city | state | zipCode | phoneNumber | email               | addressBookName | addressBookType |
+-----------+----------+---------+------+-------+---------+-------------+---------------------+-----------------+-----------------+
| Chandler  | Bong     | Pkhda   | Pqr  | PQR   |    9862 |  8791824823 | Bong123@gmail.com   | NULL            | NULL            |
| Joey      | Joe      | Abcdef  | Abc  | ABC   |    7878 |  9875929865 | Joey123@gmail.com   | AddressBook 2   | FAMILY          |
| Monica    | Mon      | ZCXCNd  | Xyz  | XYZ   |    7953 |  9869869866 | Monica123@gmail.com | AddressBook 1   | FRIENDS         |
| Pheebs    | Regina   | hjgdfa  | Mno  | MNO   |    9832 |  7859429793 | Pheebs123@gmail.com | NULL            | NULL            |
| Rach      | Gren     | IOPS    | NYC  | Yukl  |    8943 |  9878737703 | greenr123@gmail.com | AddressBook 4   | FAMILY          |
| Ross      | Tron     | QWYT    | NYC  | Yui   |   12543 |  9874327392 | ross123@gmail.com   | AddressBook 3   | FRIENDS         |
+-----------+----------+---------+------+-------+---------+-------------+---------------------+-----------------+-----------------+
6 rows in set (0.04 sec)

#usecase12

mysql> CREATE TABLE users
    -> (
    -> user_id INT NOT NULL,
    -> firstName VARCHAR(100) NOT NULL,
    -> lastName VARCHAR(100) NOT NULL,
    -> PRIMARY KEY (user_id)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> CREATE TABLE location
    -> (
    -> user_id INT NOT NULL,
    -> address VARCHAR(100) NOT NULL,
    -> city VARCHAR(100) NOT NULL,
    -> state VARCHAR(100) NOT NULL,
    -> zipCode INT NOT NULL,
    -> PRIMARY KEY (user_id) ,
    -> FOREIGN KEY (user_id) REFERENCES users(user_id)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE Contact
    -> (
    -> user_id INT,
    -> phoneNumber BIGINT,
    -> email VARCHAR(100),
    -> FOREIGN KEY(user_id) REFERENCES users(user_id)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> CREATE TABLE ContactType
    -> (
    -> type_id INT,
    -> type_contact VARCHAR(100),
    -> PRIMARY KEY (type_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE user_ContactTypeLink
    -> (
    -> user_id INT,
    -> type_id INT,
    -> FOREIGN KEY(user_id) REFERENCES users(user_id),
    -> FOREIGN KEY(type_id) REFERENCES ContactType(type_id)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> show tables;
+-------------------------------+
| Tables_in_addressbook_service |
+-------------------------------+
| addressbook                   |
| contact                       |
| contacttype                   |
| location                      |
| user_contacttypelink          |
| users                         |
+-------------------------------+
6 rows in set (0.03 sec)

mysql> INSERT INTO users VALUES
    -> (1, 'Alan', 'Ron'),
    -> (2, 'Steve', 'Rogger'),
    -> (3, 'Stef', 'Kingham');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO location VALUES
    -> (1, 'Nish', 'Gautam', 'Lko', '78261'),
    -> (2, 'Nita', 'Iyer', 'Delhi', '85873'),
    -> (3, 'Sam', 'OP', 'Pune', '89692');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Contact VALUES
    -> (1,'8158738923','Abc@gmail.com'),
    -> (2,'8097625187','XYbc@gmail.com'),
    -> (3,'9087352719','IOstac@gmail.com');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO ContactType VALUES
    -> (111,'FRIENDS'),
    -> (222,'FAMILY');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO user_contacttypelink VALUES
    -> (1,10),
    -> (2,100),
    -> (3,101);
