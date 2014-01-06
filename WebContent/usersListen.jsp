<%@ page import="model.User"%>
<%@ page import="model.Enduser"%>
<%@ page import="java.util.List"%>
<html>
<head>
<title>EMP - Event Management Project</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="content">
		<%
			int index = 0;
			for (model.User user : ((List<User>) request.getAttribute("users"))) {
				if (user instanceof Enduser) {
		%>
		<div class="eventContainer" style="height: 440px">
			<img
				src="<%=((Enduser) user).getUserPicPath() == null ? "img/nopic.jpeg"
							: ((Enduser) user).getUserPicPath()%>"
				style="padding: 11px; width: 210px" /> <span
				style="margin-left: 12px; font-weight: 800; color: #565555;"><%=user.getUserName()%></span>
			<table
				style="margin-left: 11px; height: 100px; color: #f0bb2d; font-size: 12px; margin-top: 8px; margin-bottom: 10px">
				<tr>
					<td><img src="img/locationIcon.png" style="margin-left: 1px" /></td>
					<td style="padding-left: 15px"><%=user.getFirstName()%></td>
				</tr>
				<tr>
					<td><img src="img/dateIcon.png" /></td>
					<td style="padding-left: 14px"><%=user.getLastName()%></td>
				</tr>
				<tr>
					<td><img src="img/genreIcon.png" /></td>
					<td style="padding-left: 15px"><%=user.getBirthDate()%></td>
				</tr>
			</table>
			<input type="button" value="Follow" name="edit" class="buttonAmber"
				style="float: left; margin-left: 10px;" /> <input type="button"
				value="View" name="edit" class="buttonGray"
				style="float: left; margin-left: 10px;"
				onclick="window.location.href='user?userName=<%=user.getUserName()%>'" />
			<div class="clear"></div>
		</div>
		<%
			if (index > 0 && index++ % 3 == 0)
						out.print("<div class='clear'></div>");
		%>
		<%
			}
			}
			if (((List<User>) request.getAttribute("users")).size() == 0)
				out.print("<div style='margin-left:50px;margin-top:30px;'>No Users registered yet..</div>");
		%>

	</div>

	<jsp:include page="sidebar.jsp" />
</body>
</html>