<%@page import="util.SHA256"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"%>
<%@page import="java.util.UUID" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	

	request.setCharacterEncoding("euc-KR");//����Ʈ����϶� �ѱ�ó�� ���ڵ���¼��
	String id = request.getParameter("_id");
	String pw = request.getParameter("_pw");
	String pwcheck = request.getParameter("_checkpw");
	String name = request.getParameter("_name");
	String phone = request.getParameter("_phone");
	String uuid = UUID.randomUUID().toString();
	
	System.out.println("join���� joincheck�� �Ѿ�� ID: "+id);
	System.out.println("join���� joincheck�� �Ѿ�� PW: "+pw);
	System.out.println("joincheck ���� ���� : "+uuid);
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB����̹����
	System.out.println("JoinCheck ����̹����");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:XE", "jsptest", "1234");//2.Ŀ�ؼǰ�ü�����ؼ� Ŀ��Ʈ
			System.out.println("����üũ Ŀ��Ʈ");
	Statement stmt = conn.createStatement();//3.Ŀ��Ʈ ��ü�� stmt ��ü�� �����
	System.out.println("statement");
	

	//ȸ������ �����մϴ�.
	ResultSet rs=stmt.executeQuery("select id from userinfo where id='"+id+"'");
	System.out.println("JoinCheck���� ���̵� ������� �ߺ�üũ�ϴ� �κ�");
	if(rs.next()){
		String str = "<script>";
		str += "alert('�ߺ��� ���̵��Դϴ�.');";
		str += "location.href='Join.jsp';";
		str += "</script>";
		out.println(str);
	}
	else{
	System.out.println("ȸ������ ���� �ֱ� ��");
	stmt.executeUpdate("insert into userinfo values('"+id+"','"+name+"','"+SHA256.getSHA256(pw,uuid)+"','0','0','"+phone+"','"+uuid+"')");
	System.out.println("Insert�� ȸ�� ���� ID : "+id);
	System.out.println("Insert�� ȸ�� ���� NAME : "+name);
	System.out.println("Insert�� ȸ�� ���� ��ȣȭ�� pw : "+SHA256.getSHA256(pw,uuid));
	String str = "<script>";
	str += "alert('ȸ�����ԿϷ�!.');";
	str += "location.href='index.jsp';";
	str += "</script>";
	out.println(str);
	stmt.close();
	conn.close();			
	}
	}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>