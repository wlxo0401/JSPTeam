<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-KR");//포스트방식일때 한글처리 인코딩어쩌구

String code = request.getParameter("code");

if(code.equals("M2348")){
    response.sendRedirect("Join.jsp");
    }else{
        response.sendRedirect("code.jsp");
    }
%>
</body>
</html>