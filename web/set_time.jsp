<%-- 
    Document   : set_time
    Created on : Jul 28, 2020, 11:20:57 AM
    Author     : asus
--%>

<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try
            {
            int time=Integer.parseInt(request.getParameter("time"));
    String qry= "update test_time set time_in_minutes='"+time+"' where test_name='test1';"; 
            SqlUtil.connectDb();
            SqlUtil.update(qry);
//            request.setAttribute("Message",time+" min Time has been set");
            RequestDispatcher rd=request.getRequestDispatcher("add_question.jsp");
            rd.forward(request, response);  
            }
            catch(Exception ex)
            {
                
                System.out.println("error in set_time : "+ex);
            }
           
        %>
    </body>
</html>
