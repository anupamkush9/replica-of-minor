<%-- 
    Document   : add_question
    Created on : Mar 26, 2020, 12:20:38 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add_question Page</title>
        
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="all" href="css/add_question.css">
         <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
         <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
         <script>
             function check_s_no()
             {
                var a=parseInt(document.getElementById("ques_no").value);
		if(!(Number.isInteger(a)))
		{
                    document.getElementById("msg1").innerHTML="***** digits must be digit in this field******";
                    return false;
		}
             }
             
             function check_time()
             {
                var a=parseInt(document.getElementById("time").value);
		if(!(Number.isInteger(a)))
		{
                    document.getElementById("msg2").innerHTML="***** digits must be digit in this field******";
                    return false;
		}
             }
         </script>
        <style>
            label
            {
                font-size: 30px;
            }
            #save
            {
                margin-top: 14px;
            }
           td
           {
               font-size: 30px;
           }
          
        </style>
       
    </head>
    <body onload="show_time()">
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
       
 
   <div class="row" >
        <form action="logout">
            <input style="float: right; position: relative; margin-left: 50px; margin-top: 20px; width: 100px;" type="submit" class="btn btn-danger btn-lg" 
                                   value="Logout">
        </form>
        <a style="float: right; margin-left: 50px; margin-top: 20px;" 
         class="btn btn-info btn-lg" href="admin.jsp" id="goback">
          Go Back to Profile</a>
       
         <header class="headerbar top">
             <h1 style="font-size: 40px; padding-top: 20px;">Question insertion</h1>
         </header>
    <div class="col-sm-3">
        <aside class="leftbar">
            <div >
                <form action="faculty" onsubmit="return check_s_no()">  
                    <fieldset>
                        <label for="q_no">s_no</label>
                        <input type="text" id="ques_no" name="ques_no" >
                        <span id="msg1" style="color: red;"></span>
                    </fieldset>  

                    <fieldset>
                        <label for="question" >Enter Question</label>
                        <textarea rows="4" id="question" name="question" ></textarea>
                    </fieldset>  
                     <fieldset>
                        <label for="op_a" >option_A</label>
                        <input type="text" id="op_a" name="op_a">
                    </fieldset>  
                     <fieldset>
                        <label for="op_b" >option_B</label>
                        <input type="text" id="op_b" name="op_b" >
                    </fieldset>  
                     <fieldset>
                        <label for="op_c" >option_C</label>
                        <input type="text" id="op_c" name="op_c" >
                    </fieldset> 
                     <fieldset>
                        <label for="op_D" >option_d</label>
                        <input type="text" id="op_d" name="op_d">
                    </fieldset>  
                       <fieldset>
                        <label for="ans" >correct_option</label>
                        <input type="text" id="correct" name="correct_option">
                    </fieldset>
                    <fieldset>
                        <input id="save" type="submit" class="btn btn-success" name="submit" value="save">
                    </fieldset>
               </form>   
            </div>
          </aside>  
        <div class="input-group mb-3" style="margin-left: 10px; display:inline-block; padding-right: 30px;">
            <form action="set_time.jsp" onsubmit="return check_time()" >
                <input type="text" name="time" id="time" class="form-control" placeholder="Enter no of minutes for test in interger" >
                <div class="input-group-append" style="padding-top: 10px;">
                     <button class="btn btn-success" type="submit">Set Time</button>  
                </div>  
            </form>
            <%! int minutes; %>
             <script>
                 function show_time()
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
                    var min;
                    min="<%=minutes%>";
                document.getElementById("ans_time").innerHTML= min +" Minute time is set";
                }
            </script>
            
            
        </div>
        <span id="msg2" style="color: red;"></span>
        <span id="ans_time" style="color:red; margin-left: 20px;"></span>
    </div>
            
            <div class="col-sm-9">
                <aside class="rightbar">
                <table id="ques_table"  class="table table-hover">
                    <thead>
                        <tr>
                            <th>s_no</th>
                            <th>question</th>
                            <th>option_a</th>
                            <th>option_b</th>
                            <th>option_c</th>
                            <th>option_d</th>
                            <th>correct</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody id="table_rows">
                        <%
                   try
                   {   SqlUtil.connectDb();
                        String qry="select * from question";
                       ResultSet rs= SqlUtil.read(qry);
                       while(rs.next())
                       {
                        %>  
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                           <td><%=rs.getString(5)%></td>
                           <td><%=rs.getString(6)%></td>
                           <td><%=rs.getString(2)%></td>  
                           <td>
                               <form action="edit.jsp">
                               <input type="hidden" name="hidden" value="<%=rs.getString(1)%>">
                               <input type="submit" class="c1"  value="EDIT"><br/> 
                              </form>
                               <form action="delete_question.jsp">
                                   <input type="hidden" name="hidden" value="<%=rs.getString(1)%>">
                                   <input type="submit" class="c1" value="delete">
                               </form></td>
                        </tr>
                        <%
                            }
                       } catch(Exception ex)
                     {
                      System.out.println("error in add_question.jsp"+ex);
                     }
                        %>
                    </tbody>
                </table>
                </aside>
            </div>
            <footer class="headerbar bottom"></footer>
   </div>

   </body>
</html>
