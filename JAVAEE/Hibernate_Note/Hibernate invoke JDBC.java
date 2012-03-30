    import java.sql.CallableStatement;  
    import java.sql.Connection;  
    import java.sql.ResultSet;  
    import java.sql.SQLException;  
    import javax.sql.DataSource;  
    import org.springframework.orm.hibernate3.SessionFactoryUtils;  
    import org.springframework.orm.hibernate3.support.HibernateDaoSupport;  
    /** 
    *  
    * <pre> 
    * Title:��hibernate���ô洢���� 
    * ֻ��Ҫ�ƹ�hibernate   ����jdbc   API,��Ȼ��������hibernateҵ����:  
    �������Ǵ��������´洢����:  
    create   or   replace   procedure   batchUpdateCustomer(p_age   in   number)   as      
    begin      
    update   CUSTOMERS   set   AGE=AGE+1   where   AGE> p_age;      
    end;      
    �洢��������һ������p_age������ͻ������䣬Ӧ�ó���ɰ������·�ʽ���ô洢���̣� 
    * Description: �����ܵ�����  
    * </pre> 
    * @author   lichunmei licm@sagessesoft.com 
    * @version 1.00.00 
    * <pre> 
    * �޸ļ�¼ 
    *    �޸ĺ�汾:     �޸��ˣ�  �޸�����:     �޸�����:  
    * </pre> 
    */  
    public class Text extends HibernateDaoSupport {  
    public void  proceduce(){  
       try {  
        DataSource ds= SessionFactoryUtils.getDataSource(getSessionFactory());  
        Connection  conn=ds.getConnection();  
        String sql = "{call batchUpdateCustomer( )}";  
        CallableStatement cstmt = conn.prepareCall(sql);  
        cstmt.setInt(1, 0);//�������������Ϊ0��  
        cstmt.executeUpdate();  
        //ResultSet rs = cstmt.executeQuery(sql);���ǲ�ѯ��ʱ��  
        conn.commit();  
        //rs.close();  
        conn.close();  
      } catch (SQLException e) {  
       e.printStackTrace();  
      }  
    }  
    }  