package DBPKG;

import java.sql.*;

public class util {
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe","musthave","1234");
		System.out.println("DB 연결 성공(기본 생성자)");
		return con;
	}
	
	
}
