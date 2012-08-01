select 
    a.orgnam abbr ,
	a.code ,
	a.name,
	a.codeseq,
	a.nimlvl,
	RANK() OVER(PARTITION BY a.PCODE ,a.abbr  ORDER BY a.CODESEQ) as SORT ,
	isnull(b.REST,0)*power(10.0000,4-?) REST1,--@llUnit
	isnull(b.CURDAYREST,0)*power(10.0000,4-?) CURDAYREST1,
	isnull(b.INTERESTINEXP,0)*power(10.0000,4-?) INTERESTINEXP1,
	isnull(b.INPAYRATE,0) INPAYRATE1,
	isnull(c.REST,0)*power(10.0000,4-?) REST2,
    isnull(c.CURDAYREST,0)*power(10.0000,4-?) CURDAYREST2,
	isnull(c.INTERESTINEXP,0)*power(10.0000,4-?) INTERESTINEXP2,-- @llUnit*6
	isnull(c.INPAYRATE,0) INPAYRATE2,
	datediff(day, (substring(?,1,4)+'0101'),?)+1 aa ,--@llDate*2
	datediff(day, (substring(?,1,4)+'0101'),?)+1 bb --@frqDate *2
from ( 
	select 
            orgnam ,orgcod ,code ,name, codeseq, nimlvl ,pcode,abbr
	from NIM_CALIBER_TAB ,(
		select orgnam,orgcod,abbr from CM_ORG  c 
			where  
				( ( '0'= ? and c.ORGCOD= ?) or ( '1'= ?  and c.PORGCOD = ?  ) ) and c.BEGDATE<= ? and c.ENDDATE>= ?
				-- ? @underLvl , @org , @underLvl , @org , llDate ,llDate 
	) t
) a  left join 
        (
			select rest,CURDAYREST,INTERESTINEXP,INPAYRATE ,NIMCODE ,org  from NIM_MIDDLE_TAB where    CCY='90' and TRTAG='9' and DTE='20110930' and FRQ='MM' 
			--? @ccy , @trtag , @llDate , @frq 
		)b  on  b.NIMCODE=a.CODE and b.ORG= a.orgcod
left join  (
			select rest,CURDAYREST,INTERESTINEXP,INPAYRATE  ,NIMCODE ,org  from NIM_MIDDLE_TAB where    CCY='90' and TRTAG='9' and DTE='20110831' and FRQ='MM' 
			--? @ccy , @trtag , @frqDate , @frq 
		)c  on  c.NIMCODE=a.CODE and c.ORG= a.orgcod
order by a.CODESEQ 


select t1.CODE,t1.NAME,t1.CODESEQ,t1.NIMLVL,t1.REST*power(10.0000,4-?) REST1,t1.CURDAYREST*power(10.0000,4-?) CURDAYREST1,
t1.INTERESTINEXP*power(10.0000,4-?) INTERESTINEXP1,t1.INPAYRATE INPAYRATE1,
t2.REST*power(10.0000,4-?) REST2,t2.CURDAYREST*power(10.0000,4-?) CURDAYREST2,
t2.INTERESTINEXP*power(10.0000,4-?) INTERESTINEXP2,t2.INPAYRATE INPAYRATE2,t1.SORT,
datediff(day, (substring(?,1,4)+'0101'),?)+1 aa ,datediff(day, (substring(?,1,4)+'0101'),?)+1 bb
from (select isnull(a.ORG,?) ORG,isnull(a.CCY,?) CCY,isnull(a.TRTAG,?) TRTAG,isnull(a.FRQ,?) FRQ,isnull(a.NIMCODE,b.CODE) NIMCODE,b.CODE,b.NAME,b.CODESEQ,b.NIMLVL,isnull(a.REST,0) REST,isnull(a.CURDAYREST,0) CURDAYREST,isnull(a.INTERESTINEXP,0) INTERESTINEXP,isnull(a.INPAYRATE,0) INPAYRATE,
                 RANK() OVER(PARTITION BY b.PCODE ORDER BY b.CODESEQ) as SORT from NIM_CALIBER_TAB b left join 
                 (select * from NIM_MIDDLE_TAB where ORG=? and CCY=? and TRTAG=? and DTE=? and FRQ=? ) a
on a.NIMCODE=b.CODE ) t1
    left join (select isnull(c.ORG,?) ORG,isnull(c.CCY,?) CCY,isnull(c.TRTAG,?) TRTAG,isnull(c.FRQ,?) FRQ,isnull(c.NIMCODE,d.CODE) NIMCODE,isnull(c.REST,0) REST,isnull(c.CURDAYREST,0) CURDAYREST,isnull(c.INTERESTINEXP,0) INTERESTINEXP,isnull(c.INPAYRATE,0) INPAYRATE 
    from NIM_CALIBER_TAB d left join (select * from NIM_MIDDLE_TAB where ORG=? and CCY=? and TRTAG=? and DTE=? and FRQ=? )c 
    on c.NIMCODE=d.CODE
    ) t2 
    on t1.ORG=t2.ORG and t1.CCY=t2.CCY and t1.TRTAG=t2.TRTAG and t1.FRQ=t2.FRQ and t1.NIMCODE=t2.NIMCODE  
order by t1.CODESEQ











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























