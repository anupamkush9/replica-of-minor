<%-- 
    Document   : save_ans
    Created on : Mar 27, 2019, 2:36:04 PM
    Author     : asus
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="util.SqlUtil"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.*"%>
<%@page import="util.SqlUtil.*"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

        String choice=request.getParameter("q_no");
       String q_no=request.getParameter("n");
      //  System.out.println("question_no="+q_no+" choice is"+choice);
        
        try
        {
         String query="update std_ans set question_no='"+q_no+"',"
              + "answer='"+choice+"' where question_no='"+q_no+"'";
         SqlUtil.update(query);
         %>
     
       <%  }
        catch(Exception ex)
        {
            System.out.println("error in save ans "+ex);
        }
        
        %>
    </body>
</html>
