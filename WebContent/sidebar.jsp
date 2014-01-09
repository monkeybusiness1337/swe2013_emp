<%@ page import="model.Administrator" %>
<%@ page import="model.Enduser" %>
<%@ page import="model.Organizer" %>

<% if(session.getAttribute("session") instanceof Administrator){ %>
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
				<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555">Private Messages</p>
				<div class="clear"></div>
                        </div>
                     <div id="submenuItemsPMs" style="display: none">
                     <div style="width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='FrontController?site=writeMessage'>Nachricht verfassen</a></div>
                     <div style="margin-top:1px;width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='FrontController?site=eingang'>Posteingang</a></div>
                     </div>
                </div>
                	      <div class="sidebarItem">
				<div style="background-color: #f5f5f5; width: 300px; height: 50px; margin-top: 10px ; ">
					<img src="img/manageUsersIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
					<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #f0bb2d"><a href="FrontController?site=listUsers" style="color: rgb(86, 85, 85);text-decoration:none">View all users</a></p>
					<div class="clear"></div>
				</div>
			</div>
	</div>
	<div class="clear"></div>
<% } else if(session.getAttribute("session") instanceof Organizer ) {%>
	<div id="sidebarRight" style="margin-left: 50px; margin-top: 30px; border: 0px ; border-left-width:1px; border-style: solid; border-color: #bcbcbc; float: left; height: 100%; padding-left: 50px;">
			<div class="sidebarItem" style="height: auto" onclick="if(document.getElementById('submenuItemsManageEvents').style.display=='none'){document.getElementById('submenuItemsManageEvents').style.display='block'}else{document.getElementById('submenuItemsManageEvents').style.display='none'}">
				<img src="img/manageEventIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
				<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555">Manage Events</p>
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
					<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #f0bb2d"><a href="FrontController?site=editUserInformation" style="color: rgb(86, 85, 85);text-decoration:none">Edit User Information</a></p>
					<div class="clear"></div>
				</div>
			</div>
	                <div class="sidebarItem" style="height: auto" onclick="if(document.getElementById('submenuItemsPMs').style.display=='none'){document.getElementById('submenuItemsPMs').style.display='block'}else{document.getElementById('submenuItemsPMs').style.display='none'}">
				<div style="background-color: #f5f5f5; width: 300px; height: 50px; margin-top: 10px ; ">
					<img src="img/messageIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
					<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555">Private Messages</p>
					<div class="clear"></div>
	                        </div>
	                     <div id="submenuItemsPMs" style="display: none">
	                     <div style="width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='FrontController?site=writeMessage'>Nachricht verfassen</a></div>
<div style="margin-top:1px;width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='FrontController?site=eingang'>Posteingang</a></div>
</div>
	                </div>
	</div>
	<div class="clear"></div>
<% } else if(session.getAttribute("session") instanceof Enduser ) {%>
	<div id="sidebarRight" style="margin-left: 50px; margin-top: 30px; border: 0px ; border-left-width:1px; border-style: solid; border-color: #bcbcbc; float: left; height: 100%; padding-left: 50px;">
			<div class="sidebarItem">
				<div style="background-color: #f5f5f5; width: 300px; height: 50px; margin-top: 10px ; ">
					<img src="img/editIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
					<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555"><a href="FrontController?site=editUserInformation&action=noEdit" style="color: rgb(86, 85, 85);text-decoration:none">Edit User Information</a></p>
					<div class="clear"></div>
				</div>
			</div>
	                <div class="sidebarItem" style="height: auto" onclick="if(document.getElementById('submenuItemsPMs').style.display=='none'){document.getElementById('submenuItemsPMs').style.display='block'}else{document.getElementById('submenuItemsPMs').style.display='none'}">
				<div style="background-color: #f5f5f5; width: 300px; height: 50px; margin-top: 10px ; ">
					<img src="img/messageIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
					<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555">Private Messages</p>
					<div class="clear"></div>
	                        </div>
	                     <div id="submenuItemsPMs" style="display: none"><div style="width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='FrontController?site=writeMessage'>Nachricht verfassen</a></div>
<div style="margin-top:1px;width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='FrontController?site=eingang'>Posteingang</a></div>
	                     </div>
	                </div>
	      <div class="sidebarItem">
				<div style="background-color: #f5f5f5; width: 300px; height: 50px; margin-top: 10px ; ">
					<img src="img/manageUsersIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
					<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #f0bb2d"><a href="FrontController?site=listUsers" style="color: rgb(86, 85, 85);text-decoration:none">View all users</a></p>
					<div class="clear"></div>
				</div>
			</div>
	      <div class="sidebarItem">
				<div style="background-color: #f5f5f5; width: 300px; height: 50px; margin-top: 10px ; ">
					<img src="img/manageEventIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
					<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #f0bb2d"><a href="FrontController?site=showFollowedEvents" style="color: rgb(86, 85, 85);text-decoration:none">View events (followed users)</a></p>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	<div class="clear"></div>
<% } else if(session.getAttribute("session") == null) { %>
	<div id="sidebarRight" style="margin-left: 40px; margin-top: 30px; border: 0px ; border-left-width:1px; border-style: solid; border-color: #bcbcbc; float: left; height: 100%;">
		<div style="background-image: url(thumbUp.png); background-repeat: no-repeat; background-position: 290px 90px; width: 300px ; padding: 30px; margin-left: 40px; padding-bottom: 30px; background-color:#1abc9c; color: white; font-size: 25px; line-height: 1.4; margin-bottom:10px; padding-top: 25px">
		Erstelle Veranstaltungen und teile sie mit deinen Freunden!
		</div>
		<div style="background-image: url(thumbUp.png); background-repeat: no-repeat; background-position: 290px 90px; width: 300px ; padding: 30px; padding-top: 25px; margin-left: 40px; padding-bottom: 30px; background-color:#16a085; color: white; font-size: 25px; line-height: 1.4; margin-bottom: 10px;">
		Folge Freunden und bleibe so immer am Laufenden!
		</div>
		<div style="background-image: url(thumbUp.png); background-repeat: no-repeat; background-position: 290px 115px; width: 300px ; padding: 30px; padding-top: 25px; margin-left: 40px; padding-bottom: 30px; background-color:#2ecc71; color: white; font-size: 25px; line-height: 1.4; margin-bottom: 10px; height: 130px">
		Suche und filtere Veranstaltungen nach verschiedenen Kriterien!
		</div>
		<div style="font-size: 11px; width: 340px;border:0;border-top:1px;border-style:solid; margin-left: 50px; border-color: #aba">
			<p style="width: 160px; margin-left: 90px">Terms | Privacy | Cookies | Imprint</p>
		</div>
	</div>
<% } %>
	<div class="clear"></div>