
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.UserDAO;

public class Logservlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("username");
        int password = Integer.parseInt(request.getParameter("password"));
        String usertype = request.getParameter("usertype");
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        u.setUsertype(usertype);
        UserDAO ud = new UserDAO();
        if(ud.check(u))
        {
            HttpSession session=request.getSession();
            session.setAttribute("user", username);
            session.setMaxInactiveInterval(30*60);
            if(u.getUsertype().equals("Admin"))
            {
                RequestDispatcher rd=request.getRequestDispatcher("admin.html");
                rd.forward(request,response);
            }
            else if(u.getUsertype().equals("Student/Faculty"))
            {
                RequestDispatcher rd=request.getRequestDispatcher("student.html");
                rd.forward(request,response);
            }
            else if(u.getUsertype().equals("Staff"))
            {
                RequestDispatcher rd=request.getRequestDispatcher("staff.html");
                rd.forward(request,response);
            }
        }
        else
        {
           RequestDispatcher rd=request.getRequestDispatcher("login.html");
            rd.forward(request,response); 
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
