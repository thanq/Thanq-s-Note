
drop database sqlbook ;
create database sqlbook ; 
use   sqlbook ;

 create table student (
	sno integer ,
	sname varchar(10),
	age integer 
 );
 
 create table courses (
	con varchar(5),
	title varchar(10),
	credits integer 
 );
 
 create table professor(
	lname varchar(10),
	dept varchar(10),
	salary integer,
	age integer
 ) ;
 
 create table take (
	sno integer ,
	con varchar(5)
 );
 
 create table teach (
	lname varchar(10),
	cno varchar(5)
 );
 
 insert into student values 
 (1,'aaron',20),
 (2,'chuck',21),
 (3,'doug',20),
 (4,'maggie',19),
 (5,'steve',22),
 (6,'jing',18),
 (7,'brian',20),
 (8,'kay',20),
 (9,'gillian',20),
 (10,'chad',21);
 
 insert into courses values 
 ('cs112','physics',4),
 ('cs113','calculus',4),
 ('cs114','history',4);
 
 insert into professor values 
 ('choi','science',400,45),
 ('gunn','history',300,60),
 ('mayer','math',400,55),
 ('pomel','science',500,65),
 ('feuer','math',400,40);
 
 insert into take values 
 (1,'cs112'),
 (1,'cs113'),
 (1,'cs114'),
 ( 2 ,'cs112' ),
 (3,'cs112'),
 (3,'cs114'),
 (4,'cs112'),
 (4,'cs113'),
 (5,'cs113'),
 (6,'cs113'),
 (6,'cs114');
 
 insert into teach values 
 ('choi','cs112'),
 ('choi','cs113'),
 ('choi','cs114'),
 ('pomel','cs113'),
 ('mayer','cs112'),
 ('mayer','cs114');
 
