<%-- 
    Document   : booking
    Created on : 20 Aug, 2011, 12:32:58 AM
    Author     : guest
--%>

<%@page import="movieclasses.Show_time"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="movieclasses.User"%>
<%@page import="movieclasses.Seat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Booking Page</title>
    </head>
    <body>
        <h1>Select seat and type</h1>
        <FORM METHOD=POST ACTION="booking_confirm.jsp">

            <%
                Show_time st = new Show_time();
                ResultSet res;
                Seat seat = new Seat();

                int seat_no = 0, sid = -1, tid = -1;
                String year = null, month = null, date = null, show_date = null, show_time = null;

                if (request.getParameter("sid") != null) {

                    sid = Integer.parseInt(request.getParameter("sid"));
                    tid = Integer.parseInt(request.getParameter("tid" + sid));
                    year = request.getParameter("year" + sid);
                    month = request.getParameter("month" + sid);
                    date = request.getParameter("date" + sid);
                    show_date = year + "-" + month + "-" + date;

                    show_time = st.get_time(tid).toString();

                } else {
                    response.sendRedirect("show_list.jsp");
                }

            %>
            <input type="hidden" name="sid" value="<%=sid%>">
            <input type="hidden" name="show_date" value="<%=show_date%>">
            <input type="hidden" name="tid" value="<%=tid%>">
            <input type="hidden" name="show_time" value="<%=show_time%>">

            <%

                out.println("<br/><b> Balcony Individual</b><br/>");
                res = seat.list_bal_ind(sid, show_date, show_time);
                if (res.next()) {
                    res.previous();
                    while (res.next()) {
                        seat_no = res.getInt("seat_no");%>
            <INPUT TYPE=RADIO NAME=seat_no VALUE="<%= seat_no%>" ><%=seat_no%> 
            <%
                }

            } else {
            %>
            <a href="book_waiting.jsp?seat_type=i&sid=<%=sid%>&show_date=<%=show_date%>&show_time=<%=show_time%>&tid=<%=tid%>">Book waiting</a>
            <%                }

                out.println("<br/><br/><b> Balcony Lady</b><br/>");
                res = seat.list_bal_lad(sid, show_date, show_time);
                if (res.next()) {
                    res.previous();
                    while (res.next()) {
                        seat_no = res.getInt("seat_no");%>
            <INPUT TYPE=RADIO NAME=seat_no VALUE="<%= seat_no%>" ><%=seat_no%> 
            <%
                }

            } else {
            %>
            <a href="book_waiting.jsp?seat_type=l&sid=<%=sid%>&show_date=<%=show_date%>&show_time=<%=show_time%>&tid=<%=tid%>">Book waiting</a>
            <%                }

                out.println("<br/><br/><b> Balcony Family</b><br/>");
                res = seat.list_bal_fam(sid, show_date, show_time);
                if (res.next()) {
                    res.previous();
                    while (res.next()) {
                        seat_no = res.getInt("seat_no");%>
            <INPUT TYPE=RADIO NAME=seat_no VALUE="<%= seat_no%>" ><%=seat_no%> 
            <%
                }
            %>
            :<i> Need -></i>
            <select name="fam_tkt_no" >
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <%
            } else {
            %>
            <a href="book_waiting.jsp?seat_type=f&sid=<%=sid%>&show_date=<%=show_date%>&show_time=<%=show_time%>&tid=<%=tid%>">Book waiting</a>
            <%                }

                out.println("<br/><br/><b> First Class</b><br/>");
                res = seat.list_first(sid, show_date, show_time);
                if (res.next()) {
                    res.previous();
                    while (res.next()) {
                        seat_no = res.getInt("seat_no");%>
            <INPUT TYPE=RADIO NAME=seat_no VALUE="<%= seat_no%>" ><%=seat_no%> 
            <%
                    }

                } else {
                    out.println("<i>Full</i>");
                }

                out.println("<br/><br/><b> Second Class</b><br/>");
                res = seat.list_second(sid, show_date, show_time);
                if (res.next()) {
                    res.previous();
                    while (res.next()) {
                        seat_no = res.getInt("seat_no");%>
            <INPUT TYPE=RADIO NAME=seat_no VALUE="<%= seat_no%>" ><%=seat_no%> 
            <%
                    }

                } else {
                    out.println("<i>Full</i>");
                }
            %>

            <P><INPUT TYPE=SUBMIT VALUE="Book" NAME=book >
        </FORM>
        <br/><a href="show_list.jsp">back</a>
    </body>
</html>
