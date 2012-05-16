package org.apache.jsp.WEB_002dINF.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class tool_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<ul class=\"easyui-tree\" animate=\"true\" lines=\"true\" >\r\n");
      out.write("\t\t<li><span>数据库管理</span><ul><li class=\"selected\"><a href=\"/iwebshop/index.php?controller=tools&amp;action=db_bak\">数据库备份</a></li><li><a href=\"/iwebshop/index.php?controller=tools&amp;action=db_res\">数据库还原</a></li></ul></li><li><span>文章管理</span><ul><li><a href=\"/iwebshop/index.php?controller=tools&amp;action=article_cat_list\">文章分类</a></li><li><a href=\"/iwebshop/index.php?controller=tools&amp;action=article_list\">文章列表</a></li></ul></li><li><span>帮助管理</span><ul><li><a href=\"/iwebshop/index.php?controller=tools&amp;action=help_cat_list\">帮助分类</a></li><li><a href=\"/iwebshop/index.php?controller=tools&amp;action=help_list\">帮助列表</a></li></ul></li><li><span>广告管理</span><ul><li><a href=\"/iwebshop/index.php?controller=tools&amp;action=ad_position_list\">广告位列表</a></li><li><a href=\"/iwebshop/index.php?controller=tools&amp;action=ad_list\">广告列表</a></li></ul></li><li><span>公告管理</span><ul><li><a href=\"/iwebshop/index.php?controller=tools&amp;action=notice_list\">公告列表</a></li><li><a href=\"/iwebshop/index.php?controller=tools&amp;action=notice_edit\">公告发布</a></li></ul></li><li><span>网站地图</span><ul><li><a href=\"/iwebshop/index.php?controller=tools&amp;action=seo_sitemaps\">网站搜索地图</a></li></ul></li></ul>");
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
