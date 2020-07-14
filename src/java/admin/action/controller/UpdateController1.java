/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.action.controller;

import dao.BookDAO;
import dao.CategoryDAO;
import dto.BookDTO;
import dto.CategoryDTO;
import dto.ErrorBookDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author se130
 */
public class UpdateController1 extends HttpServlet {

    private static final String ERROR = "update.jsp";
    private static final String SUCCESS = "SearchController";

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
        ErrorBookDTO errorDTO = new ErrorBookDTO();
        try {
            String bookID = request.getParameter("txtId");
            String bookName = request.getParameter("txtBookName");
            String authorName = request.getParameter("txtAuthorName");
            String caName = request.getParameter("txtCaID");
            CategoryDAO caDAO = new CategoryDAO();
             List<CategoryDTO> listCategory = caDAO.getListCategory();
            CategoryDTO cadto = caDAO.getCategoryByName(caName);
            String phName = request.getParameter("txtPhID");
            int publishingYear = Integer.valueOf(request.getParameter("txtPublishingYear"));
            int quantity = Integer.valueOf(request.getParameter("txtQuantity"));
            float price = Float.valueOf(request.getParameter("txtPrice"));

            boolean check = true;

            if (bookName.length() > 30) {
                errorDTO.setErrBookName("Book name < 30");
                check = false;
            }
            if (authorName.length() > 30) {
                errorDTO.setErrAuthorID("AuthorName < 30");
                check = false;
            }
            if (phName.length() > 30) {
                errorDTO.setErrPhID("pusling house muse < 30");
                check = false;
            }

            if (publishingYear <= 0) {
                errorDTO.setErrPublishingYear("PublishingYear must > 0");
                check = false;
            }
            if (quantity <= 0) {
                errorDTO.setErrQuantity("Quantity must > 0");
                check = false;
            }
            if (price <= 0) {
                errorDTO.setErrPrice("Price must > 0");
                check = false;
            }
         
            if (check) {
                BookDTO dto = new BookDTO(bookID, bookName, authorName, cadto.getCaID(), phName, publishingYear, quantity, price);
                BookDAO dao = new BookDAO();
                dao.updateBook(dto);
                url = SUCCESS;
            } else {
                url = ERROR;
                request.setAttribute("ERROR", errorDTO);
                 request.setAttribute("LIST_CATEGORY_UPDATE", listCategory);
            }
        } catch (Exception e) {
            log("Error at UpdateController: " + e.getMessage());
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
