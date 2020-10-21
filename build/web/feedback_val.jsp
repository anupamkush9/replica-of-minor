<%-- 
    Document   : feedback
    Created on : jul 2, 2020, 4:51:19 PM
    Author     : asus
--%>

<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
 try
 {
    String feedback =request.getParameter("feedback");
    String user_nm=(String)session.getAttribute("unm");
    SqlUtil.update("insert into feedback(username,feedback_data) values('"+user_nm+"','"+feedback+"')");
    request.setAttribute("Message","Thanks for Your Feedback");
    RequestDispatcher rd=request.getRequestDispatcher("feedback.jsp");
    rd.forward(request, response);
 }
catch(Exception ex)
{
    request.setAttribute("Message","Try Again");
    RequestDispatcher rd=request.getRequestDispatcher("feedback.jsp");
    rd.forward(request, response);
    System.out.println(""+ex);
    
//    timer.js i have to delete 
}
%>