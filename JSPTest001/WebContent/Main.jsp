<%@page import="com.mysql.jdbc.log.Log"%>
<%@page import="java.io.Console"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Double Six</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<!-- ������Ʈ ��� -->
<style>
<%

//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
String id = (String)session.getAttribute("__id");
if(id==null){
	//response.sendRedirect("index.jsp");
	response.sendRedirect("index.jsp");
}
System.out.println(session.getAttribute("__id"));
int[] point = {0,0,0,0,0};
String[] name = new String[5];

//�Խñ� ���� ����
int pNum = 10;
int sNum = 10;
int [][] tno = new int[pNum][sNum];
String[][] title = new String[pNum][sNum];
String[][] tname = new String[pNum][sNum];
String[][] tdate = new String[pNum][sNum];
String[][] tcontent = new String[pNum][sNum];
int textNum = 1;
int lastNum = 0;
int pCount = 0;
int sCount = 0;

int [][] ftno = new int[pNum][sNum];
String[][] ftitle = new String[pNum][sNum];
String[][] ftname = new String[pNum][sNum];
String[][] ftdate = new String[pNum][sNum];
String[][] ftcontent = new String[pNum][sNum];



int i=0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");//1.DB����̹����
	System.out.println("JoinCheck ����̹����");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521:xe", "jsptest", "1234");//2.Ŀ�ؼǰ�ü�����ؼ� Ŀ��Ʈ
			System.out.println("����üũ Ŀ��Ʈ");
	Statement stmt = conn.createStatement();//3.Ŀ��Ʈ ��ü�� stmt ��ü�� �����
	System.out.println("statement");
	//ȸ������ �����մϴ�.
	ResultSet rs=stmt.executeQuery("SELECT point,name FROM(SELECT point,name FROM userinfo ORDER BY point DESC) WHERE ROWNUM <= 5");
	System.out.println("sql�� ���");
	System.out.println("2�� �õ�");
	while(rs.next()) {
		
		point[i] = rs.getInt("point");
		System.out.println("getint ��� : " + point[i]);

		name[i] = rs.getString("name");
		System.out.println("getString ��� : " + name[i]);
		System.out.println(name[i]);
		i++;
	}
	
	//���� ���� �ҷ����� ������ �迭������ ���
	rs = stmt.executeQuery("SELECT MAX(no) FROM textList");
	while(rs.next()){
		lastNum = rs.getInt(1);
	}
	rs = stmt.executeQuery("SELECT COUNT(no) FROM textList");
	while(rs.next()){
		textNum = rs.getInt(1);
	}
	//�۹�ȣ �ʱ�ȭ
	for(int k = 0 ; k < 10 ; k++){
		for(int j = 0 ; j < 10 ; j++){
			tno[k][j] = 0;
		}
	}
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
	
	rs = stmt.executeQuery("SELECT * FROM textList ORDER BY no DESC");
	//����� ���� ����
	int k = 0;
	int j = 0;
	while(rs.next()){
		tno[k][j] = rs.getInt("no");
		tname[k][j] = rs.getString("userid");
		title[k][j] = rs.getString("title");
		tcontent[k][j] = rs.getString("content");
		tdate[k][j] = (rs.getString("data")).substring(0, 10);
		j++;
		if(j>=10){
			j = 0;
			k++;
		}
	}
	
	//�����Խ��� ���� ���� �ҷ����� ������ �迭������ ���
	rs = stmt.executeQuery("SELECT MAX(no) FROM freeTextList");
	while(rs.next()){
		lastNum = rs.getInt(1);
	}
	rs = stmt.executeQuery("SELECT COUNT(no) FROM freeTextList");
	while(rs.next()){
		textNum = rs.getInt(1);
	}
	//�۹�ȣ �ʱ�ȭ
	for(int q = 0 ; q < 10 ; q++){
		for(int r = 0 ; r< 10 ; r++){
			ftno[q][r] = 0;
		}
	}
	
	rs = stmt.executeQuery("SELECT * FROM freeTextList ORDER BY no DESC");
	
	
	
	//����� ���� ����
	int l = 0;
	int m = 0;
	while(rs.next()){
		ftno[l][m] = rs.getInt("no");
		ftname[l][m] = rs.getString("userid");
		ftitle[l][m] = rs.getString("title");
		ftcontent[l][m] = rs.getString("content");
		ftdate[l][m] = (rs.getString("data")).substring(0, 10);
		m++;		
		if(m>=10){
			m = 0;
			l++;
		}
	}
	
	
	
	}catch(Exception e){
	e.printStackTrace();
	}
	System.out.println("����Ʈ�� �ҷ����� : "+point[0]+"//" + point[1] +"//"+point[2]+"//"+point[3]+"//" +point[4]);
	System.out.println("����Ʈ�� �ҷ����� : "+name[0]+"//" + name[1] +"//"+name[2]+"//"+name[3]+"//" +name[4]);
