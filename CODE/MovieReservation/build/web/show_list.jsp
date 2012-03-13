<%-- 
    Document   : show_list
    Created on : 19 Aug, 2011, 9:28:51 PM
    Author     : guest
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.xs.YearDV"%>
<%@page import="java.util.Calendar"%>
<%@page import="movieclasses.Show"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Movie page</title>
    </head>
    <body>
        <h1>Select movie and time</h1>
        <FORM METHOD=POST ACTION="booking.jsp">
            <table>

                <%
                    int i = 0;
                    int sid;
                    String start, end;
                    Show show = new Show();
                    ResultSet res = show.show_list();
                    int start_year;
                    int end_year;
                    while (res.next()) {
                        sid = res.getInt("sid");
                        start = res.getDate("start_date").toGMTString().substring(0, 11);
                        start_year = Integer.parseInt(res.getDate("start_date").toGMTString().substring(7, 11));

                        end = res.getDate("end_date").toGMTString().substring(0, 11);
                        end_year = Integer.parseInt(res.getDate("end_date").toGMTString().substring(7, 11));
                %>
                <tr>
                    <td>
                        <INPUT TYPE=RADIO NAME=sid VALUE="<%= sid%>" /><%=res.getString("show_name")%> 
                        (<%= start%> -- <%= end%>)
                    </td>
                    <td>
                        <select name="<%="year" + sid%>" > <%
                            for (i = start_year; i <= end_year; i++) {%>
                            <option value="<%= i%>"><%= i%></option> 
                            <%}%>
                        </select>
                    </td>
                    <td>
                        <select name="<%= "month" + sid%>" > <%
                            for (i = 1; i <= 12; i++) {%>
                            <option value="<%= i%>"><%= i%></option> 
                            <%}%>
                        </select>
                    </td>
                    <td>
                        <select name="<%= "date" + sid%>"> <%
                            for (i = 1; i <= 31; i++) {%>
                            <option value="<%= i%>"><%= i%></option> 
                            <%}%>
                        </select>
                    </td>
                    <td>
                        <select name="<%= "tid" + sid%>">
                            <option value="1">MNG</option>
                            <option value="2">NON</option>
                            <option value="3">EVN</option>
                            <option value="4">NGT</option>
                        </select>
                    </td>
                    <%}%>
                </tr>
                <tr>
                    <td colspan="5">
                        <INPUT TYPE=SUBMIT VALUE="Check" NAME=check />
                    </td>
                </tr>
            </table>
        </FORM>
        <br/><a href="welcome.jsp">back</a>
    </body>
</html>
