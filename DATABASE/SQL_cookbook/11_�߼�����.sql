-- �������ҳ 
	--db2 
		select * from 
			( select rownumber_over() as rn ,t.* )
		where rn between 10  to 20  
	-- oracle 	rownum 
	-- mySql 
		limit 5 offset 0  -- offset (^λ��0)1(^λ��1)2^ �� 0 ���λ�ÿ�ʼ  
		
-- ���ݵȼ� , ���� ����  / name , salary  : t  �õ� ����ǰ5 ���ȼ��� ���� �� 
	����1	dense_rank () over (order by salary) : ���� xx �ֵȼ� 
	����2	
			select name from (
				select
				( select count(salary) from t  where t.salary > t1.salary ) as r,
				name from  t as t1
			)   where   r<=5 

	
		
		