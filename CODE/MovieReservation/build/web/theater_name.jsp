<%-- 
    Document   : theater_name
    Created on : 23 Aug, 2011, 10:43:16 PM
    Author     : guest
--%>

<%@page import="movieclasses.Show"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Theater Name update Page</title>
    </head>
    <body>
        <h1>Enter New Theater Name</h1>
        <%
            String theater_name = request.getParameter("theater_name");

            if (theater_name != null) {
                if (theater_name.length() > 0) {
                    Show show = new Show();
                    show.change_theater_name(theater_name);
        %>
        <script>
            alert('Name changed');
            window.location = "http://localhost:8084/MovieReservation/welcome.jsp"
        </script>
        <%

        } else {
        %>
        <script>
            alert('Invalid');
        </script>
        <%                }
            }
        %>

        <div>
            <FORM METHOD=POST ACTION="theater_name.jsp">
                New Theater Name <INPUT TYPE=TEXT NAME=theater_name SIZE=30/>
                <br/><INPUT TYPE=SUBMIT VALUE="change" />
            </FORM>
            <br/><a href="welcome.jsp">back</a>
        </div>    
    </body>
</html>
