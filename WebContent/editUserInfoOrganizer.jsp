<%@ page import="model.Organizer" %>

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
		<form method="POST" action="FrontController" enctype="multipart/form-data">
		<input type="hidden" name="site" value="editUserInfo"/>
			<div id="eventLeft" style="float: left">
				<div class="eventContainerNoHover" style="height: 310px; padding-top: 20px !important;">
	                  <span style="margin-left: 12px ; font-weight: 800; color: #565555;"><input type="text" name="username" value="${user.userName}" disabled="disabled" style="width:198px;color:#565555;font-weight:800;font-size:16px;border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: gray; border-style:dashed"/></span>
						<input type="hidden" name="uname" value="<%=((Organizer)request.getAttribute("user")).getUserName() %>" />
							<div style="margin-top: 20px; margin-left: 15px">
								<label for="" style="font-size:10pt; font-weight: bold">Firstname: </label>
								<input type="text" name="firstName" value="${user.firstName}" style="font-size: 10pt !important; margin-top:5px !important; margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
								<label for="" style="font-size:10pt; font-weight: bold">Lastname:</label>
								<input type="text" name="lastName" value="${user.lastName}" style="font-size: 10pt !important; margin-top:5px !important;  margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
								<br/>
								<label for="" style="font-size:10pt; font-weight: bold">Contact Email:</label>
								<input type="text" name="lastName" value="${user.email}" style="font-size: 10pt !important; margin-top:5px !important;  margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
								<br/>
								<label for="" style="font-size:10pt; font-weight: bold">Contact Tel:</label>
								<input type="text" name="lastName" value="${user.tel}" style="font-size: 10pt !important; margin-top:5px !important;  margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
								<br/>
								<label for="" style="font-size:10pt; font-weight: bold">Birthdate:</label>
								<input type="text" name="birthDate" value="${user.birthDate}" style="font-size: 10pt !important; margin-top:5px !important;  margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
							</div>	
				</div>
				<div class="clear"></div>
	                </div>	
			<div id="eventContainerRechts">
				<div style="float: left; margin-left: 10px; background-color: #f5f5f5; width: 510px; min-height: 500px; margin-top: 30px; padding: 20px; text-align: justify; font-size:12px; line-height:19px">
					<h3 style="margin-top: 0px; float: left; font-size:20px; color:#565555">Description</h3>
	                                <input type="reset" value="Verwerfen" class="buttonGray" style="float: right; margin-top: -11px"/>
	                                <input type="submit" value="Speichern" class="buttonAmber" style="float: right; margin-top: -11px"/>
	                                <div class="clear"></div>
					<hr style="margin-bottom: 15px"/>
	                                <textarea name="about" style="font-family: arial; line-height:19px; text-align:justify; max-width:510px; width:510px; min-height: 500px;border-style:dashed; background-color:transparent">${user.description}</textarea>
				</div>
	                </div>
			<div class="clear"></div>
		</form>
	</div>
	<div id="sidebarRight" style="margin-left: 50px; margin-top: 30px; border: 0px ; border-left-width:1px; border-style: solid; border-color: #bcbcbc; float: left; height: 100%; padding-left: 50px;">
		<div class="sidebarItem" style="height: auto" onclick="if(document.getElementById('submenuItemsManageEvents').style.display=='none'){document.getElementById('submenuItemsManageEvents').style.display='block'}else{document.getElementById('submenuItemsManageEvents').style.display='none'}">
			<img src="img/manageEventIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
			<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555">Manage Events</p>
			<div class="clear"></div>
                        <div id="submenuItemsManageEvents" style="display: none">
                            <div style="width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='#'>Event erstellen</a></div>
                            <div style="margin-top:1px;width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='#'>Events listen</a></div>
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
				<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #f0bb2d">Edit User Information</p>
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
                     <div style="width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='#'>Nachricht verfassen</a></div>
                     <div style="margin-top:1px;width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='#'>Posteingang</a></div>
                     </div>
                </div>
	</div>
	<div class="clear"></div>
</body>
</html>