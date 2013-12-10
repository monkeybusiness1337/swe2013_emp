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
		<div id="searchButton"  onclick="document.getElementById('searchform').submit()"></div>
		
	</div>
	<div id="content">
		<form action="FrontController" method="GET">
			<input type="hidden" name="site" value="createEvent" />
			<div id="eventLeft" style="float: left">
				<div class="eventContainerNoHover">
	                            <div style="background-color: #cecece; width: 90%; border: 1px dashed darkgray; margin: 0 auto; margin-top: 10px; margin-bottom: 15px;  height: 280px; cursor:pointer">
					<img src="img/uploadIcon.png" style="padding:11px; margin-left: 45px; margin-top: 80px; width: 40%;-moz-opacity: 0.7; opacity: 0.7;filter: alpha(opacity = 70);"/>
	                                <p style="font-size:12px; color: #f0bb2d; margin-left: 40px;">Upload Flyer Picture!</p>
	                            </div>
	                            <span style="margin-left: 12px ; font-weight: 800; color: #565555;"><input type="text" name="titel" value="Titel" style="width:198px;color:#565555;font-weight:800;font-size:16px;border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: gray; border-style:dashed"/></span>
						<table style="margin-left: 11px; height: 100px; color: #f0bb2d;  font-size: 12px; margin-top: 8px">
							<tr><td><img src="img/locationIcon.png" style="margin-left: 1px"/></td><td style="padding-left: 15px"><input type="text" name="ort" value="Ort" style="width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/></td></tr>
							<tr><td><img src="img/dateIcon.png" /></td><td style="padding-left: 14px"><input type="text" name="datum" value="Datum (dd-mm-yyyy)" style="width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/></td></tr>
							<tr><td><img src="img/genreIcon.png" /></td><td style="padding-left: 15px"><input type="text" name="genre" value="Genre" style="width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/></td></tr>
						</table>
				</div>
				<div class="clear"></div>
	                </div>
			<div id="eventContainerRechts">
				<div style="float: left; margin-left: 10px; background-color: #f5f5f5; width: 510px; min-height: 500px; margin-top: 30px; padding: 20px; text-align: justify; font-size:12px; line-height:19px">
					<h3 style="margin-top: 0px; float: left; font-size:20px; color:#565555">Beschreibung</h3>
	                                <input type="reset" value="Verwerfen" class="buttonGray" style="float: right; margin-top: -11px"/>
	                                <input type="submit" value="Speichern" class="buttonAmber" style="float: right; margin-top: -11px"/>
	                                <div class="clear"></div>
					<hr style="margin-bottom: 15px"/>
	                                <textarea name="beschreibung" style="font-family: arial; line-height:19px; text-align:justify; max-width:510px; width:510px; min-height: 500px;border-style:dashed; background-color:transparent">Beschreibungstext...</textarea>
				</div>
	        </div>
			<div class="clear"></div>
		</form>
	</div>
	<div id="sidebarRight" style="margin-left: 50px; margin-top: 30px; border: 0px ; border-left-width:1px; border-style: solid; border-color: #bcbcbc; float: left; height: 100%; padding-left: 50px;">
		<div class="sidebarItem" style="height: auto" onclick="if(document.getElementById('submenuItemsManageEvents').style.display=='none'){document.getElementById('submenuItemsManageEvents').style.display='block'}else{document.getElementById('submenuItemsManageEvents').style.display='none'}">
			<img src="img/manageEventIcon.png" style="margin-top: 5px; margin-left: 5px; float: left;"/>
			<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #f0bb2d">Manage Events</p>
			<div class="clear"></div>
                        <div id="submenuItemsManageEvents" style="display: none">
                            <div style="width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top: 15px"><a href='createEvent.jsp'>Event erstellen</a></div>
                            <div style="margin-top:1px;width:80%;height:30px;background-color:darkgray; color: white; font-size:12px; padding-left: 60px; padding-top:15px"><a href='FrontController?site=listOwnEvents'>Events listen</a></div>
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
				<p style="float: left; margin-left: 15px; font-size: 12px; margin-top: 18px; font-weight: 600; color: #565555"><a href="FrontController?site=editUserInformation" style="color: rgb(86, 85, 85);text-decoration:none">Edit User Information</a></p>
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