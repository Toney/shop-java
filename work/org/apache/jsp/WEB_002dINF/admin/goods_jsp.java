package org.apache.jsp.WEB_002dINF.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class goods_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<ul class=\"easyui-tree\" animate=\"true\" lines=\"true\" >\n");
      out.write("\t<li><span>商品管理</span>\n");
      out.write("\t<ul>\n");
      out.write("\t\t\t<li class=\"selected\"><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=goods&amp;action=goods_list\">商品列表</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=goods&amp;action=goods_add\">商品添加</a></li>\n");
      out.write("\t\t</ul></li>\n");
      out.write("\t<li><span>商品分类</span>\n");
      out.write("\t<ul>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=goods&amp;action=category_list\">分类列表</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=goods&amp;action=category_edit\">添加分类</a></li>\n");
      out.write("\t\t</ul></li>\n");
      out.write("\t<li><span>品牌</span>\n");
      out.write("\t<ul>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=brand&amp;action=category_list\">品牌分类</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=brand&amp;action=brand_list\">品牌列表</a></li>\n");
      out.write("\t\t</ul></li>\n");
      out.write("\t<li><span>模型</span>\n");
      out.write("\t<ul>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=goods&amp;action=model_list\">模型列表</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=goods&amp;action=spec_list\">规格列表</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=goods&amp;action=spec_photo\">规格图库</a></li>\n");
      out.write("\t\t</ul></li>\n");
      out.write("\t<li><span>热门搜索</span>\n");
      out.write("\t<ul>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=tools&amp;action=keyword_list\">关键词列表</a></li>\n");
      out.write("\t\t\t<li><a\n");
      out.write("\t\t\t\thref=\"/iwebshop/index.php?controller=tools&amp;action=search_list\">搜索统计</a></li>\n");
      out.write("\t\t</ul></li>\n");
      out.write("</ul>");
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
