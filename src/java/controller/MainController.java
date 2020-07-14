/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author se130
 */
public class MainController extends HttpServlet {

    private static final String LOGIN = "LoginController";
    private static final String ERROR = "error.jsp";
    private static final String SEARCH = "SearchController";
    private static final String SEARCH_BOOK_USER = "SearchBookByUserController";
    private static final String LOAD_CATEGORY_UPDATE = "LoadCategoryUpdateController";
    private static final String UPDATE = "UpdateController1";
    private static final String DELETE = "DeleteController";
    private static final String CREATE = "CreateController";
    private static final String ADD = "AddController";
    private static final String LOGOUT = "LogoutController";
    private static final String DELETE_BOOK_FROM_CART = "DeleteBookFromCart";
    private static final String UPDATE_BOOK_FROM_CART = "UpdateBookFromCart";
    private static final String USER_MANAGER = "userManager1.jsp";
    private static final String SEARCH_USER = "SearchUser1Controller";
    private static final String UPDATE_USER = "UpdateUserController";
    private static final String DELETE_USER = "DeleteUserController";
 private static final String SHOW_CART = "cart1.jsp";
  private static final String BOOK_MANAGER = "admin1.jsp";
  private static final String LOAD_CATEGORY = "LoadCategoryController";
  private static final String CREATE_USER = "CreateUserController";
    private static final String CHECKOUT = "CheckOutController";
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
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Search")) {
                url = SEARCH;
            } else if (action.equals("Delete")) {
                url = DELETE;
            } else if (action.equals("Update  ")) {
                url = LOAD_CATEGORY_UPDATE;
            } else if (action.equals("Update")) {
                url = UPDATE;
            } else if (action.equals("Create")) {
                url = CREATE;
            } else if (action.equals("AddToCart")) {
                url = ADD;
            } else if (action.equals("DeleteBookFromCart")) {
                url = DELETE_BOOK_FROM_CART;
            } else if (action.equals("UpdateBookFromCart")) {
                url = UPDATE_BOOK_FROM_CART;
            } else if (action.equals("Search_Book")) {
                url = SEARCH_BOOK_USER;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("User Manager")) {
                url = USER_MANAGER;
            } else if (action.equals("Search User")) {
                url = SEARCH_USER;
            } else if (action.equals("Update_User")) {
                url = UPDATE_USER;
            } else if (action.equals("Delete_User")) {
                url = DELETE_USER;
            }else if(action.equals("ShowCart")){
                url = SHOW_CART;
            }else if(action.equals("Book Manager")){
                url = BOOK_MANAGER;
            }else if(action.equals("Create Book")){
                url = LOAD_CATEGORY;
            }else if(action.equals("Create_User")){
                url = CREATE_USER;
            }else if(action.equals("CheckOut")){
                url = CHECKOUT;
            }
            else {
                url = ERROR;
                request.setAttribute("ERROR", "Action invalid !");
            }
        } catch (Exception e) {
            log("Error at Main Controller: " + e.getMessage());
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
