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
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@author Sanskar Kumar
public class loginservlet extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        
        com.tech.blog.dao.userdao dao=new com.tech.blog.dao.userdao(ConnectionProvider.getConnection());
       com.tech.blog.entities.user user =   dao.getuserby(email, password);
        
        if(user!=null)
        {
         HttpSession session =request.getSession();
         session.setAttribute("current" ,user);
         response.sendRedirect("profile.jsp");
        }
        else
        {
        System.out.println("error");
        HttpSession session =request.getSession();
        session.setAttribute("error" ,"Invalid Email & Password !");
        response.sendRedirect("error.jsp");
        }
        
    }
}
