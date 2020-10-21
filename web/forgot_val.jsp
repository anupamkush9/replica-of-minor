<%-- 
    Document   : forgot_val
    Created on : jun 4, 2020, 7:26:39 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
 try
 {
     SqlUtil.connectDb();
     String username=new String();
     String mobile=new String();
     String city=new String();
     String email=new String();
   
    email =request.getParameter("Email");
    username =request.getParameter("username");
    
    mobile =request.getParameter("mobile");
    city =request.getParameter("city");
//    String q="SELECT password FROM student_login WHERE "
//        + "username = (SELECT username from student_profile where email='"+email+"' "
//        + "and contact_no='"+mobile+"' and city='"+city+"' and username='"+username+"')";
//    ResultSet rs=SqlUtil.read("select password from student_profile,student_login where email='"+email+"' and username='"+username+"' and city='"+city+"'"); 
 ResultSet rs =SqlUtil.read("SELECT password FROM student_login WHERE "
        + "username = (SELECT username from student_profile where email='"+email+"' "
        + "and contact_no='"+mobile+"' and city='"+city+"' and username='"+username+"')");
if(rs.next()==true)
    {
        String pass=rs.getString("password");
        request.setAttribute("Message","Your password : "+pass);
        RequestDispatcher rd=request.getRequestDispatcher("Forgot_password.jsp");
        rd.forward(request, response);
    }
    else{
        request.setAttribute("Message"," Details are Incorrect.");
        RequestDispatcher rd=request.getRequestDispatcher("Forgot_password.jsp");
        rd.forward(request, response);
    }
 }
catch(Exception ex)
{
    request.setAttribute("Message","Try Again");
    RequestDispatcher rd=request.getRequestDispatcher("Forgot_password.jsp");
    rd.forward(request, response);
    System.out.println(""+ex);
}
%>