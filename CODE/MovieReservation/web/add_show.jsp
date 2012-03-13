<%-- 
    Document   : add_show
    Created on : 19 Aug, 2011, 3:12:10 PM
    Author     : guest
--%>

<%@page import="movieclasses.Fare"%>
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
        <h1>Add show</h1>
        <%
            int sid = 0;
            String show_name = request.getParameter("show_name");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");
            String fare_balcony = request.getParameter("fare_balcony");
            String fare_first = request.getParameter("fare_first");
            String fare_second = request.getParameter("fare_second");

            if (show_name != null && fare_balcony != null && start_date != null) {

                Show show = new Show();

                show.show_name = show_name;
                show.start_date = start_date;
                show.end_date = end_date;
                show.fare.fare_balcony = fare_balcony;
                show.fare.fare_first = fare_first;
                show.fare.fare_second = fare_second;
                show.add_show(show);
            }
        %>

        <div>
            <FORM METHOD=POST ACTION="add_show.jsp">
                <table>
                    <tr>
                        <td>
                            Show name
                        </td>
                        <td>
                            <INPUT TYPE=TEXT NAME=show_name SIZE=20 />
                        </td>
                    </tr>
                    <tr>
                        <td>

                            Start date
                        </td>
                        <td>
                            <INPUT TYPE=TEXT NAME=start_date SIZE=10 />
                        </td>
                    </tr>
                    <tr>
                        <td>

                            End date 
                        </td>
                        <td>
                            <INPUT TYPE=TEXT NAME=end_date SIZE=10 />
                        </td>
                    </tr>
                    <tr>
                        <td>

                            Balcony fare
                        </td>
                        <td>
                            <INPUT TYPE=TEXT NAME=fare_balcony SIZE=3 />
                        </td>
                    </tr>
                    <tr>
                        <td>

                            First class fare 
                        </td>
                        <td>
                            <INPUT TYPE=TEXT NAME=fare_first SIZE=3 />
                        </td>
                    </tr>
                    <tr>
                        <td>

                            Second class fare
                        </td>
                        <td>
                            <INPUT TYPE=TEXT NAME=fare_second SIZE=3 />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">

                            <INPUT TYPE=SUBMIT VALUE="Add" NAME=add />
                        </td>
                    </tr>
                </table>
            </FORM>
            <p><a href="welcome.jsp">back</a>

        </div>   

    </body>
</html>
