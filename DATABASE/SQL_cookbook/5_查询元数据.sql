--列出模式中的表 -- 以模式名为 CBRC 为例
	--db2 
	select tabname 
	from syscat.tables
	where tabname = 'EMP' and tabschema = 'CBRC'
	
	--oracle 
	select table_name 
	from all_tables
	where owner = 'CBRC'
	
	--mysql
	select table_name
	from information_schema.tables
	where table_schema = 'CBRC'
	
--列出表的列
	--db2
	select colname , typename , colno 
	from syscat.columns
	where tabname = 'EMP' and tabschema = 'CBRC'
	
	--oracle 
	select column_name ,data_type, column_id
	from all_tab_columns
	where owner = 'CBRC'  and table_name = 'EMP'
	
	-- mysql 
	select column_name , data_type , ordinal_position
	from information_schema.columns
	where table_schema ='CBRC' and table_name = 'EMP'
	
-- 列出给定表的索引,索引的列 , 以及这些列在索引中的位置 
	--db2 
	select a.tabname , a.indname , b.colname , b.colseq 
	from syscat.indexes a , 
		syscat.indexeColuse b 
	where a.tabname = 'EMP'
	and a.tabschema = 'CBRC'
	and a.indschema = b.indschema 
	and a.indname = b.indname 
	
	--oracle 
	select table_name , index_name , column_name ,column_position 
	from sys.all_ind_columns 
	where table_name = 'EMP' and table_schema ='CBRC'
	
	-- mysql 
	show index from emp 
	
-- 列出表的约束 

	--mysql 
	select a.table_name, a.constraint_name,b.column_name ,a.constraint_type
	from information_schema.table_constraints a,
		information_schema.key_column_usage b 
	where  a.table_name ='OA_C_ATTENDANCE_LEAVE'
		and a.table_schema = 'NEW_OA'
		and a.table_name  = b.table_name 
		and a.table_schema = b.table_schema 
		and a.constraint_name = b.constraint_name 
		
	--db2 
	select a.tabname , a.constname , b.colname , a.type
	from syscat.tabconst a,
		syscat.columns b 
	where a.tabname = 'EMP'
	and a.tabschema = 'CBRC'
	and a.tabname = b.tabname 
	and a.tabschema = b.tabschema 
	
	--oracle 
	select a.table_name ,a.constraint_name , b.column_name ,a.constraint_type
	from all_constraints a ,all_cons_columns b 
	where a.owner = 'CBRC'
		and a.table_name = 'EMP'
		and a.table_name = b.table_name 
		and a.owner = b.owner 
		and a.constraint_name = b.constraint_name
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	