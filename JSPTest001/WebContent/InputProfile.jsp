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
<!-- ������ �ҷ����� -->
<jsp:useBean id="dbc" class="kr.ac.inhatc.DBConnect"></jsp:useBean>

<%
//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
	String id = (String)session.getAttribute("__id");
	if(id==null){
		id = "ID101";
	}
String name = "";
String tel = "";

//�����ͺ��̽� ���� �̿��� �̸� �ҷ�����
Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB����̹����
	System.out.println("JoinCheck ����̹����");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:xe", "jsptest", "1234");//2.Ŀ�ؼǰ�ü�����ؼ� Ŀ��Ʈ
	Statement stmt = conn.createStatement();//3.Ŀ��Ʈ ��ü�� stmt ��ü�� �����
	ResultSet rs=stmt.executeQuery("SELECT * FROM userInfo WHERE id='" + id + "'");
while(rs.next()){
	name = rs.getString("name");
	tel = rs.getString("tel");
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
<h4 class="mb-3">ȸ������ ����</h4>
<form action="ProfileChangeSave.jsp" class="needs-validation" method="post" novalidate>
  <div class="form-group">
    <label for="uname">�̸�</label>
    <input type="text" class="form-control" id="uname" placeholder="������ �̸��� �����ּ���" name="_name" value="<%=name %>" required>
    <div class="valid-feedback">����</div>
    <div class="invalid-feedback">������ �̸��� �����ּ���</div>
  </div>
  <div class="form-group">
    <label for="pwd">��й�ȣ</label>
    <input type="password" class="form-control" id="pwd" placeholder="��й�ȣ�� �Է��ϼ���" name="pswd" required>
    <div class="valid-feedback">Ȯ��</div>
    <div class="invalid-feedback">��й�ȣ�� �Է��ϼ���</div>
  </div>
  <div class="form-group">
  <div class="row">
  <div class="col-3">
    <label for="country">��Ż�</label>
    <select class="custom-select d-block w-100" id="telecom" required="">
    	<option value="">Choose...</option>
        <option>KT</option>
        <option>SKT</option>
        <option>LG</option>
    </select>
        <div class="invalid-feedback">
    		��Ż縦 ���� ���ּ���
        </div>
  </div>
  <div class="col">
     <label for="zip">��ȭ��ȣ</label>
     <input class="form-control" id="phoneNumber" required="" type="text" placeholder="��ȣ�� �Է��ϼ���"  name="_tel" value="<%=tel %>">
     <div class="invalid-feedback">
     	��ȭ��ȣ�� �Է� ���ּ���
     </div>
  </div>
  </div>
  </div>
  <div class="form-group form-check">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox" name="remember" required> �������� ���濡 �����մϴ�.
      <div class="valid-feedback">Ȯ��</div>
      <div class="invalid-feedback">�ʼ� �����׸� ������ �ּ���</div>
    </label>
  </div>

  <button type="submit" class="btn btn-primary">������� ����</button>
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