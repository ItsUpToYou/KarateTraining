package com.karate.helpers;

import net.minidev.json.JSONObject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbHandler {

    public static final String serverName = "localhost";
    public static final String port = "1521";
    public static final String dataBase = "orclcdb";
    public static final String username = "sys as sysdba";
    public static final String password = "Oradoc_db1";
    public static final String conn = "jdbc:oracle:thin:@" + serverName + ":" + port + ":" + dataBase;

    public static void insertRow(String firstName) {
        try(Connection connect = DriverManager.getConnection(conn,username, password)) {
                    connect.createStatement().execute("Insert into orders(First_Name, Last_Name, City, Address, Email, Item_Quantity, Total_Price)\n" +
                            "Values('"+firstName+"', 'LastNewNAme', 'Plovdiv', 'addresszz', 'ema',11,11)");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static JSONObject readTotalPrice(String byName){

            JSONObject json = new JSONObject();

            try(Connection connect = DriverManager.getConnection(conn,username, password)){
                ResultSet rs = connect.createStatement().executeQuery("SELECT * FROM Orders where FIRST_NAME = '"+byName+"'");
                rs.next();
                json.put("totalprice", rs.getString("TOTAL_PRICE"));
            } catch (SQLException e){
                e.printStackTrace();
            }
            return json;

    }

}
