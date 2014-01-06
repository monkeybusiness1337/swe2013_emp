<%@ page import="model.Enduser" %>

<html>
<head>
<title>EMP - Event Management Project</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="content">
		<form method="POST" action="FrontController" enctype="multipart/form-data">
		<input type="hidden" name="site" value="editUserInformation"/>
			<div id="eventLeft" style="float: left">
			<%
				boolean haspic = ((Enduser)request.getAttribute("user")).getUserPicPath() != null ;
			%>
				<div class="eventContainerNoHover" style="height: 500px">
					<% if(haspic) { %>
						<img src="${user.userPicPath}" style="padding:11px; width: 210px; margin-bottom: 20px;"/>
	                <% } else { %>
	                		<img src="img/nopic.jpeg" style="padding:11px; width: 210px; margin-bottom: 20px;"/>
	                 <% } %>
	                  <span style="margin-left: 12px ; font-weight: 800; color: #565555;"><input type="text" name="username" value="${user.userName}" disabled="disabled" style="width:198px;color:#565555;font-weight:800;font-size:16px;border: none !important ; background-color: transparent !important"/></span>
						<input type="hidden" name="uname" value="<%=((Enduser)request.getAttribute("user")).getUserName() %>"/>
							<div style="margin-top: 20px; margin-left: 15px">
								<label for="" style="font-size:10pt; font-weight: bold; border: none">Vorname: </label>
								<input disabled="disabled" type="text" name="firstName" value="${user.firstName}" style="font-size: 10pt !important; margin-top:5px !important; margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d; border: none"/>
								<label for="" style="font-size:10pt; font-weight: bold">Nachname:</label>
								<input disabled="disabled" type="text" name="lastName" value="${user.lastName}" style="font-size: 10pt !important; margin-top:5px !important;  margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d; border: none"/>
								<label for="" style="font-size:10pt; font-weight: bold">Geburstdatum:</label>
								<input disabled="disabled" type="text" name="birthDate" value="${user.birthDate}" style="font-size: 10pt !important; margin-top:5px !important;  margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d; border: none"/>
							</div>	
				</div>
				<div class="clear"></div>
	                </div>
			<div id="eventContainerRechts">
				<div style="float: left; margin-left: 10px; background-color: #f5f5f5; width: 510px; min-height: 500px; margin-top: 30px; padding: 20px; text-align: justify; font-size:12px; line-height:19px">
					<h3 style="margin-top: 0px; float: left; font-size:20px; color:#565555">About</h3>
	                                <% if (session.getAttribute("session") != null) { %>
	                                <input type="submit" value="Folgen" class="buttonGray" style="float: right; margin-top: -11px"/>
	                                <% } %>
	                                <div class="clear"></div>
					<hr style="margin-bottom: 15px"/>
	                                <textarea disabled="disabled" name="about" style="color: rgb(86, 85, 85) !important ; border: none !important ; font-family: arial; line-height:19px; text-align:justify; max-width:510px; width:510px; min-height: 500px;border-style:dashed; background-color:transparent">${user.about}</textarea>
				</div>
	                </div>
			<div class="clear"></div>
		</form>
	</div>
	<jsp:include page="sidebar.jsp" />
</body>
</html>