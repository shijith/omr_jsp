<%-- 
    Document   : show_status
    Created on : 21 Aug, 2011, 10:18:55 AM
    Author     : guest
--%>

<%@page import="movieclasses.Show"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="movieclasses.booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Status Page</title>
    </head>
    <body>
        <%
            ResultSet res;
            booking bk = new booking();
            Show show = new Show();
            int uid = Integer.parseInt(session.getAttribute("uid").toString());
            int bid = 0, wid, sid, seat_no;
            String show_name, show_date, show_time;
            char seat_type;

            res = bk.get_bookings(uid);
            if (res.next()) {
                res.previous();%>

        <h2>Bookings</h2>
        <FORM METHOD=POST ACTION="welcome.jsp">

            <%
                while (res.next()) {
                    bid = res.getInt("bid");
                    sid = res.getInt("sid");
                    seat_no = res.getInt("seat_no");
                    show_name = show.get_show_name(sid);
                    show_date = res.getString("show_date");
                    show_time = res.getString("show_time");

            %>
            <INPUT TYPE=RADIO NAME=bid VALUE="<%= bid%>" ><%= seat_no + "  " + show_name + "  " + " " + show_date + " " + show_time%><br> 
            <%
                }
            %>
            <br/><INPUT TYPE=SUBMIT VALUE="Cancel" NAME=bk_can >
            <INPUT TYPE=SUBMIT VALUE="Update" NAME=tkt_update >
                <a href="print_ticket.jsp?bid=<%=bid%>" target="_blank">
                    <input type="button" value="Print" />
                </a>

        </FORM>
        <%
            }



            booking bk1 = new booking();
            res = bk1.get_waitings(uid);
            if (res.next()) {
                res.previous();%>
        <h2>Waitings</h2>
        <FORM METHOD=POST ACTION="welcome.jsp">

            <%
                while (res.next()) {
                    wid = res.getInt("wid");
                    sid = res.getInt("sid");

                    show_name = show.get_show_name(sid);
                    show_date = res.getString("show_date");
                    show_time = res.getString("show_time");
                    seat_type = res.getString("seat_type").charAt(0);

            %>
            <INPUT TYPE=RADIO NAME=wid VALUE="<%= wid%>" ><%= show_name + "  " + show_time + " " + seat_type%><br> 
            <%
                }
            %>
            <P><INPUT TYPE=SUBMIT VALUE="Cancel" NAME=wt_can >
        </FORM>
        <%
            }
        %>





    </body>
</html>
