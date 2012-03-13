<%-- 
    Document   : add_show
    Created on : 19 Aug, 2011, 2:21:37 PM
    Author     : guest
--%>

<%@page import="movieclasses.Fare"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="movieclasses.Show"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Add show</title>
    </head>
    <body>
        <h1>Update fare</h1>
        <%if (request.getParameter("update") != null && request.getParameter("sid") != null) {
                int sid = Integer.parseInt(request.getParameter("sid").toString());
                String fare_balcony = request.getParameter("fare_balcony"+sid);
                String fare_first = request.getParameter("fare_first"+sid);
                String fare_second = request.getParameter("fare_second"+sid);

                if (fare_balcony != null && fare_first != null && fare_second != null) {
                    Fare fare = new Fare();
                    int bal_fare = Integer.parseInt(fare_balcony.toString());
                    int fir_fare = Integer.parseInt(fare_first.toString());
                    int sec_fare = Integer.parseInt(fare_second.toString());
                    fare.update_fare(sid, bal_fare, fir_fare, sec_fare);

                }
            }
        %>

        <div>
            <FORM METHOD=POST ACTION="update_fare.jsp">
                <%
                    int sid = 0;
                    Show show = new Show();
                    ResultSet res = show.show_list();
                %>
                <table>
                    <tr>
                        <td>
                            Show Name
                        </td>
                        <td>
                            Balcony Fare
                        </td>
                        <td>
                            First Class
                        </td>
                        <td>
                            Second Class
                        </td>
                    </tr>
                    <%
                        while (res.next()) {
                            sid = res.getInt("sid");
                    %>
                    <tr>
                        <td>
                            <INPUT TYPE=RADIO NAME=sid VALUE="<%= sid%>" /><%=res.getString("show_name")%>
                        </td>
                        <td>
                            <INPUT TYPE=TEXT NAME="<%="fare_balcony"+sid%>" />
                        </td>
                        <td> 
                            <INPUT TYPE=TEXT NAME="<%="fare_first"+sid%>" />
                        </td>
                        <td>
                            <INPUT TYPE=TEXT NAME="<%="fare_second"+sid%>" />
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="4">
                            <INPUT TYPE=SUBMIT VALUE="Update" NAME=update />
                        </td>
                    </tr>
                </table>
            </FORM>
            <br/><a href="welcome.jsp">back</a>

        </div>    
    </body>
</html>
