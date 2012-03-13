/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package movieclasses;

/**
 *
 * @author guest
 */
public class Fare {

    public String fare_balcony;
    public String fare_first;
    public String fare_second;
    private Database db = new Database();
    private String sql_query;

    public void update_fare(int sid, int bal_fare, int fir_fare, int sec_fare) {
        sql_query = "UPDATE fares SET balcony=" + bal_fare + " , first_class="
                + fir_fare + " , second_class=" + sec_fare + " WHERE sid=" + sid;
        db.update(sql_query);
    }
}
