//���� List<...
	Query query = session.createQuery("...");// ������ѯ����
	List<Student> catList = query.list();// ����ִ�в�ѯ
	Iterator it=list.iterator();
        while(it.hasNext()){
                Student stu=(Student)it.next();//�����Ļ�����ǿת //�з�����һ˵
                System.out.println("id"+stu.getId());
                System.out.println("name"+stu.getSname());
                System.out.println("\n");
        }
		
//���� List<Object[]>	// �� select c.name ,c.age from ...  ʱ	
    Query query=session.createQuery("select Student.sname,Student.sdept from Student");	
	//select .. from ����  // ���Բ�ѯ�Ľ�� ���Է��� OBJ������
	query.list();
	// list  �� ��װ���� ��������  Object[]
	Iterator it=list.iterator();
        while(it.hasNext()){
                Object[] stu=(Object[])it.next();// ? �ܷ�ǿתΪ Student ? 
                System.out.println("id"+stu[0]);
                System.out.println("name"+stu[1]);
                System.out.println("\n");
        }
		
//����ͨ�� ĳ�� ���� ������ List<*Student*>
    Query query=session.createQuery("select new Student(student.name , student.age ) from Student student");
	// OR 	// �� HQL �� д���캯��, Ҫȥ�����Ǹ�����  �� Object[]--> Student ;


//���ص�����ֵ	//����������ͳ�ƺ���
	Query q=session.createQuery("select count(c) from Cat c");
	Number num=(Number)q.uniqueResult(); //���ص���ʵ��//Ҫ��û�� order by  ,
	int count=num.intValue(); //������ֵ

//����List<List> ���� 
	String hql="select new List(c.name,c.mother) from Cat c"'
		List<List> list=session.cresteQuery(hql).list();
		//��ȡ
		For(List row : list){
			For(Object obj : row){
				System.out.println(obj);
			}
		}

//����List<Map> ���� // �Զ����ɵ�map , �� new Map( * as name ,* as mother , ..) 
									���� map.put ("name",value),map.put("mother",value) ... ȥ��װ
	String hql="sesect new Map(c.name as name,c.mother as mother)" + "from Cat c" ;
	List listMap=session.creatgQuery(hql).list();//ȡ�� List<Map>
	//��ȡ
	for(Map map : (List<Map> listMap){
		System.out.println("Name:"+map.get("name"));
		System.out.println("Mother:"+map.get("mother"));
	}

//HQL ��ҳ��ѯ
	String hql="select count(c) from Cat c";
	Long count=(Long)session.createQuery(hql).uniqueResult(); //��ѯ��¼����
	List<Cat> ccList=session.createQuery("from Cat")
		.setFirstResult(0) //�ӵ�0 ����ʼ// �� 0 ��ʼ , �� JDBC ��һ��
		.setMaxResults(10).list(); //ȡ10 ������		

//�����Ӳ�ѯ
	String hql=" select e from Event e where e.cat.name='Ketty' ";
	List<Event> eventList=sessionQuery(hql).list();
		Where �Ӿ��õ���Car ��
	String hql="select c from Cat c left join c.events e
	where e.description like :str";
	List<Cat> list=session.createQuery(hql).setParameter("str","%dd%").list();

//ʹ��SQL:
	String hql="select * from tb_cat";
	SQLQuery sqlquery=session.createSQLQuery(sql);
	sqlquery.addEntity(Cat.class); //�����������
	List<Cat> catList=sqlquery.list();
	
	//ʹ�� update deleat :
	
		SQLQuery ss = s.createSQLQuery(sql);
		ss.setDate(0, new Date());
		ss.executeUpdate();//

//�������õĲ�ѯ -------------------------------????  ��ô�� 
	ʵ������@ע�����ã�ʹ��ֱ���������֡�
	@NamedQuery(name="cat",query="select c from Cat c")
	@NamedNativeQuery(name="cat",query="select * from tb_cat)

//ԭ���������	->  ����
����Transaction trans=session.beginTransaction();
	����String hql=��update User user set user.age=20 where user.age=18��;//
	����Query queryupdate=session.createQuery(hql);
	����int ret=queryupdate.executeUpdate();
	trans.commit();
	����ͨ�����ַ�ʽ���ǿ�����Hibernate3�У�һ��������������ݵĸ��£������ܵ�������൱�Ŀɹۡ�
		ͬ��Ҳ����ͨ�����Ƶķ�ʽ�����delete������������Ĵ��룺
	Transaction trans=session.beginTransaction();
	����String hql=��delete from User user where user.age=18��;//
	����Query queryupdate=session.createQuery(hql);
	����int ret=queryupdate.executeUpdate();
����trans.commit();
	
=====�Ż�ͳ�Ʋ�ѯ==========================================================

		����from Customer c inner join c.orders o group by c.age;(1)
			// hibernate ���� , return  �־û�����, �һᱻ���� hibernate �� session ����,hibernate ����Ψһ�Ժ����̨��ͬ��
			//�������ύ��,���ǲŴӻ��������
			
			select c.ID,c.name,c.age,o.ID,o.order_number,o.customer_ID
��			��from Customer c inner join c.orders c group by c.age;(2)
			//�������ص��ǹ�ϵ����,����ռ��session ����, �����ͬ�������޸�
			//���Ա�����
			//ͳ�Ʋ�����������,��һ������¶���ֻ�� : ��ʱ����(2) , �Ϳ��Ա��ⲻ��Ҫ�����ܿ���, �������

			
			
=====һЩHQL֧�ֵ������=====================================================

��ѧ�������+ - * /
?? �Ƚϲ�������= != < <= > >= like
?? �߼����㷨��and or not
?? SQL ��������in ��not in ��between ��is null ��is not null
is empty ��number of
?? �ַ������ӣ�|| ��concat("","")
?? ʱ�����ں�����current_date() current_time() current_timestamp()
Second() minute() hour() day() month() year()
?? JPA ����Ĳ�����substring() coalesce() lower() upper() lenth()
Locate() abs() sqrt() bit_lenth() nullif() trim()
?? ���ݿ�֧�ֵ�SQL ����������sign() trunc() rtrim() sin()
?? �򵥵���ת��䣺case...when...then...else...end
�﷨�����߼���ѯ�����ò�ѯ����ʱ��Ӧ����ʹ��setParameter()���ݲ�����
		
		
		

	
	
	
		