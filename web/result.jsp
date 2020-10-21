<%-- 
    Document   : result
    Created on : Mar 29, 2020, 5:08:55 AM
    Author     : asus
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Satisfy&display=swap" rel="stylesheet">
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <title>result Page</title>
        <style>
               #feedback{
                position: fixed;
                margin-top:450px;
                margin-left: 300px;
               
            }
            #logout_id{
                position:fixed;
                margin-top:450px;
                margin-left: 600px;
                
            }
             .feed
     	    {
                display: inline-block;
                margin-top:50px;
                margin-left:220px;
                width: 55%;
                padding:10px 22px 50px 30px;
                position: fixed;
                background-color: black;
               
                
            }
           b,h2
            {
            	color:white;
            	opacity: 1;
            }
          </style>
    </head>
    <body background="image/background.jpg">
         
        <%! 
             String student_ans[]=new String[51];
             String correct_ans[]=new String[51];
             int num_of_rows=0,student_attempt=0;
             int  attempt[]=new int[51];
              String user_nmm;
        %>
      <%
            // FOR PREVENTION FROM THE UNAUTHORIZED USER
//           response.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
//            response.setHeader("pragma","no-cache");//http 1.0
//            response.setHeader("expires","0");//proxies
//           
           user_nmm=(String)session.getAttribute("unm");
           
            if(user_nmm==null)
            {
               response.sendRedirect("login.html");
            }
       %>
      
	
	<h1 class="st-font" style="text-align: center; margin-top: 50px; font-size: 60px;"><b>RESULT</b></h1>
    
    <%
            try
            {
            SqlUtil.connectDb();
            String query="select count(*) from std_ans where answer is not null";
            ResultSet r=SqlUtil.read(query);
            while(r.next())
            {  student_attempt=r.getInt("count(*)");
//               System.out.println("no of student_attempt question are="+student_attempt);
            }
            }catch(Exception ex)
            {   System.out.println("error in calculation of no of rows"+ex); }
                
          // for the no of all question in the paper
            try
            {
            SqlUtil.connectDb();
            String query="select count(*) from question";
            ResultSet r=SqlUtil.read(query);
            while(r.next())
            {  num_of_rows=r.getInt("count(*)");
             //  System.out.println("no of rows are="+num_of_rows);
            }
            }catch(Exception ex)
            {   System.out.println("error in calculation of no of rows"+ex); }
                
            
            try
            {
            SqlUtil.connectDb();
            String query="select question_no from std_ans where  answer is not null ";
            
            ResultSet r=SqlUtil.read(query);
            int index=0;
            //while((boolean))
             for (int k = 0; k<student_attempt ; k++)
            {  
                r.next();
                attempt[index]=r.getInt("question_no");
                index++;   
            }
            }catch(Exception ex)
            {   System.out.println("error in calculation of index rows"+ex); }
             
            try{
                 Class.forName("com.mysql.jdbc.Driver");
           Connection conn= DriverManager.getConnection("jdbc:mysql://localhost/quiz","root","root");
           Statement stmt1=conn.createStatement();
            Statement stmt2=conn.createStatement();
            
                ResultSet rs=null;  
                 ResultSet rr=null;
        SqlUtil.connectDb();
        String q="select answer from std_ans";
        String qq="select correct_ans from question";
         rs=stmt1.executeQuery(q);
         rr=stmt2.executeQuery(qq);
        //rs contains the student_answer like anupam
        //rr contains the correct answer which is set by the admin/faculty
            for (int i = 0; rs.next() ; i++)
            { //System.out.println("for loop");
            student_ans[i]=rs.getString("answer");
           //  System.out.println("---->"+student_ans[i]);
            }
         
            for (int j = 0; j<num_of_rows ; j++)
            {  // System.out.println("while loop");
            rr.next();
             correct_ans[j]=rr.getString("correct_ans");
          //   System.out.println("---->"+correct_ans[j]);
            }
          }catch(Exception ex)
            {
           System.out.println("error on geting student correct ans------->"+ex);
            }
            
         try
         {
            int temp,marks=0;
             for (int ii = 0; ii<student_attempt ; ii++)
             {      temp=attempt[ii];
                    temp--;
              // System.out.println("inside the comparision="+temp);
              if(student_ans[temp].equals(correct_ans[temp]))
              {
                //  System.out.println("both string are same ");
                  marks++;   
              }
             }
             %>
             <h2 style="padding:20Px;"><b>you attempt <span style="color:red; text-decoration: underline"> <%=student_attempt%> </span> and your score is<span style="color: red; text-decoration: underline"> <%=marks%></span> marks</b></h2>
             <%
                 
                //String user_name=(String)session.getAttribute("unm");
                String query="insert into result(username,remarks) values('"+user_nmm+"','"+marks+"');";
                SqlUtil.insert(query);
         }catch(Exception ex)
         {
             System.out.println("error in the insertion of result=="+ex);
         }
             %> 
      <%            
        try {
 //  System.out.println(qry);
 //   PrintWriter out=resp.getWriter();    
        //  HttpSession session=req.getSession();
           
       //  response.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
       
        /*        session.invalidate();
                response.sendRedirect("login.html");;
        */ 
       
        String qry="select * from student_profile where username='"+user_nmm+"'";
           
        ResultSet re = SqlUtil.read(qry);
//          System.out.println("query of result is="+qry);
        if(re.next())
        {
              //  System.out.println("query executed re.next() succesfully page"); 
          //   out.println("<script>alert('we reach on the cookies page');</script>");
            String name=re.getString("username");
              String email=re.getString("email");
                String gender=re.getString("gender");
                  String city=re.getString("city");
             %>  
             
           <div class="feed">
               <form>
                 <fieldset>
                    <legend>
                        <h1><b>your profile </b></h1>
                    </legend>
                    <h2 style="padding-left: 100px;"><b> NAME   : </b><%=name%></h2>
                    <h2 style="padding-left: 100px;"><b>  EMAIL  : </b><%=email%></h2>      
                    <h2 style="padding-left: 100px;"><b>  GENDER : </b><%=gender%></h2>        
                    <h2 style="padding-left: 100px;"> <b> CITY   : </b><%=city%></h2>  
                </fieldset>
             </form>
           </div>
           
                
             <%}
        else
        {
            System.out.println("else of rs.next() executed ");
        }
    } catch (Exception ex) {
        System.out.println("error in the session of the result--------------------->"+ex);
    }   %>
    
    <div id="feedback">
         <header>
                <a class="btn btn-info btn-lg" href="feedback.jsp" ><b>Give Feedback</b></a>           
        </header> 
    </div>
       
    <form id="logout_id" action="logout">
        <input class="btn btn-danger btn-lg" type="submit" value="Logout"> 
    </form><br> 
    
         </body>
</html>
