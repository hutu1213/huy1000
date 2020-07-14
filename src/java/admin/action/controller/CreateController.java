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
public class CreateController extends HttpServlet {

    private static final String SUCCESS = "adminOptions.jsp";
    private static final String ERROR = "createBook.jsp";

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
        ErrorBookDTO errorDTO = new ErrorBookDTO();
        String url = ERROR;
        try {
            String bookID = request.getParameter("txtBookID");
            String bookName = request.getParameter("txtBookName");
            String authorName = request.getParameter("txtAuthorName");
            String caID = request.getParameter("txtCaID");
            CategoryDAO caDAO = new CategoryDAO();
            List<CategoryDTO> listCategory = caDAO.getListCategory();

            CategoryDTO caDTO = caDAO.getCategoryByName(caID);

            String phID = request.getParameter("txtPublishingHouse");
            int publishingYear = Integer.valueOf(request.getParameter("txtPublishingYear"));
            int quantity = Integer.valueOf(request.getParameter("txtQuantity"));
            float price = Float.valueOf(request.getParameter("txtPrice"));

            BookDAO dao = new BookDAO();
            boolean check = true;
            if (bookName.length() > 30) {
                errorDTO.setErrBookName("Book name < 30");
                check = false;
            }
            if (authorName.length() > 30) {
                errorDTO.setErrAuthorID("AuthorName < 30");
                check = false;
            }
            if (phID.length() > 30) {
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

            if (dao.checkID(bookID) == true) {
                errorDTO.setErrBookID("ID is exits");
                check = false;
            }
            if (check) {
                BookDTO dto = new BookDTO(bookID, bookName, authorName, caDTO.getCaID(), phID, publishingYear, quantity, price);
                dao.insert(dto);
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR", errorDTO);
                request.setAttribute("LIST_CATEGORY", listCategory);
                url = ERROR;
            }

        } catch (Exception e) {
            log("Error at CreateController: " + e.getMessage());
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
