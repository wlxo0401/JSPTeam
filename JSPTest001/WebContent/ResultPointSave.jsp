<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.inhatc.DBConnect" %>
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
String no = request.getParameter("_no");
String point = request.getParameter("_point");

int userNo;
int userPoint;

if(no==null){
	userNo = 1;
}else{
	userNo = Integer.parseInt(no);
}
if(point==null){
	userPoint = 0;
}else{
	userPoint = Integer.parseInt(point);
}


String name = request.getParameter("_name");

//DB���� �� ������ ����
DBConnect dbc = new DBConnect();
dbc.connectDB();

//����Ʈ �ҷ����� �� ���
dbc.setQuery("SELECT * FROM userInfo WHERE no=" + userNo);
while(dbc.rs.next()){
	userPoint += dbc.rs.getInt("point");	
}

//����Ʈ ����
dbc.updateQuery("UPDATE userInfo SET point=" + userPoint + " WHERE no=" + userNo);

dbc.closeDB();

response.sendRedirect("CommonQuizContentText.jsp?_no=" + userNo);
%>
</body>
</html>