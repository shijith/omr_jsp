/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package movieclasses;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author guest
 */
public class Seat {

    private String sql_query;
    private Database db = new Database();
    public ResultSet res;

    public void add_seat(char seat_class, char seat_type) {
        sql_query = "INSERT INTO seats(seat_class, seat_type) VALUES('" + seat_class + "','" + seat_type + "')";
        db.update(sql_query);

    }

    public char get_seat_class(int seat_no) {
        char seat_class = 0;
        sql_query = "SELECT seat_class FROM seats WHERE seat_no=" + seat_no;

        try {
            res = db.execute(sql_query);
            res.next();
            seat_class = res.getString("seat_class").charAt(0);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return seat_class;
    }

    public char get_seat_type(int seat_no) {
        char seat_type = 0;
        sql_query = "SELECT * FROM seats WHERE seat_no=" + seat_no;

        try {
            res = db.execute(sql_query);
            res.next();
            seat_type = res.getString("seat_type").charAt(0);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return seat_type;
    }

    public ResultSet list_bal_ind(int sid, String show_date, String show_time) {
        sql_query = "SELECT * FROM seats WHERE seat_class='b' AND seat_type='i'"
                + " AND seat_no NOT IN (SELECT seat_no FROM bookings WHERE sid="
                + sid + " AND show_date='" + show_date + "' AND show_time='" + show_time
                + "' AND canceled = 0)";
        res = db.execute(sql_query);
        return res;

    }

    public ResultSet list_bal_lad(int sid, String show_date, String show_time) {
        sql_query = "SELECT * FROM seats WHERE seat_class='b' AND seat_type='l'"
                + " AND seat_no NOT IN (SELECT seat_no FROM bookings WHERE sid="
                + sid + " AND show_date='" + show_date + "' AND show_time='" + show_time
                + "' AND canceled = 0)";
        res = db.execute(sql_query);
        return res;

    }

    public ResultSet list_bal_fam(int sid, String show_date, String show_time) {
        sql_query = "SELECT * FROM seats WHERE seat_class='b' AND seat_type='f'"
                + " AND  seat_no NOT IN (SELECT seat_no FROM bookings WHERE sid="
                + sid + " AND show_date='" + show_date + "' AND show_time='" + show_time
                + "' AND canceled = 0)";
        res = db.execute(sql_query);
        return res;

    }

    public ResultSet list_first(int sid, String show_date, String show_time) {
        sql_query = "SELECT * FROM seats WHERE seat_class='f'"
                + " AND seat_no NOT IN (SELECT seat_no FROM bookings WHERE sid="
                + sid + " AND show_date='" + show_date + "' AND show_time='" + show_time
                + "' AND canceled = 0)";
        res = db.execute(sql_query);
        return res;

    }

    public ResultSet list_second(int sid, String show_date, String show_time) {
        sql_query = "SELECT * FROM seats WHERE seat_class='s'"
                + " AND  seat_no NOT IN (SELECT seat_no FROM bookings WHERE sid="
                + sid + " AND show_date='" + show_date + "' AND show_time='" + show_time
                + "' AND canceled = 0)";
        res = db.execute(sql_query);
        return res;

    }
}