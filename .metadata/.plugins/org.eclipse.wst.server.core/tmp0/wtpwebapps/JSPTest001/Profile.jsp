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

<!-- 광고배너 스타일 -->
<script type="text/javascript">
 var stmnLEFT = 10; // 오른쪽 여백 
 var stmnGAP1 = 0; // 위쪽 여백 
 var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
 var stmnBASE = 150; // 스크롤 시작위치 
 var stmnActivateSpeed = 1; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
 var stmnScrollSpeed = 1; //스크롤 속도 (클수록 느림)
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
  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
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
<!-- 데이터 초기화 및 불러오기 -->
<%
//이용자 정보 변수 받아오기 및 초기화

	//이용자 정보 변수 받아오기 및 초기화
	String id = (String)session.getAttribute("__id");
	if(id==null){
		response.sendRedirect("index.jsp");
	}

//초기 화면url 설정
String url = request.getParameter("_url");
if(url==null)
{
	url = "InputProfile.jsp";
}
//초기 화면 크기 설정
String size = request.getParameter("_size");
if(size==null)
{
	size = "500px";
}


%>


		<div class="card card bg-dark text-white" color=red>
		<!-- 홈페이지 로고 -->
        <div>
            <a id = "logo" href="Main.jsp"><img src="image/DoubleSixTitle.png" width="100%" height="200px"></img></a>
            <!--<p>Welcome to Lawrence Home</p>-->
        </div>        
        
        <!-- 홈페이지 메뉴 -->
        <div id="nav-3">
        <div class="card-body" align="center">
        		<a class="link-3" href="MainTextList.jsp?_url=NoticeList.jsp&_size=900px">공지사항</a>
				<a class="link-3" href="MainTextList.jsp?_url=FreeList.jsp&_size=900px">자유게시판</a>
				<a class="link-3" href="QuizMain.jsp?">포인트퀴즈</a>
				<a class="link-3" href="GameMain.jsp?">포인트게임</a>
        </div>
        </div>
        
        <!-- 홈페이지 본문 -->
        <div class="card-body">
            <div class="row">
            
	            <!-- 좌측 항목 -->
            	<div class="col-2">
            		<div class="btn-group-vertical">
  						<button id=ChangeUserInfo type="button" class="btn btn-secondary" onclick='open_in_frame("InputProfile.jsp","500px")'>회원 정보 변경</button><hr>
  						<button id=ChangeUserPoint type="button" class="btn btn-secondary" onclick='open_in_frame("InputPoint.jsp","500px")'>포인트 충전/환전</button>
					</div>
				</div>            	
            	
            	<!-- 메인 항목 -->
                <div class="col">
                	<iframe id=mainframe src=<%=url %> width=100% height=<%=size %> frameborder="0" scrolling="no"></iframe>
                </div>		
                
                <!-- 우측 광고 배너 -->			
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