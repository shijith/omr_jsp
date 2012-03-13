<%-- 
    Document   : print_ticket
    Created on : 23 Aug, 2011, 2:25:24 PM
    Author     : guest
--%>

<%@page import="movieclasses.Seat"%>
<%@page import="movieclasses.Show"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="movieclasses.booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Ticket Print Page</title>
    </head>
    <body  onload="javascript:window.print();window.close();">
        <%
            booking bk = new booking();
            Show show = new Show();
            Seat seat = new Seat();

            ResultSet res;
            String s_class = null, type = null;
            String theater_name = show.get_theater_name();
            String user_name = session.getAttribute("user_name").toString();
            int bid = Integer.parseInt(request.getParameter("bid").toString());
            res = bk.print_ticket(bid);
            res.next();
            int sid = res.getInt("sid");
            int seat_no = res.getInt("seat_no");
            String show_date = res.getString("show_date");
            String show_time = res.getString("show_time");
            String show_name = show.get_show_name(sid);
            char seat_class = seat.get_seat_class(seat_no);
            char seat_type = seat.get_seat_type(seat_no);
            if (seat_class == 'b') {
                s_class = "Balcony";
            } else if (seat_class == 'f') {
                s_class = "First class";
            } else {
                s_class = "Second class";
            }

            if (seat_type == 'i') {
                type = "Individual";
            } else if (seat_type == 'l') {
                type = "Ladies";
            } else {
                type = "Family";
            }
        %>
        <div>
            <h1>Movie Ticket - <%=theater_name%></h1>
            Show Name : <%= show_name%><br/>
            Show Date : <%= show_date%><br/>
            Show Time : <%= show_time%><br/>
            Seat Number : <%= seat_no%><br/>
            Seat Class : <%= s_class%><br/>
            Seat Type : <%= type%><br/>
            Booked by : <%= user_name%><br/>
            Ticket ID : <%=bid%>
        </div>
    </body>
</html>
