<%-- 
    Document   : newjsp
    Created on : 18 Aug, 2011, 1:14:08 PM
    Author     : guest
--%>

<%@page import="movieclasses.booking"%>
<%@page import="movieclasses.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" /> 
        <title>Welcome</title>
    </head>
    <body>
        <% if (session.getAttribute("uid") != null) {%>
        <h1>Welcome <%= session.getAttribute("user_name")%> </h1>
        <%
            int uid = Integer.parseInt(session.getAttribute("uid").toString());
            if (uid > 0) {

                if (request.getParameter("bid") != null || request.getParameter("wid") != null) {
                    if (request.getParameter("bk_can") != null) {

                        booking bk = new booking();
                        int bid = Integer.parseInt(request.getParameter("bid"));
                        if (request.getParameter("bk_can") != null) {
                            bk.cancel_ticket(bid);
                        }
                    } else if (request.getParameter("wt_can") != null) {
                        booking bk = new booking();
                        int wid = Integer.parseInt(request.getParameter("wid"));
                        bk.cancel_waiting(wid);

                    } else if (request.getParameter("tkt_gen") != null) {
                        int bid = Integer.parseInt(request.getParameter("bid"));
                        String url = "print_ticket.jsp?bid=" + bid;
                        response.sendRedirect(url);
                    } else if (request.getParameter("tkt_update") != null) {
                        int bid = Integer.parseInt(request.getParameter("bid"));
                        String url = "update_ticket.jsp?bid=" + bid;
                        response.sendRedirect(url);
                    }
                }

        %><br/><br/>
        <a href="show_list.jsp">Booking</a>
        <jsp:include page="show_status.jsp"></jsp:include><br/>
        <a href="change_password.jsp">Change password.</a><br/>

        <%            } else {
        %><p>
            <a href="add_show.jsp">Add show.</a><br/>
            <a href="update_fare.jsp">Add/Update Fair.</a><br/>
            <a href="add_seat.jsp">Add seat.</a><br/>
            <a href="ticket_person.jsp">Update ticket/person.</a><br/>
            <a href="theater_name.jsp">Update theater name.</a><br/>
            <a href="report_selector.jsp">Generate report.</a><br/>
            <%                   }

            %>
            <a href="logout.jsp" >Log out.</a>
            <% } else {
                    response.sendRedirect("index.jsp");
                }%>
    </body> 
</html>
