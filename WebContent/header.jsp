<%@ page import="model.Organizer" %>
<div id="header">
		<div id="logoHeader" onclick="document.location='FrontController'"></div>
		<form action="FrontController" method="GET" id="searchform">
		<input type="hidden" name="site" value="search" />
		<input id="searchField" name="searchTerm" type="text" value="<%= request.getAttribute("searchTerm") != null ? request.getAttribute("searchTerm") : "Search..." %>" onclick="document.getElementById('searchField').value='';" />
		</form>
		<div class="clear"></div>
		<div id="searchButton" onclick="document.getElementById('searchform').submit()">
		</div>
		<div style="float: left">
		<% if(session.getAttribute("session") == null ){ %>
			<form>
			<input type="button" class="buttonAmber" style="margin-left:920px; margin-top: -40px; float: left" value="Login" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"/>
			<input type="button" class="buttonGray" style="margin-left:1030px; margin-top: -40px; float: left" value="Register" onclick = "document.getElementById('light2').style.display='block';document.getElementById('fade').style.display='block'"/>
			<div class="clear"></div>
			</form>
		<% } else { %>
			<div id="userMenuButton" style="background-image: none;background-size: 20%; background-repeat: no-repeat; background-position: 43px 30px ;width:50px;  position: absolute; z-index:199; margin-left: 940px; margin-top: -40px; padding: 3px; cursor: pointer" onclick="if(document.getElementById('userMenu').style.display=='block'){document.getElementById('userMenu').style.display='none';document.getElementById('userMenuButton').style.borderBottomWidth='1px';}else{document.getElementById('userMenu').style.display='block';document.getElementById('userMenuButton').style.borderBottomWidth='0px';}" onmouseover="document.getElementById('userMenuButton').style.backgroundImage='url(dropDownIcon.png)'" onmouseout="document.getElementById('userMenuButton').style.backgroundImage='none'">
			<img src="img/unfug.jpg" style="width:70%; border-width:1px; border-style:dashed "/>
		</div>
		<div id="userMenu" style="display: none; width:200px; z-index: 0; position: absolute; background-color: #565555;box-shadow: 10px 10px 30px #888; margin-left: 940px; margin-top:10px;">
		<ul>
		<li>
		<a href="FrontController">Home</a>
		</li>
		<li>
		<a href="FrontController?site=editUserInformation&action=noEdit">Profile</a>
		</li>
		<li>
		<a href="FrontController?site=search&searchTerm=">Veranstaltungssuche</a>
		</li>
		<% if (session.getAttribute("session") instanceof Organizer){ %>
			<li>
			<a href="FrontController?site=listOwnEvents">Eigne Veranstaltungen</a>
			</li>
		<% } %>
		<li>
		<a href="FrontController?site=logout">Logout</a>
		</li>
		</ul>
		</div>
		<div class="clear"></div>
		<% } %>
		</div>
		<div class="clear"></div>
</div>
<div id="light" class="white_content" style="font-size:12px">
		<img src="img/crossOrange.png" style="position:absolute;margin-left:270px; margin-top: 3px;cursor:pointer;" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none';"/>
		<h3 style="margin-bottom:15px; color:rgb(86, 85, 85)">Login</h3>
		<hr style="margin-top:10px; margin-bottom:15px"/>
		<form action="FrontController" method="GET" >
			Username:<br/>
			<input type="text" name="username" class="textField" style="margin-bottom:15px" /><br/>
			Password:<br/>
			<input type="password" name="password" class="textField" />
			<input type="hidden" value="login" name="site" />
			<input type="submit" class="buttonAmber" value="Login" style="margin-top:10px"/>
			<input type="reset" class="buttonGray" value="Reset" style="margin-top:10px"/>	
		</form>
	</div>
	<div id="light2" class="white_content" style="font-size:12px; height: 400px">
		<img src="img/crossOrange.png" style="position:absolute;margin-left:270px; margin-top: 3px;cursor:pointer;" onclick="document.getElementById('light2').style.display='none';document.getElementById('fade').style.display='none';"/>
		<h3 style="margin-bottom:15px; color:rgb(86, 85, 85)">Register</h3>
		<hr style="margin-top:10px; margin-bottom:15px"/>
		<form action="FrontController" method="GET">
			Username:<br/>
			<input type="text" name="username" class="textField" style="margin-bottom:15px" /><br/>
			Password:<br/>
			<input type="password" name="password" class="textField" style="margin-bottom:15px" />
			Retype Password:<br/>
			<input type="password" name="password2" class="textField" /><br/><br/>
			Usertype:<br/><br/>
			<label for="" style="float:left">Enduser</label><input type="checkbox" name="enduser" id="enduser" style="float:left" onclick="document.getElementById('organizer').checked = false" checked/>
			<label for="" style="float:left; margin-left: 15px">Organizer</label><input type="checkbox" name="organizer" id="organizer" style="float:left" onclick="document.getElementById('enduser').checked = false"/><br/>
			<div class="clear"></div>
			<input type="hidden" value="register" name="site" />
			<input type="submit" class="buttonAmber" value="Login" style="margin-top:10px"/>
			<input type="reset" class="buttonGray" value="Reset" style="margin-top:10px"/>	
		</form>
	</div>
    <div id="fade" class="black_overlay"></div>