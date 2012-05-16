package org.apache.jsp.WEB_002dINF.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class myhomepage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<script type=\"text/javascript\" src=\"resource/admin/js/myhomepage.js\"></script>\n");
      out.write("<table style=\"width:100%;\">\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td width=\"50%\" valign=\"top\">\n");
      out.write("\t\t<table class=\"easyui-panel tb_list\" title=\"概况\"  fit=\"true\">\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td class=\"lefttd\">销售总额</td>\n");
      out.write("\t\t\t\t\t\t<td class=\"righttd\" >sfs</td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td class=\"lefttd\">今年销售总额</td>\n");
      out.write("\t\t\t\t\t\t<td class=\"righttd\" ></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td class=\"lefttd\">客户</td>\n");
      out.write("\t\t\t\t\t\t<td class=\"righttd\" ></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td class=\"lefttd\">产品</td>\n");
      out.write("\t\t\t\t\t\t<td class=\"righttd\" ></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td class=\"lefttd\">咨询</td>\n");
      out.write("\t\t\t\t\t\t<td class=\"righttd\" ></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td class=\"lefttd\">评论</td>\n");
      out.write("\t\t\t\t\t\t<td class=\"righttd\" ></td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t\t<td width=\"50%\" valign=\"top\">\n");
      out.write("\t\t<table class=\"easyui-panel tb_list\" title=\"订单信息\"  fit=\"true\" >\n");
      out.write("\t\t\t<tbody>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"lefttd\">总订单</td>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"righttd\" >sf</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"lefttd\">新订单</td>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"righttd\" ></td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"lefttd\">未付款订单</td>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"righttd\" ></td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"lefttd\">未发货订单</td>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"righttd\" ></td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"lefttd\">七天未确认订单</td>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"righttd\" ></td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"lefttd\">完成订单</td>\n");
      out.write("\t\t\t\t\t\t\t<td class=\"righttd\" ></td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t</tbody>\t\t\t\t\n");
      out.write("\t\t</table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td colspan=\"2\">\n");
      out.write("\t\t<table id=\"orderlist\" title=\"最新10条订单\" fit=\"true\"></table>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
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
