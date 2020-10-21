<%-- 
    Document   : admin
    Created on : jan 1, 2020, 7:26:00 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" type="text/css" media="all" href="css/view.css">
          <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
         
    </head>
    <body>
        <%
          //for preventaion from unauthorized user
       
           HttpSession sessi=request.getSession();
            response.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
            response.setHeader("pragma","no-cache");//http 1.0
            response.setHeader("expires","0");//proxies
           
            if(sessi.getAttribute("unm")==null)
            {
               response.sendRedirect("login.html");
            }  
      
         %>
    <h1 style="text-align: center;font-size: 60px;"><b>LOGIN AS ADMIN</b></h1>
<!--   <form action="logout"><input type="submit" style="width: 100px;
           height:40px;font-size: 20px;  float: right;" value="Logout"> </form><br> 
             -->
         <form action="logout">
            <input style="float: right; margin-right: 50px; margin-top: 20px; width: 100px;" type="submit" class="btn btn-danger btn-lg" 
                                   value="Logout">
        </form>
         
      <a style="float: right; margin-right: 50px; margin-top: 20px;" 
         class="btn btn-info btn-lg" href="admin.jsp" id="goback">
          Go Back to Profile</a>
             
    
             <header class="headerbar top"><h1 style="font-size: 40px; padding-top: 20px; text-decoration: underline;">All  STUDENTS  RESULT</h1> </header>
    
            <aside class="rightbar">
                <table id="ques_table" class="table table-hover">
                    <thead>
                        <tr>
                            <th>username</th>
                            <th>remarks</th> 
                        </tr>
                    </thead>
                    <tbody id="table_rows">
                        <%
                   try
                   {   SqlUtil.connectDb();
                        String qry="select * from result";
                       ResultSet rs= SqlUtil.read(qry);
                       while(rs.next())
                       {
                        %>  
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                           
                        </tr>
                        <%
                            }
                       } catch(Exception ex)
                     {
                      System.out.println("error in admin.jsp page is="+ex);
                     }
                        %>
                    </tbody>
                </table>
            </aside>
            <footer class="headerbar bottom"></footer>
       
    </body>
</html>
