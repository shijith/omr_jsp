/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package movieclasses;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author guest
 */
public class booking {

    private Database db = new Database();
    private Show_time tm = new Show_time();
    private ResultSet res;
    private String sql_query, show_date, show_time;
    private int uid, sid, tid, wid, bid, seat_no;
    private Time time;

    public void book_ticket(int uid, int sid, String show_date, int tid, int seat_no) {

        this.uid = uid;
        this.sid = sid;
        this.show_date = show_date;
        this.show_time = tm.get_time(tid).toString();

        if (check_limit()) {

            sql_query = "INSERT INTO bookings(uid, sid, show_date, show_time,seat_no, canceled) VALUES("
                    + uid + "," + sid + ",'" + show_date + "','" + show_time + "'," + seat_no + ",0)";
            db.update(sql_query);
        }

    }

    public void book_family_ticket(int uid, int sid, String show_date, int tid, int seat_no, int fam_tkt_no) {

        String seat_avail = "";
        this.uid = uid;
        this.sid = sid;
        this.show_date = show_date;
        this.show_time = tm.get_time(tid).toString();
        Seat seat = new Seat();
        res = seat.list_bal_fam(sid, show_date, show_time);
        try {
            while (res.next()) {
                seat_avail = seat_avail + "," + res.getString("seat_no");

            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        for (int i = 0; i < fam_tkt_no; i++) {

            if (seat.get_seat_type(seat_no) == 'f') {
                if (seat_avail.contains(String.valueOf(seat_no))) {
                    if (check_limit()) {

                        sql_query = "INSERT INTO bookings(uid, sid, show_date, show_time,seat_no, canceled) VALUES("
                                + uid + "," + sid + ",'" + show_date + "','" + show_time + "'," + seat_no + ",0)";
                        db.update(sql_query);
                    }
                } else {
                    i--;
                }
            } else {
                book_waiting(uid, sid, show_date, tid, 'f', fam_tkt_no - i);
                break;
            }
            seat_no = seat_no + 1;

        }

    }

    public void book_waiting(int uid, int sid, String show_date, int tid, char seat_type, int need) {

        this.uid = uid;
        this.sid = sid;
        this.show_date = show_date;

        Show_time st = new Show_time();
        this.show_time = st.get_time(tid).toString();
        for (int i = 0; i < need; i++) {
            if (check_limit()) {

                sql_query = "INSERT INTO waiting_list(uid, sid, show_date, show_time, seat_type) VALUES("
                        + uid + "," + sid + ",'" + show_date + "','" + show_time + "','" + seat_type + "')";
                db.update(sql_query);
            }
        }
    }

    public int waiting_status(int sid, String show_date, String show_time, char seat_type) {
        int count = 0;
        sql_query = "SELECT COUNT(wid) FROM waiting_list WHERE sid=" + sid + " AND show_date='" + show_date
                + "' AND show_time='" + show_time + "' AND seat_type='" + seat_type + "'";
        res = db.execute(sql_query);
        try {
            if (res.next()) {
                count = res.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return count;


    }

    public ResultSet get_bookings(int uid) {
        sql_query = "SELECT * FROM bookings WHERE uid=" + uid + " AND canceled=0";
        res = db.execute(sql_query);
        return res;
    }

    public ResultSet get_waitings(int uid) {
        sql_query = "SELECT * FROM waiting_list WHERE uid=" + uid;
        res = db.execute(sql_query);
        return res;
    }

    public void cancel_ticket(int bid) {
        if (manage_waiting(bid)) {
            sql_query = "UPDATE bookings SET canceled=1 WHERE bid=" + bid;
            db.update(sql_query);
        }



    }

    private boolean manage_waiting(int bid) {

        boolean in_time_limit = true;
        Seat seat = new Seat();
        sql_query = "SELECT * FROM bookings WHERE bid=" + bid;
        res = db.execute(sql_query);
        try {
            res.next();
            sid = res.getInt("sid");
            show_date = res.getString("show_date");
            show_time = res.getTime("show_time").toString();
            seat_no = res.getInt("seat_no");
            char seat_class = seat.get_seat_class(seat_no);
            char seat_type = seat.get_seat_type(seat_no);
            if (check_time_limit()) {
                if (!manage_upgrade(seat_class, seat_type)) {
                    sql_query = "SELECT wid,uid FROM waiting_list WHERE sid="
                            + sid + " AND show_date='" + show_date + "' AND show_time='"
                            + show_time + "' AND seat_type='" + seat_type + "' ORDER BY wid ";

                    res = db.execute(sql_query);
                    if (res.next()) {
                        wid = res.getInt("wid");
                        uid = res.getInt("uid");
                        sql_query = "DELETE FROM waiting_list WHERE wid=" + wid;
                        db.update(sql_query);
                        sql_query = "INSERT INTO bookings(uid, sid, show_date, show_time,seat_no, canceled) VALUES("
                                + uid + "," + sid + ",'" + show_date + "','" + show_time + "'," + seat_no + ",0)";

                        db.update(sql_query);
                    } else if (seat_type == 'l') {
                        sql_query = "SELECT wid,uid FROM waiting_list WHERE sid="
                                + sid + " AND show_date='" + show_date + "' AND show_time='"
                                + show_time + "' AND seat_type='i' AND uid in (SELECT uid FROM users WHERE sex='f') ORDER BY wid ";
                        res = db.execute(sql_query);
                        if (res.next()) {
                            wid = res.getInt("wid");
                            uid = res.getInt("uid");
                            sql_query = "DELETE FROM waiting_list WHERE wid=" + wid;
                            db.update(sql_query);
                            sql_query = "INSERT INTO bookings(uid, sid, show_date, show_time,seat_no, canceled) VALUES("
                                    + uid + "," + sid + ",'" + show_date + "','" + show_time + "'," + seat_no + ",0)";
                            db.update(sql_query);

                        }

                    }
                }
            } else {
                in_time_limit = false;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return in_time_limit;

    }

    private boolean manage_upgrade(char seat_class, char seat_type) {
        boolean upgraded = false;
        int uwid = 0, ubid = 0;
        sql_query = "select uwid,bid from upgrade_list where seat_class='"
                + seat_class + "' and seat_type='" + seat_type + "' and bid in(select bid from bookings where sid="
                + sid + " and show_date='" + show_date + "' and show_time='" + show_time + "') ORDER BY uwid";
        res = db.execute(sql_query);
        try {
            if (res.next()) {
                uwid = res.getInt("uwid");
                ubid = res.getInt("bid");
                sql_query = "UPDATE bookings SET seat_no=" + seat_no + " WHERE bid=" + ubid;
                db.update(sql_query);
                sql_query = "DELETE FROM upgrade_list WHERE uwid=" + uwid;
                db.update(sql_query);
                upgraded = true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return upgraded;
    }

    public void cancel_waiting(int wid) {
        sql_query = "DELETE FROM waiting_list WHERE wid=" + wid;
        db.update(sql_query);
    }

    private boolean check_limit() {
        if (check_time_limit() && check_book_limit()) {
            return true;
        } else {
            return false;
        }

    }

    private boolean check_book_limit() {
        int book_count = 0, wait_count = 0, limit = 0;
        limit = ticket_per_person();

        try {
            sql_query = "SELECT COUNT(bid) FROM bookings WHERE uid=" + uid + " AND sid="
                    + sid + " AND show_date='" + show_date + "' AND show_time='"
                    + show_time + "' AND canceled=0";
            res = db.execute(sql_query);
            res.next();
            book_count = res.getInt(1);
            sql_query = "SELECT COUNT(wid) FROM waiting_list WHERE uid=" + uid + " AND sid="
                    + sid + " AND show_date='" + show_date + "' AND show_time='"
                    + show_time + "'";
            res = db.execute(sql_query);
            res.next();
            wait_count = res.getInt(1);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        if (book_count + wait_count >= limit) {
            return false;
        }
        return true;
    }

    public boolean check_time_limit() {
        boolean check = true;
        String date_time = show_date + " " + show_time;
        long diff = 0;
        try {

            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            Date date = sdf.parse(date_time);

            long time_of_show = date.getTime() / 1000;
            long now = System.currentTimeMillis() / 1000;
            diff = time_of_show - now;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        if (diff > (6 * 60 * 60)) {
            check = true;
        } else {
            check = false;
        }

        return check;
    }

    public ResultSet print_ticket(int bid) {
        sql_query = "SELECT * FROM bookings WHERE bid=" + bid;
        return db.execute(sql_query);
    }

    private int ticket_per_person() {
        int count = 1;
        sql_query = "SELECT max_tkt FROM theater_details";
        res = db.execute(sql_query);
        try {
            res.next();
            count = res.getInt("max_tkt");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return count;
    }

    public void update_ticket(int bid, char seat_class, char seat_type) {
        Seat seat = new Seat();
        sql_query = "SELECT uid, sid, show_date, show_time, seat_no FROM bookings WHERE bid=" + bid;
        res = db.execute(sql_query);
        try {
            res.next();
            uid = res.getInt("uid");
            sid = res.getInt("sid");
            show_date = res.getString("show_date");
            show_time = res.getString("show_time");
            seat_no = res.getInt("seat_no");

            if (seat_class != seat.get_seat_class(seat_no) || seat_type != seat.get_seat_type(seat_no)) {

                sql_query = "SELECT seat_no FROM seats WHERE seat_class='" + seat_class + "' AND seat_type='" + seat_type
                        + "' AND seat_no NOT IN (SELECT seat_no FROM bookings WHERE sid="
                        + sid + " AND show_date='" + show_date + "' AND show_time='" + show_time
                        + "' AND canceled = 0)";
                res = db.execute(sql_query);
                if (res.next()) {
                    seat_no = res.getInt("seat_no");
                    sql_query = "UPDATE bookings SET seat_no=" + seat_no + " WHERE bid=" + bid;
                    db.update(sql_query);
                } else {
                    sql_query = "INSERT INTO upgrade_list(bid, seat_class, seat_type) VALUES("
                            + bid + ",'" + seat_class + "','" + seat_type + "')";
                    db.update(sql_query);
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}