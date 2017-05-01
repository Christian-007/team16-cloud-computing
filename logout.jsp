<%
	session.setAttribute("currentUser", null);
	session.invalidate();
	response.sendRedirect("login.jsp");
%>