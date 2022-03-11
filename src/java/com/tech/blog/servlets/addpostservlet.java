
package com.tech.blog.servlets;

import com.tech.blog.dao.postdao;
import com.tech.blog.entities.post;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class addpostservlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
     
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        String code=request.getParameter("code");
       Part part=request.getPart("image");
       HttpSession session=request.getSession();
     user u= new user();
            u=(user) session.getAttribute("current");
        post p=new post(title,content,code,part.getSubmittedFileName(),null,u.getId());
        postdao pdao=new postdao(ConnectionProvider.getConnection());
        if(pdao.savepost(p))
        {    

          
            String path=request.getRealPath("/")+"pics"+File.separator+part.getSubmittedFileName();
        helper.saveFile(part.getInputStream(), path);
        
            HttpSession s=request.getSession();
            s.setAttribute("yes", "Blog Added Successfully , "+"Add More...");
           
            response.sendRedirect("profile.jsp");
            
                
        }
        
        else
        {
            out.print("error not inserted");
            response.sendRedirect("error.jsp");
        }
        
    }

   

}
