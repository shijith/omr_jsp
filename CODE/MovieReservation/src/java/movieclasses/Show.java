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
public class Show {

    private int sid;
    private String show_name;
    private String start_date;
    private String end_date;
    private Fare fare = new Fare();
    private Database db = new Database();
    private String sql_query;
    private ResultSet res;

    public void add_show(Show show) {

        sql_query = "INSERT INTO shows(show_name, start_date, end_date) VALUES('" + show.show_name
                + "','" + show.start_date + "','" + show.end_date + "')";
        db.update(sql_query);

        sid = get_showid(show.show_name);
        if (sid > 0) {
            sql_query = "INSERT INTO fares VALUES(" + sid + "," + show.fare.fare_balcony
                    + "," + show.fare.fare_first + "," + show.fare.fare_second + ")";
            db.update(sql_query);
        }

    }

    public ResultSet show_list() {
        sql_query = "SELECT * FROM shows";
        return res = db.execute(sql_query);
    }

    public String get_show_name(int sid) {
        sql_query = "SELECT show_name FROM shows WHERE sid=" + sid;
        res = db.execute(sql_query);
        try {
            res.next();
            show_name = res.getString("show_name").toString();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return show_name;

    }

    public int get_showid(String show_name) {
        sid = 0;
        sql_query = "SELECT sid FROM shows WHERE show_name='" + show_name + "'";
        res = db.execute(sql_query);
        if (res != null) {
            try {
                res.next();
                sid = res.getInt("sid");
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return sid;
    }

    public void change_theater_name(String new_theater_name) {
        sql_query = "UPDATE theater_details SET theater_name='" + new_theater_name + "'";
        db.update(sql_query);
    }

    public String get_theater_name() {
        String theater_name = null;
        sql_query = "SELECT theater_name FROM theater_details";
        res = db.execute(sql_query);
        try {
            res.next();
            theater_name = res.getString("theater_name");
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return theater_name;
    }

    public ResultSet get_report_bookings(int sid) {
        sql_query = "SELECT * FROM bookings WHERE canceled=0 AND sid=" + sid;
        return db.execute(sql_query);
    }

    public ResultSet get_report_canceled(int sid) {
        sql_query = "SELECT * FROM bookings WHERE canceled=1 AND sid=" + sid;
        return db.execute(sql_query);
    }

    public ResultSet get_report_bookings(int sid, String date) {
        sql_query = "SELECT * FROM bookings WHERE canceled=0 AND sid=" + sid + " AND show_date='" + date + "'";
        return db.execute(sql_query);
    }

    public ResultSet get_report_canceled(int sid, String date) {
        sql_query = "SELECT * FROM bookings WHERE canceled=1 AND sid=" + sid + " AND show_date='" + date + "'";
        return db.execute(sql_query);
    }
}
