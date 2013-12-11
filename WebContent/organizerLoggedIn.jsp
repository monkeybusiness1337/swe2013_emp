<%@ page import="daos.EventDAO" %>
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
		for(model.Event event : EventDAO.getEventDAO().getEventList()){
	%>
		<div class="eventContainer" style="height:450px" onclick="document.location='FrontController?site=showEvent&event=<%= event.getEventId() %>'">
					<img src="<% if(event.getPicturePath() != null){ out.print( event.getPicturePath() ); } else{out.print( "img/flyer.png" ) ; } %>" style="width: 207px; padding:11px" onclick="document.location='FrontController?site=showEvent&event=<%= event.getEventId() %>'"/>
					<span style="margin-left: 12px ; font-weight: 800; color: #565555;"><%= event.getEventName() %></span>
					<table style="margin-left: 11px; height: 100px; color: #f0bb2d;  font-size: 12px; margin-top: 8px; margin-bottom: 10px">
						<tr><td><img src="img/locationIcon.png" style="margin-left: 1px"/></td><td style="padding-left: 15px"><%= event.getEventPlace() %></td></tr>
						<tr><td><img src="img/dateIcon.png" /></td><td style="padding-left: 14px"><%= event.getEventDate() %></td></tr>
						<tr><td><img src="img/genreIcon.png" /></td><td style="padding-left: 15px"><%= event.getGenre() %></td></tr>
					</table>
                    <div class="clear"></div>
		</div>
		<%
			if(index > 0 && index++%3 == 0)
				out.print("<div class='clear'></div>") ;
		%>
		<% } %>
	</div>
	<jsp:include page="sidebar.jsp" />
</body>
</html>