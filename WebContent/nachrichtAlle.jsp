<%@ page import="model.User" %>
<html>
<head>
<title>EMP - Event Management Project</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
    <div id="content" style=" position: relative; float: left; ">
    <%
    User sender = (User)request.getAttribute("sender");
	%>
        <div id="messagesContainerHeader" style="padding:10px; padding-bottom:0px; margin-top:30px; margin-left: 50px; background-color: #f5f5f5; height: 35px">
            <h3 style="color:#565555;margin:0px">Nachricht an alle verfassen</h3>
        </div>
        <div id="messageContainer" style="margin-left: 50px">
            <div id="message" style="margin-top:5px; background-color: #f5f5f5; padding: 10px; ">
                <div id="messageFromUser" style="float:left">
                    <img src="img/unfug.jpg" style="width:40%;" />
                    <p style="font-size:12px; margin-top: 3px; margin-bottom: 0px"><%= sender.getUserName() %></p>
                </div>
                <div id="messageContent" style="float: left; background-color: darkgray; min-height: 70px; padding: 10px; color: white; font-size: 12px; width: 82%; margin-left: -90px">
                	<form action="FrontController" method="GET">
                   		
                    	<label for="" style="font-size:10pt; font-weight: bold">Subject: </label>
                    	<input type="text" name="subject" value="" style="font-size: 10pt !important; margin-top:5px !important; margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
                   		<textarea name ="body" style="max-width:630px;width:630px; min-height: 300px; color: white; font-family: Arial; background-color: transparent; border-color: white"></textarea>
                		<input type="hidden" value="sendAll" name="site" />
                		<input type="submit" value="Senden" name="senden" class="buttonAmber" style="margin-left: 110px; margin-top: 5px" />
                		<input type="reset" value="Verwerfen" name="loeschen" class="buttonGray" style="margin-left: 0px; margin-top: 5px" />
                	</form>
                	</div>
                <div class="clear"></div>
        </div>
    </div>
    </div>
    
	<jsp:include page="sidebar.jsp" />
	<div class="clear"></div>
</body>
</html>