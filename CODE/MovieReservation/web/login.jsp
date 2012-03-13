<%-- 
    Document   : login
    Created on : 18 Aug, 2011, 1:04:12 PM
    Author     : guest
--%>

<%@page import="movieclasses.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" /> 
        <title>Login Page</title>
    </head>
    <body>
        <%
            User user = new User();
            int uid = -1;
            String user_name = request.getParameter("username");
            String password = request.getParameter("password");
            String action = request.getParameter("sign");

            if (user_name != null && password != null) {
                if (action.equals("Sign IN")) {
                    uid = user.login(user_name, password);
                    if (uid != -1) {
                        out.println("valid");
                        session.setAttribute("user_name", user_name);
                        session.setAttribute("uid", uid);
                        response.sendRedirect("welcome.jsp");
                    } else {
                        out.println("Invalid details\n");
                    }
                } else {
                    response.sendRedirect("register.jsp");

                }
            }

        %>

        <div>
            <FORM METHOD=POST ACTION="login.jsp">
                <table>
                    <tr>
                        <td>
                            Username </td>
                        <td><INPUT TYPE=TEXT NAME=username SIZE=20><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>

                            Password </td>
                        <td><INPUT TYPE=PASSWORD NAME=password SIZE=20>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <INPUT TYPE=SUBMIT VALUE="Sign IN" NAME=sign />
                        </td>       
                        <td align="right">
                            <INPUT TYPE=SUBMIT VALUE="Sign UP" NAME=sign />
                        </td>
                    </tr>
                </table>
            </FORM>
        </div>    
    </body>
</html>
