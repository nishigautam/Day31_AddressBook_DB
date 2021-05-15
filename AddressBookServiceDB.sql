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
