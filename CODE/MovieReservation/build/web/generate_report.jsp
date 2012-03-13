<%-- 
    Document   : generate_report
    Created on : 24 Aug, 2011, 12:25:37 AM
    Author     : guest
--%>

<%@page import="movieclasses.Seat"%>
<%@page import="movieclasses.Show"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Generate Report Page</title>
    </head>
    <body>
        <h1>Report</h1>
        <br/>(booking_id, show_date, show_time, seat_no, Class, Zone)
        <%if (request.getParameter("sid") != null) {
                ResultSet bk_res, can_res;
                String show_date = "";
                Show show = new Show();
                Show show_1 = new Show();
                Seat seat = new Seat();

                int sid = Integer.parseInt(request.getParameter("sid"));
                String show_name = show.get_show_name(sid);
                int seat_no = 0;
                char seat_class = 0, seat_type = 0;

                if (request.getParameter("show") != null) {
                    String year = request.getParameter("year" + sid);
                    String month = request.getParameter("month" + sid);
                    String date = request.getParameter("date" + sid);
                    show_date = year + "-" + month + "-" + date;
                    bk_res = show.get_report_bookings(sid, show_date);
                    can_res = show_1.get_report_canceled(sid, show_date);
                } else {
                    bk_res = show.get_report_bookings(sid);
                    can_res = show_1.get_report_canceled(sid);
                }
        %>
        <h2><%= show_name + "   " + show_date%></h2>
        <%
            if (bk_res.next()) {
                bk_res.previous();
        %>
        <h3>Bookings </h3>
        <%
                while (bk_res.next()) {
                    seat_no = bk_res.getInt("seat_no");
                    seat_class = seat.get_seat_class(seat_no);
                    seat_type = seat.get_seat_type(seat_no);
                    out.println(bk_res.getString("bid") + " " + bk_res.getString("show_date") + " " + bk_res.getString("show_time") + " "
                            + seat_no + " " + seat_class + " " + seat_type + " <br/>");
                }
            }
            if (can_res.next()) {
                can_res.previous();
        %>
        <h3>Cancels </h3>
        <%
                    while (can_res.next()) {

                        out.println(can_res.getString("bid") + " " + can_res.getString("show_date") + " " + can_res.getString("show_time") + " " + can_res.getString("seat_no") + "<br/>");
                    }
                }
            } else {
                response.sendRedirect("report_selector.jsp");
            }
        %>
        <br/>
        <INPUT TYPE=SUBMIT VALUE="Print" onclick="javascript:window.print();"/>
        <br/><br/><a href="report_selector.jsp">back</a>
    </body>
</html>
