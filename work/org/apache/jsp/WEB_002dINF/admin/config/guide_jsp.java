package org.apache.jsp.WEB_002dINF.admin.config;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class guide_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/WEB-INF/admin/config/../header.jsp");
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

      out.write('\r');
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
      out.write("<script type=\"text/javascript\" src=\"resource/admin/global.js\"></script>");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"resource/admin/js/config/guide.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"body_panel easyui-layout\">\r\n");
      out.write("\t<div region=\"center\"  border=\"false\" class=\"bdcenter\">\r\n");
      out.write("\t\t<form method=\"post\" id=\"form_config_guide\" >\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"action\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${action }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" /> <input type=\"hidden\"\r\n");
      out.write("\t\t\t\tname=\"order\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${order }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" />\r\n");
      out.write("\t\t\t<table class=\"tab_form\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"edittd\">名称：</td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"\r\n");
      out.write("\t\t\t\t\t\tname=\"name\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${guide.name }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" required=\"true\" validType=\"length[1,50]\" /></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"edittd\">链接地址：</td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"\r\n");
      out.write("\t\t\t\t\t\tname=\"link\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${guide.link }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" required=\"true\" validType=\"length[1,100]\" /></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div region=\"south\" class=\"btnbar\" border=\"false\">\r\n");
      out.write("\t\t<a class=\"easyui-linkbutton\" iconCls=\"icon-ok\"\r\n");
      out.write("\t\t\thref=\"javascript:void(0)\" onclick=\"config_guide()\">编辑</a> <a\r\n");
      out.write("\t\t\tclass=\"easyui-linkbutton\" iconCls=\"icon-cancel\"\r\n");
      out.write("\t\t\thref=\"javascript:void(0)\" onclick=\"closePWin(1)\">取消</a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
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
