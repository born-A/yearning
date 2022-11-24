package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
public class common {
	 
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		try {

			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yearning", 
					"root","0331");
			System.out.println("success");
			Statement stmt = conn.createStatement();

		} catch (SQLException ex) {
			System.out.println("SQLException" + ex);
		}
        
    }
}
