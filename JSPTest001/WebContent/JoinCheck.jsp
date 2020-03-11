<%@page import="util.SHA256"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"%>
<%@page import="java.util.UUID" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	

	request.setCharacterEncoding("euc-KR");//포스트방식일때 한글처리 인코딩어쩌구
	String id = request.getParameter("_id");
	String pw = request.getParameter("_pw");
	String pwcheck = request.getParameter("_checkpw");
	String name = request.getParameter("_name");
	String phone = request.getParameter("_phone");
	String uuid = UUID.randomUUID().toString();
	
	System.out.println("join에서 joincheck로 넘어온 ID: "+id);
	System.out.println("join에서 joincheck로 넘어온 PW: "+pw);
	System.out.println("joincheck 에서 구한 : "+uuid);
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB드라이버잡기
	System.out.println("JoinCheck 드라이버잡기");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:XE", "jsptest", "1234");//2.커넥션객체생성해서 커넥트
			System.out.println("조인체크 커넥트");
	Statement stmt = conn.createStatement();//3.커넥트 객체로 stmt 객체를 만든다
	System.out.println("statement");
	

	//회원정보 저장합니다.
	ResultSet rs=stmt.executeQuery("select id from userinfo where id='"+id+"'");
	System.out.println("JoinCheck에서 아이디가 골라지면 중복체크하는 부분");
	if(rs.next()){
		String str = "<script>";
		str += "alert('중복된 아이디입니다.');";
		str += "location.href='Join.jsp';";
		str += "</script>";
		out.println(str);
	}
	else{
	System.out.println("회원가입 정보 넣기 전");
	stmt.executeUpdate("insert into userinfo values('"+id+"','"+name+"','"+SHA256.getSHA256(pw,uuid)+"','0','0','"+phone+"','"+uuid+"')");
	System.out.println("Insert된 회원 정보 ID : "+id);
	System.out.println("Insert된 회원 정보 NAME : "+name);
	System.out.println("Insert된 회원 정보 암호화된 pw : "+SHA256.getSHA256(pw,uuid));
	String str = "<script>";
	str += "alert('회원가입완료!.');";
	str += "location.href='index.jsp';";
	str += "</script>";
	out.println(str);
	stmt.close();
	conn.close();			
	}
	}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>