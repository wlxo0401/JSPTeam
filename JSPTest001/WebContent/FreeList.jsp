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
//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
String id = (String)session.getAttribute("__id");
if(id==null){
	response.sendRedirect("index.jsp");
}

//�̿��� �ʱ�ȭ ���� ����
int textNo;
String name="";
String date="";

//�Խñ� ���� ����
int pNum = 10;
int sNum = 10;
int [][] tno = new int[pNum][sNum];
String[][] title = new String[pNum][sNum];
String[][] tname = new String[pNum][sNum];
String[][] tdate = new String[pNum][sNum];
String[][] tcontent = new String[pNum][sNum];
int textNum = 1;
int lastNum = 0;
int pCount = 0;
int sCount = 0;

//������ ���� �޾ƿ��� �� �ʱ�ȭ
String tempPage = request.getParameter("_pageNum");
int pageNum = 1;
if(tempPage!=null){
	pageNum = Integer.parseInt(tempPage);
}

//DB���� �� ������ �ҷ�����
Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB����̹����
	System.out.println("JoinCheck ����̹����");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:xe", "jsptest", "1234");//2.Ŀ�ؼǰ�ü�����ؼ� Ŀ��Ʈ
	Statement stmt = conn.createStatement();//3.Ŀ��Ʈ ��ü�� stmt ��ü�� �����
	ResultSet rs;



//���� ���� �ҷ����� ������ �迭������ ���
rs = stmt.executeQuery("SELECT MAX(no) FROM freeTextList");
while(rs.next()){
	lastNum = rs.getInt(1);
}
rs = stmt.executeQuery("SELECT COUNT(no) FROM freeTextList");
while(rs.next()){
	textNum = rs.getInt(1);
}
//�۹�ȣ �ʱ�ȭ
for(int i = 0 ; i < 10 ; i++){
	for(int j = 0 ; j < 10 ; j++){
		tno[i][j] = 0;
	}
}

//�� ���� �ҷ�����
rs = stmt.executeQuery("SELECT * FROM freeTextList ORDER BY no DESC");
//����� ���� ����
int i = 0;
int j = 0;
while(rs.next()){
	tno[i][j] = rs.getInt("no");
	tname[i][j] = rs.getString("userid");
	title[i][j] = rs.getString("title");
	tcontent[i][j] = rs.getString("content");
	tdate[i][j] = (rs.getString("data")).substring(0, 10);
	j++;
	if(j>=10){
		j = 0;
		i++;
	}
}



//DB���� ����
rs.close();
stmt.close();
conn.close();

%>

<div class="container">
  <center><h2>�����Խ���</h2></center>
  <br/>
  <table class="table">
    <thead align="center">
      <tr>
      	<th align="center">�� ��ȣ</th>
      	<th>����</th>
        <th>�ۼ��� ���̵�</th>
        <th>�ۼ� ��¥</th>                
      </tr>
    </thead>
    <tbody align="center">
    <%
    for(i = 0 ; i < 10 ; i++){
    	if(title[pageNum-1][i]!=null){
    		out.print("<tr>");
    		out.print("<td>" + tno[pageNum-1][i] + "</td>");
    		out.print("<td><a href='ReadTextFree.jsp?_tno=" + tno[pageNum-1][i] + "'>" + title[pageNum-1][i] + "</a></td>");
    		out.print("<td>" + tname[pageNum-1][i] + "</td>");
    		out.print("<td>" + tdate[pageNum-1][i] + "</td>");
    		out.print("</tr>");
    	}
    }
    %>                                
    </tbody>
  </table>
  <center><form action=WriteTextFree.jsp method=post>
  <button type="submit" class="btn btn-dark">�� ����</button>
  </form></center>
  <!-- ������ ��ȣ -->
  <center>
  <%
  for(i = 0 ; i < 10 ; i++){
	  if(title[i][0]!=null){
		  out.print("<a href='FreeList.jsp?_pageNum=" + (i+1) + "'>" + (i+1) + "</a>");
	  }
  }
  %>
  </center>  
</div>
</body>
</html>