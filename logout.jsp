<%
	session.setAttribute("currentUser", null);
	session.invalidate();
	Cookie ck = new Cookie("userEmail", "email");
	ck.setMaxAge(0);
	response.addCookie(ck);
	response.sendRedirect("login.jsp");
%>