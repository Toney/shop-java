package org.apache.jsp.WEB_002dINF.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class config_005fbasic_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

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

      out.write("\r\n");
      out.write("<form method=\"post\" name=\"form_config_basic\" action=\"admin/config/config_basic_do\" enctype=\"multipart/form-data\">\t\r\n");
      out.write("<table class=\"tab_form\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">商店名称：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"name\" />* 网店名称</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">商店网址：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"url\" />* 网站完整的URL访问地址</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">商店LOGO：</td>\r\n");
      out.write("\t\t<td><input type=\"file\" value=\"上传\" class=\"text\" size=\"25\" name=\"logo\" />\r\n");
      out.write("\t\t\t直接从本地上传图片覆盖原有的网站logo</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">联系人：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"master\" required=\"true\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">QQ：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"qq\" required=\"true\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">Email：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"email\" required=\"true\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">手机：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"mobile\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">固定电话：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"phone\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">具体地址：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"address\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">商品货号前缀：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"goods_no_pre\" required=\"true\"/>只取前两位</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">首页TITLE前缀：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"index_seo_title\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">首页关键字：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"index_seo_keywords\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">首页描述：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text\" name=\"index_seo_description\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td></td>\r\n");
      out.write("\t\t<td><input type=\"button\" value=\"保存基本设置\" onclick=\"config_basic()\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>");
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
