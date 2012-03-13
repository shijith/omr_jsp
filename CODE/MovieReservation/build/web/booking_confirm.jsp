<%-- 
    Document   : booking_confirm
    Created on : 20 Aug, 2011, 2:43:11 PM
    Author     : guest
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="movieclasses.Seat"%>
<%@page import="movieclasses.booking"%>
<%@page import="movieclasses.Show"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Booking confirm Page</title>
    </head>
    <body>
        <h1>You have booked</h1>
        <%if (request.getParameter("seat_no") != null) {
                int uid = Integer.parseInt(session.getAttribute("uid").toString());
                int seat_no = Integer.parseInt(request.getParameter("seat_no"));
                int sid = Integer.parseInt(request.getParameter("sid"));
                String show_date = request.getParameter("show_date");
                int tid = Integer.parseInt(request.getParameter("tid"));
                String show_time = request.getParameter("show_time");

                booking bk = new booking();
                Show show = new Show();
                Seat seat = new Seat();
                char seat_type = seat.get_seat_type(seat_no);
                if (seat_type == 'f') {
                    int fam_tkt_no = Integer.parseInt(request.getParameter("fam_tkt_no"));
                    bk.book_family_ticket(uid, sid, show_date, tid, seat_no, fam_tkt_no);
                } else {
                    bk.book_ticket(uid, sid, show_date, tid, seat_no);
                }
                String show_name = show.get_show_name(sid);

        %>
        <b> Movie Name </b>: <%= show_name%><br/>
        <b> Movie Date </b>: <%= show_date%><br/>
        <b> Movie Time </b>: <%= show_time%><br/>
        <b> Seat NO    </b>: <%= seat_no%><br/><br/>

        <a href="show_list.jsp">back</a>
        <%
            } else {
                response.sendRedirect("show_list.jsp");
            }
        %>
    </body>
</html>
