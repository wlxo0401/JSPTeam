<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.inhatc.DBConnect" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
//�� ���� ���� �޾ƿ��� �� �ʱ�ȭ
String id = (String)session.getAttribute("__id");
if(id==null){
	response.sendRedirect("index.jsp");
}
String tno = request.getParameter("_tno");

String type = request.getParameter("_type");
if(type==null){
	type = "0";
}

int textNo;
String userID = "";

if(tno==null){
	textNo = 1;
	tno = "1";
}else{
	textNo = Integer.parseInt(tno);
}

//�� ���� �ʱ�ȭ ���� ����
String name="";
String title="";
String content="";

//DB���� �� ������ �ҷ�����
Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB����̹����
	System.out.println("JoinCheck ����̹����");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:xe", "jsptest", "1234");//2.Ŀ�ؼǰ�ü�����ؼ� Ŀ��Ʈ
	Statement stmt = conn.createStatement();//3.Ŀ��Ʈ ��ü�� stmt ��ü�� �����
	ResultSet rs;

rs = stmt.executeQuery("SELECT * FROM textList WHERE no="+textNo);
while(rs.next()){
	userID = rs.getString("userID");
}
rs = stmt.executeQuery("SELECT * FROM userinfo WHERE id='"+ userID + "'");
while(rs.next()){
	name = rs.getString("name");
}
rs = stmt.executeQuery("SELECT * FROM textList WHERE no="+textNo);
while(rs.next()){
	title = rs.getString("title");
}
rs = stmt.executeQuery("SELECT * FROM textList WHERE no="+textNo);
while(rs.next()){
	content = rs.getString("content");
}

rs.close();
stmt.close();
conn.close();
%>

<div class="card">
  <div class="card-header" align="center"><%=title %></div>
  <div class="card-header" align="right"><%=name %></div>
  <div class="card-body"><%=content %></div> 
  <div class="card-footer"><center>
    <%
  if(type.equals("0")){
	  out.print("<form action='NoticeList.jsp' method='post'>");
  }else{
	  out.print("<form action='Main.jsp' method='post'>");
  }
  %>
  <button type="submit">������� ���ư���</button>
  </form></center></div>
</div>
</body>
</html>