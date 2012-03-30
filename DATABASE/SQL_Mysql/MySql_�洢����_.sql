delimiter // 													/*  改变结尾界定符  */
DROP PROCEDURE IF EXISTS sp_test //
CREATE PROCEDURE sp_test                                         /* 存储过程名 */
(IN inparms INT,OUT outparams varchar(32))                         /* 输入参数 */
BEGIN                                                           /* 语句块头 */
     DECLARE var CHAR(10);                                      /* 变量声明 */
     DECLARE num int;
     IF inparms = 1 THEN                                         /* IF条件开始*/
         SET var = 'hello';                                        /* 赋值 */
     ELSE
        SET var = 'world';
     END IF;     

	 
	 DECLARE variable1 INT;
     SET variable1 = parameter1 + 1;
     CASE variable1
          WHEN 0 THEN INSERT INTO t VALUES (17);
          WHEN 1 THEN INSERT INTO t VALUES (18);
          ELSE INSERT INTO t VALUES (19);
     END CASE;
	 
	 
	 SET v = 0;
     WHILE v < 5 DO
           INSERT INTO t VALUES (v);
           SET v = v + 1;
      END WHILE;

	 /* IF结束 */
     INSERT INTO t1 VALUES (var);                                /* SQL语句 */
     select count(*) from t1 into num;
     SELECT name FROM t1 LIMIT num, 1 INTO outparams;
END
//
delimiter ;
------------------------------------------------------------------------
case  varible 
	when ~ then ..
	when ~ then .
	else ~ 
end case   -- 与sql 中的 case 不同的是 :  end 后 还有 case : case .. end case // case .. end 

if ~ then .. 
else if ~ then .. 
else ~ 
end if

call sp_test(1, @out);
Select @out;
事先创建表
create table t1(id int not null auto_increment,name varchar(45),primary key pk_id (id));

drop procedure   if exists  procedure1 ;

show  procedure  status 

设置变量 : 
set @t1 = 0 ;
select @t1 := 1 ; -- 可以修改 , 创建
select  c1 , c2  into x , y  from table limit 1 -- 把选中的单行直接存储到变量


-----------------------------------------------------------------------------
触发器中可以使用大多数 T-SQL 语句，但如下一些语句是不能在触发器中使用的。
CREATE 语句，如：CREATE DATABASE、CREATE TABLE、CREATE INDEX 等。
ALTER 语句，如：ALTER DATABASE、ALTER TABLE、ALTER INDEX 等。
DROP 语句，如：DROP DATABASE、DROP TABLE、DROP INDEX 等。
DISK 语句，如：DISK INIT、DISK RESIZE。
LOAD 语句，如：LOAD DATABASE、LOAD LOG。
RESTORE 语句，如：RESTORE DATABASE、RESTORE LOG。
RECONFIGURE
TRUNCATE TABLE 语句在sybase的触发器中不可使用！ 

mysql 内 : source : c:/oa.sql ; 

select TABLE_NAME,TABLE_ROWS from INFORMATION_SCHEMA.TABLES where table_name  = 'oa_m_user' and table_schema = 'oa';
/*这个可以取到 表的row 数 , 但是不精确, 当表条目巨多 ,可以考虑使用 */ 

返回select操作的行数用found_rows()函数； insert、update、delete等操作影响的行数用row_count()函数。 
select count(*) from INFORMATION_SCHEMA.TABLES where table_schema = 'oa';
select found_rows() //1
select * from INFORMATION_SCHEMA.TABLES where table_schema = 'oa';
select found_rows() //很多
SELECT SQL_CALC_FOUND_ROWS * FROM a LIMIT 10 // SQL_CALC_FOUND_ROWS 这个会忽略 limit * 
SELECT FOUND_ROWS()//返回的结果数是不受limit影响的
  
/*
	1 当限制条件多是 count 的效率不是很高  所以用该方法
	2 当没有where 等 限制时  用 count  效率很高
*/

mysql> SELECT NOW();

        -> '1997-12-15 23:50:26'

mysql> SELECT NOW() + 0;

        -> 19971215235026

在一个存储程序或触发器内, NOW() 返回一个常数时间，该常数指示了该程序或触发语句开始执行的时间。这同SYSDATE()的运行有所不同。




