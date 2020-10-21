<!DOCTYPE html>
<!--
     Document   : feedback
     Created on : Jun, 2020, 12:00:20 PM
     Author     : asus 
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Satisfy&display=swap" rel="stylesheet">       
         <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
         
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        
        <style type="text/css">            
            #feed
     	    {
                display: inline-block;
                margin-top:100px;
                margin-left:270px;
                width: 53%;
                padding:10px 22px 50px 30px;
                position: fixed;
                background-color: rgba(0,0,0,0.7);
            }
            body
            {
            	font-family: Arial, Helvetica, sans-serif;
                background-size: 1600px;
                background-repeat: no-repeat;
                box-sizing: border-box;
                color:white;
            }
            .st-font
            {
                font-family: "Satisfy";
            } 
            #goback{
                color:white;
                margin-left: 80px;
                margin-right: 80px;
            }
            #log
            {
                font-size: 18px;
                font-family:serif;
            }
            textarea{
                resize:none;
            }
            .blinking{
                animation:blinkingText 0.5s infinite;
            }
            @keyframes blinkingText{
                0%{     color: red;    }
                20%{     color: red;    }
                30%{     color: red;    }
                88%{    color: transparent; }
                100%{   color: #ff3333;    }
            }

	</style>
    </head>
    <body background="image/feed.PNG"  method="post">
        <form action="logout">
            <input style="float: right; margin-right: 50px; margin-top: 50px;" type="submit" class="btn btn-danger btn-lg" 
                                   value="Logout">
        </form>
            <div id="feed">
             
             <FORM action="feedback_val.jsp">
                 <h1 class="st-font">Give Feedback...</h1>
                    <table cellpadding="5px">
            
            <tr>
            	<td>
                    <h3 class="st-font"><b>feedback:</b></h3> 
				</td>
				<td>
				<textarea rows="8" cols="60" required name="feedback"></textarea>
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
                	<button type='reset' class="btn btn-danger"> Reset </button>
<!--                        <a class="btn btn-outline-success" href="welcome.jsp" id="goback">Go Back to Profile</a>
-->                                
                        </td>
            </tr>
        </table>
    </FORM>  
 </div>
    </body>
</html>
