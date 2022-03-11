<%-- 
    Document   : singlepost
    Created on : 18 Feb, 2022, 3:36:23 PM
    Author     : Sanskar Kumar
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<% com.tech.blog.entities.user user=(com.tech.blog.entities.user)session.getAttribute("current");
if(user==null)
{
    response.sendRedirect("login.jsp");
}
%>
<% int postid=Integer.parseInt(request.getParameter("id"));
postdao dao=new postdao(ConnectionProvider.getConnection());
post p=dao.getbypost(postid);




%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Single Post</title>
        
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
       
        <% com.tech.blog.entities.post post= new com.tech.blog.entities.post();
      
%>
<input type="hidden" value="<%=postid %>">

                          <div class="container">
           

            <div class="row mb-3">
                <div class="col md-5 ">
                                         <div class="card" style=" margin-top: 35px; border-radius: 15px; background-color: white; border-color:  black; ">
                       
      <div class="card-body">
      <div class=" text-center">
      <img src="pics/<%=p.getPpic()%>" style=" height: 200px; width: 280px;">
      </div>
     <h5 class="card-text" style=" text-align: right" >Blog Id-<%=p.getPid() %></h5>
     <h4 class="card-title" style=" text-decoration: underline;" ><span class=" fa fa-asterisk fa-spin"></span>	<%=p.getPtitle()%></h4>
    <p class="card-text"><%=p.getPcontent()%></p>
    <h5 class="card-text">Code:-<%=p.getPcode() %></h5>
    <br>
    <h6 class="card-text ">Published By :<%=user.getName() %></h6>
    <h6 class="card-text">Published On :<%=p.getPdate().toLocaleString() %></h6>
    <div class="text-center">
    <a href="#" class="btn btn-success text-center"><span class="	fa fa-thumbs-up ">20</span></a>   
    <a href="showblogs.jsp" class="btn btn-danger text-center"><span class=" 	fa fa-reply-all"></span>Back</a>
    <a href="#" class="btn btn-success text-center"><span class="	fa fa-commenting ">15</span></a>
    </div>
    </div>
    </div>
    </div>
    </div>   
    </div>     
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
