<%@ page import="model.Event" %>
<%@ page import="model.Comment" %>
<%@ page import="model.Enduser" %>
<%@ page import="java.util.List" %>

<html>
<head>
<title>EMP - Event Management Project</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="content">
		<div id="eventLeft" style="float: left">
			<div class="eventContainerNoHover">
					<!-- <img src="img/flyer.png" style="padding:11px"/> -->
					<img src="${event.picturePath}" style="padding:11px; width: 210px"/>
					<span style="margin-left: 12px ; font-weight: 800; color: #565555;">${event.eventName}</span>
					<table style="margin-left: 11px; height: 100px; color: #f0bb2d;  font-size: 12px; margin-top: 8px">
						<tr><td><img src="img/locationIcon.png" style="margin-left: 1px"/></td><td style="padding-left: 15px">${event.eventPlace}</td></tr>
						<tr><td><img src="img/dateIcon.png" /></td><td style="padding-left: 14px">${event.eventDate}</td></tr>
						<tr><td><img src="img/genreIcon.png" /></td><td style="padding-left: 15px">${event.genre}</td></tr>
					</table>
			</div>
			<div class="clear"></div>
			<div class="teilnehmerContainer">
				<h3 style="margin-top: -5px">Teilnehmer<span style="font-size:11px;color:#f0bb2d; font-weight: normal">&nbsp;&nbsp;(<%= ((Event)request.getAttribute("event")).getParticipatedUsers().size() %> going)</span></h3>
				<hr style="margin-bottom: 15px"/>
				
				<% 
				List<Enduser> allUsers = ((Event)request.getAttribute("event")).getParticipatedUsers();
				for( model.Enduser forUser : allUsers )
				{
				%>
				
				
				<div class="teilnehmerLine">
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left;">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left; margin-left:16px">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left; margin-left:16px">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="clear"></div>
				</div>
				
				<% } %>
				
				<div class="teilnehmerLine">
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left;">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left; margin-left:16px">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left; margin-left:16px">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="clear"></div>
				</div>
				<div class="teilnehmerLine">
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left;">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left; margin-left:16px">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left; margin-left:16px">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="clear"></div>
				</div>
				<div class="teilnehmerLine">
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left;">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left; margin-left:16px">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left; margin-left:16px">
						<img src="img/unfug.jpg" style="width: 100%"/>
						<p style="margin-top:3px; font-weight: bold">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
					</div>
					<div class="clear"></div>
				</div>
				<br/>
				<a href="#" style="font-size:11px">show all</a>
			</div>
		</div>
		<div id="eventContainerRechts">
			<div style="float: left; margin-left: 10px; background-color: #f5f5f5; width: 510px; min-height: 500px; margin-top: 30px; padding: 20px; text-align: justify; font-size:12px; line-height:19px">
				<h3 style="margin-top: 0px; float: left; font-size:20px; color:#565555">Beschreibung</h3>
                                <input type="reset" value="Teilen" class="buttonGray" style="float: right; margin-top: -11px"/>
                                <input type="submit" value="Teilnehmen" class="buttonAmber" style="float: right; margin-top: -11px"/>
                                <div class="clear"></div>
				<hr style="margin-bottom: 15px"/>
				${event.description}
				<br/>
			</div>
			<div style="float: left; margin-left: 10px; background-color: #f5f5f5; width: 510px; margin-top: 10px; font-size: 12px; padding: 20px;">
				<h3 style="margin-top: -5px">Kommentare</h3>
				<hr style="margin-bottom: 15px"/>
				<textarea style="max-width: 510px; width:100%; height:50px;font-family:arial; padding:10px">blablablabla....</textarea>
				<input type="submit" class="buttonAmber" style="margin-top:10px;" />
				<%
					if(((Event)request.getAttribute("event")).getComments().size() == 0)
						out.print("<br/><br/>No comments avalaible...") ;
					else{
						for(Comment comment : ((Event)request.getAttribute("event")).getComments()){
							%>
								<div class="kommentar"
									style="margin-top: 20px; border: 0; border-top: 5; border-color: white; border-style: solid">
									<div
										style="margin-top: 10px; margin-left: 15px; float: left; width: 20%">
										<img src="img/unfug.jpg" style="width: 60%;" />
										<p style="margin-top: 3px; font-weight: bold;">
											<%= comment.getAutor() %><br />
											<span style="font-size: 8px; font-weight: normal">10 Followers</span>
										</p>
									</div>
									<p style="width: 75%; text-align: justify; float: left; margin-top: 7px">
										<%= comment.getCommentBody() %>
									</p>
									<p style="font-size: 9px; color: #565555"><%= comment.getDraftDate() %></p>
									<div class="clear"></div>
								</div>
				<%
						}
					}
				
				%>
				<!-- 
			<div class="kommentar" style="margin-top: 20px; border:0; border-top:5; border-color: white; border-style: solid">
				<div style="margin-top: 10px; margin-left: 15px; float: left; width: 20%">
					<img src="img/unfug.jpg" style="width: 60%;"/>
					<p style="margin-top:3px; font-weight: bold;">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
				</div>
				<p style="width: 75%; text-align: justify; float: left; margin-top: 7px">
				Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
				</p>
				<p style="font-size: 9px; color: #565555">22:28 Uhr, 09.November 2013</p>
				<div class="clear"></div>
			</div>
			<div class="kommentar">
				<div style="margin-top: 10px; margin-left: 15px; float: left; width: 20%">
					<img src="img/unfug.jpg" style="width: 60%;"/>
					<p style="margin-top:3px; font-weight: bold;">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
				</div>
				<p style="width: 75%; text-align: justify; float: left; margin-top: 7px">
				Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
				</p>
				<p style="font-size: 9px; color: #565555">22:28 Uhr, 09.November 2013</p>
				<div class="clear"></div>
			</div>
			<div class="kommentar">
				<div style="margin-top: 10px; margin-left: 15px; float: left; width: 20%">
					<img src="img/unfug.jpg" style="width: 60%;"/>
					<p style="margin-top:3px; font-weight: bold;">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
				</div>
					<div style="width: 75%;text-align: justify; float: left; margin-top: 7px">
						Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
						nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
						erat, sed diam voluptua. At vero eos et accusam et justo duo
						dolores et ea rebum. Stet clita kasd gubergren, no sea takimata
						sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit
						amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
						invidunt ut labore et dolore magna aliquyam erat, sed diam
						voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
						Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
						dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing
						elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore
						magna aliquyam erat, sed diam voluptua. At vero eos et accusam et
						justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea
						takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor
						sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
						tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
						voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
						Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
						dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing
						elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore
						magna aliquyam erat, sed diam voluptua. At vero eos et accusam et
						justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea
						takimata sanctus est Lorem ipsum dolor sit amet.<p style="font-size: 9px; color: #565555">22:28 Uhr, 09.November 2013</p></div>
				<div class="clear"></div>
			</div>
			<div class="kommentar">
				<div style="margin-top: 10px; margin-left: 15px; float: left; width: 20%">
					<img src="img/unfug.jpg" style="width: 60%;"/>
					<p style="margin-top:3px; font-weight: bold;">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
				</div>
				<p style="width: 75%; text-align: justify; float: left; margin-top: 7px">
				Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
				</p>
				<p style="font-size: 9px; color: #565555">22:28 Uhr, 09.November 2013</p>
				<div class="clear"></div>
			</div>
			<div class="kommentar">
				<div style="margin-top: 10px; margin-left: 15px; float: left; width: 20%">
					<img src="img/unfug.jpg" style="width: 60%;"/>
					<p style="margin-top:3px; font-weight: bold;">Unfug1337<br/><span style="font-size:8px; font-weight:normal">63 Followers</span></p>
				</div>
				<p style="width: 75%; text-align: justify; float: left; margin-top: 7px">
				Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
				</p>
				<p style="font-size: 9px; color: #565555">22:28 Uhr, 09.November 2013</p>
				<div class="clear"></div>
			</div> -->
			</div>
			
		</div>
		<div class="clear"></div>
	</div>
	<jsp:include page="sidebar.jsp" />
</body>
</html>