<%
	session.setAttribute("currentUser", null);
	session.invalidate();
	Cookie killMyCookie = new Cookie("userLogin", null);
	killMyCookie.setMaxAge(0);
	killMyCookie.setPath("/");
    response.addCookie(killMyCookie);
	response.sendRedirect("login.jsp");
%>