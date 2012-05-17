package org.apache.jsp.WEB_002dINF.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class console_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/WEB-INF/admin/header.jsp");
    _jspx_dependants.add("/WEB-INF/c.tld");
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
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
      out.write('\n');

String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 

      out.write("    \n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<base href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['url']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\">\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<title>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${webtitle}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("</title>\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"resource/easyui/themes/cupertino/easyui.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"resource/easyui/themes/icon.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"resource/admin/css.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"resource/admin/easyui_update.css\">\n");
      out.write("<script type=\"text/javascript\" src=\"resource/easyui/jquery-1.7.2.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"resource/easyui/jquery.easyui.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"resource/easyui/locale/easyui-lang-zh_CN.js\"></script>\n");
      out.write("<link href=\"resource/plugin/loadmask/jquery.loadmask.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<script type=\"text/javascript\" src=\"resource/plugin/loadmask/jquery.loadmask.min.js\"></script>\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"resource/plugin/fancybox/jquery.fancybox-1.3.4.css\">\n");
      out.write("<script type=\"text/javascript\" src=\"resource/plugin/fancybox/jquery.mousewheel-3.0.4.pack.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"resource/plugin/fancybox/jquery.fancybox-1.3.4.pack.js\"></script>\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\" src=\"resource/admin/global.js\"></script>\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\" src=\"resource/admin/top.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"resource/admin/js/index.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body id=\"bodycontainer\" class=\"easyui-layout\">\n");
      out.write("\t\t<div region=\"north\" style=\"height:85px;overflow:hidden;\" class=\"headerNav\">\n");
      out.write("\t\t\t<a class=\"logo\"></a>\n");
      out.write("            <ul class=\"nav\">\n");
      out.write("                <li><a>修改密码</a></li>\n");
      out.write("                <li><a>修改资料</a></li>\n");
      out.write("                <li><a href=\"admin/webmaster/loginout\">退出</a></li>\n");
      out.write("            </ul>\n");
      out.write("            <div id=\"navMenu\">\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li><a id=\"nav_goods\" href=\"javascript:menuList('goods')\"><span>商品</span></a></li>\n");
      out.write("\t\t\t\t\t<li><a id=\"nav_memeber\" href=\"javascript:menuList('member')\"><span>会员</span></a></li>\n");
      out.write("\t\t\t\t\t<li><a id=\"nav_order\" href=\"javascript:menuList('order')\"><span>订单</span></a></li>\n");
      out.write("\t\t\t\t\t<li><a id=\"nav_market\" href=\"javascript:menuList('market')\"><span>营销</span></a></li>\n");
      out.write("\t\t\t\t\t<li><a id=\"nav_stat\" href=\"javascript:menuList('stat')\"><span>统计</span></a></li>\n");
      out.write("\t\t\t\t\t<li><a id=\"nav_system\" href=\"javascript:menuList('system')\"  class=\"selected\" ><span>系统</span></a></li>\n");
      out.write("                    <li><a id=\"nav_tool\" href=\"javascript:menuList('tool')\"><span>工具</span></a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div region=\"south\" style=\"height:30px;background:#efefef;text-align: center;padding-top:5px;\">\n");
      out.write("\t\t中国百分百商城系统\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div region=\"west\" split=\"true\" style=\"width:150px;overflow:hidden;\">\n");
      out.write("\t\t\t<div id=\"accordion\" fit=\"true\" border=\"false\">\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div region=\"center\" style=\"overflow:hidden;\">\n");
      out.write("\t\t\t<div id=\"tabs\" fit=\"true\" border=\"false\" >\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
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
}
