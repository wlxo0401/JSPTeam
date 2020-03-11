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
	//���� ��ü ����
	GameQuiz quiz = new GameQuiz();

	//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ

	//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
	String id = (String)session.getAttribute("__id");
	if(id==null){
		response.sendRedirect("index.jsp");
	}
	
	
	
	//���� ��ȣ �ҷ�����
	String qNo = request.getParameter("_qno");
	int quizNo;
	if(qNo==null){
		quizNo = 0;
	}else{
		quizNo = Integer.parseInt(qNo);
	}
	

	
	//���� ���� ���� �ҷ�����
	String ans = request.getParameter("_ans");
	int pAns;
	if(ans==null){
		pAns = 1;
	}else{
		pAns = Integer.parseInt(ans);
	}
	
	//���� ���� ���� ���� �ҷ�����
	String uAns = request.getParameter("_uAns");
	int userAns;
	if(uAns==null){
		userAns = -1;
	}else{
		userAns = Integer.parseInt(uAns);
	}
		
	//���� ���� �ҷ�����
	String point = request.getParameter("_point");
	int userPoint;
	if(point==null){
		userPoint = 0;
	}else{
		userPoint = Integer.parseInt(point);
	}
	
	//ù ������ �ƴ� ��� ���� Ȯ�� �� ���� ����
	
		if(userAns==pAns){
			userPoint += 50;
		}
	
		//3���� Ǯ���� ��� ����� �̵�
		if(quizNo>2){
			response.sendRedirect("PointChangeSave.jsp?_point=" + userPoint + "&_type=quizg");
		}
	

%>

<div class="card bg-light text-dark">
  <div class="card-header" align="center"><%=quiz.Question[quizNo] %></div>
  <div class="card-body" align="center"><div class="btn-group-vertical"> 
<%


	out.print("<a href='GameQuizContent.jsp?_qno=" + (quizNo+1) + "&_point=" + userPoint + "&_ans=" + quiz.answerNo[quizNo] + "&_uAns=1' class='btn btn-success' role='button'>" + quiz.QText[quizNo][0] + "</a>");
	out.print("<a href='GameQuizContent.jsp?_qno=" + (quizNo+1) + "&_point=" + userPoint + "&_ans=" + quiz.answerNo[quizNo] + "&_uAns=2' class='btn btn-info' role='button'>" + quiz.QText[quizNo][1] + "</a>");
	out.print("<a href='GameQuizContent.jsp?_qno=" + (quizNo+1) + "&_point=" + userPoint + "&_ans=" + quiz.answerNo[quizNo] + "&_uAns=3' class='btn btn-warning' role='button'>" + quiz.QText[quizNo][2] + "</a>");
	out.print("<a href='GameQuizContent.jsp?_qno=" + (quizNo+1) + "&_point=" + userPoint + "&_ans=" + quiz.answerNo[quizNo] + "&_uAns=4' class='btn btn-danger' role='button'>" + quiz.QText[quizNo][3] + "</a>");


%> 
</div></div>
  <div class="card-footer" align="center">
  
  <a href="GameQuizContent.jsp?_qno=<%=quizNo+1 %>&_point=<%=userPoint %>&_ans=<%=quiz.answerNo[quizNo]%>&_uAns=0" class="btn btn-success" role="button">Pass</a>
  </div>
</div>
</body>
</html>