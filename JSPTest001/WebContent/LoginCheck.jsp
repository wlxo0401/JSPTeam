<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"%>
<!-- ��ȣȭ�� �ʿ��� Ŭ������ �ҷ����°� -->
<%@page import="util.SHA256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("EUC-KR");//����Ʈ����϶� �ѱ�ó�� ���ڵ���¼��
String id = request.getParameter("_id");
String pw = request.getParameter("_pw");
String uuid=""; //DB���� �ҷ��� ��Ʈ ����
System.out.println("�α��� �Է� ���� id : "+ id);
System.out.println("�α��� �Է� ���� pw : "+ pw);
//DB���� ����
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
System.out.println("����Ŭ driver����");
String dae = ""; //�ʱ�ȭ

try{
	Connection conn = DriverManager.getConnection(url, "jsptest", "1234");
	System.out.println("��������");
	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	
	//salt���� �������� ����

	ResultSet rs2 = stmt2.executeQuery("select salt from userInfo where id='"+id+"'");
	System.out.println("salt ����Ʈ�� ���");
	if(rs2.next())
	{
		uuid = rs2.getString("salt");	
		System.out.println("��ȣȭ�� salt : " + rs2.getString("salt"));
		System.out.println("��Ʈ�ҷ����⼺�� �ҷ��� salt : " +rs2.getString("salt"));
	}else{
		System.out.println("��Ʈ����");
	}

	//������� salt���� ���̵� ���(�ؽ��Ѱ�) ������ ���ؼ� �α��� üũ
	ResultSet rs = stmt.executeQuery(
			"select * from userInfo where id='"+id+"'and pw='"+SHA256.getSHA256(pw,uuid)+"'");
	System.out.println("����Ʈ��");
	
	if(rs.next()){
		System.out.println("�α��� ���");
		session.setAttribute("__id", id);//�������� ���� �Ǳ� �� ���� �����ִ� ���� ��ü�� ���� �ֱ�, ���޾��� ���������� ��𿡼��� �ĺ��ڷ� ȣ�Ⱑ��
		response.sendRedirect("Main.jsp");
	}else{
		String str = "<script>";
		str += "alert('���̵�/��й�ȣ�� Ȯ�����ּ���.');";
		str += "location.href='index.jsp';";
		str += "</script>";
		out.println(str);
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>