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
//인코딩 언어 설정
request.setCharacterEncoding("euc-kr");

//이용자 정보 변수 받아오기 및 초기화
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

//DB연동 및 데이터 저장
DBConnect dbc = new DBConnect();
dbc.connectDB();

//포인트 불러오기 및 계산
dbc.setQuery("SELECT * FROM userInfo WHERE no=" + userNo);
while(dbc.rs.next()){
	userPoint += dbc.rs.getInt("point");	
}

//포인트 저장
dbc.updateQuery("UPDATE userInfo SET point=" + userPoint + " WHERE no=" + userNo);

dbc.closeDB();

response.sendRedirect("CommonQuizContentText.jsp?_no=" + userNo);
%>
</body>
</html>