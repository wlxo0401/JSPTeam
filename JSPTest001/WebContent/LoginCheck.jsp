<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"%>
<!-- 암호화시 필요한 클래스들 불러오는것 -->
<%@page import="util.SHA256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("EUC-KR");//포스트방식일때 한글처리 인코딩어쩌구
String id = request.getParameter("_id");
String pw = request.getParameter("_pw");
String uuid=""; //DB에서 불러온 솔트 저장
System.out.println("로그인 입력 정보 id : "+ id);
System.out.println("로그인 입력 정보 pw : "+ pw);
//DB연결 시작
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
System.out.println("오라클 driver연결");
String dae = ""; //초기화

try{
	Connection conn = DriverManager.getConnection(url, "jsptest", "1234");
	System.out.println("서버연결");
	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	
	//salt값을 가져오기 위함

	ResultSet rs2 = stmt2.executeQuery("select salt from userInfo where id='"+id+"'");
	System.out.println("salt 셀렉트문 통과");
	if(rs2.next())
	{
		uuid = rs2.getString("salt");	
		System.out.println("복호화전 salt : " + rs2.getString("salt"));
		System.out.println("솔트불러오기성공 불러온 salt : " +rs2.getString("salt"));
	}else{
		System.out.println("솔트실패");
	}

	//가지고온 salt값과 아이디 비번(해시한것) 정보를 비교해서 로그인 체크
	ResultSet rs = stmt.executeQuery(
			"select * from userInfo where id='"+id+"'and pw='"+SHA256.getSHA256(pw,uuid)+"'");
	System.out.println("셀렉트문");
	
	if(rs.next()){
		System.out.println("로그인 통과");
		session.setAttribute("__id", id);//브라우저가 종료 되기 전 까지 남아있는 세션 객체에 정보 넣기, 전달없이 브라우저에서 어디에서든 식별자로 호출가능
		response.sendRedirect("Main.jsp");
	}else{
		String str = "<script>";
		str += "alert('아이디/비밀번호를 확인해주세요.');";
		str += "location.href='index.jsp';";
		str += "</script>";
		out.println(str);
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>