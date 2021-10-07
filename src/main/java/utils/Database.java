package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
    private final String driver = "com.mysql.cj.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/blog";
    private final String user = "root";
    private final String password = "";

    public Connection connection = null;

    public Database(){
        try{
            Class.forName(driver);
            connection = DriverManager.getConnection(url,user,password);
            System.out.println("Connection Success");
        }catch (Exception e){
            System.err.println("Connection Error : "+ e);
        }
    }
    public void close(){
        try{
            if (connection != null){
                connection.close();
            }
        }catch (Exception e){
            System.err.println("Close Error : "+e);
        }
    }
}
