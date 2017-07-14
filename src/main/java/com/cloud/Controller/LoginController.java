package com.cloud.Controller;

import com.cloud.Dao.DAO;
import com.cloud.Model.FileOb;
import com.cloud.Model.User;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import org.apache.log4j.Logger;
import org.json.JSONObject;



@Controller
public class LoginController {


    static Logger log = Logger.getLogger(LoginController.class.getName());
    
    @RequestMapping(value="/userLogin",method=RequestMethod.POST)

    public RedirectView userLogin(@ModelAttribute("usr") User user, String pass,Model model,HttpServletRequest request,HttpServletResponse response,final RedirectAttributes redirectAttributes) throws Exception {

            
          PrintWriter out = response.getWriter();
          ApplicationContext ctx=new ClassPathXmlApplicationContext("/com/rdpc/ds/applicationContext.xml");  
             
          System.out.println( user+" " + pass);  
          DAO u =(DAO)ctx.getBean("edao"); 
    
          JSONObject data = new JSONObject();
          boolean status = true;
          out.write("status"+String.valueOf(status));
          if(status){
              request.getSession(true).setAttribute("user", user);
              model.addAttribute("fileobj",new FileOb());
              model.addAttribute("usr", new User());
              redirectAttributes.addFlashAttribute("newuser","newuser");
              log.info("Status : " + status);
              return new RedirectView("DataOwnerProfile");
              
          }
          else{
                 return new RedirectView("LoginIndexdfd");
          }
          
      
    }
    


    
}
