package com.cloud.Controller;

import com.cloud.Dao.DAO;
import com.cloud.Model.FileOb;
import com.cloud.Model.User;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.json.JSONArray;

import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
/**
 * Handles requests for the application file upload requests
 */
@Controller
public class DataOwnerController {

    /**
     * Upload single file using Spring Controller
     * @param dirPath // Directory Path of the Project Context
     * @param file    //  File need to Upload
     * @param session 
     * @param model
     * @return 
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public String uploadFileHandler(@RequestParam("dirpath") String dirPath,@RequestParam("file") MultipartFile file, HttpSession session,ModelMap model) {
        String d = (String) session.getAttribute("user");
        String name = d + "File.txt";
       
        String status = null;
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                // Creating the directory to store file
                //String rootPath = System.getProperty("catalina.home");
                
                
               File save_path = new File(formatPath(session,dirPath) + File.separator);
              
                if (!save_path.exists()) {
                    save_path.mkdirs();
                }

                // Create the file on server
                File serverFile = new File(save_path.getAbsolutePath()  + File.separator + name);
                 System.out.println(serverFile.getAbsolutePath());
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
    
    @RequestMapping(value = "/userLogout", method = RequestMethod.GET)
    public ModelAndView cssLogoutIndex(ModelMap model,HttpSession session) {

         session.removeAttribute("user");  
        return new ModelAndView("Login", "usr", new User());

    }
    
    
}
