<%-- 
    Document   : change_password
    Created on : 18 Aug, 2011, 10:32:24 PM
    Author     : guest
--%>

<%@page import="movieclasses.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Change Password</title>
    </head>
    <body>
        <h1>Change Password</h1>
        <%
            User user = new User();
            int uid = -1;
            String password = request.getParameter("password");

            if (password != null) {
                if (password.length() > 0) {

                    uid = Integer.parseInt(session.getAttribute("uid").toString());
                    if (uid != -1) {
                        user.change_password(uid, password);
        %>
        <script>
            alert('Changed Password');
            window.location = "http://localhost:8084/MovieReservation/welcome.jsp"
        </script>
        <%
            }

        } else {
        %><script>
            alert('Invalid');
        </script>
        <%                }
            }
        %>

        <div>
            <FORM METHOD=POST ACTION="change_password.jsp">
                New Password <INPUT TYPE=PASSWORD NAME=password SIZE=20/>
                <P><INPUT TYPE=SUBMIT VALUE="change" />
            </FORM>
            <br/><a href="welcome.jsp">back</a>
        </div>    
    </body>
</html>
