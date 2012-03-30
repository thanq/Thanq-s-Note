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
    * Title:在hibernate中用存储过程 
    * 只是要绕过hibernate   调用jdbc   API,当然事务还是由hibernate业管理:  
    假如我们创建了以下存储过程:  
    create   or   replace   procedure   batchUpdateCustomer(p_age   in   number)   as      
    begin      
    update   CUSTOMERS   set   AGE=AGE+1   where   AGE> p_age;      
    end;      
    存储过程中有一个参数p_age，代表客户的年龄，应用程序可按照以下方式调用存储过程： 
    * Description: 程序功能的描述  
    * </pre> 
    * @author   lichunmei licm@sagessesoft.com 
    * @version 1.00.00 
    * <pre> 
    * 修改记录 
    *    修改后版本:     修改人：  修改日期:     修改内容:  
    * </pre> 
    */  
    public class Text extends HibernateDaoSupport {  
    public void  proceduce(){  
       try {  
        DataSource ds= SessionFactoryUtils.getDataSource(getSessionFactory());  
        Connection  conn=ds.getConnection();  
        String sql = "{call batchUpdateCustomer( )}";  
        CallableStatement cstmt = conn.prepareCall(sql);  
        cstmt.setInt(1, 0);//把年龄参数设置为0；  
        cstmt.executeUpdate();  
        //ResultSet rs = cstmt.executeQuery(sql);若是查询的时候  
        conn.commit();  
        //rs.close();  
        conn.close();  
      } catch (SQLException e) {  
       e.printStackTrace();  
      }  
    }  
    }  