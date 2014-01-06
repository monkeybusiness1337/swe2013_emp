<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<html>
<head>
<title>EMP - Event Management Project</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="content">
	<%
		int index = 0 ;
		for(model.User user : ((List<User>)request.getAttribute("users"))){
	%>
		<div class="eventContainer" style="height:510px">
					<span style="margin-left: 12px ; font-weight: 800; color: #565555;"><%= event.getEventName() %></span>
					<table style="margin-left: 11px; height: 100px; color: #f0bb2d;  font-size: 12px; margin-top: 8px; margin-bottom: 10px">
						<tr><td><img src="img/locationIcon.png" style="margin-left: 1px"/></td><td style="padding-left: 15px"><%= event.getEventPlace() %></td></tr>
						<tr><td><img src="img/dateIcon.png" /></td><td style="padding-left: 14px"><%= event.getEventDate() %></td></tr>
						<tr><td><img src="img/genreIcon.png" /></td><td style="padding-left: 15px"><%= event.getGenre() %></td></tr>
					</table>
                 	<input type="button" value="Edit" name="edit" class="buttonAmber" style="margin-left:10px; float: left" onclick="document.location='FrontController?site=editEvent&event=<%= event.getEventId() %>'"/>
                    <input type="button" value="Delete" name="delete" class="buttonGray" style="margin-left:5px; float: left" onclick="document.location='FrontController?site=deleteEvent&event=<%= event.getEventId() %>'"/>
                   	<div class="clear"></div>
		</div>
		<%
			if(index > 0 && index++%3 == 0)
				out.print("<div class='clear'></div>") ;
		%>
		<% } 
			if(((List<Event>)request.getAttribute("events")).size() == 0)
				out.print("<div style='margin-left:50px;margin-top:30px;'>You have no events created yet.</div>") ;
		%>
		
                <div class="clear"></div> 
	</div>
	<jsp:include page="sidebar.jsp" />
</body>
</html>