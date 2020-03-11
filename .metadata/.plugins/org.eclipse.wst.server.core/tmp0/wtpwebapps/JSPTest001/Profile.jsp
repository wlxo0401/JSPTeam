<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

<!-- ������ ��Ÿ�� -->
<script type="text/javascript">
 var stmnLEFT = 10; // ������ ���� 
 var stmnGAP1 = 0; // ���� ���� 
 var stmnGAP2 = 150; // ��ũ�ѽ� ������ ���ʰ� �������� �Ÿ� 
 var stmnBASE = 150; // ��ũ�� ������ġ 
 var stmnActivateSpeed = 1; //��ũ���� �ν��ϴ� ������ (���ڰ� Ŭ���� ������ �ν�)
 var stmnScrollSpeed = 1; //��ũ�� �ӵ� (Ŭ���� ����)
 var stmnTimer; 
 
 function RefreshStaticMenu() { 
  var stmnStartPoint, stmnEndPoint; 
  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
  if (stmnStartPoint != stmnEndPoint) { 
   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
   stmnRefreshTimer = stmnScrollSpeed; 
   }
  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
  } 
 function InitializeStaticMenu() {
  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //ó���� �����ʿ� ��ġ. left�� �ٲ㵵.
  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
  RefreshStaticMenu();
  }
</script>

<style type="text/css">
#STATICMENU { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
#logo {color: orange}
body {background-color: #232323}
#myPage {float: right; right: 50px;}
#nav-3 {
  background:#274075;
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




</head>
<body onload="InitializeStaticMenu();">
<!-- ������ �ʱ�ȭ �� �ҷ����� -->
<%
//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ

	//�̿��� ���� ���� �޾ƿ��� �� �ʱ�ȭ
	String id = (String)session.getAttribute("__id");
	if(id==null){
		response.sendRedirect("index.jsp");
	}

//�ʱ� ȭ��url ����
String url = request.getParameter("_url");
if(url==null)
{
	url = "InputProfile.jsp";
}
//�ʱ� ȭ�� ũ�� ����
String size = request.getParameter("_size");
if(size==null)
{
	size = "500px";
}


%>


		<div class="card card bg-dark text-white" color=red>
		<!-- Ȩ������ �ΰ� -->
        <div>
            <a id = "logo" href="Main.jsp"><img src="image/DoubleSixTitle.png" width="100%" height="200px"></img></a>
            <!--<p>Welcome to Lawrence Home</p>-->
        </div>        
        
        <!-- Ȩ������ �޴� -->
        <div id="nav-3">
        <div class="card-body" align="center">
        		<a class="link-3" href="MainTextList.jsp?_url=NoticeList.jsp&_size=900px">��������</a>
				<a class="link-3" href="MainTextList.jsp?_url=FreeList.jsp&_size=900px">�����Խ���</a>
				<a class="link-3" href="QuizMain.jsp?">����Ʈ����</a>
				<a class="link-3" href="GameMain.jsp?">����Ʈ����</a>
        </div>
        </div>
        
        <!-- Ȩ������ ���� -->
        <div class="card-body">
            <div class="row">
            
	            <!-- ���� �׸� -->
            	<div class="col-2">
            		<div class="btn-group-vertical">
  						<button id=ChangeUserInfo type="button" class="btn btn-secondary" onclick='open_in_frame("InputProfile.jsp","500px")'>ȸ�� ���� ����</button><hr>
  						<button id=ChangeUserPoint type="button" class="btn btn-secondary" onclick='open_in_frame("InputPoint.jsp","500px")'>����Ʈ ����/ȯ��</button>
					</div>
				</div>            	
            	
            	<!-- ���� �׸� -->
                <div class="col">
                	<iframe id=mainframe src=<%=url %> width=100% height=<%=size %> frameborder="0" scrolling="no"></iframe>
                </div>		
                
                <!-- ���� ���� ��� -->			
                <div class="col-2">
                	<div id="STATICMENU"><img src="image/DoubleSixAdv1.png" width="100%" height="auto"></img></div>
				</div>
            </div>
        </div>

        
        
        <div class="card-footer">
        	<iframe width=100% height=500px frameborder="0" scrolling="no"></iframe>
        </div>
   		</div>

<script src="//code.jquery.com/jquery.min.js"></script>
<script>
function open_in_frame(url,size) {
	$('#mainframe').attr('src', url);
	$('#mainframe').attr('height', size);
}
</script>
   		
</body>
</html>