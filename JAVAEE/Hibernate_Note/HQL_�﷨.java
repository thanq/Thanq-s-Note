HQl : �﷨:  
	from { *.class.getName() } as * , {*.class.getName() } as * 
	// *,* => ������������
	
	inner join : ���� ; left outer join : ��������(left join)
	
		from Cat as cat
		join cat.mate as mate
		left join cat.kittens as kitten
	
	select distinct ����.�ֶ�{Ҫ��Ϊ distinct �� �ֶ�} from ӳ������ ���� // Ҫȥ�ظ��������� .. 
	//���Բ鵽 ���ظ����ֶ� // ӦΪID ����һ��, ���ԶԲ�����ظ��Ķ����������û�������~ 
	
	where * is null / * is not null
	
	delete from Class as c where c.age = 2;
	
	update from Class as c  set c.age = 3 where c.age = 2 ; // �������������� 
	
	from User user order by user.name asc,user.age desc; // �����������
	
	��HQL�����ͬ��֧��ʹ��group by�Ӿ�����ѯ����֧��group by�Ӿ��Ͼۼ������ķ���ͳ�Ʋ�ѯ��
	�󲿷ֱ�׼��SQL�ۼ�������������HQL�����ʹ�ã����磺count(),sum(),max(),min(),avg()�ȡ�������ĳ�����룺
��		��String hql=��select count(user),user.age from User user group by user.age having count(user)>10 ��;
		// ��ѯ ���� user.age �����  �õ� �������� ���� �� ��Ϣ 
��		��List list=session.createQuery(hql).list();

-------------------		
		
Connection conn = session.connection();
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.executeUpdate();
stmt.execute();		
		
---------------
��ʹ��hibernate��query����updateʱ�������ʾorg.hibernate.QueryException: query must begin with SELECT or FROM������ʾhibernate�汾��query��֧�ָ��£����hibernate�������ļ��ᷢ���и���������Ϊ
<property name="query.factory_class">
      org.hibernate.hql.classic.ClassicQueryTranslatorFactory
</property>
������Ի�ʹ��hibernate��֧�ָ�����䣬���ʹ��executeUpdateִ�и������ͻᱨ������������Ե���ָ��hibernate��hql��������
