<%-- 
    Document   : add_seat
    Created on : 19 Aug, 2011, 5:59:16 PM
    Author     : guest
--%>

<%@page import="movieclasses.Seat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Add seat</title>
    </head>
    <body>
        <h1>Add seat</h1>
        <%
            Seat seat = new Seat();
            String seat_class = request.getParameter("seat_class");
            String seat_type = request.getParameter("seat_type");

            if (seat_class != null && seat_type != null) {
                seat.add_seat(seat_class.charAt(0), seat_type.charAt(0));
            }
        %>
        <div>
            <FORM METHOD=POST ACTION="add_seat.jsp">
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
                            <INPUT TYPE=SUBMIT VALUE="Add" NAME=add />
                        </td>
                    </tr>
                </table>
            </FORM>
            <p>  <a href="welcome.jsp">back</a>
        </div>  
    </body>
</html>