%>
.container1 {
	display: table;
	width: 100%;
	
}
</style>




<!-- ������Ʈ -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);
function drawBasic() {
    var data = google.visualization.arrayToDataTable([
        ['Element', 'Density', { role: 'style' }],
        ['<%=name[0]%>', <%=point[0]%>, '#F0D000'],            // RGB value
        ['<%=name[1]%>', <%=point[1]%>, '#F0D000'],            // English color name
        ['<%=name[2]%>', <%=point[2]%>, '#F0D000'],
        ['<%=name[3]%>', <%=point[3]%>, '#F0D000'],
        ['<%=name[4]%>', <%=point[4]%>, '#F0D000'], // CSS-style declaration
     ]);
    var options = {
            title: '�츮����Ʈ ����Ʈ ��ŷ Top 5',
            legend : 'none',
            backgroundColor:'#000000', //����
            pointSize:5,
            titleTextStyle: { 
                color: 'white' // Ÿ��Ʋ ��
            },
            hAxis:{  // ����
                textStyle:{
                    fontSize:20,
                    color:'white'
                },
                baselineColor:'white' // ���� ���� ��
            },
            vAxis:{ // ���� 
                textStyle:{
                    fontSize:20,
                    color:'white'
                },
                gridlines: { // �߰��� ��
                    color: '#8898A1'
                },
                baselineColor:'8898A1' // �ϴ� ��  
            },
            series: { // ����
                0: {
                    color: '#F0A57C'
                },
                1: {
                    color: '#91FFC3'
                }
            }
        };
      var chart = new google.visualization.ColumnChart(
        document.getElementById('char_one'));
      chart.draw(data, options);
    }
</script>






<!-- ��� �̹��� ĭ�Դϴ�. ���ֵ� �˴ϴ�.  -->
<style>
	.tiledBackground {
		background-image: url(image/DoubleSixFooter.png);
		background-repeat: no-repeat;
		background-position: center;
		width: 1902px;
		height: 200px;
}
</style>



<!-- div ���� -->
<style>
#leftad{
	width:10%;
	height:auto;
	float:left;
}

#middle{
	width:80%;
	height:700px;
	float:left;
}

#rightad{
	width:10%;
	height:auto;
	float:left;
}
</style>



<!-- ���θ޴�(nav)���� -->

<style>
@import url(https://fonts.googleapis.com/css?family=Raleway);

nav {
  padding: 10px;
  text-align: center;
  font-family: Raleway;
  box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
}

#nav-3 {
  background:#3399ff;
}

.link-3 {
  transition: 0.4s;
  color: #ffffff;
  font-size: 30px;
  text-decoration: none;
  padding: 0 10px;
  margin: 0 10px;
}
.link-3:hover {
  background-color: #ffffff;
  color: #668ee3;
  padding: 5px 10px;
}

</style>




<!-- ���� ���� -->
<style>
nav{
	background: #2f3542;
	border-radius: 30px;
	padding: 1px;
}
.header__content {
	height: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
  color: white;
}
.header__title{
	padding: 10px 20px;
	display: inline-block;
	border-radius: 5px;
	text-decoration: none;
	font-size: 40px;
	text-transform: uppercase;
}

</style>


<!-- ĭ������ ���� ���� ���� footer�� �����ֽ��ϴ�. padding�� �� �α��Դϴ�. background�� ���Դϴ�.-->
<style>
footer{
	clear: both;
	background: #940038;
	text-align: center;
	padding: 0.5px;
	color: white;
	border-radius: 5px;
}
table{
background: #ffffff;
}
</style>


