-- 结果集分页 
	--db2 
		select * from 
			( select rownumber_over() as rn ,t.* )
		where rn between 10  to 20  
	-- oracle 	rownum 
	-- mySql 
		limit 5 offset 0  -- offset (^位置0)1(^位置1)2^ 从 0 这个位置开始  
		
-- 根据等级 , 档次 查找  / name , salary  : t  得到 工资前5 个等级的 所有 人 
	方案1	dense_rank () over (order by salary) : 根据 xx 分等级 
	方案2	
			select name from (
				select
				( select count(salary) from t  where t.salary > t1.salary ) as r,
				name from  t as t1
			)   where   r<=5 

	
		
		