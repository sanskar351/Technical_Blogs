/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sanskar Kumar
 */
public class delete extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int blogid=Integer.parseInt(request.getParameter("id"));
    com.tech.blog.dao.postdao  pd=new com.tech.blog.dao.postdao(ConnectionProvider.getConnection());
    boolean f= pd.deletenotes(blogid);
     HttpSession session;
    if(f)
    {
      session =request.getSession();
        session.setAttribute("delete", "Blog Deleted Successfully !");
        response.sendRedirect("showblogs.jsp");
        
    }
    else
    { session=request.getSession();
       session.setAttribute("wrongdelete", "something went wrong");
      
    }
    }

    }


