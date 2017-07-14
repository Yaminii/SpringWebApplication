package com.rdpc;

import com.cloud.Dao.DAO;
import com.cloud.Model.User;
import org.junit.Test;
import org.junit.Ignore;
import static org.junit.Assert.assertEquals;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestJunit {

   String message = "Robert";	
  
   

   
   @Test
   public void testLogin() throws Exception{
       
          ApplicationContext ctx=new ClassPathXmlApplicationContext("/com/rdpc/ds/applicationContext.xml");  
             
          
          DAO u =(DAO)ctx.getBean("edao"); 
          
          //boolean status = u.Checklogin(new User("a", "b",null, null));
          //boolean status2 = u.Checklogin(new User("a", "b3",null, null));
         // assertEquals(true,status);
          //assertEquals(false,status2);
   }
}