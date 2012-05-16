package org.apache.jsp.WEB_002dINF.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class config_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/admin/common/config.jsp");
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
      out.write('\r');
      out.write('\n');

String win_topbar = "closed=\"true\" modal=\"true\" collapsible=\"false\"  draggable=\"false\" minimizable=\"false\" maximizable=\"false\" resizable=\"false\"";

      out.write("    ");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"resource/admin/js/config.js\"></script>\r\n");
      out.write("\t<div class=\"easyui-tabs\">\r\n");
      out.write("\t\t<div title=\"基本设置\" class=\"p10\" >\r\n");
      out.write("\t\t<form method=\"post\" id=\"form_config_basic\" url=\"admin/config/config_basic_do\" enctype=\"multipart/form-data\" >\t\r\n");
      out.write("<table class=\"tab_form\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">商店名称：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" name=\"name\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['name']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" required=\"true\" validType=\"length[1,50]\" />* 网店名称</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">商店网址：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" name=\"url\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['url']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" required=\"true\"  />* 网站完整的URL访问地址</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">商店LOGO：</td>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t<img id=\"logo\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['url']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/resource/front/");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['theme']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/images/logo.gif\" onload=\"if(this.height>50)this.height=50\" height=\"50\"/>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t<input type=\"file\" value=\"上传\" class=\"text\" size=\"30\" name=\"logo\" />\r\n");
      out.write("\t\t\t直接从本地上传图片覆盖原有的网站logo</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">联系人：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['master']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"master\" required=\"true\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">QQ：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['qq']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"qq\" required=\"true\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">Email：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['email']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"email\" required=\"true\" validType=\"email\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">手机：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['mobile']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"mobile\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">固定电话：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['phone']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"phone\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">具体地址：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['address']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"address\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">商品货号前缀：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['goods_no_pre']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"goods_no_pre\" required=\"true\"/>只取前两位</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">首页TITLE前缀：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['index_seo_title']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"index_seo_title\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">首页关键字：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['index_seo_keywords']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"index_seo_keywords\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"edittd\">首页描述：</td>\r\n");
      out.write("\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${system_config['index_seo_description']}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"index_seo_description\" required=\"true\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td></td>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t<a href=\"javascript:config_basic_submit()\" class=\"easyui-linkbutton\" >保存基本配置</a></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div title=\"导航设置\" class=\"p10\">\r\n");
      out.write("\t\t\t<div class=\"hidden\">\r\n");
      out.write("\t\t\t\t<div id=\"config_guide\" class=\"easyui-window\" ");
      out.print(win_topbar );
      out.write(" title=\"添加导航\">  \r\n");
      out.write("\t\t\t\t\t<div region=\"center\"  border=\"false\" class=\"bdcenter\">\r\n");
      out.write("\t\t\t\t\t\t\t<form method=\"post\" id=\"form_config_guide\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"action\" /> <input type=\"hidden\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tname=\"order\"  />\r\n");
      out.write("\t\t\t\t\t\t\t\t<table class=\"tab_form\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td class=\"edittd\">名称：</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tname=\"name\"  required=\"true\" validType=\"length[1,50]\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td class=\"edittd\">链接地址：</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tname=\"link\" required=\"true\" validType=\"length[1,100]\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div region=\"south\" class=\"btnbar\" border=\"false\">\r\n");
      out.write("\t\t\t\t\t\t\t<a class=\"easyui-linkbutton\" iconCls=\"icon-ok\"\r\n");
      out.write("\t\t\t\t\t\t\t\thref=\"javascript:void(0)\" onclick=\"config_guide()\">编辑</a> <a\r\n");
      out.write("\t\t\t\t\t\t\t\tclass=\"easyui-linkbutton\" iconCls=\"icon-cancel\"\r\n");
      out.write("\t\t\t\t\t\t\t\thref=\"javascript:void(0)\" onclick=\"closeWin('config_guide')\">取消</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write(" \t\t\t\t</div>  \r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<table id=\"guidelist\" title=\"导航列表\" fit=\"true\"></table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div title=\"首页幻灯设置\" class=\"p10\">\r\n");
      out.write("\t\t\t<div class=\"hidden\">\r\n");
      out.write("\t\t\t\t<div id=\"wind_config_indexSlide\" class=\"easyui-window\" ");
      out.print(win_topbar );
      out.write("  title=\"添加幻灯\">\r\n");
      out.write("\t\t\t\t\t<div region=\"center\"  border=\"false\" class=\"bdcenter\">\r\n");
      out.write("\t\t\t\t\t\t\t<form method=\"post\" id=\"form_config_indexSlide\" enctype=\"multipart/form-data\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"action\" /> \r\n");
      out.write("\t\t\t\t\t\t\t\t<table class=\"tab_form\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td class=\"edittd\">名称：</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tname=\"name\"  required=\"true\" validType=\"length[1,50]\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td class=\"edittd\">链接地址：</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tname=\"link\" required=\"true\" validType=\"length[1,100]\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td class=\"edittd\">图片：</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><input type=\"file\" value=\"上传\" class=\"text\" size=\"30\" name=\"imgFile\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div region=\"south\" class=\"btnbar\" border=\"false\">\r\n");
      out.write("\t\t\t\t\t\t\t<a class=\"easyui-linkbutton\" iconCls=\"icon-ok\"\r\n");
      out.write("\t\t\t\t\t\t\t\thref=\"javascript:void(0)\" onclick=\"formsubmit('form_config_indexSlide')\">编辑</a> <a\r\n");
      out.write("\t\t\t\t\t\t\t\tclass=\"easyui-linkbutton\" iconCls=\"icon-cancel\"\r\n");
      out.write("\t\t\t\t\t\t\t\thref=\"javascript:void(0)\" onclick=\"closeWin('wind_config_indexSlide')\">取消</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<table id=\"config_indexSlide\" title=\"首页幻灯列表\" fit=\"true\"></table>\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div title=\"站点底部信息\" class=\"p10\">\r\n");
      out.write("\t\t\t<iframe src=\"admin/config/config_footer\" frameborder=\"0\"  width=\"100%\" height=\"600\"  ></iframe>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div title=\"购物设置\" class=\"p10\">\r\n");
      out.write("\t\t\t<table class=\"tab_form\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"edittd\">税率：</td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" /></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"edittd\">默认备货时间：</td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />天 &nbsp;&nbsp;*订单确认后需要备货的时间</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"edittd\">团购过期时间：</td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />分钟 &nbsp;&nbsp;*报名参加团购后多长时间不付款则视为过期，默认为60分钟</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:config_basic_submit()\" class=\"easyui-linkbutton\" >保存购物设置</a></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div title=\"显示设置\" class=\"p10\">\r\n");
      out.write("\t\t\t<table class=\"tab_form\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">默认的排序依据：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />* 在商品列表页中商品的排序依据条件</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">默认的排序方式： \t</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />* 在商品列表页中商品的排序方式</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">列表默认展示方式：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />* 在商品列表页中商品的展示样式</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">列表展示商品数量：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />* 在商品列表页中商品的展示数量</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">智能提示开启字数：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />当输入若干个字符后，会出现智能提示信息</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"javascript:config_basic_submit()\" class=\"easyui-linkbutton\" >保存显示设置</a></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div title=\"图片设置\" class=\"p10\">\r\n");
      out.write("\t\t\t<table class=\"tab_form\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">列表页缩略图：</td>\r\n");
      out.write("\t\t\t\t\t\t<td>宽：<input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />* 在商品列表页中商品的排序依据条件</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\"></td>\r\n");
      out.write("\t\t\t\t\t\t<td>高：<input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />* 在商品列表页中商品的排序依据条件</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">详细页缩略图：</td>\r\n");
      out.write("\t\t\t\t\t\t<td>宽：<input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />* 在商品列表页中商品的排序依据条件</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\"></td>\r\n");
      out.write("\t\t\t\t\t\t<td>高：<input type=\"text\" class=\"text easyui-validatebox\" name=\"name\"  required=\"true\" validType=\"length[1,50]\" />* 在商品列表页中商品的排序依据条件</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"javascript:config_basic_submit()\" class=\"easyui-linkbutton\" >保存图片设置</a></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div title=\"邮箱设置\" class=\"p10\">\r\n");
      out.write("\t\t\t<table class=\"tab_form\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">发送Email方式：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"radio\" name=\"type\"/>第三方SMTP方式&nbsp;&nbsp;<input type=\"radio\" name=\"type\"/>本地mail邮箱&nbsp;&nbsp;* 如果本地已经搭建好邮件服务，请选择 \"本地mail邮箱\"，否则选择\" 第三方SMTP方式 \"来发送邮件</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">发送邮件的地址：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"  required=\"true\" validType=\"length[1,50]\" />* 发送邮件所使用的email地址，邮件内容中的收件人信息就是显示此信息</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">SMTP地址：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"  required=\"true\" validType=\"length[1,50]\" />第三方的SMTP的URL地址</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">用户名：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"  required=\"true\" validType=\"length[1,50]\" />SMTP用户名</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">密码：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"  required=\"true\" validType=\"length[1,50]\" />SMTP密码</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">端口号：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"  required=\"true\" validType=\"length[1,50]\" />SMTP端口号(默认：25)</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"edittd\">测试邮件地址：</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" class=\"text easyui-validatebox\"  required=\"true\" validType=\"length[1,50]\" />用于测试邮件发送的功能【可选】</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"javascript:config_basic_submit()\" class=\"easyui-linkbutton\" >保存邮箱设置</a></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div title=\"系统设置\" class=\"p10\">\r\n");
      out.write("\t\t\t<table class=\"tab_form\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"edittd\">清理缓存：</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><a href=\"\" class=\"easyui-linkbutton\" >开始清理</a>&nbsp;&nbsp;清理系统编译生成的缓存文件</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
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
