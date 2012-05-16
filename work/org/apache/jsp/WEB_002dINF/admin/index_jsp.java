package org.apache.jsp.WEB_002dINF.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/c.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');

String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 

      out.write("    \n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<base href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['url']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\">\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<title>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${webtitle}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("</title>\n");
      out.write("<script type=\"text/javascript\" src=\"resource/easyui/jquery-1.7.2.min.js\"></script>\n");
      out.write("<link href=\"resource/admin/login/css/login.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<style>\n");
      out.write(".Errormsg{padding:0 0 0 10px; line-height:25px; color:#4c4c4c; font-size:14px;}\n");
      out.write("</style>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("function fleshVerify(){ \n");
      out.write("\t$('#verifyImg').attr('src', '/kaptcha.jpg?' + Math.floor(Math.random()*100) ); \n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div id=\"login\">\n");
      out.write("\t<div id=\"login_header\">\n");
      out.write("\t\t<h1 class=\"login_logo\">\n");
      out.write("\t\t\t<a href=\"index.php/webmaster/login\"><img src=\"resource/admin/login/images/login_logo.gif\" /></a>\n");
      out.write("\t\t</h1>\n");
      out.write("\t\t<div class=\"login_headerContent\">\n");
      out.write("\t\t\t<div class=\"navList\">\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li><a href=\"#\">返回首页</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"#\">反馈</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"#\">帮助</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<h2 class=\"login_title\"><img src=\"resource/admin/login/images/login_title.png\" /></h2>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t<div id=\"login_content\">\n");
      out.write("\t\t<div class=\"loginForm\">\n");
      out.write("\t\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\t\t\t<form method=\"post\" action=\"admin/webmaster/login\" >\n");
      out.write("\t\t\t\t<p>\n");
      out.write("\t\t\t\t\t<label>帐号：</label>\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"user_name\" size=\"20\" class=\"login_input\" />\n");
      out.write("\t\t\t\t</p>\n");
      out.write("\t\t\t\t<p>\n");
      out.write("\t\t\t\t\t<label>密码：</label>\n");
      out.write("\t\t\t\t\t<input type=\"password\" name=\"password\" size=\"20\" class=\"login_input\" />\n");
      out.write("\t\t\t\t</p>\n");
      out.write("\t\t\t\t<p>\n");
      out.write("\t\t\t\t\t<label>验证码：</label>\n");
      out.write("\t\t\t\t\t<input class=\"code\" name=\"verify\" type=\"text\" size=\"5\" />\n");
      out.write("\t\t\t\t</p>\n");
      out.write("\t\t\t\t<p>\n");
      out.write("\t\t\t\t\t<img id=\"verifyImg\" src=\"kaptcha.jpg\" style=\"margin-top:10px;margin-left:10px;\" onClick=\"fleshVerify()\" border=\"0\" title=\"点击刷新验证码\" alt=\"点击刷新验证码\" style=\"cursor:pointer\" align=\"absmiddle\"/>\n");
      out.write("\t\t\t\t</p>\n");
      out.write("\t\t\t\t<div class=\"login_bar\" >\n");
      out.write("\t\t\t\t\t<input class=\"sub\" type=\"submit\" name=\"form_submit\" value=\" \" />\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</form>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"login_banner\"><img src=\"resource/admin/login/images/login_banner.jpg\" /></div>\n");
      out.write("\t\t<div class=\"login_main\">\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t<div id=\"login_footer\">\n");
      out.write("\t\t中国百分百商城系统\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /WEB-INF/admin/index.jsp(44,3) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${message!=null }", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("\t\t\t\t<p><span class=\"Errormsg\">");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${message }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
        out.write("</span></p>\n");
        out.write("\t\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }
}
