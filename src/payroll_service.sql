"Welcome to Employee PayRoll service"

#UC1: create database
mysql> CREATE DATABASE payroll_service;
Query OK, 1 row affected (0.27 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| classicmodels      |
| information_schema |
| mysql              |
| newschema          |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
9 rows in set (0.51 sec)

mysql> USE payroll_service;
Database changed
mysql> SELECT DATABASE();

mysql> SELECT DATABASE()
    -> ;
+-----------------+
| DATABASE()      |
+-----------------+
| payroll_service |
+-----------------+
1 row in set (0.00 sec)

#UC2: create a table.
mysql> CREATE TABLE employee_payroll
    -> (
    -> id INT unsigned NOT NULL AUTO_INCREMENT,
    -> name VARCHAR(150) NOT NULL,
    -> salary double NOT NULL,
    -> start DATE NOT NULL,
    -> PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (1.14 sec)

mysql> SHOW TABLES;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_payroll          |
+---------------------------+
1 row in set (0.16 sec)

#UC3: Insert data in table
mysql> INSERT INTO employee_payroll (name, salary, start) VALUES
    -> ('Bill',100000.00, '2021-01-03'),
    -> ('Charlie',200000.00, '2019-01-05'),
    -> ('Terisa',300000.00, '2018-02-06');
Query OK, 3 rows affected (0.27 sec)
Records: 3  Duplicates: 0  Warnings: 0