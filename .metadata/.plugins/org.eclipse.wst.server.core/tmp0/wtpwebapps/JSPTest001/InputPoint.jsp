<%@ page language="java" contentType="text/html; charset=Euc-kr"
    pageEncoding="Euc-kr"%>
<%@ page import="kr.ac.inhatc.DBConnect" %>
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
<!-- ������ �ҷ����� -->
<%
	//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
	String id = (String)session.getAttribute("__id");
	if(id==null){
		id = "ID101";
	}
String name = "";
String point = "";
int userPoint = 0;

//�����ͺ��̽� ���� �̿��� �̸� �� ����Ʈ �ҷ�����
Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB����̹����
	System.out.println("JoinCheck ����̹����");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:xe", "jsptest", "1234");//2.Ŀ�ؼǰ�ü�����ؼ� Ŀ��Ʈ
	Statement stmt = conn.createStatement();//3.Ŀ��Ʈ ��ü�� stmt ��ü�� �����
	ResultSet rs=stmt.executeQuery("SELECT * FROM userInfo WHERE id='" + id + "'");
while(rs.next()){
	name = rs.getString("name");
}

	rs=stmt.executeQuery("SELECT * FROM userInfo WHERE id='"+id+"'");
while(rs.next()){
	point = rs.getString("point");
}
if(!point.equals("")){
	userPoint = Integer.parseInt(point);
}
rs.close();
stmt.close();
conn.close();


%>

<!-- ���� ������ ���� -->
<%!

%>


<!-- ȸ�� ���� ���� ���� -->
<center>  <div class="card bg-dark text-white">
    <div class="card-body">
<h4 class="mb-3">����Ʈ ����/ȯ��</h4>
<h6 class="mb-3">���� ����Ʈ : <%=userPoint %></h6>
<form action="PointChangeSave.jsp" class="needs-validation" method="post" novalidate>
  <div class="form-group">
    <label for="uname">����Ʈ ����</label>
    <input type="text" class="form-control" id="uname" placeholder="������ ����Ʈ�� �����ּ���" name="_point" value="0" required>
    <div class="valid-feedback">Ȯ��</div>
    <div class="invalid-feedback">������ ����Ʈ�� �����ּ���</div>
  </div>
  <div class="form-group">
  <div class="form-group form-check">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox" name="remember" required> ����Ʈ ���� ���� ������ �����մϴ�.
      <div class="valid-feedback">Ȯ��</div>
      <div class="invalid-feedback">�ʼ� �����׸� ������ �ּ���</div>
    </label>
  </div>
  <input type="hidden" name="_type" value="plus">
  <button type="submit" class="btn btn-primary">����Ʈ ����</button>
  </div>
</form>
<form action="PointChangeSave.jsp" class="needs-validation" method="post" novalidate>
  <div class="form-group">
     <label for="zip">����Ʈ ȯ��</label>
     <input class="form-control" id="phoneNumber" required="" type="text" value="0" name="_point">
     <div class="valid-feedback">Ȯ��</div>
     <div class="invalid-feedback">ȯ���� ����Ʈ�� �����ּ���</div>
  </div>
  <div class="form-group">
  </div>
  <div class="form-group form-check">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox" name="remember" required> ����Ʈ ���� ���� ������ �����մϴ�.
      <div class="valid-feedback">Ȯ��</div>
      <div class="invalid-feedback">�ʼ� �����׸� ������ �ּ���</div>
    </label>
  </div>
  <input type="hidden" name="_type" value="minus">
  <button type="submit" class="btn btn-primary">����Ʈ ȯ��</button>
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