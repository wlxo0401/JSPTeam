package kr.ac.inhatc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

//import java.sql.*; // java.sql.모든클래스를 참조

// 단축키
// import : ctrl + shift + O
// 주석처리 : ctrl + /(//), ctrl + shift + c, 블럭설정 후 ctrl + shift + / (/* */) 
// 코드 라인정렬 : Ctrl + Shift + F 
public class SelectEx01 {
	public static void main(String[] args) {
		// 사원의 사번, 성, 부서코드, 업무코드, 급여, 입사일자 조회
		// 1. 드라이버 로딩 : 드라이버명
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //오류가 발생할수도 있으니 try안에 감싸준다. 
			System.out.println("드라이버로딩성공");
			
			// 2. DB와 연결(드라이버관리자)
			// localhost = 127.0.0.1 = 자신의 IP사용가능
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@192.168.219.115:1521:xe", "jsptest", "1234"); // DB연결자:IP, 계정명, 계정비밀번호 
			System.out.println("DB연결 성공!");
			
			// 3. SQL문 작성
			// DB 연결된 곳에서 쿼리문에 실행할 준비를 한다.
			// 쿼리문 실행 기능을 갖고 있는 객체 : Statement
			String sql = "select * from userinfo";
			Statement st = conn.createStatement();
			// 쿼리문실행 : executeQuery → 조회결과 : ResultSet
			ResultSet rs = st.executeQuery(sql);
//			데이터행이 있는 만큼 커서를 이동시켜서 데이터행을 읽는다.
			while( rs.next() ) { // 데이터행이 있는만큼 반복 실행한다. ? true : false
				System.out.print( rs.getString("name") + "\t");
				
			}
//			4. 자원회수
			rs.close();
			st.close();
			conn.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
}
