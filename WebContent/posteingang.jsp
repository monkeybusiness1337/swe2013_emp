<%@ page import="model.PrivateMessage" %>
<%@ page import="java.util.List" %>
<html>
	<head>
		<title>EMP - Event Management Project</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<jsp:include page="header.jsp" />
    <div class="clear"></div>
    <div id="content" style=" position: relative; float: left; ">
        <div id="messagesContainerHeader" style="padding:10px; padding-bottom:0px; margin-top:30px; margin-left: 50px; background-color: #f5f5f5; height: 35px">
            <h3 style="color:#565555;margin:0px">Posteingang</h3>
        </div>
        <div id="messageContainer" style="margin-left: 50px">
        <%
		for(model.PrivateMessage message : ((List<PrivateMessage>)request.getAttribute("messages"))){
		%>
            <div id="message" style="margin-top:5px; background-color: #f5f5f5; padding: 10px; ">
                <div id="messageFromUser" style="float:left">
                    <img src="img/unfug.jpg" style="width:40%;" />
                    <p style="font-size:12px; margin-top: 3px; margin-bottom: 0px"><%= message.getSender() == null ? "asd" : message.getSender().getUserName() %></p>
                    <p style="font-size:12px; margin-top: 3px; margin-bottom: 0px; color: red; font-weight:800">ungelesen</p>
                </div>
                <div id="messageContent" style="float: left; background-color: darkgray; min-height: 70px; padding: 10px; color: white; font-size: 12px; width: 82%; margin-left: -90px">
                <%= message.getBody() %>  
                </div>
                <div class="clear"></div>
                <input type="submit" value="Antworten" name="antworten" class="buttonAmber" onclick="document.location='FrontController?site=writeMessage&to=<%= message.getSender().getUserName() %>'" style="margin-left: 110px; margin-top: 5px" />
                <input type="submit" value="Gelesen" name="gelesen" class="buttonGray" style="margin-left: 0px; margin-top: 5px" />
                <input type="submit" value="L&ouml;schen" name="loeschen" class="buttonGray" onclick="document.location='FrontController?site=deleteMessage&id=<%= message.getPrivateMessageId() %>'"style="margin-left: 0px; margin-top: 5px" />
            </div>
		<% } 
			if(((List<PrivateMessage>)request.getAttribute("messages")).size() == 0)
				out.print("<div style='margin-left:50px;margin-top:30px;'>You have no messages!</div>") ;
		%>
        </div>
    </div>
    
	<jsp:include page="sidebar.jsp" />
	<div class="clear"></div>
</body>
</html>