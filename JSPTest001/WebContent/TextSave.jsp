<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.inhatc.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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

//�� ���� ���� �޾ƿ��� �� �ʱ�ȭ
String title = request.getParameter("_title");
String content = request.getParameter("_content");


int tNo=100;
String nDate;
//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
String id = (String)session.getAttribute("__id");
if(id==null){
	response.sendRedirect("index.jsp");
}
String name = request.getParameter("_name");

//DB���� �� ������ ����
Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB����̹����
	System.out.println("JoinCheck ����̹����");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:xe", "jsptest", "1234");//2.Ŀ�ؼǰ�ü�����ؼ� Ŀ��Ʈ
	Statement stmt = conn.createStatement();//3.Ŀ��Ʈ ��ü�� stmt ��ü�� �����
	ResultSet rs;
//�� ��ȣ ����
rs = stmt.executeQuery("SELECT MAX(no) FROM textList");
while(rs.next()){
	tNo = rs.getInt(1) + 1;
}

//�ۼ� ��¥ ����
Date date = new Date();
nDate = String.valueOf(date.getYear()+1900) + "-" + String.valueOf(date.getMonth()+1) + "-" + String.valueOf(date.getDate());

//�� ����
stmt.executeUpdate("INSERT INTO textList VALUES(" + tNo + ", '" + id + "', '" + title + "', '" + content + "', '" + nDate + "')");

rs.close();
stmt.close();
conn.close();

response.sendRedirect("NoticeList.jsp");
%>
</body>
</html>