<%-- 
    Document   : logout
    Created on : 23 Aug, 2011, 1:57:48 PM
    Author     : guest
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("uid");
            session.removeAttribute("user_name");
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
