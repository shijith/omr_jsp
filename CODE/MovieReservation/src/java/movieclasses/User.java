/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package movieclasses;

import java.sql.*;
/**
 *
 * @author guest
 */
public class User {

    private int uid = 0;
    private Database db = new Database();
    private ResultSet res = null;
    private String sql_query;

    public int login(String user_name, String password) {

        String db_uname = null, db_password = null;
        sql_query = "SELECT * FROM users WHERE uname ='"
                + user_name + "' AND password = '" + password + "'";


        try {
            res = db.execute(sql_query);
            if (res.next()) {
                uid = res.getInt("uid");
                db_uname = res.getString("uname");
                db_password = res.getString("password");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }


        if (user_name.equals(
                db_uname) && password.equals(db_password)) {
            return uid;
        } else {
            return -1;
        }
    }

    public void register(String user_name, String password, char sex) {
        sql_query = "INSERT INTO users(uname, password, sex) values('" + user_name
                + "','" + password + "','" + sex + "')";
        db.update(sql_query);
    }

    public void change_password(int uid, String password) {
        sql_query = "UPDATE users SET password='" + password + "' where uid=" + uid;
        db.update(sql_query);
    }

    public void change_tkt_person(int tkt_limit) {
        sql_query = "UPDATE theater_details SET max_tkt=" + tkt_limit;
        db.update(sql_query);
    }
}
