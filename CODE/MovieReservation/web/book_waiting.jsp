<%-- 
    Document   : book_waiting
    Created on : 21 Aug, 2011, 12:30:31 AM
    Author     : guest
--%>

<%@page import="movieclasses.Show"%>
<%@page import="movieclasses.booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Book waiting Page</title>
    </head>
    <body>
        <h1>Waiting ticket</h1>
        <%
            booking bk = new booking();
            Show show = new Show();
            int uid = Integer.parseInt(session.getAttribute("uid").toString());

            char seat_type = request.getParameter("seat_type").toString().charAt(0);
            int sid = Integer.parseInt(request.getParameter("sid"));
            String show_date = request.getParameter("show_date");
            String show_time = request.getParameter("show_time");
            int tid = Integer.parseInt(request.getParameter("tid").toString());

            bk.book_waiting(uid,sid, show_date, tid, seat_type, 1);
            String show_name = show.get_show_name(sid);
            int wait_status = bk.waiting_status(sid, show_date, show_time, seat_type);
            

        %>
        <b> Movie Name </b>: <%= show_name%><br/>
        <b> Movie Date </b>: <%= show_date%><br/>
        <b> Movie Time </b>: <%= show_time%><br/>
        <b> Wait Status</b>: <%= wait_status%><br/><br/>

        <a href="show_list.jsp">back</a>
    </body>
</html>