</head>


		<!-- ���⼭ ��׶��带 �ٲٸ� ��� ���� ��� �ٲ�ϴ�. -->
		<body  onload="InitializeStaticMenu();" style="overflow:auto; background:black" >
		<!--Google -Fonts-->
		<link href='https://fonts.googleapis.com/css?family=Sintony:400,700&subset=latin-ext' rel='stylesheet' type='text/css'>
		
		<!--Font-awsome-->
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">


<div class="container1">
	<header class="tiledBackground"></header>	
	<nav id="nav-3">
		<a class="link-3" href="QuizMain.jsp?">����Ʈ����</a>
		<a class="link-3" href="GameMain.jsp?">����Ʈ����</a>
		<a class="link-3" href="MainTextList.jsp?">�Խ���</a>
		<a class="link-3" href="Profile.jsp">MyProfile</a>
		<a class="link-3" href="Logout.jsp">�α׾ƿ�</a>
	</nav>
</div>


<div id="bottom" style=" height:auto;  width: 100%;">
	<div id="leftad">
		<footer class="footer">
	</div>
	<p>
	<p>
	
	<div id="middle">
		<header class="header">
			<nav class="header__content">
				<a class="header__title">����</a>
			</nav>
		</header>
		<p><p>
		<!--��Ʈ �׸���-->
		<div id="char_one"></div>
		<p><p>
		<!-- �׳� ���׸��� ��� -->
		<footer class="footer"></footer>
		<p>
		<p>
		<div style="overflow:auto; background:#99ff99; border-radius: 10px;">
			<center><h2>��������</h2></center>
			<p>
			<table class="table">
				<thead align="center">
					<tr>
						<th align="center">�� ��ȣ</th>
						<th>����</th>
						<th>�ۼ��� �̸�</th>
						<th>�ۼ� ��¥</th>                
					</tr>
				</thead>
				
				<tbody align="center">
    <%
    int pageNum = 1;
    for(i = 0 ; i < 3 ; i++){
    	if(title[pageNum-1][i]!=null){
    		out.print("<tr>");
    		out.print("<td>" + tno[pageNum-1][i] + "</td>");
    		out.print("<td><a href='ReadText.jsp?_tno=" + tno[pageNum-1][i] + "&_type=1'>" + title[pageNum-1][i] + "</a></td>");
    		out.print("<td>" + tname[pageNum-1][i] + "</td>");
    		out.print("<td>" + tdate[pageNum-1][i] + "</td>");
    		out.print("</tr>");
    	}
    }
    %>      
				</tbody>
			</table>
		</div>


		<!-- �׳� ���׸��� ��� --><p><p>
		<footer class="footer"></footer><p><p>
		
		<div style="overflow:auto; background:#99ff99; border-radius: 10px;">
		<center><h2>�����Խ���</h2></center>
		<p>
		<table class="table">
			<thead align="center">
				<tr>
					<th align="center">�� ��ȣ</th>
					<th>����</th>
					<th>�ۼ��� �̸�</th>
					<th>�ۼ� ��¥</th>                
				</tr>
			</thead>
			<tbody align="center">
    <%
    pageNum = 1;
    for(i = 0 ; i < 3 ; i++){
    	if(title[pageNum-1][i]!=null){
    		out.print("<tr>");
    		out.print("<td>" + ftno[pageNum-1][i] + "</td>");
    		out.print("<td><a href='ReadTextFree.jsp?_tno=" + ftno[pageNum-1][i] + "&_type=1'>" + ftitle[pageNum-1][i] + "</a></td>");
    		out.print("<td>" + ftname[pageNum-1][i] + "</td>");
    		out.print("<td>" + ftdate[pageNum-1][i] + "</td>");
    		out.print("</tr>");
    	}
    }
    %>       
			</tbody>
		</table>
		</div>
		<!-- �׳� ���׸��� ��� -->
		<p><p>
		<footer class="footer"></footer>
	
	</div>
	<div id="rightad">
		
		<!-- �׳� ���׸��� ��� -->
		<footer class="footer">
	</div>
</div>	
</body>
</html>