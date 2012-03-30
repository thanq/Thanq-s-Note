--按照子串排序
	order by substr ('1233',len('1223')-2,2); 从 len()-2 开始 , 取两个字符
	
--字母数字混合的数据排序
	abc 2
	cba 1
	--oracle 
		--order by char -- 将 数字 > ''
		order by replace( 
				translate (data , '1234567890','##########')-- 将对应的内容(数字)>'#'
			,'#','')
		--order by num 将 非数字 > ''
		order by replace( data
				replace(  -- 得到 'cba 1' 里的 'cba '
					translate (data , '1234567890','##########')-- 将对应的内容(数字)>'#'
					,'#',''
				)
			,'')

		--db2 
		-- translate(data,'####','1234')  -- 参数次序不同
		
-- 引申  字符+数字的串里去数字 / 保留数字
		select  replace( -- 去数字
			translate(data , "1234567890","##########"),
		'#','')
			
			
			
--对空值的排序
	select c1 , c2  
	from(
		select c1 , c2 case when c2  is null then 1 else 0 end as order1 
		from t 
		)
	order by order1  , c2 
		
	-- oracle 
		order by c2 nulls first  / nulls last 
		
--根据属性 键值排序
		select c1 c2 
		from t 
		order by case when c1 = 'test' then c2 else c1 end 
		-- ==
		select c1, c2 , case when c1 = 'test' then c2 else c1 end as order1 
		from t 
		order by order1 
		------------------------


		
		
		
		
// 开始准备 支付宝		

book :重构 , model , thinking , 结构 , sql , 正则 ,  
		
		

drop procedure if exists xx;
delimiter //
create procedure xx(inout xx)
begin

end //
delimiter ;




	protect
	protected 

	encrypt 
	transient 
	synchronized
	volatile
	procedure
	limit 
	limiter 
	delimiter
	guide
	preform
	description
	analysis
	relation
	batch task 
	extension 
	quota 配额
	component 
	infrastructure
	persist
	nested
	strategy 
	postfix // 后缀
	vocation 
	concat 
	coalesce 

	garbage
	interpect 
	generator 
	machine
	jurisdiction  司法权 裁判权
	risk 风险 , vt 冒险
	semantic 语意的 
	dimension 范围 特征 
	formula 方程 公式
	cube 立方
	graph : 图表 
	deal 分配
	gather 聚集 收集 check  检查
	social adj 社会的  , 交际的 
	associate 结交	
	association 联盟 
	associated 联合
	environ
	environment

	pivot
	splice 
	merger
