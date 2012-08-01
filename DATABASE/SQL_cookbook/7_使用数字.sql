-- 平均值 : 
	avg() -- 组函数会忽略null , so avg(coalesce( , )) // function coalesce  will return the first value in argument list 
	
-- 计算模式 : (就是出现最多的那个哇 ~　　１　１　１　２　３　４　４　：　模式是　１　)	＼
	
-- 计算中间数 

-- 部门10 总工资 占 所有部门总工资的百分比 : 
	--mysql 
	select ( sum(case when deptNo = 10 then sal end ) / sum(sal) * 100 ) as pct from emp 
	
	--oracle db2  // if  sal is  integer  , need type case 
	select distinct  (sal_10 / total * 100 )  as pct from 
		(
			select deptNo , 
				sum(sal ) over()  as  total , 
				sum(sal ) over (partition by deptNo ) as sal_10 
			from emp e 
		)
	where deptNo = 10 
	