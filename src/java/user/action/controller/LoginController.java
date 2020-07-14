/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user.action.controller;

import dao.BookDAO;
import dao.RoleDAO;
import dao.UserDAO;
import dto.BookDTO;
import dto.RoleDTO;
import dto.UserDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author se130
 */
public class LoginController extends HttpServlet {

    private static final String ADMIN = "adminOptions.jsp";
    private static final String ERROR = "error.jsp";
    private static final String USER = "user.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userName = request.getParameter("txtUserName");
            String password = request.getParameter("txtPassword");
            RoleDAO roleDAO = new RoleDAO();
            UserDAO userDAO = new UserDAO();
           
            UserDTO dto = userDAO.checkLogin(userName, password);
            if (dto != null) {
                HttpSession session = request.getSession();
                session.setAttribute("NAME", dto);
                String roleID = dto.getRoleID();
                RoleDTO roleDTO = roleDAO.getRoletByID(roleID);
                String roleName = roleDTO.getRoleName();
                if (roleName.equals("admin")) {
                    url = ADMIN;
                } else if (roleName.equals("user")) {
                    url = USER;
                   
                       
                }
            } else {
                request.setAttribute("ERROR", "Invalid username or password");
                url = ERROR;
            }

        } catch (Exception e) {
            log("Error at LoginControler: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
