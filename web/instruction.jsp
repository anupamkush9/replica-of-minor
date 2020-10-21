<%-- 
    Document   : insruction
    Created on : Mar 21, 2019, 6:06:40 AM
    Author     : asus
--%>

<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" media="all" href="css/instruction.css">
         <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
         <style>
             li{
                 font-size: 30px;
             }
            #btn
             {
                 background-color:grey;
                 width: 200px;
                 height: 50px;
                 font-size: 30px;
                 text-align: center;
                 border-radius: 50px;
              
             }
         </style>
    </head>
    <%
    String qry= "update std_ans set answer=null"; 
    SqlUtil.connectDb();
    SqlUtil.update(qry);
    %>
    <body>
           <%
            // FOR PREVENTION FROM THE UNAUTHORIZED USER
            String user_nmm;
           response.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
            response.setHeader("pragma","no-cache");//http 1.0
            response.setHeader("expires","0");//proxies
           
           user_nmm=(String)session.getAttribute("unm");
           
            if(user_nmm==null)
            {
               response.sendRedirect("login.html");
            }
       %>
     
        <header style="background-color: greenyellow;">
            <h1 align="center" style="background-color: greenyellow;text-decoration: underline">
                <b>HAVE A GLANCE OF CAMPUS</b>
            </h1>
        </header>

                    <h1 align="left" style="font-size: 40px;">Instructions:</h1>
                <ul><li>There is no negative marking </li></ul>
                <ul><li style="color: red">warning do not leave or minimize the page otherwise your test automatically will get submitted</li></ul>
		<ul><li>Click on <b>attempt quiz</b> button to start the test</li></ul>
                <ul><li>You can skip and reattemp any question</li></ul>
		<ul><li>There will be timer at the top right corner of the screen.</li></ul>
		<ul><li>Questions based on simple mathematices</li></ul>		
		<ul><li>After the test starts, don't press back or refresh button or dont close the browser window</li></ul><br>
           	
            <form action="show_quiz_question.jsp" onsubmit="return confirm('*******Do you want to start attempt?********')">
                <!--    <input id="btn" type="submit" value="Attempt Quiz" onclick="call_timer()" >-->

                <button type="submit" class="btn btn-success btn-lg" onclick="call_timer(); ">attempt quiz</button>
            </form>
                <script>
                    function preventBack()
                    {
                        window.history.forward();
                    }
                        setTimeout("preventBack()",0);
                </script>
  </body>
   
</html>
