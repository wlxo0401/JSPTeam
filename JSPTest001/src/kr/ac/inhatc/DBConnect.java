package kr.ac.inhatc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConnect {
	public Connection conn = null;
	public Statement st = null;
	public ResultSet rs = null;
	
	
	public void connectDB() {
		try {
			// 2. DB와 연결(드라이버관리자)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jsptest", "1234"); // DB연결자:IP, 계정명, 계정비밀번호 
			System.out.println("tttt");
			// 쿼리문 실행 기능을 갖고 있는 객체 : Statement
			st = conn.createStatement();
		}catch(Exception e) {
			System.out.println("ERROR");
		}

	}
	
	public ResultSet setQuery(String sql) {		
		//SELECT 질의문 수행
		try {
			this.rs = st.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return rs;
		}
	}
	
	public void updateQuery(String sql) {
		//UPDATE 질의문 수행
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("ERROR2");
		}
	}
	
	public void closeDB() {
		//자원 종료
		try {
			st.close();
			conn.close();
			if(rs!=null) {
				rs.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
