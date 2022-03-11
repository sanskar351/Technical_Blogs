<%-- 
    Document   : showblogs
    Created on : 17 Feb, 2022, 8:37:44 PM
    Author     : Sanskar Kumar
--%>

<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

  <% com.tech.blog.entities.user un= (com.tech.blog.entities.user)session.getAttribute("current");
        if(un==null)
        {
            response.sendRedirect("login.jsp");
        }

%>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Blogs</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style>
       .banner_background{
      background-color: 	#ADACAC	;
       clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0 0, 26% 0);
       }
       body
{
    background-color: #DAD7D7;
}
   </style>
   <link href="css/footercss.css" rel="stylesheet" type="text/css"/>
        
        
    </head>
    <body>
          <%@include file="navbar.jsp" %>
 
          
          <h3 class=" text-center mt-1">Explore Your Blogs !</h3>

<% String delete=(String)session.getAttribute("delete");
if(delete!=null)
{
    %>
   
    <div class="alert alert-success " role="alert" style=" width: 242px; margin-left: 640px;" >
                         <%=delete%></div>

                         <%

session.removeAttribute("delete");

 }
%>

                     <%
                         
com.tech.blog.dao.postdao p=new com.tech.blog.dao.postdao(ConnectionProvider.getConnection());
    List<com.tech.blog.entities.post> p1= p.showpost(un.getId());
for(post p2:p1)
{
    


                         %>
                         
                          <div class="container">
           

            <div class="row mb-3">
                <div class="col md-5 ">
                                         <div class="card mt-2" style=" border-radius: 15px; background-color: white; border-color:  darkgrey; ">
                       
  <div class="card-body">
      <div class=" text-center">
      <img src="pics/<%=p2.getPpic()%>" style=" height: 200px; width: 280px;">
      </div>
    <h4 class="card-title"><%=p2.getPtitle()%></h4>
    <p class="card-text"><%=p2.getPcontent()%></p>
    <h5 class="card-text">Code:-<%=p2.getPcode() %></h5>
  
   
         
       
    <div class="text-center">
      <a href="editblog.jsp?id=<%=p2.getPid()%> " class="btn btn-danger text-center">Edit</a>   
    <a href="singlepost.jsp?id=<%=p2.getPid()%>" class="btn btn-success text-center" ><span class="	fa fa-edit "></span>Read More</a>
     <a href="delete?id=<%=p2.getPid()%>" class="btn btn-danger text-center">Delete</a>
    </div>
        
       
  </div>
</div>
                </div>
                   </div>   
     
             </div>       
                         <%   }
%>
               
       
       
        <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="js/myjs.js" type="text/javascript"></script>
<%@include file="footer.jsp" %>
    </body>
</html>
