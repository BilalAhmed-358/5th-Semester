
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conn {
    public static void main(String args[])

    {
        System.out.println("Hello!");
        // Connection con= null;

//    String DB_DRIVER= "com.mysql.jdbc.Driver";
   String URL="jdbc:Mysql://localhost/mafaza";
//    String DB_HOST= "localhost";
   String DB_USER="root";
   String password= "";
  
   try
   {
     Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection ("jdbc:Mysql://localhost/mafaza", "root", "");
     System.out.println("Connected!");
   }
   catch (Exception ex){
    System.out.println (ex);
    // ex.printStackTrace();
   }
  
   
   
}
}
