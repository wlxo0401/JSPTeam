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

	//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
	String id = (String)session.getAttribute("__id");
	if(id==null){
		response.sendRedirect("index.jsp");
	}
String tno = request.getParameter("_tno");
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


rs = stmt.executeQuery("SELECT * FROM freeTextList WHERE no="+textNo);
while(rs.next()){
	userID = rs.getString("userID");
}
rs = stmt.executeQuery("SELECT * FROM userinfo WHERE id='"+userID + "'");
while(rs.next()){
	name = rs.getString("name");
}
rs = stmt.executeQuery("SELECT * FROM freeTextList WHERE no="+textNo);
while(rs.next()){
	title = rs.getString("title");
}
rs = stmt.executeQuery("SELECT * FROM freeTextList WHERE no="+textNo);
while(rs.next()){
	content = rs.getString("content");
}

rs.close();
stmt.close();
conn.close();
%>
<form action="TextSaveFree.jsp" method="post">
<div class="card">
<!-- ���� �Է� -->
  <div class="card-header" align="center"> <input type="text" class="form-control" id="usr" name=_title></div>
  <!-- ���� �Է� -->
  <div class="card-body"><textarea class="form-control" rows="20" id="comment" name=_content></textarea></div> 
  <div class="card-footer"><center> 
  <button type="submit">�����ϱ�</button>
  </center></div>
</div></form>
</body>
</html>