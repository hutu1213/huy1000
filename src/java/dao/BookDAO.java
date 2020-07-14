/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.BookDTO;
import dto.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author se130
 */
public class BookDAO {

    private Connection conn;
    private PreparedStatement pstm;
    private ResultSet rs;

    public List<BookDTO> searchBook(String search) throws SQLException, ClassNotFoundException {
        List<BookDTO> listBook = null;
        CategoryDAO caDAO = new CategoryDAO();
        CategoryDTO caDTO;

        try {

            conn = util.DBUtil.getConnection();
            String sql = "Select bookID, bookName,authorName, caID, publishingHouse, publishingYear, quantity, price from tblBook where bookName like ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, "%" + search + "%");
            rs = pstm.executeQuery();
            listBook = new ArrayList<>();
            while (rs.next()) {
                String bookID = rs.getString("bookID");
                String bookName = rs.getString("bookName");
                String authorName = rs.getString("authorName");
                String caID = rs.getString("caID");
                caDTO = caDAO.getCategoryByID(caID);
                String ph = rs.getString("publishingHouse");

                int publishingYear = rs.getInt("publishingYear");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                listBook.add(new BookDTO(bookID, bookName, authorName, caDTO.getCaName(), ph, publishingYear, quantity, price));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listBook;
    }

    public List<BookDTO> getAllBook() throws SQLException, ClassNotFoundException {
        List<BookDTO> listBook = null;
        CategoryDAO caDAO = new CategoryDAO();
        CategoryDTO caDTO;

        try {
            conn = util.DBUtil.getConnection();
            String sql = "Select bookID, bookName,authorName, caID, publishingHouse, publishingYear, quantity, price from tblBook ";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            listBook = new ArrayList<>();
            while (rs.next()) {
                String bookID = rs.getString("bookID");
                String bookName = rs.getString("bookName");
                String authorName = rs.getString("authorName");
                String caID = rs.getString("caID");
                caDTO = caDAO.getCategoryByID(caID);
                String ph = rs.getString("publishingHouse");
                int publishingYear = rs.getInt("publishingYear");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                listBook.add(new BookDTO(bookID, bookName, authorName, caDTO.getCaName(), ph, publishingYear, quantity, price));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listBook;
    }

    public void deteleBook(String bookID) throws ClassNotFoundException, SQLException {
        try {
            conn = util.DBUtil.getConnection();
            String sql = "Delete from tblBook where bookID = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, bookID);
            pstm.executeUpdate();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

    }

    public void updateBook(BookDTO dto) throws SQLException, ClassNotFoundException {
        try {
            conn = util.DBUtil.getConnection();
            String sql = "Update tblBook SET bookName=?,authorName=?,caID=?,publishingHouse=?, publishingYear=?, quantity=?, price=? where bookID like ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, dto.getBookName());
            pstm.setString(2, dto.getAuthorName());
            pstm.setString(3, dto.getCaID());
            pstm.setString(4, dto.getPublishingHouse());
            pstm.setInt(5, dto.getPublishingYear());
            pstm.setInt(6, dto.getQuantity());
            pstm.setFloat(7, dto.getPrice());
            pstm.setString(8, "%" + dto.getBookID() + "%");
            pstm.executeUpdate();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void insert(BookDTO dto) throws SQLException, ClassNotFoundException {
        try {
            conn = util.DBUtil.getConnection();
            String sql = "Insert into tblBook(bookID,bookName,authorName,caID,publishingHouse,publishingYear,quantity,price) values(?,?,?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, dto.getBookID());
            pstm.setString(2, dto.getBookName());
            pstm.setString(3, dto.getAuthorName());
            pstm.setString(4, dto.getCaID());
            pstm.setString(5, dto.getPublishingHouse());
            pstm.setInt(6, dto.getPublishingYear());
            pstm.setInt(7, dto.getQuantity());
            pstm.setFloat(8, dto.getPrice());
            pstm.executeUpdate();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean checkID(String bookID) throws SQLException, ClassNotFoundException {

        boolean result = false;
        try {
            conn = util.DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT bookName FROM tblBook WHERE bookID=?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, bookID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public int getQuantityBook(String bookID) throws SQLException, ClassNotFoundException {
        int quantity = 0;
        try {
            String sql = "SELECT quantity FROM tblBook WHERE bookID = ?";
            conn = util.DBUtil.getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, bookID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;
    }

    public void updateQuantityBook(String bookID, int orderQuantity) throws SQLException, ClassNotFoundException {
        int quantityUpdate = getQuantityBook(bookID) - orderQuantity;
        try {
            conn = util.DBUtil.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblBook SET quantity = ? WHERE bookID = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, quantityUpdate);
                pstm.setString(2, bookID);
                pstm.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
