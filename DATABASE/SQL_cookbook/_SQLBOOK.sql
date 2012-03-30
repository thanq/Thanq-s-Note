
-- MySQL 5.0.*
--
-- Table structure for table emp
--
CREATE TABLE IF NOT EXISTS emp (
  EMPNO int(11) NOT NULL,
  ENAME varchar(32) default NULL,
  JOB varchar(32) default NULL,
  MGR varchar(32) default NULL,
  HIREDATE date default NULL,
  SAL varchar(8) default NULL,
  COMM varchar(16) default NULL,
  DEPTNO varchar(8) default NULL,
  PRIMARY KEY   (EMPNO)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Dumping data for table emp
--
INSERT INTO emp (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES
(7369, 'SMITH', 'CLERK', '7902', '1980-12-17', '800', NULL, '20'),
(7499, 'ALLEN', 'SALESMAN', '7698', '1981-02-20', '1600', '300', '30'),
(7521, 'WARD', 'SALESMAN', '7698', '1981-02-22', '1250', '500', '30'),
(7566, 'JONES', 'MANAGER', '7839', '1981-04-02', '2975', NULL, '20'),
(7654, 'MARTIN', 'SALESMAN', '7698', '1981-09-28', '1250', '1400', '30'),
(7698, 'BLAKE', 'MANAGER', '7839', '1981-05-01', '2850', NULL, '30'),
(7782, 'CLARK', 'MANAGER', '7839', '1981-06-09', '2450', NULL, '10'),
(7788, 'SCOTT', 'ANALYST', '7566', '1982-12-09', '3000', NULL, '20'),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', '5000', NULL, '10'),
(7844, 'TURNER', 'SALESMAN', '7698', '1981-09-08', '1500', '0', '30'),
(7876, 'ADAMS', 'CLERK', '7788', '1983-01-12', '1100', NULL, '20'),
(7900, 'JAMES', 'CLERK', '7698', '1981-12-03', '950', NULL, '30'),
(7902, 'FORD', 'ANALYST', '7566', '1981-12-03', '3000', NULL, '20'),
(7934, 'MILLER', 'CLERK', '7782', '1982-01-23', '1300', NULL, '10');

--
-- table dept
--
CREATE TABLE IF NOT EXISTS dept (
  DEPTNO int(11) NOT NULL,
  DNAME varchar(32) default NULL,
  LOC varchar(32) default NULL,
  PRIMARY KEY   (DEPTNO)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO dept (DEPTNO, DNAME, LOC)
VALUES
('10', 'ACCOUNTING', 'NEW YORK'),
('20', 'RESEARCH', 'DALLAS'),
('30', 'SALES', 'CHICAGO'),
('40', 'OPERATIONS', 'BOSTON');

--
-- table t1
--
CREATE TABLE IF NOT EXISTS t1 (
  ID int(11) NOT NULL,
  PRIMARY KEY   (ID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO t1 (ID)
VALUES
('1');

--
-- table t10
--
CREATE TABLE IF NOT EXISTS t10 (
  ID int(11) NOT NULL,
  PRIMARY KEY   (ID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO t10 (ID)
VALUES
('1'),
('2'),
('3'),
('4'),
('5'),
('6'),
('7'),
('8'),
('9'),
('10');

Learn:
     SQL Cookbook, by Anthony Molinaro.
     Copyright 2006 O'Reilly Media, Inc.

--EOF--