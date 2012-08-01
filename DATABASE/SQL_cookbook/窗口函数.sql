' 窗口函数 : 使用组函数() 而 不用分组  // 在没有分组的情况下 , 使用组函数 , 

rownumber(  )over(  partition by ..  order by .. ); // 在 结果集出来后 
 窗口函数 会在 where 子句后执行  !
--= 在 包含 group by  语句的sql 中  使用 count(*) , 不会返回 0 ; 应为不能从空表中创建分组  
group by  语句 不会 给 NULL 值 分组  ..  '
select coalesce (name , 'NULL') ,count(name) from t group by name ;
'-- count (*) 将会出现 NULL 5 , * 可以让count function 对 行计数而不对具体的值计数 , 就避免了 count(null) 的情况 
 -- if name 中 包含 null  : NULL 0
--(空值驳论 , 聚集函数会忽略 null '

select coalesce (name , 'NULL') ,count(name) from t group by name ; -- if name 中 包含 null  : NULL 5
'partition by  : 分区    窗口函数里的  分组  表名这个函数的参数集合为  ...  deptNo = 当前 deptNo 的 分组   '
select name ,
		deptNo , 
		count(*) over(partition by deptNo ) as cnt -- 按当前的deptNo 分组 
from emp e

相当于 下面的 高效版本

select name ,
		deptNo , 
		( select conut(*) from emp p where p.deptNo = e.deptNo )
from emp e

-- over 子句中指定 order by 子句时 , 就指定了两件事 : 1 分区中的行如何排序 , 2 在计算中包含哪些行  

		sum (sal) over (order by hiredate 
						range between unbounded preceding -- 从前面所有行 	
						and  unbounded following  	 ) as .. -- 到后面所有行
						
		sum (sal) over (order by hiredate 
						range between unbounded preceding -- 从前面所有行 	
						and  current now ) as .. -- 到当前行 
						
		sum (sal) over (order by hiredate 
						range between 1 preceding 	-- 从框架前一行开始 
						and  current now ) as .. -- 到当前行
	
		sum (sal) over (order by hiredate 
							range between current now
							and  unbounded following  	 ) as .. -- 从当前行到后面所有行
							
		sum (sal) over (order by hiredate 
							range between current now
							and  1 following  	 ) as .. -- 从当前行到后面的一行 
			
			
			
			
			
			
			
			
吸取教训 : 
		资源是 自己 争取的 / 
			雅思 
			好好做人 , 做事 , 承担责任 
			NPY 这个 , 我还承担不起 ,
			做自己的项目 
			
		
		
			
			
			
			
			
			
			
			
			
			
			