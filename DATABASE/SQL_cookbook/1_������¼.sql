--连接列值
	--mySql
	select concat(name ,' work in' , deptName )
	
--select 中使用条件逻辑
	select name ,sal ,
			case when sal <= 2000 then 'underPaid'
				 when sal >= 5000 then 'overPaid'
			     else 'ok'  --如果没有else  return null
			end as status 
	
--限制返回的行数
	--db2  fetch : 取得 , 取到 
		select * from t fetch first 5 row only
	--mySql limit : 限制 
		select * from t limit 5
	--oracle -- oracle  rownum 是在获取每行的值后 才赋予的 
		select * from   (select * ) t  where rownum <=5
		/* 注意 where rownum =2  是 永远得不到结果的*/
	--sql server 
		select top 5 * from t 
		
--随机返回 n 条记录
	--db2
		select * from t order by  rahnd() fetch first 5 row only
	--mySql
		select * from t order by rand()  limit 5
	--oracle
		select * from(
			select * from t order by dbms_random.value()
			) where rownum <=5	
	-- sql server 
		select top 5 * from t order by  newid() ;
		
--null 值替换
		select coalesce(name ,'no name') 
		
		
-- % escape ('/') 逃脱  like _% 
		

	
