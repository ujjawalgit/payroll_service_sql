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