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
	               <div class="<%= !haspic ? "uploadImgBox" : "" %>" onclick="document.getElementById('fileUpload').click();">
					<% if(haspic) { %>
							<img src="${user.userPicPath}" style="width: 200px; margin: 15px; position: relative ;"/>
	                <% } else { %>
	                		<img src="img/uploadIcon.png" style="padding:11px; margin-left: 45px; margin-top: 80px; width: 40%;-moz-opacity: 0.7; opacity: 0.7;filter: alpha(opacity = 70);"/>
	                        <p style="font-size:12px; color: #f0bb2d; margin-left: 40px;">Upload User Picture!</p>
	                         <input type="file" name="fileName" id="fileUpload">
	                 <% } %>
	                  </div>
	                  <span style="margin-left: 12px ; font-weight: 800; color: #565555;"><input type="text" name="username" value="${user.userName}" disabled="disabled" style="width:198px;color:#565555;font-weight:800;font-size:16px;border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: gray; border-style:dashed"/></span>
						<input type="hidden" name="uname" value="<%=((Enduser)request.getAttribute("user")).getUserName() %>" />
							<div style="margin-top: 20px; margin-left: 15px">
								<label for="" style="font-size:10pt; font-weight: bold">Vorname: </label>
								<input type="text" name="firstName" value="${user.firstName}" style="font-size: 10pt !important; margin-top:5px !important; margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
								<label for="" style="font-size:10pt; font-weight: bold">Nachname:</label>
								<input type="text" name="lastName" value="${user.lastName}" style="font-size: 10pt !important; margin-top:5px !important;  margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
								<label for="" style="font-size:10pt; font-weight: bold">Geburstdatum:</label>
								<input type="text" name="birthDate" value="${user.birthDate}" style="font-size: 10pt !important; margin-top:5px !important;  margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
							</div>	
				</div>
				<div class="clear"></div>
	                </div>
			<div id="eventContainerRechts">
				<div style="float: left; margin-left: 10px; background-color: #f5f5f5; width: 510px; min-height: 500px; margin-top: 30px; padding: 20px; text-align: justify; font-size:12px; line-height:19px">
					<h3 style="margin-top: 0px; float: left; font-size:20px; color:#565555">About</h3>
	                                <input type="reset" value="Verwerfen" class="buttonGray" style="float: right; margin-top: -11px"/>
	                                <input type="submit" value="Speichern" class="buttonAmber" style="float: right; margin-top: -11px"/>
	                                <div class="clear"></div>
					<hr style="margin-bottom: 15px"/>
	                                <textarea name="about" style="font-family: arial; line-height:19px; text-align:justify; max-width:510px; width:510px; min-height: 500px;border-style:dashed; background-color:transparent">${user.about}</textarea>
				</div>
	                </div>
			<div class="clear"></div>
		</form>
	</div>
	<jsp:include page="sidebar.jsp" />
</body>
</html>