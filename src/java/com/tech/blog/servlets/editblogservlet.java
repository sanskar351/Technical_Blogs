/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;
import com.tech.blog.entities.post;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Sanskar Kumar
 */
@MultipartConfig
public class editblogservlet extends HttpServlet {


    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        com.tech.blog.entities.post a=new com.tech.blog.entities.post();
                
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        String code=request.getParameter("code");
        Part part=request.getPart("image");
        String imagename=part.getSubmittedFileName();
        HttpSession s=request.getSession();
        
        post p= new post();
            user ug= new user();
            ug=(user) s.getAttribute("current");
 
      
         p.setPtitle(title);
         p.setPcontent(content);
         p.setPcode(code);
         p.setPpic(imagename);
        com.tech.blog.dao.postdao p1=new com.tech.blog.dao.postdao(ConnectionProvider.getConnection());
     boolean ans=  p1.updatepost(p);
        if(ans)
        {
             String path=request.getRealPath("/")+"pics"+File.separator+a.getPpic();
        //delete code
       
         
          helper.deleteFile(path);
             
         
         
             if(helper.saveFile(part.getInputStream(), path))
             {
                     out.println("updated to database");
                     HttpSession session=request.getSession();
                     session.setAttribute("yess", "Edit Successfully!");
                     response.sendRedirect("showblogs.jsp");
               }
   }
      else
      {
          out.println("not updated");
      }

        }
        
        
        
            }



