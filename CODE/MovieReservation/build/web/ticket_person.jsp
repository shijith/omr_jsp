<%-- 
    Document   : ticket_person
    Created on : 23 Aug, 2011, 8:53:59 PM
    Author     : guest
--%>

<%@page import="movieclasses.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Ticket/person update Page</title>
    </head>
    <body>
        <h1>Update max ticket/person</h1>
        <%
            User user = new User();
            int tkt_limit = -1;

            if (!request.getParameter("tkt_no").isEmpty()) {
                String tkt_no = request.getParameter("tkt_no");
                tkt_limit = Integer.parseInt(request.getParameter("tkt_no").toString());
                if (tkt_limit > 0) {
                    user.change_tkt_person(tkt_limit);
        %>
        <script>
            alert('Changed limit');
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
            <FORM METHOD=POST ACTION="ticket_person.jsp">
                New ticket limit <INPUT TYPE=TEXT NAME=tkt_no SIZE=3/>
                <P><INPUT TYPE=SUBMIT VALUE="update" />
            </FORM>
            <br/><a href="welcome.jsp">back</a>
        </div>    
    </body>
</html>
