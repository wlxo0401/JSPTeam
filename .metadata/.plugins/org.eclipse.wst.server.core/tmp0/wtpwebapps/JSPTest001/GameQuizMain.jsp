<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.inhatc.*" %>
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
<!-- ������ �ʱ�ȭ �� �ҷ����� -->
<%


	//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ

	//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
	String id = (String)session.getAttribute("__id");
	if(id==null){
		response.sendRedirect("index.jsp");
	}


%>

<div class="card bg-light text-dark">
  <div class="card-header" align="center">��������</div>
  <div class="card-body" align="center"><div class="btn-group-vertical"> 
  <img src='image/GameQuizMain.PNG' class='img-thumbnail' alt='Cinque Terre'>
</div></div>
  <div class="card-footer" align="center">
  
  <a href="GameQuizContent.jsp?" class="btn btn-success" role="button">�����ϱ�</a>
  </div>
</div>
</body>
</html>