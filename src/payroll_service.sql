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

#UC4 Show data from table.
mysql> select * from employee_payroll;
+----+---------+--------+------------+
| id | name    | salary | start      |
+----+---------+--------+------------+
|  1 | Bill    | 100000 | 2021-01-03 |
|  2 | Charlie | 200000 | 2019-01-05 |
|  3 | Terisa  | 300000 | 2018-02-06 |
+----+---------+--------+------------+
3 rows in set (0.07 sec)

#UC5 Check according to date range.
mysql> SELECT salary FROM employee_payroll WHERE name = 'Bill';
+--------+
| salary |
+--------+
| 100000 |
+--------+
1 row in set (0.03 sec)

mysql> SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
+----+---------+--------+------------+
| id | name    | salary | start      |
+----+---------+--------+------------+
|  1 | Bill    | 100000 | 2021-01-03 |
|  2 | Charlie | 200000 | 2019-01-05 |
|  3 | Terisa  | 300000 | 2018-02-06 |
+----+---------+--------+------------+
3 rows in set (0.05 sec)

#UC6 Add gender and update.
mysql> ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
Query OK, 0 rows affected (0.78 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE employee_payroll SET gender = 'M' WHERE name='Bill' or name='Charlie';
Query OK, 2 rows affected (0.08 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> UPDATE employee_payroll SET gender = 'F' WHERE name='Terisa';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+--------+--------+------------+
| id | name    | gender | salary | start      |
+----+---------+--------+--------+------------+
|  1 | Bill    | M      | 100000 | 2021-01-03 |
|  2 | Charlie | M      | 200000 | 2019-01-05 |
|  3 | Terisa  | F      | 300000 | 2018-02-06 |
+----+---------+--------+--------+------------+
3 rows in set (0.00 sec)

#UC7 find sum,average,min,max,count.
.............................Sum............................
mysql> SELECT SUM(salary) FROM employee_payroll
    -> WHERE gender = 'F' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|      300000 |
+-------------+
1 row in set (0.04 sec)

mysql> SELECT SUM(salary) FROM employee_payroll
    -> WHERE gender = 'M' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|      300000 |
+-------------+
1 row in set (0.00 sec)
............................Average.................................................
mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY GENDER;
+-------------+
| AVG(salary) |
+-------------+
|      150000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY GENDER;
+-------------+
| AVG(salary) |
+-------------+
|      300000 |
+-------------+
1 row in set (0.00 sec)
..............................min..............................
mysql> SELECT gender, MIN(salary) FROM employee_payroll GROUP BY GENDER;
+--------+-------------+
| gender | MIN(salary) |
+--------+-------------+
| M      |      100000 |
| F      |      300000 |
+--------+-------------+
2 rows in set (0.09 sec)
............................max..............................
mysql> SELECT gender, MAX(salary) FROM employee_payroll GROUP BY GENDER;
+--------+-------------+
| gender | MAX(salary) |
+--------+-------------+
| M      |      200000 |
| F      |      300000 |
+--------+-------------+
2 rows in set (0.00 sec)
.........................count................................
mysql> SELECT gender, COUNT(name) FROM employee_payroll GROUP BY GENDER;
+--------+-------------+
| gender | COUNT(name) |
+--------+-------------+
| M      |           2 |
| F      |           1 |
+--------+-------------+
2 rows in set (0.02 sec)