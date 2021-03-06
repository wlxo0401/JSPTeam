<%@ page language="java" contentType="text/html; charset=Euc-kr"
    pageEncoding="Euc-kr"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Euc-kr">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
body {background-color:black}
</style>
</head>
<body>
<!-- 데이터 불러오기 -->
<jsp:useBean id="dbc" class="kr.ac.inhatc.DBConnect"></jsp:useBean>

<%
//이용자 정보 변수 받아오기 및 초기화
//이용자 정보 변수 받아오기 및 초기화
	String id = (String)session.getAttribute("__id");
	if(id==null){
		id = "ID101";
	}
String name = "";
String tel = "";

//데이터베이스 연동 이용자 이름 불러오기
Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB드라이버잡기
	System.out.println("JoinCheck 드라이버잡기");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:xe", "jsptest", "1234");//2.커넥션객체생성해서 커넥트
	Statement stmt = conn.createStatement();//3.커넥트 객체로 stmt 객체를 만든다
	ResultSet rs=stmt.executeQuery("SELECT * FROM userInfo WHERE id='" + id + "'");
while(rs.next()){
	name = rs.getString("name");
	tel = rs.getString("tel");
}
rs.close();
stmt.close();
conn.close();
%>

<!-- 변경 데이터 저장 -->
<%!

%>


<!-- 회원 정보 수정 본문 -->
<center>  <div class="card bg-dark text-white">
    <div class="card-body">
<h4 class="mb-3">회원정보 수정</h4>
<form action="ProfileChangeSave.jsp" class="needs-validation" method="post" novalidate>
  <div class="form-group">
    <label for="uname">이름</label>
    <input type="text" class="form-control" id="uname" placeholder="변경할 이름을 적어주세요" name="_name" value="<%=name %>" required>
    <div class="valid-feedback">성공</div>
    <div class="invalid-feedback">변경할 이름을 적어주세요</div>
  </div>
  <div class="form-group">
    <label for="pwd">비밀번호</label>
    <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요" name="pswd" required>
    <div class="valid-feedback">확인</div>
    <div class="invalid-feedback">비밀번호를 입력하세요</div>
  </div>
  <div class="form-group">
  <div class="row">
  <div class="col-3">
    <label for="country">통신사</label>
    <select class="custom-select d-block w-100" id="telecom" required="">
    	<option value="">Choose...</option>
        <option>KT</option>
        <option>SKT</option>
        <option>LG</option>
    </select>
        <div class="invalid-feedback">
    		통신사를 선택 해주세요
        </div>
  </div>
  <div class="col">
     <label for="zip">전화번호</label>
     <input class="form-control" id="phoneNumber" required="" type="text" placeholder="번호만 입력하세요"  name="_tel" value="<%=tel %>">
     <div class="invalid-feedback">
     	전화번호를 입력 해주세요
     </div>
  </div>
  </div>
  </div>
  <div class="form-group form-check">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox" name="remember" required> 개인정보 변경에 동의합니다.
      <div class="valid-feedback">확인</div>
      <div class="invalid-feedback">필수 동의항목에 동의해 주세요</div>
    </label>
  </div>

  <button type="submit" class="btn btn-primary">변경사항 저장</button>
</form></div>
  </div>

<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
</center>


				
</body>
</html>