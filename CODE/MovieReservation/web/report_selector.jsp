<%-- 
    Document   : generate_report
    Created on : 24 Aug, 2011, 12:04:43 AM
    Author     : guest
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="movieclasses.Show"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Report Page</title>
    </head>
    <body>
        <h1>Report Generation</h1>
        <div>
            <FORM METHOD=POST ACTION="generate_report.jsp">
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
                        <%}%>
                    </tr>
                    <tr>
                        <td colspan="1">
                            <INPUT TYPE=SUBMIT VALUE="Show" NAME=show />
                        </td>
                        <td colspan="3" >
                            <INPUT TYPE=SUBMIT VALUE="Show All" NAME=show_all />
                        </td>
                    </tr>
                </table>
            </FORM>
            <br/><a href="welcome.jsp">back</a>

        </div>    
    </body>
</html>
