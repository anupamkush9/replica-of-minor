<%-- 
    Document   : Forgot_password
    Created on : jun 2, 2020, 10:16:40 PM
    Author     : asus
--%>
<html>
    <head>
        <title>Forgot Password</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">       
        <link href="https://fonts.googleapis.com/css?family=Satisfy&display=swap" rel="stylesheet">
        <style type="text/css">            
            #feed
     	    {
                display: inline-block;
                margin-top:120px;
                margin-left:400px;
                width: 53%;
                padding:10px 22px 50px 30px;
                position: fixed;
            }
            body
            {
            	font-family: Arial, Helvetica, sans-serif;
                background-size: 1600px;
                background-repeat: no-repeat;
                box-sizing: border-box;
                color:white;
            }
            .st-font,h3
            {
                font-family: "Satisfy";
            }             
            input{
                width:300px;
            }
            #log
            {
                font-size: 18px;
                margin-left: 150px;
                font-family:serif;
            }
	</style>
    </head>
    <body background="image/background.jpg">
            <div id="feed">
             <FORM action="forgot_val.jsp" method="post">
                 <h1 class="st-font">Forgot Your Password...</h1>
                    <br><br>
                    <table cellpadding="5px">
            <tr>
            	<td>
                    <h3><b>Username:<b/></h3> 
		</td>
                <td>
                    <input type="text" name="username" required>					
                </td>
            </tr>
            <tr>
            	<td>
                    <h3><b>Email:</b></h3> 
		</td>
		<td>
                     <input type="text" name="Email" required>
            	</td>
            </tr>
            <tr>
            	<td>
                    <h3><b>mobile no:</b></h3> 
		</td>
		<td>
                     <input type="text" name="mobile" required>
            	</td>
            </tr>
            <tr>
                    <td><h3><b>City :</b></h3></td>
                        <td>
                            <select name="city">
                                <option>Indore</option>
                                <option>Bhopal</option>
                                <option>Ujjain</option>
                                <option>Dewas</option>
                                <option>Shivpuri</option>
                                <option>Gwalior</option>
                                <option>Dhar</option>
                                <option>umaria</option>
                                <option>other</option>
                            </select>
                        </td>
	    </tr>
            
            <tr>
                <td></td>
                <td>
                    <h6><span class="blinking">
              <% 
             if(request.getAttribute("Message")!=null)
             {
                 out.println(request.getAttribute("Message"));
             }
                %>
                </span>
              </h6>
                </td>
            </tr>
            <tr>
            	<td>
            		<button type='submit' class="btn btn-success"> Submit </button>
                </td>
                <td>
                        <a type="button" id="log" class="btn btn-light" href="login.html"><b>Login</b></button>
                </td>
            </tr>
            
        </table>
    </FORM>  
 </div>
    </body>
</html>

