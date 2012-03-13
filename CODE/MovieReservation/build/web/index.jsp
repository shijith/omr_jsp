<%-- 
    Document   : index
    Created on : 17 Aug, 2011, 9:06:48 PM
    Author     : guest
--%>

<%@page import="movieclasses.Show"%>
<%@page import="movieclasses.booking"%>
<%@page import="java.sql.Statement"%>
<%@page import="movieclasses.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" /> 
        <title>Index Page</title>
    </head>
    <body>
        <%
            Show show = new Show();
        %>

        <h1>Welcome to  <%=show.get_theater_name()%></h1>
        <jsp:include page="login.jsp"/>

    </body>
</html>
