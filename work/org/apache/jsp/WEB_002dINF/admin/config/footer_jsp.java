package org.apache.jsp.WEB_002dINF.admin.config;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<script type=\"text/javascript\" src=\"resource/admin/global.js\"></script>\n");
      out.write("\r\n");
      out.write("<script charset=\"utf-8\" src=\"resource/plugin/kindeditor/kindeditor.js\"></script>\r\n");
      out.write("<script charset=\"utf-8\" src=\"resource/plugin/kindeditor/lang/zh_CN.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write("#msg_tr{display:none;}\r\n");
      out.write("</style>\r\n");
      out.write("<script>\r\n");
      out.write("var editor;\r\n");
      out.write("KindEditor.ready(function(K) {\r\n");
      out.write("\teditor = K.create('textarea[name=\"site_footer_code\"]', {\r\n");
      out.write("\t\tresizeType : 1,\r\n");
      out.write("\t\tallowPreviewEmoticons : true,\r\n");
      out.write("\t\tallowImageUpload : true,\r\n");
      out.write("\t\tallowFileManager : true,\r\n");
      out.write("\t\titems:editoritem_more,\r\n");
      out.write("\t\tuploadJson:'file/upload',\r\n");
      out.write("\t\tfileManagerJson:'file/filemanager',\r\n");
      out.write("\t\timgLocation:\"resource/upload/images/config/\"\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("function config_footer_submit(){\r\n");
      out.write("\tvar param = {site_footer_code:editor.html()};\r\n");
      out.write("\t$.get(\"admin/config/config_footer_do\",param,function(data){\r\n");
      out.write("\t\tif(data.type == \"true\"){\r\n");
      out.write("\t\t\t$(\"#message\").html(\"底部信息修改成功！\");\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\t$(\"#message\").html(msg_ex);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t$(\"#msg_tr\").show();\r\n");
      out.write("\t},'json');\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"body_panel easyui-layout\">\r\n");
      out.write("<form method=\"post\" id=\"form_config_footer\" >\r\n");
      out.write("<table class=\"tab_form\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t<textarea name=\"site_footer_code\" id=\"site_footer_code\"  style=\"width:100%;visibility:hidden;height:350px;\">\r\n");
      out.write("\t\t\t");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['site_footer_code']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\r\n");
      out.write("\t\t</textarea>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td><a href=\"javascript:config_footer_submit()\" class=\"easyui-linkbutton\" >保存站点底部信息</a></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr id=\"msg_tr\">\r\n");
      out.write("\t\t<td><div id=\"message\" class=\"success\"></div></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
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
