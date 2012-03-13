<%-- 
    Document   : update_ticket
    Created on : 24 Aug, 2011, 11:02:14 AM
    Author     : guest
--%>

<%@page import="movieclasses.booking"%>
<%@page import="movieclasses.Show"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Ticket update Page</title>
    </head>
    <body>
        <h1>Update ticket</h1>
        <%
            int bid = Integer.parseInt(request.getParameter("bid"));
            if (request.getParameter("update") != null) {
                booking bk = new booking();
                String seat_class = request.getParameter("seat_class");
                String seat_type = request.getParameter("seat_type");

                if (seat_class != null && seat_type != null) {
                    bk.update_ticket(bid, seat_class.charAt(0), seat_type.charAt(0));
                    response.sendRedirect("welcome.jsp");
                }
            }
        %>
        <div>
            <FORM METHOD=POST ACTION="update_ticket.jsp?bid=<%=bid%>">
                <table>
                    <tr>
                        <td>
                            Seat class
                        </td>
                        <td>
                            <select name="seat_class" >
                                <option value="b">Balcony</option>
                                <option value="f">First</option>
                                <option value="s">Second</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Seat Type 
                        </td>
                        <td><select name="seat_type" >
                                <option value="i">Individual</option>
                                <option value="l">Lady</option>
                                <option value="f">Family</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" >
                            <INPUT TYPE=SUBMIT VALUE="Update" NAME=update />
                        </td>
                    </tr>
                </table>
            </FORM>
            <p>  <a href="welcome.jsp">back</a>
        </div>  
    </body>
</html>