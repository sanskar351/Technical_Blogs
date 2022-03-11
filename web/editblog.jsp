<%-- 
    Document   : editblog
    Created on : 20 Feb, 2022, 6:55:35 PM
    Author     : Sanskar Kumar
--%>

<%@page import="com.tech.blog.dao.userdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int postid=Integer.parseInt(request.getParameter("id"));
postdao dao=new postdao(ConnectionProvider.getConnection());
post p=dao.getbypost(postid);




%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        
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
         <% com.tech.blog.entities.post post= new com.tech.blog.entities.post();
      
%>
            <%@include file="navbar.jsp" %>
            <% user u1=new user();
            u1=(user)session.getAttribute("current");
if(u1==null)
{ 
    response.sendRedirect("login.jsp");
}
%>
         
          
            <div class="container-fluid">
            <form action="editblogservlet" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-4 offset-4">
                        <div class="card mt-5" style=" border-radius: 10px; border-color: black;">
                            <div class="card-header">
                                <b> <h4 class=" text-center"><b>Edit Your Blog</b></h4></b>
                            </div>
                            <div class="card-body">
                                <table class="table">
                              
                                     <th>Category:</th>
                                     <td>
                                 <div class="form-group">
                                     
                                     <select name="cid" class="form-control">
                                     
                                         <option selected disabled >Select Category</option>
                                          <% 
                                         postdao pd=new postdao(ConnectionProvider.getConnection());
                                         ArrayList<category> list=pd.getallcategory();
                                         for(category c:list)
                                         {  %>
                                         <option value="<% c.getCid();%>" >  <%=c.getName()%></option>
                                        <% }

                                         %>                                
                                     
                                     
                                     </select>
                                </div>
                                       
                                    
                                        
                                      
                                     </td>
                                    <tr>
                          <th>Tittle:</th>
                          <td><input type="text" name="title" value="<%=p.getPtitle()%>" class="form-control"  >
                          </td>
                          
                      </tr>
                                       <tr>
                          <th>Content:</th>
                          <td><input  name="content" value="<%=p.getPcontent()%>"  class="form-control"  >
                          </td>
                          
                      </tr>
                                       <tr>
                          <th>Code</th>
                          <td><input type="text" name="code" value="<%=p.getPcode()%>" class="form-control">
                          </td>
                          
                      </tr>
                                       <tr>
                          <th>Choose Pic:</th>
                          <td><input type="file" name="image" value="<%=p.getPpic()%>" class="form-control"  >
                          </td>
                          
                      </tr>
                          
                                
                                
                                
                                
                                </table>   
                            </div>
                            <div class="card-footer">
                                <div class="text-center">
                          <button type="submit" class="btn btn-success form-group" >Edit</button>
                          
                      </div> 
                            </div>
                                   </div>
                          </div>
           </div>
              </form>
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
