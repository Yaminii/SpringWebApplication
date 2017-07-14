package com.cloud.Controller;

import com.cloud.Dao.DAO;
import com.cloud.Model.FileOb;
import com.cloud.Model.User;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import com.cloud.Model.FileOb;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller
public class IndexController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String Index(ModelMap model) {

        return "index";

    }

    
    @RequestMapping(value = "/LoginIndex", method = RequestMethod.GET)
    public String LoginIndex(ModelMap model) {


        model.addAttribute("usr",new User());
        return "Login";

    }
  
    
    
     @RequestMapping(value = "/cssprofile1", method = RequestMethod.GET)
    public void Login1Index(@RequestParam("id") String name,ModelMap model,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws FileNotFoundException, IOException {
        File save_path = new File(formatPath(session,"tmp") + File.separator + name);
        File file = new File("F:\\Registration\\target\\RDPC-1.0-SNAPSHOT\\WEB-INF\\download\\pdf\\abc.pdf");
        FileInputStream in = new FileInputStream(file);
        byte[] content = new byte[(int) file.length()];
        in.read(content);
        ServletContext sc = request.getSession().getServletContext();
        String mimetype = sc.getMimeType(file.getName());
        response.reset();
        response.setContentType(mimetype);
        response.setContentLength(content.length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
        org.springframework.util.FileCopyUtils.copy(content, response.getOutputStream());

    }
     @RequestMapping(value = "/cssprofile2", method = RequestMethod.GET)
    public ModelAndView Login4Index(ModelMap model) {

        return new ModelAndView("cssprofile2","usr",new User());

    }
    
    @RequestMapping(value = "/C1", method = RequestMethod.GET)
    @ResponseBody
    public void CSS1Index( HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
 
        
                String fileName = "abc.pdf";
		   File save_path = new File(formatPath(session,"tmp"));
                   response.getWriter().write("server file = " + save_path.getAbsolutePath());
		//Authorized user will download the file
		//File serverFile = new File(save_path.getAbsolutePath()  + File.separator + "a7.txt");
		Path file = Paths.get(save_path.getCanonicalPath(),fileName);
                response.getWriter().write("path  file = " + file.toString());
		if (Files.exists(file)) 
		{
			response.setContentType("text/pdf");
			response.addHeader("Content-Disposition", "attachment; filename="+fileName);
			try 
			{
                            
                                response.getWriter().write("server file = " + save_path.getAbsolutePath());
				Files.copy(file, response.getOutputStream());
				response.getOutputStream().flush();
			} 
			catch (IOException ex) {
				ex.printStackTrace();
			}
		}

    }
    
    @RequestMapping(value = "/download2", method = RequestMethod.GET)
    @ResponseBody
    public void CSS2Index(ModelMap model,HttpServletResponse response,HttpSession session) throws IOException {
          File save_path = new File(formatPath(session,"tmp") + File.separator);
       File serverFile = new File(save_path.getAbsolutePath()  + File.separator + "a7.txt");
         response.setContentType("text/html");  
         PrintWriter out = response.getWriter();  
         //String filename = "home.jsp";   
         //String filepath = "e:\\";   
         response.setContentType("APPLICATION/OCTET-STREAM");   
         response.setHeader("Content-Disposition","attachment; filename=\"" + serverFile.getName() + "\"");   

         FileInputStream fileInputStream = new FileInputStream(serverFile.getAbsolutePath());  

         int i;   
         while ((i=fileInputStream.read()) != -1) {  
         out.write(i);   
        }   
        fileInputStream.close();   
        out.close();   

    }
    
    @RequestMapping(value="/DataOwnerProfile",method=RequestMethod.GET)
    public String dataowner(ModelMap model){
      model.addAttribute("fileobj",new FileOb());
      model.addAttribute("usr", new User());
      return "DataOwnerProfile";
    }
  
	@RequestMapping("/pdf/{fileName:.+}")
	public void downloadPDFResource( HttpServletRequest request,HttpServletResponse response,@PathVariable("fileName") String fileName,HttpSession session) throws IOException 
	{
		//If user is not authorized - he should be thrown out from here itself
		   File save_path = new File(formatPath(session,"tmp"));
                   response.getWriter().write("server file = " + save_path.getAbsolutePath());
		//Authorized user will download the file
		//File serverFile = new File(save_path.getAbsolutePath()  + File.separator + "a7.txt");
		Path file = Paths.get(save_path.getCanonicalPath(),fileName);
                response.getWriter().write("path  file = " + file.toString());
		if (Files.exists(file)) 
		{
			response.setContentType("text/pdf");
			response.addHeader("Content-Disposition", "attachment; filename="+fileName);
			try 
			{
                            
                                response.getWriter().write("server file = " + save_path.getAbsolutePath());
				Files.copy(file, response.getOutputStream());
				response.getOutputStream().flush();
			} 
			catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}
    
    
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    @ResponseBody
    public String fileSaveIndex(ModelMap model,HttpSession session) throws IOException, SQLException, Exception {
        
        ApplicationContext ctx=new ClassPathXmlApplicationContext("/com/rdpc/ds/applicationContext.xml");  
        DAO d = (DAO) ctx.getBean("edao");
        String path=session.getServletContext().getRealPath("/WEB-INF/tmp/split");

       // System.out.println(text);
        JSONObject result = d.Retrieve();
        
        model.addAttribute("fileobj",new FileOb());
        model.addAttribute("usr", new User());
       // model.addAttribute("statusinsertion","Insertion Request Sended Successfully!" );
        
        //return new RedirectView("DataOwnerProfile");
        return result.toString();

    }
    
    
     private String getCurrPath(HttpSession session){
        System.out.println(session.getServletContext().getRealPath("/WEB-INF/DataOwner"));
        return session.getServletContext().getRealPath("/WEB-INF/DataOwner");
        
      
    }
    private String formatPath(HttpSession session,String URI){
        
        return getCurrPath(session) + File.separator + URI;
    }
   
   
    
    

    @RequestMapping(value = "/Register", method = RequestMethod.GET)
    public ModelAndView RegisterIndex(ModelMap model) {

        return new ModelAndView("Register", "usr", new User());

    }
    
     @RequestMapping(value = "/Details", method = RequestMethod.GET)
    public ModelAndView DetailsIndex(ModelMap model) {

        return new ModelAndView("Details", "usr", new User());

    }
   
  

    
}
   
