<%-- 
    Document   : show_quiz_question
    Created on : Mar 9, 2020, 7:04:33 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="all" href="css/show_quiz.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
        <script type="text/JavaScript">
            
        <!--for disabling the right click  -->  
       document.addEventListener('contextmenu', event => event.preventDefault());           
        <!--for disabling the right click -->
        function killCopy(e)
        {
        return false
        }
        function reEnable()
        {
        return true
        }
        document.onselectstart=new Function ("return false")
        if (window.sidebar)
        {
        document.onmousedown=killCopy
        document.onclick=reEnable
        }
        
 <!--access method is used for fetching the data from database-->
        <%!int minutes;%>
       function access()
        { 
            <% 
                   try
                   {   
                       SqlUtil.connectDb();
                       String qry="select * from test_time";
                      
                       ResultSet rs= SqlUtil.read(qry);
                       if(rs.next())
                       {
                            minutes=rs.getInt("time_in_minutes");
                       }
                    } 
                   catch(Exception ex)
                   {
                      System.out.println("error in add_question.jsp"+ex);
                   }
            %>
        } 
        
    <!--below script contains the script timer.js code-->
       
        var min;
        min="<%=minutes%>";
        var total_sec=60*min;
        var c_min=parseInt(total_sec/60);
        var c_sec=parseInt(total_sec%60);

        
       function checkTime()
       { 
           document.getElementById("quiz-time-left").innerHTML='Time left : '+c_min+' min '+c_sec+' sec';
            if(total_sec<=0)
            {
                setTimeout('document.quiz.submit()',1);
            }
            else
            {
             total_sec=total_sec-1;
             c_min=parseInt(total_sec/60);
             c_sec=parseInt(total_sec%60);    
            }
       }
        

    </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Examination Page</title>
         <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
       <!-- sometime we need to link .js after the body ending tag>-->
       <style>

       .td_class
       {
           border-radius: 10px;
           background-color: gold;
       }
       .td_i
       {
           background: gold;
       }
  
       </style>
      </head>
 <body onload="sendreq(1);call_timer();access();"> 
     
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
     
    
     <div class="row">
  <div class="col-9">
           
      <div class="container">  
       <h2 class="left" id="left"></h2>
      </div>
  </div>
         
 
  <div class="col-3">
        <h2 style="color: red; background-color: lightcyan;" style="font-size:15px; margin-top: 20px; margin-right: 60px;"  id="quiz-time-left">
        </h2> 
    <div >     
        <!--for displaying the question no buttons-->
        <table  height: auto>
                     <%
                   try
                   {   SqlUtil.connectDb();
                        String qry="select * from question";
                      
                       ResultSet rs= SqlUtil.read(qry);
                       while(rs.next())
                       {
                        %>  
    <input style="width: 50px;" class="td_i" type="button" name="btn"
  id=<%=rs.getString(1)%>  value =<%=rs.getString(1)%> onClick="sendreq(this.value)"/>               
                     <%
                            }
                       } catch(Exception ex)
                     {
                      System.out.println("error in add_question.jsp"+ex);
                     }
                     %>
        </table>
    </div>
        <hr style="border: 10px solid #003333; border-radius:10px;">
        <div class="p-3 mb-2 bg-primary text-white">.blue color visited</div>
        <div class="p-3 mb-2 bg-success text-white">.green color for attempted</div>
        <div class="p-3 mb-2 bg-warning text-dark">.Gold color for unvisited</div>
        <form method="post" name="quiz"  action="result.jsp">
            <button type="submit"  class="btn btn-success btn-lg" id="quiz_sumit" >Submit quiz</button>
                     <div id="res"></div>
        </form> 
   </div>
</div>

 <script>
     function preventBack()
     {
         window.history.forward();
     }
     setTimeout("preventBack()",0);
     window.onunload=function (){null};
     function  submition()
     {
       document.getElementsByName("quiz").submit();
     }
     
     function call_timer()
      {
          setInterval('checkTime()',1000);    
      } 
      
    $(window).blur(function() {
    if(!confirm("warning do not leave the page otherwise your test automatically will get submitted"))
    {
        if(!document.hasFocus()) {
            //alert("warning do not leave the page otherwise your test automatically will get submitted");
          document.getElementById("quiz_sumit").click();
            }
    }
});   
     
       function save(value,n){
            document.getElementById(n).style.background='green';
               xmlhttp=new XMLHttpRequest();
            xmlhttp.onreadystatechange=function ()
         {
            if(this.readyState == 4 && this.status == 200)
            {  var text=this.responseText;
              
           } 
       };
  var url="http://localhost:8080/replica%20of%20minor/save_ans.jsp?q_no="+value+"&n="+n;
           xmlhttp.open("GET",url,true);
            xmlhttp.send();
         }
         
 var xmlhttp;
        function sendreq(value)
        {
             document.getElementById(value).style.background='blue';
           
            //console.log("sendreq fun() called");
           // document.getElementById("mydiv").innerHTML="sending data........."+value;
             xmlhttp=new XMLHttpRequest();
            xmlhttp.onreadystatechange=function ()
        {
           //  alert("ready state has changed");
            if(this.readyState == 4 && this.status == 200)
            {
                var text=this.responseText;
                
                document.getElementById("left").innerHTML=text;
            }
        };
        
            var url="http://localhost:8080/replica%20of%20minor/ques_display.jsp?q_no="+value;
            xmlhttp.open("GET",url,true);
            xmlhttp.send();
          // alert("ajax is sent successfully");
          
        }	       
     </script>
     </body>
</html>