1.导出整个数据库
mysqldump -u 用户名 -p --default-character-set=latin1 数据库名 > 导出的文件名(数据库默认编码是latin1)
mysqldump -u wcnc -p smgp_apps_wcnc > wcnc.sql
2.导出一个表
mysqldump -u 用户名 -p 数据库名 表名> 导出的文件名
mysqldump -u wcnc -p smgp_apps_wcnc users> wcnc_users.sql
3.导出一个数据库结构
mysqldump -u wcnc -p -d –add-drop-table smgp_apps_wcnc >d:wcnc_db.sql
-d 没有数据 –add-drop-table 在每个create语句之前增加一个drop table
4.导入数据库
常用source 命令
进入mysql数据库控制台，
如mysql -u root -p
mysql>use 数据库
然后使用source命令，后面参数为脚本文件(如这里用到的.sql)
mysql>source d:wcnc_db.sql




1、建表
命令：create table <表名> ( <字段名1> <类型1> [,..<字段名n> <类型n>]);
mysql> create table MyClass(
> id int(4) not null primary key auto_increment,
> name char(20) not null,
> sex int(4) not null default ''0'',
> degree double(16,2));
2、获取表结构
命令： desc 表名，或者show columns from 表名
mysql>DESCRIBE MyClass
mysql> desc MyClass;
mysql> show columns from MyClass;
mysql> select * from MyClass order by id limit 0,2;

7、在表中增加字段：
命令：alter table 表名 add字段 类型 其他;
例如：在表MyClass中添加了一个字段passtest，类型为int(4)，默认值为0
mysql> alter table MyClass add passtest int(4) default ''0''
8、更改表名：
命令：rename table 原表名 to 新表名;
例如：在表MyClass名字更改为YouClass
mysql> rename table MyClass to YouClass;

更新字段内容
update 表名 set 字段名 = 新内容
update 表名 set 字段名 = replace(字段名,''旧内容'',''新内容'');

文章前面加入4个空格
update article set content=concat(''　　'',content);

字段类型
1．INT[(M)] 型： 正常大小整数类型
2．DOUBLE[(M,D)] [ZEROFILL] 型： 正常大小(双精密)浮点数字类型
3．DATE 日期类型：支持的范围是1000-01-01到9999-12-31。MySQL以YYYY-MM-DD格式来显示DATE值，但是允许你使用字符串或数字把值赋给DATE列
4．CHAR(M) 型：定长字符串类型，当存储时，总是是用空格填满右边到指定的长度
5．BLOB TEXT类型，最大长度为65535(2^16-1)个字符。
6．VARCHAR型：变长字符串类型

5.导入数据库表
　　 （1）创建.sql文件
　　 （2）先产生一个库如auction.c:mysqlbin>mysqladmin -u root -p creat auction，会提示输入密码，然后成功创建。
　　 （2）导入auction.sql文件
　　 c:mysqlbin>mysql -u root -p auction < auction.sql。
　　 通过以上操作，就可以创建了一个数据库auction以及其中的一个表auction。
　　 6．修改数据库
　　 （1）在mysql的表中增加字段：
　　 alter table dbname add column userid int(11) not null primary key auto_increment;
　　 这样，就在表dbname中添加了一个字段userid，类型为int(11)。
　　 7．mysql数据库的授权
　　 mysql>grant select,insert,delete,create,drop
　　 on *.* (或test.*/user.*/..)
　　 to 用户名@localhost
　　 identified by ''密码''；
　　 如：新建一个用户帐号以便可以访问数据库，需要进行如下操作：
　　 mysql> grant usage
　　 -> ON test.*
　　 -> TO testuser@localhost;
　　 Query OK, 0 rows affected (0.15 sec)
　　 此后就创建了一个新用户叫：testuser，这个用户只能从localhost连接到数据库并可以连接到test 数据库。下一步，我们必须指定testuser这个用户可以执行哪些操作：
　　 mysql> GRANT select, insert, delete,update
　　 -> ON test.*
　　 -> TO testuser@localhost;
　　 Query OK, 0 rows affected (0.00 sec)
　　 此操作使testuser能够在每一个test数据库中的表执行SELECT，INSERT和DELETE以及UPDATE查询操作。现在我们结束操作并退出MySQL客户程序：

1:使用SHOW语句找出在服务器上当前存在什么数据库：
mysql> SHOW DATABASES;
2:2、创建一个数据库MYSQLDATA
mysql> Create DATABASE MYSQLDATA;
3:选择你所创建的数据库
mysql> USE MYSQLDATA; (按回车键出现Database changed 时说明操作成功！)
4:查看现在的数据库中存在什么表
mysql> SHOW TABLES;
5:创建一个数据库表
mysql> Create TABLE MYTABLE (name VARCHAR(20), sex CHAR(1));
6:显示表的结构：
mysql> DESCRIBE MYTABLE;
7:往表中加入记录
mysql> insert into MYTABLE values ("hyq","M");
8:用文本方式将数据装入数据库表中（例如D:/mysql.txt）
mysql> LOAD DATA LOCAL INFILE "D:/mysql.txt" INTO TABLE MYTABLE;
9:导入.sql文件命令（例如D:/mysql.sql）
mysql>use database;
mysql>source d:/mysql.sql;
10:删除表
mysql>drop TABLE MYTABLE;
11:清空表
mysql>delete from MYTABLE;
12:更新表中数据
mysql>update MYTABLE set sex="f" where name=''hyq'';

