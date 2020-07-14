/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user.action.controller;

import dao.BookDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dto.BookDTO;
import dto.CartDTO;
import dto.OrderDTO;
import dto.OrderDetailDTO;
import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author se130
 */
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "thank.jsp";

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
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            UserDTO userDTO = (UserDTO) session.getAttribute("NAME");

            OrderDTO orderDTO = new OrderDTO(userDTO.getUserID(), userDTO.getFullName(), userDTO.getAddress(), userDTO.getPhone());
            OrderDAO orderDAO = new OrderDAO();
            orderDAO.insert(orderDTO);
            for (String key : cart.getCart().keySet()) {
                BookDTO bookDTO = cart.getCart().get(key);
                OrderDetailDTO orderDetailDTO = new OrderDetailDTO(orderDTO.getOrderID(), bookDTO.getBookID(), bookDTO.getQuantity(), bookDTO.getPrice()*bookDTO.getQuantity());
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                orderDetailDAO.insert(orderDetailDTO);

                BookDAO bookDAO = new BookDAO();
                bookDAO.updateQuantityBook(bookDTO.getBookID(), bookDTO.getQuantity());
            }
            session.setAttribute("CART", null);

            url = SUCCESS;
        } catch (Exception e) {
            log("Error at CheckOutController: "+ e.getMessage());
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
