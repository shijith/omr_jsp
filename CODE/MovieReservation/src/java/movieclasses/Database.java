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
public class Database {

    private Statement stmt;
    private Connection connection;
    private ResultSet res;

    public Database() {

        try {

            String connectionURL = "jdbc:mysql://localhost:3306/mysql";
            connection = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "asdfgh");
            stmt = connection.createStatement();
            stmt.executeUpdate("use movie_reservation");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ResultSet execute(String query) {
        try {
            res = stmt.executeQuery(query);
        } catch (Exception ex) {

            System.out.println(ex.getMessage());
        }
        return res;
    }
    public void update(String query){
        try {
            stmt.executeUpdate(query);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

}