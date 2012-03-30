-- 属性数和属性数据类型相同前提下 叠加记录集
	select name , age from  t1 
	union all 
	select str1 , int1 from t2 
	
	--只是  union (不是union all) 相当于 对 结果集 进行 distinct 
	
-- 找出一个表中存在而另一个表中没有的行 
	-- eg 查询在 emp 表里没有引用到的 dept 记录 // 即 emp 里有deptNo , but dept 里 没有的 
	-- oracle 
	select deptNo from dept
	minus -- 求差集 
	select deptNo from emp 	select deptNo from dept
	
	--db2
	select deptNo from dept
	except -- 求差集  // 从第一个结果集中去掉第二个结果集中也有的行  , 就是只在 deptNo 里 有的 deptNo 
	select deptNo from emp 
	
	--mysql
	select deptNo from dept 
	where deptNo not in (
		select deptNo from emp 
	)
	-- 注意 null 值 问题 ; 如果 dept 里 有deptNo is  null  
	-- not in(10 , null)  相当于 not ( deptNo = 10 or deptNo = null )
	-- 当  deptNo = 20  ,  ->  false or null -> null   // -- SQL 中 true or null is true ;false or null is null
	
	--不受 null 值 影响的:
	-- ! in 本质上是 OR 运算  
	--  20 not in (10,null ) ->  ()运算结果不是 true 而是  null  ; // SQL 中 true or null is true ; false or null is null
	-- so not in (...) 时 要注意 null 值 问题  ,  有 null 值的话是查不出值的
	--(false or null)-> null 
	select deptNo from dept d 
	where not exists (select 1 from emp e where d.deptNo = e.deptNo)
	--  如果子查询查到结果 , exists() true , not exists false : 该记录被抛弃 , 
	-- 未查到结果 , 该记录将返回 
	
	
	
-- 标量子查询 : 
		select c2 , (	select c3 from t  t where t.c2 = t2.c2  ) as cc from tt 
		-- 如果子查询查不到结果 return null  
		--注意 使用标量子查询时 , 必须确保返回的是 标量值(单个值 , 如果返回值超过一行 , 将爆出出错误)
		
-- 如果连接产生重复行 , 避免聚集函数计算错误的方案 : 
		select sum(distinct c1) as cc  --在聚集函数中只对 distince 后的列 计算
		--应该
		select sum() from (
			select distinct ..
		)
		
-- 检测两个表中是否有相同的数据并在结果集中去掉重复( 属性 & value)
	-- 找出一个表中存在而另一个表中没有的行   然后合并  , 
	
		select * from (
			select e.c1 ,count(*) as cnt from e
			group by c1
		) e 
		where not exists (
		--
			select null from (
				select v.c1 ,count(*) as cnt from v 
				group by c1
			)v
			where v.c1 = e.c1 
			and v.cnt =e.cnt 
		--
		)	
		
		
-- full outer join  : left join + right join 
	
-- null   coalesce : 合并
	where coalesce (~ , 0 ) -- 返回第一个 not  null  
		<(select ... )