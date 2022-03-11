<%-- 
    Document   : navbar
    Created on : 12 Feb, 2022, 6:02:30 PM
    Author     : Sanskar Kumar
--%>
<%@page import="com.tech.blog.entities.*"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-asl-interpreting p-1"></span>Tech Blogs</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-bank p-1"></span>Home <span class="sr-only">(current)</span></a>
      </li>
    
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class=" fa fa-check-square-o p-1"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a href="os.jsp" class="dropdown-item m" >Java</a>
          <a href="python.jsp" class="dropdown-item m" >Python</a>
          
          <a href="golang.jsp" class="dropdown-item m" >Golang</a>
          <a href="java.jsp" class="dropdown-item m" >Operating System</a>
          <a href="cn.jsp" class="dropdown-item m" >Computer Networks</a>
          <a href="database.jsp" class="dropdown-item m" >Database System</a>
          
        </div>
      </li>
             <li class="nav-item active">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#addpost" ><span class="  fa fa-pencil-square-o p-1"></span>Add Blogs</a>
      </li>
  <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><span class="	fa fa-phone p-1"></span>Show Blogs</a>
      </li>

       
    </ul> 
    
            
      <% user u=(user)session.getAttribute("current");
    if(u!=null)
    {%>
    
     
       <a href="" class="btn btn-light my-2 my-sm-0 mr-2 "  data-toggle="modal" data-target="#exampleModal" type="submit" style=" border-radius: 12px;" ><i class="fa fa-user-plus" aria-hidden="true"></i><%= u.getName()%></a>
      <a href="logout" class="btn btn-light my-2 my-sm-0" type="submit" style=" border-radius: 12px;" ><i class="fa fa-user" aria-hidden="true"></i>
 Log Out</a> 
        
       
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content ">
        <div class="modal-header text-center," style=" background-color:whitesmoke; "  >
          <h5 class="modal-title" id="exampleModalLabel" >User Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <div class="modal-body " >
          <div class="container text-center">
              <img src="pics/<%=u.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px;">
            
              <h4 class="mt-3"> <%=u.getName()%></h4>
              <div id="profile-detail">
              <table class="table">
                                 <tbody>
                       <tr>
                          <th>User Id:</th>
                          <td><%=u.getId()%>
                          </td>
                          
                      </tr>
                      <tr>
                          <th>User Name:</th>
                          <td><%=u.getName()%>
                          </td>
                          
                      </tr>
                      <tr>
                          <th>Email:</th>
                          <td><%=u.getEmail()%>
                          </td>
                          
                      </tr>
                     </tbody>
              </table>
              </div>
                          
                          <div id="profile-edit" style=" display: none;" >
                              <h6 class="mt-2">Please Edit Carefully !</h6>
                              <form action="editservlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                 <tbody>
                       <tr>
                          <th>User Id:</th>
                          <td><%=u.getId()%>
                          </td>
                          
                      </tr>
                      <tr>
                          <th>User Name:</th>
                          <td><input type="text" name="name"  class="form-control" value="<%=u.getName()%>">
                          </td>
                          
                      </tr>
                      <tr>
                          <th>Email:</th>
                          <td><input type="text" name="email"  class="form-control" value="<%=u.getEmail()%>">
                          </td>
                          
                      </tr>
                       <tr>
                          <th>Password:</th>
                          <td><input type="password" name="password"  class="form-control" value="<%=u.getPassword()%>">
                          </td>
                          
                      </tr>
                       <tr>
                          <th>New Profile:</th>
                          <td><input type="file" name="image"  class="form-control" >
                          </td>
                          
                      </tr>
                      
                     </tbody>
              </table>
                          <div class="container">
                              <button type="submit" class="btn btn-danger">Save</button>
                          </div>
                              </form>              
                              
                              
                              
                              
                              
                          </div>                    
                          
          </div>
      </div>
                         
      <div class="modal-footer ">
            <button id="edit-profile-button" type="button" class="btn btn-success " data-dismiss="modal">Edit</button>
    
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
    
      </div>
    </div>
  </div>
</div>
 <%  }
    else
    {%>
   
    <a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"  style=" border-radius: 11px;"  > <i class="fa fa-user-plus" aria-hidden="true"></i>Log In</a>
      <a href="register.jsp" class="btn btn-light my-2 my-sm-0" type="submit"  style="margin-right: 6px;  border-radius: 11px;" ><i class="fa fa-user" aria-hidden="true" ></i>
 Sign Up</a> 
         <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2"  style=" border-radius: 11px;"   type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-danger my-2 my-sm-0" type="submit"  style=" border-radius: 11px;" >
           	Search</button>
    </form>
      
         <%}
    %>

    

  </div>
</nav>