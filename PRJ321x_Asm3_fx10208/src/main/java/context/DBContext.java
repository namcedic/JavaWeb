package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	
	/* Dùng để kết nối với DATABASE*/
	
	public Connection OpenConnection() throws Exception {
		String dbUrl = "jdbc:sqlserver://" + serverName + ":" + portNum + "\\" + instance + 
				";databaseName=" + dbName;
		if (instance == null || instance.trim().isEmpty()) {
			dbUrl = "jdbc:sqlserver://" + serverName + ":" + portNum + ";databaseName=" + dbName;
		}
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(dbUrl, userID, password);
	}
	
	
	private final String serverName = "localhost";
	private final String dbName = "CellphoneShop";
	private final String portNum = "1433";
	private final String instance ="";
	private final String userID = "sa";
	private final String password = "sa";
	public static void main(String[] args) {
		try {
			System.out.println(new DBContext().OpenConnection());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}