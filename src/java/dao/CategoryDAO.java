/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

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
public class CategoryDAO {

    private Connection conn;
    private PreparedStatement pstm;
    private ResultSet rs;

    public CategoryDTO getCategoryByID(String caID) throws SQLException, ClassNotFoundException {
        CategoryDTO dto = null;
        try {
            conn = util.DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT caID, caName FROM tblCategory WHERE caID = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, caID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    String caName = rs.getString("caName");
                    dto = new CategoryDTO(caID, caName);
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
        return dto;
    }

    public CategoryDTO getCategoryByName(String caName) throws SQLException, ClassNotFoundException {
        CategoryDTO dto = null;
        try {
            conn = util.DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT caID, caName FROM tblCategory WHERE caName like ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, "%" + caName + "%");
                rs = pstm.executeQuery();
                if (rs.next()) {
                    //String caID = rs.getString("caID");
                  dto = new CategoryDTO();
                  dto.setCaID(rs.getString("caID"));
                   dto.setCaName(caName);
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
        return dto;
    }
     public List<CategoryDTO> getListCategory() throws SQLException, ClassNotFoundException {
        List<CategoryDTO> listCategory = null;
        CategoryDTO caDTO;
        try {
            conn = util.DBUtil.getConnection();
            String sql = "Select caName, caID from tblCategory";
            pstm = conn.prepareStatement(sql);
            
            rs = pstm.executeQuery();
            listCategory = new ArrayList<>();
            while (rs.next()) {
                caDTO = new CategoryDTO();
                caDTO.setCaID(rs.getString("caID"));
                caDTO.setCaName(rs.getString("caName"));  
                listCategory.add(caDTO);
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
        return listCategory;
    }
}