在windows中MySql以服务形式存在，在使用前应确保此服务已经启动，未启动可用net start mysql命令启动。而Linux中启动时可用“/etc/rc.d/init.d/mysqld start"命令，注意启动者应具有管理员权限。

刚安装好的MySql包含一个含空密码的root帐户和一个匿名帐户，这是很大的安全隐患，对于一些重要的应用我们应将安全性尽可能提高，在这里应把匿名帐户删除、 root帐户设置密码，可用如下命令进行：
use mysql;
delete from User where User="";
update User set Password=PASSWORD(''newpassword'') where User=''root'';
如果要对用户所用的登录终端进行限制，可以更新User表中相应用户的Host字段，在进行了以上更改后应重新启动数据库服务，此时登录时可用如下类似命令：
mysql -uroot -p;
mysql -uroot -pnewpassword;
mysql mydb -uroot -p;
mysql mydb -uroot -pnewpassword;
上面命令参数是常用参数的一部分，详细情况可参考文档。此处的mydb是要登录的数据库的名称。
在进行开发和实际应用中，用户不应该只用root用户进行连接数据库，虽然使用root用户进行测试时很方便，但会给系统带来重大安全隐患，也不利于管理技术的提高。我们给一个应用中使用的用户赋予最恰当的数据库权限。如一个只进行数据插入的用户不应赋予其删除数据的权限。MySql的用户管理是通过User表来实现的，添加新用户常用的方法有两个，一是在User表插入相应的数据行，同时设置相应的权限；二是通过GRANT命令创建具有某种权限的用户。其中GRANT的常用用法如下：
grant all on mydb.* to NewUserName@HostName identified by "password" ;
grant usage on *.* to NewUserName@HostName identified by "password";
grant select,insert,update on mydb.* to NewUserName@HostName identified by "password";
grant update,delete on mydb.TestTable to NewUserName@HostName identified by "password";



若要给此用户赋予他在相应对象上的权限的管理能力，可在GRANT后面添加WITH GRANT OPTION选项。而对于用插入User表添加的用户，Password字段应用PASSWORD 函数进行更新加密，以防不轨之人窃看密码。对于那些已经不用的用户应给予清除，权限过界的用户应及时回收权限，回收权限可以通过更新User表相应字段，也可以使用REVOKE操作。
下面给出本人从其它资料(www.cn-java.com)获得的对常用权限的解释：
全局管理权限：
FILE: 在MySQL服务器上读写文件。
PROCESS: 显示或杀死属于其它用户的服务线程。
RELOAD: 重载访问控制表，刷新日志等。
SHUTDOWN: 关闭MySQL服务。
数据库/数据表/数据列权限：
Alter: 修改已存在的数据表(例如增加/删除列)和索引。
Create: 建立新的数据库或数据表。
Delete: 删除表的记录。
Drop: 删除数据表或数据库。
INDEX: 建立或删除索引。
Insert: 增加表的记录。
Select: 显示/搜索表的记录。
Update: 修改表中已存在的记录。
特别的权限：
ALL: 允许做任何事(和root一样)。
USAGE: 只允许登录--其它什么也不允许做。

 

---------------------
MYSQL常用命令
有很多朋友虽然安装好了mysql但却不知如何使用它。在这篇文章中我们就从连接MYSQL、修改密码、增加用户等方面来学习一些MYSQL的常用命令。
　　有很多朋友虽然安装好了mysql但却不知如何使用它。在这篇文章中我们就从连接MYSQL、修改密码、增加用户等方面来学习一些MYSQL的常用命令。 　

　　一、连接MYSQL　

　　格式： mysql -h主机地址 -u用户名 －p用户密码 　　

　　1、例1：连接到本机上的MYSQL

　　首先在打开DOS窗口，然后进入目录 mysqlbin，再键入命令mysql -uroot -p，回车后提示你输密码，如果刚安装好MYSQL，超级用户root是没有密码的，故直接回车即可进入到MYSQL中了，MYSQL的提示符是：mysql> 　　

