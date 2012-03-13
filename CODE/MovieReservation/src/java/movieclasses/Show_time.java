/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package movieclasses;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

/**
 *
 * @author guest
 */
public class Show_time {

    private Database db = new Database();
    private String sql_query;
    private ResultSet res;
    private Time time;

    public Time get_time(int tid) {
        sql_query = "SELECT time FROM show_times WHERE tid=" + tid;
        res = db.execute(sql_query);
        try {
            res.next();
            time = res.getTime("time");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return time;


    }
}
