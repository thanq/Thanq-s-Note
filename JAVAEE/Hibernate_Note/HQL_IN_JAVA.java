//返回 List<...
	Query query = session.createQuery("...");// 创建查询对象
	List<Student> catList = query.list();// 真正执行查询
	Iterator it=list.iterator();
        while(it.hasNext()){
                Student stu=(Student)it.next();//这样的话可以强转 //有泛型另一说
                System.out.println("id"+stu.getId());
                System.out.println("name"+stu.getSname());
                System.out.println("\n");
        }
		
//返回 List<Object[]>	// 当 select c.name ,c.age from ...  时	
    Query query=session.createQuery("select Student.sname,Student.sdept from Student");	
	//select .. from 类名  // 属性查询的结果 可以放在 OBJ数组中
	query.list();
	// list  里 包装的是 对象数组  Object[]
	Iterator it=list.iterator();
        while(it.hasNext()){
                Object[] stu=(Object[])it.next();// ? 能否强转为 Student ? 
                System.out.println("id"+stu[0]);
                System.out.println("name"+stu[1]);
                System.out.println("\n");
        }
		
//返回通过 某个 构造 产生的 List<*Student*>
    Query query=session.createQuery("select new Student(student.name , student.age ) from Student student");
	// OR 	// 在 HQL 里 写构造函数, 要去调用那个构造  将 Object[]--> Student ;


//返回单个的值	//用来计数的统计函数
	Query q=session.createQuery("select count(c) from Cat c");
	Number num=(Number)q.uniqueResult(); //返回单个实例//要求没有 order by  ,
	int count=num.intValue(); //返回数值

//返回List<List> 类型 
	String hql="select new List(c.name,c.mother) from Cat c"'
		List<List> list=session.cresteQuery(hql).list();
		//获取
		For(List row : list){
			For(Object obj : row){
				System.out.println(obj);
			}
		}

//返回List<Map> 类型 // 自动生成的map , 将 new Map( * as name ,* as mother , ..) 
									按照 map.put ("name",value),map.put("mother",value) ... 去封装
	String hql="sesect new Map(c.name as name,c.mother as mother)" + "from Cat c" ;
	List listMap=session.creatgQuery(hql).list();//取得 List<Map>
	//获取
	for(Map map : (List<Map> listMap){
		System.out.println("Name:"+map.get("name"));
		System.out.println("Mother:"+map.get("mother"));
	}

//HQL 分页查询
	String hql="select count(c) from Cat c";
	Long count=(Long)session.createQuery(hql).uniqueResult(); //查询记录总数
	List<Cat> ccList=session.createQuery("from Cat")
		.setFirstResult(0) //从第0 条开始// 从 0 开始 , 和 JDBC 不一样
		.setMaxResults(10).list(); //取10 条数据		

//表连接查询
	String hql=" select e from Event e where e.cat.name='Ketty' ";
	List<Event> eventList=sessionQuery(hql).list();
		Where 子句用到了Car 表
	String hql="select c from Cat c left join c.events e
	where e.description like :str";
	List<Cat> list=session.createQuery(hql).setParameter("str","%dd%").list();

//使用SQL:
	String hql="select * from tb_cat";
	SQLQuery sqlquery=session.createSQLQuery(sql);
	sqlquery.addEntity(Cat.class); //设置输出类型
	List<Cat> catList=sqlquery.list();
	
	//使用 update deleat :
	
		SQLQuery ss = s.createSQLQuery(sql);
		ss.setDate(0, new Date());
		ss.executeUpdate();//

//命名常用的查询 -------------------------------????  怎么用 
	实体类中@注解配置，使用直接引用名字。
	@NamedQuery(name="cat",query="select c from Cat c")
	@NamedNativeQuery(name="cat",query="select * from tb_cat)

//原生事务控制	->  可以
　　Transaction trans=session.beginTransaction();
	　　String hql=”update User user set user.age=20 where user.age=18”;//
	　　Query queryupdate=session.createQuery(hql);
	　　int ret=queryupdate.executeUpdate();
	trans.commit();
	　　通过这种方式我们可以在Hibernate3中，一次性完成批量数据的更新，对性能的提高是相当的可观。
		同样也可以通过类似的方式来完成delete操作，如下面的代码：
	Transaction trans=session.beginTransaction();
	　　String hql=”delete from User user where user.age=18”;//
	　　Query queryupdate=session.createQuery(hql);
	　　int ret=queryupdate.executeUpdate();
　　trans.commit();
	
=====优化统计查询==========================================================

		　　from Customer c inner join c.orders o group by c.age;(1)
			// hibernate 检索 , return  持久化对象, 且会被置于 hibernate 的 session 缓存,hibernate 负责唯一性和与后台的同步
			//当事务提交后,他们才从缓存中清除
			
			select c.ID,c.name,c.age,o.ID,o.order_number,o.customer_ID
　			　from Customer c inner join c.orders c group by c.age;(2)
			//这样返回的是关系数据,不会占用session 缓存, 不会对同步进行修改
			//可以被回收
			//统计操作数据量大,且一般情况下都是只读 : 这时采用(2) , 就可以避免不需要的性能开销, 提高性能

			
			
=====一些HQL支持的运算符=====================================================

数学运算符：+ - * /
?? 比较操作符：= != < <= > >= like
?? 逻辑计算法：and or not
?? SQL 操作符：in 、not in 、between 、is null 、is not null
is empty 、number of
?? 字符串连接：|| 或concat("","")
?? 时间日期函数：current_date() current_time() current_timestamp()
Second() minute() hour() day() month() year()
?? JPA 定义的操作：substring() coalesce() lower() upper() lenth()
Locate() abs() sqrt() bit_lenth() nullif() trim()
?? 数据库支持的SQL 标量函数：sign() trunc() rtrim() sin()
?? 简单的跳转语句：case...when...then...else...end
语法：看高级查询，设置查询条件时，应尽量使用setParameter()传递参数。
		
		
		

	
	
	
		