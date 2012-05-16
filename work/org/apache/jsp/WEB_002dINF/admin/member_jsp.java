package org.apache.jsp.WEB_002dINF.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class member_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<ul class=\"easyui-tree\" animate=\"true\" lines=\"true\">\n");
      out.write("\t<li><span>会员管理</span>\n");
      out.write("\t<ul>\n");
      out.write("\t\t\t<li class=\"selected\"><a href=\"javascript:tab('会员列表','admin/member/list');\" >会员列表</a></li>\n");
      out.write("\t\t\t<li><a href=\"javascript:tab('会员组列表','admin/usergroup/list');\">会员组列表</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=member&amp;action=withdraw_list\">会员提现管理</a></li>\n");
      out.write("\t\t</ul></li>\n");
      out.write("\t<li><span>信息处理</span>\n");
      out.write("\t<ul>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=comment&amp;action=suggestion_list\">建议管理</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=comment&amp;action=refer_list\">咨询管理</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=comment&amp;action=discussion_list\">讨论管理</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=comment&amp;action=comment_list\">评价管理</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=comment&amp;action=message_list\">站内消息</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=message&amp;action=notify_list\">到货通知</a></li>\n");
      out.write("\t\t</ul></li>\n");
      out.write("\t<li><span>邮件短信设置</span>\n");
      out.write("\t<ul>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=message&amp;action=tpl_list\">模板管理</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=message&amp;action=registry_list\">邮件订阅</a></li>\n");
      out.write("\t\t</ul></li>\n");
      out.write("</ul>\n");
      out.write("\n");
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
