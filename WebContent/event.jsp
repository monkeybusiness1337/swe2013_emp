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
				<div class="teilnehmerLine">
				<% 
				int j = 0 ;
				for(Enduser user : ((Event)request.getAttribute("event")).getParticipatedUsers() )
				{
					if(user != null){
						j++ ;
				%>
					<a href="user/<%=user.getUserName()%>">
						<div class="userItem" style="width: 27%; height: 80px; font-size:10px; float: left; margin-left:5px">
							<img src="img/unfug.jpg" style="width: 100%"/>
							<p style="margin-top:3px; font-weight: bold"><%=user.getUserName()%></p>
						</div>
					</a>
				<%
					}
					if(j%3 == 0){
						%>
						<div class="clear"></div>
						<%
					}
				} 
				if(j == 0){
					%>
					Keine Teilnehmer..
					<%
				}
				%>
				</div>
				<!-- 
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
				 -->
			</div>
		</div>
		<div id="eventContainerRechts">
			<div style="float: left; margin-left: 10px; background-color: #f5f5f5; width: 510px; min-height: 500px; margin-top: 30px; padding: 20px; text-align: justify; font-size:12px; line-height:19px">
				<h3 style="margin-top: 0px; float: left; font-size:20px; color:#565555">Beschreibung</h3>
				<% if (session.getAttribute("session") != null ) { %>
					<form action="FrontController" method="GET" style="padding:0;margin:0">
						<input type="hidden" name="shareEvent" value="${event.eventId}" />
	                	<input type="reset" value="Teilen" class="buttonGray" style="float: right; margin-top: -11px"/>
	                </form>
	                <form action="FrontController" method="GET" style="padding:0;margin:0">
	                	<input type="hidden" name="participateEvent" value="${event.eventId}" />
	                	<input type="submit" value="Teilnehmen" class="buttonAmber" style="float: right; margin-top: -11px"/>
	               	</form>
	            <% } %>
                <div class="clear"></div>
				<hr style="margin-bottom: 15px"/>
				${event.description}
				<br/>
			</div>
			<div style="float: left; margin-left: 10px; background-color: #f5f5f5; width: 510px; margin-top: 10px; font-size: 12px; padding: 20px;">
				<h3 style="margin-top: -5px">Kommentare</h3>
				<hr style="margin-bottom: 15px"/>
				<form action="FrontController" method="GET">
				<input type="hidden" name="postComment" value="${event.eventId}" />
				<textarea name="commentBody" style="max-width: 510px; width:100%; height:50px;font-family:arial; padding:10px">blablablabla....</textarea>
				<input type="submit" class="buttonAmber" style="margin-top:10px;" /></form>
				<%
					if( ((Event)request.getAttribute("event")).getComments() != null &&  (((Event)request.getAttribute("event")).getComments().size() == 0) )
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
											<%= comment.getAutorName() %><br />
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
		
			</div>
			
		</div>
		<div class="clear"></div>
	</div>
	<jsp:include page="sidebar.jsp" />
</body>
</html>