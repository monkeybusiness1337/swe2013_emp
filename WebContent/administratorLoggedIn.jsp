<%@ page import="model.Event" %>
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
		for(model.Event event : ((List<Event>)request.getAttribute("events"))){
	%>
		<div class="eventContainer" style="height:510px">
					<img src="<% if(event.getPicturePath() != null){ out.print( event.getPicturePath() ); } else{out.print( "img/flyer.png" ) ; } %>" style="width: 207px; padding:11px" onclick="document.location='FrontController?site=showEvent&event=<%= event.getEventId() %>'"/>
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
	<div id="sidebarRight" style="margin-left: 50px; margin-top: 30px; border: 0px ; border-left-width:1px; border-style: solid; border-color: #bcbcbc; float: left; height: 100%; padding-left: 50px;">
		<div class="sidebarItem" style="height: auto" onclick="if(document.getElementById('submenuItemsManageUsers').style.display=='none'){document.getElementById('submenuItemsManageUsers').style.display='block'}else{document.getElementById('submenuItemsManageUsers').style.display='none'}">
			<img src="img/manageUsersIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
			<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555">Manage Users</p>
			<div class="clear"></div>
                        <div id="submenuItemsManageUsers" style="display: none">
                            <div style="width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='#'>User listen</a></div>
                            <div style="margin-top:1px;width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='#'>Administrator erstellen</a></div>
                        </div>
                </div>
                <div class="sidebarItem" style="height: auto">
			<img src="img/manageEventIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
			<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555">Manage Events</p>
			<div class="clear"></div>
                </div>
		<div class="sidebarItem">
			<div style="background-color: #f5f5f5; width: 300px; height: 50px; margin-top: 10px ; ">
				<img src="img/editIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
				<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555"><a href="FrontController?site=editUserInformation">Edit User Information</a></p>
				<div class="clear"></div>
			</div>
		</div>
                <div class="sidebarItem" style="height: auto" onclick="if(document.getElementById('submenuItemsPMs').style.display=='none'){document.getElementById('submenuItemsPMs').style.display='block'}else{document.getElementById('submenuItemsPMs').style.display='none'}">
			<div style="background-color: #f5f5f5; width: 300px; height: 50px; margin-top: 10px ; ">
				<img src="img/messageIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
				<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555">Private Messages<span style="font-size:10px;color:red; margin-left: 15px;">3 new messages!</span></p>
				<div class="clear"></div>
                        </div>
                     <div id="submenuItemsPMs" style="display: none">
                     <div style="width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='#'>Nachricht verfassen</a></div>
                     <div style="margin-top:1px;width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='#'>Posteingang</a></div>
                     </div>
                </div>
	</div>
	<div class="clear"></div>
</body>
</html>