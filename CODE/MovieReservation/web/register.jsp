<%-- 
    Document   : register
    Created on : 19 Aug, 2011, 11:54:17 AM
    Author     : guest
--%>

<%@page import="movieclasses.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Register Page</title>
    </head>
    <body>
        <h1>Add details</h1>

        <%
            User user = new User();
            int uid = -1;
            String user_name = request.getParameter("username");
            String password = request.getParameter("password");

            if (user_name != null && password != null) {
                if (user_name.length() > 0 && password.length() > 4) {
                    char sex = request.getParameter("sex").charAt(0);
                    user.register(user_name.toLowerCase(), password, sex);
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("Invalid details\n");
                }
            }

        %>
        <div>
            <FORM METHOD=POST ACTION="register.jsp">
                <table>
                    <tr>
                        <td>
                            Username 
                        </td>
                        <td>
                            <INPUT TYPE=TEXT NAME=username SIZE=20/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password 
                        </td>
                        <td>
                            <INPUT TYPE=PASSWORD NAME=password SIZE=20/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sex </td>
                        <td>
                            <select name="sex" >
                                <option value="m">Male</option>
                                <option value="f">Female</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <P><INPUT TYPE=SUBMIT VALUE="Register" NAME=reg >
            </FORM>
            <br/><a href="index.jsp">back</a>
        </div>    
    </body>
</html>
