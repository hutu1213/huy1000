/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user.action.controller;

import dao.UserDAO;
import dto.UserDTO;
import dto.UserErrorDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author se130
 */
public class CreateUserController extends HttpServlet {

    private static final String SUCCESS = "index.jsp";
    private static final String ERROR = "createUser.jsp";

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
        UserErrorDTO errorDTO = new UserErrorDTO();
        boolean check = true;
        try {
            String userID = request.getParameter("txtUserID");
            String fullName = request.getParameter("txtFullName");
            String address = request.getParameter("txtAddress");
            String email = request.getParameter("txtEmail");

            String phone =request.getParameter("txtPhone");
            
            String sex = request.getParameter("txtSex");
            String roleId = "R2";
            String passWord = request.getParameter("txtPassword");
            String rePassWord = request.getParameter("txtRePassword");
            if(util.Check.checkPhoneNumber(phone)  == 0){
                errorDTO.setPhoneErr("Phone is 1-15 digits");
                check = false;
            }
            if (util.Check.checkEmail(email) == 0) {
                errorDTO.setEmailErr("Email must follow format abc@xyz.qwe ");
                check = false;
            }
            if (fullName.length() > 30) {
                errorDTO.setFullNameErr("FullName must < 30");
                check = false;
            }
            if (passWord.length() > 20) {
                errorDTO.setPasswordErr("Password not > 20");
                check = false;
            }
            if (!passWord.matches(rePassWord)) {
                errorDTO.setRePasswordErr("RePassword is not matched");
                check = false;
            }

            if (check) {
                UserDAO dao = new UserDAO();
                UserDTO dto = new UserDTO(userID, fullName, address, email, roleId, sex, passWord, phone);
                dao.insertUser(dto);
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR_USER", errorDTO);
            }

        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                errorDTO.setUserIDErr("User ID is eixst ");
                request.setAttribute("ERROR_USER", errorDTO);
            }
            log("Error at CreateUserController: " + e.getMessage());
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
