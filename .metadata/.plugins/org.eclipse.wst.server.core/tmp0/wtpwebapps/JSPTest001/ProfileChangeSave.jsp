<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.inhatc.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.UUID" %>
<%@page import="util.SHA256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
//���ڵ� ��� ����
request.setCharacterEncoding("euc-kr");

	//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
	String id = (String)session.getAttribute("__id");
	if(id==null){
		response.sendRedirect("index.jsp");
	}
String name = request.getParameter("_name");
String pw = request.getParameter("pswd");
String tel = request.getParameter("_tel");
String uuid = UUID.randomUUID().toString();
//DB���� �� ������ ����
//�����ͺ��̽� ���� �̿��� �̸� �ҷ�����
Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB����̹����
	System.out.println("JoinCheck ����̹����");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:xe", "jsptest", "1234");//2.Ŀ�ؼǰ�ü�����ؼ� Ŀ��Ʈ
	Statement stmt = conn.createStatement();//3.Ŀ��Ʈ ��ü�� stmt ��ü�� �����
	stmt.executeUpdate("UPDATE userInfo SET name='" + name + "' WHERE id='" + id + "'");
	stmt.executeUpdate("UPDATE userInfo SET pw='" + SHA256.getSHA256(pw,uuid)+ "' WHERE id='" + id + "'");
	stmt.executeUpdate("UPDATE userInfo SET tel='" + tel + "' WHERE id='" + id + "'");
	stmt.executeUpdate("UPDATE userInfo SET salt='" + uuid + "' WHERE id='" + id + "'");

stmt.close();
conn.close();

response.sendRedirect("InputProfile.jsp");
%>
</body>
</html>