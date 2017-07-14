package com.cloud.Controller;

import com.cloud.Dao.DAO;
import com.cloud.Model.User;
import java.io.BufferedOutputStream;
import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;


@Controller
public class RegisterController {

    @RequestMapping(value="/userRegister",method=RequestMethod.POST)
    
    
    @ResponseBody
    public ModelAndView userRegiser(@RequestParam("dirpath") String dirPath,@RequestParam("file") MultipartFile file,@ModelAttribute("usr") User user,Model model,HttpSession session, HttpServletResponse res,HttpServletRequest request) throws IOException {
        ApplicationContext ctx=new ClassPathXmlApplicationContext("/com/rdpc/ds/applicationContext.xml");  
            
           
          PrintWriter out = res.getWriter();
          System.out.println(user.getName()+ " "+ user.getEmail()+" " + user.getMobile());  
          DAO u =(DAO)ctx.getBean("edao"); 
          out.println(user.getName());
          out.println(user.toString());
          u.register(user);
          request.getSession(true).setAttribute("user", user.getName().replace(",","") + "File");
          this.uploadFileHandler(file, session, dirPath,out);
          return new ModelAndView("Register","justregister",user.getName());
    }



 public  String uploadFileHandler(MultipartFile file,HttpSession session,String dirPath,PrintWriter out) {
            String d = (String) session.getAttribute("user");
        String name = d + "File.pdf";
        
        out.println("name =" + name);
        String status = null;
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                // Creating the directory to store file
                //String rootPath = System.getProperty("catalina.home");
                
                
                File save_path = new File(formatPath(session,dirPath) + File.separator);
                out.println("Save path = " + save_path);
                if (!save_path.exists()) {
                    save_path.mkdirs();
                }

                // Create the file on server
                File serverFile = new File(save_path.getAbsolutePath()  + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream( new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                status = "File Uplaod Successfull";
            } catch (Exception e) {
                status = "File Uplaod Failed";
            }
        } else {
            status = "File Uplaod Failed .Because the file was empty.";
        }
         out.println(status);
          return status;
    }
     /* Helper Methods */
    //  Retrieves the Current Working path 
    
    private String getCurrPath(HttpSession session){
        System.out.println(session.getServletContext().getRealPath("/WEB-INF/DataOwner"));
        return session.getServletContext().getRealPath("/WEB-INF/DataOwner");
        
      
    }
    private String formatPath(HttpSession session,String URI){
        
        return getCurrPath(session) + File.separator + URI;
    }
}