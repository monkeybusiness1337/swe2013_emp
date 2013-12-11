<%@ page import="daos.EventDAO" %>
<html>
<head>
<title>EMP - Event Management Project</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="content">
		<div id="welcomeContainer" style="">
		<img src="img/cross_20.png" style="position:absolute;margin-left: 745px; margin-top: 3px;cursor:pointer;" onclick="document.getElementById('welcomeContainer').style.display='none';"/>
		<h1 style="margin-top:10px">Welcome on EMP!</h1>
		<p style="font-size:13px; line-height:1.5; width:90%; margin-top:-10px">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>
		</div>
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
		<div class="clear"></div>
	</div>
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
	<div class="clear"></div>
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
</body>
</html>