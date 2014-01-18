<%@ page import="daos.*" %>
<%@ page import="java.util.List"%>
<html>
<head>
<title>EMP - Event Management Project</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="content">
		<div class="statistikenContainer" style="height: 440px"><br /><br /><br />
			# Users: <%= UserDAO.getUserDAO().getUserList().size() %><br />
			# Followings: <%= FollowDAO.getFollowDAO().getFollowList().size() %><br />
			# Events: <%= EventDAO.getEventDAO().getEventList().size() %><br />
		</div>	

	</div>

	<jsp:include page="sidebar.jsp" />
</body>
</html>