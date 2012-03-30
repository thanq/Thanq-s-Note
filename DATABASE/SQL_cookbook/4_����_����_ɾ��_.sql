-- insert default 
	insert into D values (default) 
	insert into D(id , num ) values (3 , default) 
	
-- 从一个表向另外的表中复制行 
	insert into t( name , age )
		select name , age 
		from stu 
		where sex = 1 

-- copy 表定义  即结构一样 
	-- db2
	create table dept_2 like dept 
	-- mysql oracle 
	create table dept_2 as 
		select * from dept where 1= 0 
		
--
	where empNo in (select  empNo  from emp_bonus)
	-- 等效于 -- 但下面的更好 , 不用考虑 null 值 问题 
	-- 且 增加了 可读性 结果由where 子句决定 
	where exists (select null from emp_bonus  where emp_bonus.empNo = emp.empNo )
	
--将查询值 插入到另一张表 
	--db2  mysql  oracle 
	update emp e set (e.sal , e.comm) = (
		select ns.sal , ns.sal/2 from new_sal ns 
		where ns.deptNo = e.deptNo 
	)
	where exists (
		select null from  new_sal ns 
		wher ns.deptNo = e.deptNo 
	) -- 在new_sal 表中存在该deptNo 记录
	
-- 删除违反参照完整性的记录 
	delete from emp 
	where not exists (
		select null from dept 
		where emp.deptNo = dept.deptNo 
	)
	
-- 删除重复记录 
	dept from dupes 
	where id not in (
		select min(id) from dupes
		group by name  -- 每个name only 一个 id  去掉多余的..
	)
	
alter table add column w int primary key 

-- 给某个字段添加默认值 :   
ALTER TABLE   CBEB_U_PERIODICAL ALTER COLUMN   PDL_FLAG  SET DEFAULT   '1';


ALTER TABLE `t1`  ADD INDEX `dept` (`dept`);