/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import util.SqlUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/Signup"})
public class Signup extends HttpServlet {

    @Override
    public void init()
    {
        try{
        SqlUtil.connectDb();
        SqlUtil.getConnection();
        SqlUtil.createDatabase();
        SqlUtil.createTable();  
        }
      catch(Exception ex)
      {
          System.out.println("Problem in creation "+ex);
      }
    }
    
    @Override
    public void service(HttpServletRequest request,HttpServletResponse response)
    {
        String admin="admin123";
        String username=request.getParameter("unm");
        String password=request.getParameter("pass");
        String mob_no=request.getParameter("mob_no");
        String email=request.getParameter("email");
        String gender=request.getParameter("gender");
        String city=request.getParameter("city");
        String query="select * from profile";   
        String qry2="insert into student_profile (username,email,gender,contact_no,city) values('"+username+"','"+email+"','"+gender+"','"+mob_no+"','"+city+"');";
        String qry1="insert into student_login (username,password) values('"+username+"','"+password+"');";
     
       try{
            PrintWriter out=response.getWriter();
          ResultSet rs=SqlUtil.read("select username from student_login where username='"+username+"' or '"+admin+"' = '"+username+"' ");
         if(rs.next()==true)
         {
          out.println("<script>alert('Username already exist');document.location.href='login.html';</script>");          
         }
         else
         {
            SqlUtil.insert(qry2);
            SqlUtil.insert(qry1);
            out.println("<script>alert('Account created Successfully');document.location.href='login.html';</script>");       
         }
       }catch(Exception ex)
       {
           System.out.println("*************Problem in insertion************** "+ex);
       }
        
    }
        
    @Override
    public void destroy()
    {
        
    }
}
