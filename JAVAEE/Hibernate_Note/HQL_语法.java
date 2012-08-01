HQl : 语法:  
	from { *.class.getName() } as * , {*.class.getName() } as * 
	// *,* => 将产生表连接
	
	inner join : 内联 ; left outer join : 左外连接(left join)
	
		from Cat as cat
		join cat.mate as mate
		left join cat.kittens as kitten
	
	select distinct 别名.字段{要求为 distinct 的 字段} from 映射类名 别名 // 要去重复可以这样 .. 
	//可以查到 不重复的字段 // 应为ID 都不一样, 所以对查出不重复的对象这件事是没有意义的~ 
	
	where * is null / * is not null
	
	delete from Class as c where c.age = 2;
	
	update from Class as c  set c.age = 3 where c.age = 2 ; // 可以批量化操作 
	
	from User user order by user.name asc,user.age desc; // 这个可以排序
	
	在HQL语句中同样支持使用group by子句分组查询，还支持group by子句结合聚集函数的分组统计查询，
	大部分标准的SQL聚集函数都可以在HQL语句中使用，比如：count(),sum(),max(),min(),avg()等。如下面的程序代码：
　		　String hql=”select count(user),user.age from User user group by user.age having count(user)>10 ”;
		// 查询 按照 user.age 分组后  得到 符合条件 分组 的 信息 
　		　List list=session.createQuery(hql).list();

-------------------		
		
Connection conn = session.connection();
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.executeUpdate();
stmt.execute();		
		
---------------
在使用hibernate的query进行update时，如果提示org.hibernate.QueryException: query must begin with SELECT or FROM，不表示hibernate版本的query不支持更新，检查hibernate的配置文件会发现有个属性设置为
<property name="query.factory_class">
      org.hibernate.hql.classic.ClassicQueryTranslatorFactory
</property>
这个属性会使得hibernate不支持更新语句，如果使用executeUpdate执行更新语句就会报错。设置这个属性的是指定hibernate的hql解析器。
