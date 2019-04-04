package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import model.*;
import org.hibernate.*;
import org.hibernate.cfg.*;

public final class schedule_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 int id;String busno;String pickuppoint;String arrivaltime;String droppoint;String droptime;Session session1 = null; 
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("<head>\n");
      out.write("   <title> Contact Us </title>\n");
      out.write("   <link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css\">\n");
      out.write("<script src=\"https://code.jquery.com/jquery-1.12.4.js\"></script>\n");
      out.write("<script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\n");
      out.write("  <style>\n");
      out.write("        body{\n");
      out.write("               margin: 0;\n");
      out.write("               background-image: url(\"images/bus.jpg\");\n");
      out.write("               background-repeat:no-repeat;\n");
      out.write("               background-size: cover;\n");
      out.write("               background-position: center;\n");
      out.write("               opacity: 0.8;\n");
      out.write("               \n");
      out.write("            }\n");
      out.write("        .header{\n");
      out.write("                font-size: 20px;\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-items: center;\n");
      out.write("                color: #66ffff;\n");
      out.write("                text-shadow: 2px 2px 4px #800000;\n");
      out.write("               \n");
      out.write("            }\n");
      out.write("             .btn{\n");
      out.write("           opacity: 0.6;\n");
      out.write("           margin-top: 50px;\n");
      out.write("           width:428px;    \n");
      out.write("           background-color:whitesmoke; \n");
      out.write("           color:#ff3300;\n");
      out.write("           font-size: 20px;\n");
      out.write("           border:none;\n");
      out.write("           padding:10px 5px;\n");
      out.write("           cursor:pointer;\n");
      out.write("           float:left;\n");
      out.write("           } \n");
      out.write("\n");
      out.write("           .btn:hover{\n");
      out.write("               background-color:#ff9900;\n");
      out.write("           }  \n");
      out.write("            .nav{\n");
      out.write("               \n");
      out.write("                 border-radius:40px;\n");
      out.write("                 padding:12px 24px;\n");
      out.write("                 margin-top: 0px;\n");
      out.write("                 display: flex; \n");
      out.write("                 margin-left: 1045px;\n");
      out.write("                 background-color: #990000;\n");
      out.write("                 display: block;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            .nav a{\n");
      out.write("                text-align: right;\n");
      out.write("                text-decoration: none;\n");
      out.write("                 font-size: 15px;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            .nav a:hover{\n");
      out.write("                color: yellow;\n");
      out.write("                background-color: white;\n");
      out.write("            }\n");
      out.write("            .container{\n");
      out.write("                \n");
      out.write("                display: flex;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("           \n");
      out.write("            .right{  \n");
      out.write("            background-image: url(\"images/rt.jpg\");\n");
      out.write("            font-size: 15px;\n");
      out.write("            height:450px;\n");
      out.write("            width:600px;\n");
      out.write("            opacity: 1.0;\n");
      out.write("            margin-left: 350px;\n");
      out.write("            margin-right: 100px;\n");
      out.write("            margin-bottom: 50px;\n");
      out.write("            box-shadow:10px 10px 10px 10px grey;\n");
      out.write("            background-repeat:no-repeat;\n");
      out.write("            background-size: cover;\n");
      out.write("            background-position: center;\n");
      out.write("            border-radius:40px;\n");
      out.write("            padding:12px 64px;\n");
      out.write("            display: block;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btnn{\n");
      out.write("            background-color:dodgerblue;\n");
      out.write("            color:white;\n");
      out.write("            width:200px;\n");
      out.write("            border-radius:40px;\n");
      out.write("            padding:12px 20px;\n");
      out.write("            cursor:pointer;\n");
      out.write("            display:block;\n");
      out.write("           } \n");
      out.write("           .btnn:hover{\n");
      out.write("            transition-duration:1s;\n");
      out.write("            transform:translate(0px,-5px);\n");
      out.write("            box-shadow:0px 10px 30px black;              \n");
      out.write("           }\n");
      out.write("           .table{\n");
      out.write("               margin-left: 0;\n");
      out.write("               color: white;\n");
      out.write("               font-size: 20px; \n");
      out.write("           }\n");
      out.write("   </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    \n");
      out.write("     <div class=\"header\">\n");
      out.write("       <h1>Arriving Time</h1>\n");
      out.write("     </div>\n");
      out.write("       \n");
      out.write("     <div class=\"main\">\n");
      out.write("            <button class=\"btn\" onclick=\"window.location.href='admin.html'\">Home</button>    \n");
      out.write("             <button class=\"btn\" onclick=\"window.location.href='ContactUs.jsp'\">Contact Us</button> \n");
      out.write("            <button class=\"btn\" onclick=\"window.location.href='login.html'\">Log Out</button>   \n");
      out.write("             \n");
      out.write("             <div class=\"container\">\n");
      out.write("              \n");
      out.write("             </div></div>\n");
      out.write("            <div style=\"clear:both;\"></div>\n");
      out.write("        </div>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        \n");
      out.write("        <div class=\"right\">\n");
      out.write("        <br><br><br>\n");
      out.write("       <table align=\"center\" class=\"table\" id=\"table\">\n");
      out.write("                            <form action=\"../delete.jsp\" method=\"post\">\n");
      out.write("                                <thead>\n");
      out.write("                                <th>Id</th>\n");
      out.write("                                <th>Bus No.</th>\n");
      out.write("                                <th>PickUp Point</th>\n");
      out.write("                                <th>Arrival Time</th>\n");
      out.write("                                <th>Drop Point</th>\n");
      out.write("                                <th>Drop Time</th>\n");
      out.write("                                <th>Action</th>\n");
      out.write("                            </thead>\n");
      out.write("                            ");

                            Configuration cf = new Configuration();
                            cf.configure("cfgPackage/Schedule.cfg.xml");
                            SessionFactory sf = cf.buildSessionFactory();
                            session1 = sf.openSession();

                            String sqr = "from schedule";
                            Query qr = session1.createQuery(sqr);
                            Iterator it = qr.iterate();
                            while(it.hasNext()){
                                schedule s = (schedule)it.next();
                                id = s.getId();
                                busno = s.getBusno();
                                pickuppoint = s.getPickuppoint();
                                arrivaltime = s.getArrivaltime();
                                droppoint = s.getDroppoint();
                                droptime = s.getDroptime();
                            
      out.write("\n");
      out.write("                            <tbody>\n");
      out.write("                                <td>");
      out.print(id);
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(busno);
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(pickuppoint);
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(arrivaltime);
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(droppoint);
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(droptime);
      out.write("</td>\n");
      out.write("                                <td> <a href=\"../update.jsp?id=");
      out.print(id);
      out.write("&busno=");
      out.print(busno);
      out.write("&pickuppoint=");
      out.print(pickuppoint);
      out.write("&arrivaltime=");
      out.print(arrivaltime);
      out.write("&droppoint=");
      out.print(droppoint);
      out.write("&droptime=");
      out.print(droptime);
      out.write("\"  class=\"table\">Update</a> \n");
      out.write("                                    <input type=\"checkbox\" class=\"form-control\" value=\"");
      out.print(id);
      out.write("\" name=\"c1\"></td>\n");
      out.write("                            </tbody>\n");
      out.write("                            ");

                            }
                            session1.close();
                            
      out.write("\n");
      out.write("                            \n");
      out.write("                            <tbody>\n");
      out.write("                                \n");
      out.write("                            <td colspan=\"10\" align=\"center\"> <input type=\"submit\" class=\"btnn btnn-hover\" value=\"Delete \"> </td>\n");
      out.write("                            </tbody>\n");
      out.write("                            <tbody>\n");
      out.write("                            <td colspan=\"10\" align=\"center\" width = \"1px\"><a href=\"../schedule.jsp\" class=\"btnn btnn-hover\">Add Schedule</a></td>\n");
      out.write("                            </tbody>\n");
      out.write("                            </form>\n");
      out.write("                            \n");
      out.write("                        </table>\n");
      out.write("                        \n");
      out.write("        </div>\n");
      out.write("        </div>\n");
      out.write("        </div>\n");
      out.write("    </form>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("   \n");
      out.write("</script>\n");
      out.write("    \n");
      out.write("</body>\n");
      out.write("</html>");
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
