<%@ page import="model.Event" %>
<%@ page import="java.util.List" %>
<html>
<head>
<title>EMP - Event Management Project</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div id="header">
		<div id="logoHeader"></div>
		<form action="FrontController" method="GET" id="searchform">
		<input type="hidden" name="site" value="search" />
		<input id="searchField" name="searchTerm" type="text" value="Search... " onclick="document.getElementById('searchField').value='';" />
		</form>		<!-- <img src="img/profileIcon.png" style="float: left; margin-top: 8px; margin-left: 53px" />
		<img src="img/pmIcon.png" style="float: left; margin-top: 8px; margin-left: 20px" />
		<img src="img/favIcon.png" style="float: left; margin-top: 8px; margin-left: 20px" />
		<img src="img/logoutIcon.png" style="float: left; margin-top: 8px; margin-left: 90px" /> -->
		<div id="userMenuButton" style="background-image: none;background-size: 20%; background-repeat: no-repeat; background-position: 43px 30px ;width:50px;  position: absolute; z-index:199; margin-left: 940px; margin-top: 7px; padding: 3px; cursor: pointer" onclick="if(document.getElementById('userMenu').style.display=='block'){document.getElementById('userMenu').style.display='none';document.getElementById('userMenuButton').style.borderBottomWidth='1px';}else{document.getElementById('userMenu').style.display='block';document.getElementById('userMenuButton').style.borderBottomWidth='0px';}" onmouseover="document.getElementById('userMenuButton').style.backgroundImage='url(dropDownIcon.png)'" onmouseout="document.getElementById('userMenuButton').style.backgroundImage='none'">
			<img src="img/unfug.jpg" style="width:70%; border-width:1px; border-style:dashed "/>
		</div>
		<div id="userMenu" style="display: none; width:200px; z-index: 0; position: absolute; background-color: #565555;box-shadow: 10px 10px 30px #888; margin-left: 940px; margin-top:50px;">
		<ul>
		<li>
		<a href="#">Home</a>
		</li>
		<li>
		<a href="#">Profile</a>
		</li>
		<li>
		<a href="#">Veranstaltungssuche</a>
		</li>
		<li>
		<a href="#">Eigne Veranstaltungen</a>
		</li>
		<li>
		<a href="#">Logout</a>
		</li>
		</ul>
		</div>
		<div class="clear"></div>
		<div id="searchButton" onclick="document.getElementById('searchform').submit()"></div>
		
	</div>
	<div id="content">
	<%
		int index = 0 ;
		for(model.Event event : ((List<Event>)request.getAttribute("events"))){
	%>
		<div class="eventContainer" style="height:510px" onclick="document.location='FrontController?site=showEvent&event=<%= event.getEventId() %>'">
					<img src="img/flyer.png" style="padding:11px"/>
					<span style="margin-left: 12px ; font-weight: 800; color: #565555;"><%= event.getEventName() %></span>
					<table style="margin-left: 11px; height: 100px; color: #f0bb2d;  font-size: 12px; margin-top: 8px; margin-bottom: 10px">
						<tr><td><img src="img/locationIcon.png" style="margin-left: 1px"/></td><td style="padding-left: 15px"><%= event.getEventPlace() %></td></tr>
						<tr><td><img src="img/dateIcon.png" /></td><td style="padding-left: 14px"><%= event.getEventDate() %></td></tr>
						<tr><td><img src="img/genreIcon.png" /></td><td style="padding-left: 15px"><%= event.getGenre() %></td></tr>
					</table>
                                        <input type="submit" value="Edit" name="edit" class="buttonAmber" style="margin-left:10px; float: left"/>
                                        <input type="submit" value="Delete" name="delete" class="buttonGray" style="margin-left:5px; float: left"/>
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
		<div class="sidebarItem" style="height: auto" onclick="if(document.getElementById('submenuItemsManageEvents').style.display=='none'){document.getElementById('submenuItemsManageEvents').style.display='block'}else{document.getElementById('submenuItemsManageEvents').style.display='none'}">
			<img src="img/manageEventIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
			<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #f0bb2d">Manage Events</p>
			<div class="clear"></div>
                        <div id="submenuItemsManageEvents" style="display: none">
                            <div style="width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='createEvent.jsp'>Event erstellen</a></div>
                            <div style="margin-top:1px;width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='FrontController?site=listOwnEvents'>Events listen</a></div>
                        </div>
                </div>
		<div class="sidebarItem">
			<img src="img/statisticsIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
			<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555">Statistics</p>
			<div class="clear"></div>
		</div>
		<div class="sidebarItem">
			<div style="background-color: #f5f5f5; width: 300px; height: 50px; margin-top: 10px ; ">
				<img src="img/editIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
				<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555">Edit User Information</p>
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