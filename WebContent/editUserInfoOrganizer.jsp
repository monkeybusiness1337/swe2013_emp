<%@ page import="model.Organizer" %>

<html>
<head>
<title>EMP - Event Management Project</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="content">
		<form method="GET" action="FrontController">
		<input type="hidden" name="site" value="editUserInformation"/>
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
								<input type="text" name="email" value="${user.email}" style="font-size: 10pt !important; margin-top:5px !important;  margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
								<br/>
								<label for="" style="font-size:10pt; font-weight: bold">Contact Tel:</label>
								<input type="text" name="tel" value="${user.tel}" style="font-size: 10pt !important; margin-top:5px !important;  margin-bottom: 10px !important ;width: 160px; border-width:0px; background-color: transparent; border-bottom-width:1px; border-color: #f0bb2d; border-style:dashed; color: #f0bb2d"/>
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
	                                <textarea name="description" style="font-family: arial; line-height:19px; text-align:justify; max-width:510px; width:510px; min-height: 500px;border-style:dashed; background-color:transparent">${user.description}</textarea>
				</div>
	                </div>
			<div class="clear"></div>
		</form>
	</div>
	<jsp:include page="sidebar.jsp" />
</body>
</html>