　　2、例2：连接到远程主机上的MYSQL

　　假设远程主机的IP为：110.110.110.110，用户名为root,密码为abcd123。则键入以下命令： 　　　

　　mysql -h110.110.110.110 -uroot -pabcd123 　　

　　（注:u与root可以不用加空格，其它也一样） 　　

　　3、退出MYSQL命令： exit （回车）


　　二、修改密码　　

　　格式：mysqladmin -u用户名 -p旧密码 password 新密码 　

　　1、例1：给root加个密码ab12。首先在DOS下进入目录mysqlbin，然后键入以下命令 　　

　　mysqladmin -uroot -password ab12 　　

　　注：因为开始时root没有密码，所以-p旧密码一项就可以省略了。 　　

　　2、例2：再将root的密码改为djg345

　　mysqladmin -uroot -pab12 password djg345



　　id int(3) auto_increment not null primary key,

　　注：在建表中（1）将ID设为长度为3的数字字段:int(3)并让它每个记录自动加一:auto_increment并不能为空:not null而且让他成为主字段primary key
　　
　　mysql -uroot -p密码 < c:\school.sql
　
四、将文本数据转到数据库中

　　1、文本数据应符合的格式：字段数据之间用tab键隔开，null值用\n来代替.
　　例：
　　3 rose 深圳二中 1976-10-10
　　4 mike 深圳一中 1975-12-23

　　2、数据传入命令 load data local infile "文件名" into table 表名;
　　注意：你最好将文件复制到\mysql\bin目录下，并且要先用use命令打表所在的库 。

五、备份数据库：（命令在DOS的\mysql\bin目录下执行）

　　mysqldump --opt school>school.bbb
　　注释:将数据库school备份到school.bbb文件，school.bbb是一个文本文件，文件名任取，打开看看你会有新发现。

 

 




2 ALL、DISTINCT、DISTINCTROW、TOP谓词
(1) ALL 返回满足SQL语句条件的所有记录。如果没有指明这个谓词，默认为ALL。
例：SELECT ALL FirstName,LastName
FROM Employees
(2) DISTINCT 如果有多个记录的选择字段的数据相同，只返回一个。
(3) DISTINCTROW 如果有重复的记录，只返回一个
(4) TOP显示查询头尾若干记录。也可返回记录的百分比，这是要用 TOP N PERCENT子句（其中N 表示百分比）
例：返回5%定货额最大的定单

SELECT TOP 5 PERCENT*
FROM [ Order Details]
ORDER BY UnitPrice*Quantity*(1-Discount) DESC



WHERE OrderDate>#1/1/96# AND OrderDate<#1/30/96#
注意：
Mcirosoft JET SQL 中，日期用‘#’定界。日期也可以用Datevalue()函数来代替。在比较字符型的数据时，要加上单引号’’，尾空格在比较中被忽略。
例：
WHERE OrderDate>#96-1-1#
也可以表示为：
WHERE OrderDate>Datevalue(‘1/1/96’)

AVG ( ) 平均值
VAR 方差
STDEV 标准误差
FIRST 第一个值
LAST 最后一个值

六. 用Parameters声明创建参数查询
Parameters声明的语法:
PARAMETERS name datatype[,name datatype[, …]]
其中name 是参数的标志符,可以通过标志符引用参数.
Datatype说明参数的数据类型.
使用时要把PARAMETERS 声明置于任何其他语句之前.

PARAMETERS[Low price] Currency,[Beginning date]datatime
SELECT OrderID ,OrderAmount
FROM Orders
WHERE OrderAMount>[low price]
AND OrderDate>=[Beginning date]

交叉查询可以对数据进行总和,平均,计数或其他总和计算法的计算,这些数据通过两种信息进行分组:一个显示在表的左部,另一个显示在表的顶部.

SELECT 语句
GROUP BY 子句
PIVOT pivotfield[IN(value1 [,value2[,…]]) ]
Aggfounction指SQL聚积函数,
SELECT语句选择作为标题的的字段,
GROUP BY 分组

说明：

Pivotfield 在查询结果集中创建列标题时用的字段或表达式,用可选的IN子句限制它的取值.
value代表创建列标题的固定值.
例:显示在1996年里每一季度每一位员工所接的定单的数目:
TRANSFORM Count(OrderID)
SELECT FirstName&’’&LastName AS FullName
FROM Employees INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
WHERE DatePart(“yyyy”,OrderDate)= ‘1996’
GROUP BY FirstName&’’&LastName
ORDER BY FirstName&’’&LastName
POVOT DatePart(“q”,OrderDate)&’季度’
