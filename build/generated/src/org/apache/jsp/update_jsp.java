package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import model.*;
import org.hibernate.*;
import org.hibernate.cfg.*;

public final class update_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 Session session1 = null; 
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\t<meta charset=\"utf-8\">\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <link rel=\"stylesheet\" media=\"screen\" href=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"Admin/css/schedule.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("<title>Schedules</title>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("    .form{\n");
      out.write("        width:600px;\n");
      out.write("        margin: 150px auto;\n");
      out.write("        padding: 10px;\n");
      out.write("    }\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("                <div class=\"sidebar\">\n");
      out.write("                    <div>\n");
      out.write("                        <img src=\"Admin/images/logo.png\" alt=\"Logo\" width=\"200px\" height=\"200px\">\n");
      out.write("                    </div>\n");
      out.write("                    <ul>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"Admin/admin.html\">\n");
      out.write("                                <span><i class=\"fa fa-home\"></i></span>\n");
      out.write("                                <span>HOME</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\">\n");
      out.write("                                <span><i class=\"fa fa-user\"></i></span>\n");
      out.write("                                <span>Profile</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"Admin/search.jsp\">\n");
      out.write("                                <span><i class=\"fa fa-search\"></i></span>\n");
      out.write("                                <span>Search</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"Admin/schedule.jsp\">\n");
      out.write("                                <span><i class=\"fa fa-clock-o\"></i></span>\n");
      out.write("                                <span>Schedule</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"Admin/view.html\">\n");
      out.write("                                <span><i class=\"fa fa-eye\"></i></span>\n");
      out.write("                                <span>ViewAll</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"last\">\n");
      out.write("                            <a href=\"Login/login.html\">\n");
      out.write("                                <span><i class=\"fa fa-sign-out\"></i></span>\n");
      out.write("                                <span>LogOut</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"jumbotron\">\n");
      out.write("                <h1>Add Schedule</h1>\n");
      out.write("                ");

                String str = request.getParameter("id");
                String busno = request.getParameter("busno");
                String pickuppoint = request.getParameter("pickuppoint");
                String arrivaltime = request.getParameter("arrivaltime");
                String droppoint = request.getParameter("droppoint");
                String droptime = request.getParameter("droptime");
                String sub = request.getParameter("s1");
                if(sub!=null){
                    int id = Integer.parseInt(str);
                    try{
                        Configuration cf = new Configuration();
                        cf.configure("cfgPackage/Schedule.cfg.xml");
                        SessionFactory sf = cf.buildSessionFactory();
                        session1 = sf.openSession();
                        Transaction tx = session1.beginTransaction();
                        schedule s = (schedule)session1.get(schedule.class,id);
                        s.setBusno(busno);
                        s.setPickuppoint(pickuppoint);
                        s.setArrivaltime(arrivaltime);
                        s.setDroppoint(droppoint);
                        s.setDroptime(droptime);
                        session1.update(s);
                        response.sendRedirect("Admin/schedule.jsp");
                        tx.commit();
                    } catch(Exception e){
                        System.out.println(e);
                    } finally{
                        session1.close();
                    }
                }
                
      out.write("\n");
      out.write("                <form class=\"form\" name=\"f1\">  \n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <input type=\"hidden\" name=\"id\" value=\"");
      out.print(str);
      out.write("\">\n");
      out.write("                    <input type=\"text\" name=\"busno\" value=\"");
      out.print(busno);
      out.write("\" class=\"form-control\" plcaeholder=\"Enter BusNo\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <input type=\"text\" name=\"pickuppoint\" value=\"");
      out.print(pickuppoint);
      out.write("\" class=\"form-control\" placeholder=\"Enter Pickuppoint\" >\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <input type=\"text\" name=\"arrivaltime\" value=\"");
      out.print(arrivaltime);
      out.write("\" class=\"form-control\" plcaeholder=\"Enter ArrivalTime\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <input type=\"text\" name=\"droppoint\" value=\"");
      out.print(droppoint);
      out.write("\" class=\"form-control\" placeholder=\"Enter DropPoint\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <input type=\"text\" name=\"droptime\" value=\"");
      out.print(droptime);
      out.write("\" class=\"form-control\" placeholder=\"Enter DropTime\">\n");
      out.write("                </div>\n");
      out.write("                <input name=\"s1\" type=\"submit\" class=\"btn btn-block btn-primary btn-lg\" value=\"Update Schedule\">\n");
      out.write("                <a href=\"Admin/schedule.jsp\" class=\"btn btn-block btn-success btn-lg\">Display Schedule</a>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\t<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\n");
      out.write("\t<script src=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js\"></script>\n");
      out.write("    <!--<script src=\"lib/schedule.js\"></script>-->\n");
      out.write("\t<script>\n");
      out.write("\t</script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
