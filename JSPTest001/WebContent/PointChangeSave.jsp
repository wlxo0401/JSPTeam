<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.inhatc.DBConnect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
//인코딩 언어 설정
request.setCharacterEncoding("euc-kr");

//이용자 정보 변수 받아오기 및 초기화
String point = request.getParameter("_point");
String type = request.getParameter("_type");

int userNo;
int userPoint;


//이용자 정보 변수 받아오기 및 초기화
String id = (String)session.getAttribute("__id");
if(id==null){
	response.sendRedirect("index.jsp");
}
if(point==null){
	userPoint = 0;
}else{
	userPoint = Integer.parseInt(point);
}
if(type==null){
	type = "plus";
}



//DB연동 및 데이터 저장
Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB드라이버잡기
	System.out.println("JoinCheck 드라이버잡기");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:xe", "jsptest", "1234");//2.커넥션객체생성해서 커넥트
	Statement stmt = conn.createStatement();//3.커넥트 객체로 stmt 객체를 만든다
	ResultSet rs=stmt.executeQuery("SELECT * FROM userInfo WHERE id='" + id + "'");
	while(rs.next()){
		if(type.equals("plus")){
			userPoint += rs.getInt("point");
		}else if(type.equals("minus")){
			userPoint = rs.getInt("point") - userPoint;
		}else if(type.equals("quizc")){
			userPoint += rs.getInt("point");
		}else if(type.equals("quizg")){
			userPoint += rs.getInt("point");
		}else if(type.equals("quize")){
			userPoint += rs.getInt("point");
		}else if(type.equals("game")){
			userPoint += rs.getInt("point");
		}
	}
	//포인트 저장
	stmt.executeUpdate("UPDATE userInfo SET point=" + userPoint + " WHERE id='" + id + "'");
rs.close();
stmt.close();
conn.close();

if(type.equals("quizc")){
	response.sendRedirect("CommonQuizResult.jsp?_point=" + point);
}else if(type.equals("quizg")){
	response.sendRedirect("GameQuizResult.jsp?_point=" + point);
}else if(type.equals("quize")){
	response.sendRedirect("EntertainmentsQuizResult.jsp?_point=" + point);
}else if(type.equals("game")){
	response.sendRedirect("CrossGameResult.jsp?_point=" + point);
}else{
	response.sendRedirect("InputPoint.jsp");
}

%>
</body>
</html>