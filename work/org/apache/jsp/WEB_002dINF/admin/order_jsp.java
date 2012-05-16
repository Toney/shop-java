package org.apache.jsp.WEB_002dINF.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class order_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<ul class=\"easyui-tree\"  lines=\"true\">\r\n");
      out.write("\t\t<li><span>订单管理</span><ul ><li class=\"selected\"><a href=\"/iwebshop/index.php?controller=order&amp;action=order_list\">订单列表</a></li><li><a href=\"/iwebshop/index.php?controller=order&amp;action=order_add\">添加订单</a></li></ul></li><li><span>单据管理</span><ul ><li><a href=\"/iwebshop/index.php?controller=order&amp;action=order_collection_list\">收款单</a></li><li><a href=\"/iwebshop/index.php?controller=order&amp;action=order_refundment_list\">退款单</a></li><li><a href=\"/iwebshop/index.php?controller=order&amp;action=order_delivery_list\">配货单</a></li><li><a href=\"/iwebshop/index.php?controller=order&amp;action=order_returns_list\">退货单</a></li><li><a href=\"/iwebshop/index.php?controller=order&amp;action=refundment_list\">退款申请列表</a></li></ul></li><li><span>快递单管理</span><ul ><li><a href=\"/iwebshop/index.php?controller=order&amp;action=ship_info_list\">发货信息管理</a></li></ul></li></ul>");
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
