/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.0.M9
 * Generated at: 2019-12-18 04:52:01 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class GameMain_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"EUC-KR\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<!-- Latest compiled and minified CSS -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\">\r\n");
      out.write("\r\n");
      out.write("<!-- jQuery library -->\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- Popper JS -->\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- Latest compiled JavaScript -->\r\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- 광고배너 스타일 -->\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write(" var stmnLEFT = 10; // 오른쪽 여백 \r\n");
      out.write(" var stmnGAP1 = 0; // 위쪽 여백 \r\n");
      out.write(" var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 \r\n");
      out.write(" var stmnBASE = 150; // 스크롤 시작위치 \r\n");
      out.write(" var stmnActivateSpeed = 1; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)\r\n");
      out.write(" var stmnScrollSpeed = 1; //스크롤 속도 (클수록 느림)\r\n");
      out.write(" var stmnTimer; \r\n");
      out.write(" \r\n");
      out.write(" function RefreshStaticMenu() { \r\n");
      out.write("  var stmnStartPoint, stmnEndPoint; \r\n");
      out.write("  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); \r\n");
      out.write("  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; \r\n");
      out.write("  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; \r\n");
      out.write("  if (stmnStartPoint != stmnEndPoint) { \r\n");
      out.write("   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); \r\n");
      out.write("   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; \r\n");
      out.write("   stmnRefreshTimer = stmnScrollSpeed; \r\n");
      out.write("   }\r\n");
      out.write("  stmnTimer = setTimeout(\"RefreshStaticMenu();\", stmnActivateSpeed); \r\n");
      out.write("  } \r\n");
      out.write(" function InitializeStaticMenu() {\r\n");
      out.write("  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.\r\n");
      out.write("  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; \r\n");
      out.write("  RefreshStaticMenu();\r\n");
      out.write("  }\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("#STATICMENU { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}\r\n");
      out.write("#logo {color: orange}\r\n");
      out.write("body {background-color: #232323}\r\n");
      out.write("#myPage {float: right; right: 50px;}\r\n");
      out.write("#nav-3 {\r\n");
      out.write("  background:#274075;\r\n");
      out.write("}\r\n");
      out.write(".link-3 {\r\n");
      out.write("  transition: 0.4s;\r\n");
      out.write("  color: #ffffff;\r\n");
      out.write("  font-size: 30px;\r\n");
      out.write("  text-decoration: none;\r\n");
      out.write("  padding: 0 10px;\r\n");
      out.write("  margin: 0 10px;\r\n");
      out.write("}\r\n");
      out.write(".link-3:hover {\r\n");
      out.write("  background-color: #ffffff;\r\n");
      out.write("  color: #668ee3;\r\n");
      out.write("  padding: 5px 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body onload=\"InitializeStaticMenu();\">\r\n");
      out.write("<!-- 데이터 초기화 및 불러오기 -->\r\n");

	//이용자 정보 변수 받아오기 및 초기화

	//이용자 정보 변수 받아오기 및 초기화
	String id = (String)session.getAttribute("__id");
	if(id==null){
		response.sendRedirect("index.jsp");
	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"card card bg-dark text-white\">\r\n");
      out.write("\t\t<!-- 홈페이지 로고 -->\r\n");
      out.write("        <div>\r\n");
      out.write("            <a id = \"logo\" href=\"Main.jsp\"><img src=\"image/DoubleSixTitle.png\" width=\"100%\" height=\"200px\"></img></a>\r\n");
      out.write("        </div>        \r\n");
      out.write("        \r\n");
      out.write("        <!-- 홈페이지 메뉴 -->\r\n");
      out.write("        <div id=\"nav-3\">\r\n");
      out.write("        <div class=\"card-body\" align=\"center\">\r\n");
      out.write("        \t\t<a class=\"link-3\" href=\"MainTextList.jsp?_url=NoticeList.jsp&_size=900px\">공지사항</a>\r\n");
      out.write("\t\t\t\t<a class=\"link-3\" href=\"MainTextList.jsp?_url=FreeList.jsp&_size=900px\">자유게시판</a>\r\n");
      out.write("\t\t\t\t<a class=\"link-3\" href=\"QuizMain.jsp?\">포인트퀴즈</a>\r\n");
      out.write("\t\t\t\t<a class=\"link-3\" href=\"Profile.jsp?_url=InputProfile.jsp&_size=500px\">회원 정보 변경</a>\r\n");
      out.write("\t\t\t\t<a class=\"link-3\" href=\"Profile.jsp?_url=InputPoint.jsp&_size=500px\">포인트 충전/환전</a>\r\n");
      out.write("        </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- 홈페이지 본문 -->\r\n");
      out.write("        <div class=\"card-body\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("            \r\n");
      out.write("\t            <!-- 좌측 항목 -->\r\n");
      out.write("            \t<div class=\"col-2\">\r\n");
      out.write("            \t<div><img src=\"image/DoubleSixAdv3.png\" width=\"100%\" height=\"auto\"></img></div>\r\n");
      out.write("\t\t\t\t</div>            \t\r\n");
      out.write("            \t\r\n");
      out.write("            \t<!-- 메인 항목 -->\r\n");
      out.write("                <div class=\"col\">\r\n");
      out.write("                \t<iframe id=mainframe src=\"CrossGame.jsp\" width=100% height=\"520px\" frameborder=\"0\" scrolling=\"auto\"></iframe>\r\n");
      out.write("                </div>\t\t\r\n");
      out.write("                \r\n");
      out.write("                <!-- 우측 광고 배너 -->\t\t\t\r\n");
      out.write("                <div class=\"col-2\">\r\n");
      out.write("                \t<div id=\"STATICMENU\"><img src=\"image/DoubleSixAdv1.png\" width=\"100%\" height=\"auto\"></img></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <div class=\"card-footer\">\r\n");
      out.write("        \t<iframe width=100% height=410px frameborder=\"0\" scrolling=\"no\"></iframe>\r\n");
      out.write("        </div>\r\n");
      out.write("   \t\t</div>\r\n");
      out.write("\r\n");
      out.write("<script src=\"//code.jquery.com/jquery.min.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("function open_in_frame(url,size) {\r\n");
      out.write("\t$('#mainframe').attr('src', url);\r\n");
      out.write("\t$('#mainframe').attr('height', size);\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("   \t\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
