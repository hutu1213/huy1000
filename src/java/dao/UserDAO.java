/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import dto.RoleDTO;
import dto.UserDTO;
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
public class UserDAO {

    private Connection conn;
    private PreparedStatement pstm;
    private ResultSet rs;

    public UserDTO checkLogin(String userID, String password) throws SQLException, ClassNotFoundException {
        UserDTO dto = null;
        try {
            conn = util.DBUtil.getConnection();
            String sql = "Select fullName,address,email,phone,roleID,sex,password from tblUser where userID=? and password=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, userID);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String roleID = rs.getString("roleID");
                String sex = rs.getString("sex");
                dto = new UserDTO(userID, fullName, address, email, roleID, sex, password, phone);
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

    public List<UserDTO> getListUser(String search) throws SQLException, ClassNotFoundException {
        UserDTO dto;
        List<UserDTO> list = null;
        try {
            conn = util.DBUtil.getConnection();
            String sql = "Select userID,address,email,fullName,phone,roleID,sex,password from tblUser where fullName like ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, "%" + search + "%");
            rs = pstm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String roleID = rs.getString("roleID");
                RoleDAO roleDAO = new RoleDAO();
                RoleDTO roleDTO = roleDAO.getRoletByID(roleID);
                String sex = rs.getString("sex");

                dto = new UserDTO(userID, fullName, address, email, roleDTO.getRoleName(), sex, "***", phone);
                list.add(dto);
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
        return list;
    }

    public void deleteUser(String userID) throws SQLException, ClassNotFoundException {

        try {
            conn = util.DBUtil.getConnection();
            if (conn != null) {
                String sql = "DELETE tblUser WHERE userID=?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, userID);
                pstm.executeUpdate();
            }
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

//    public void updateUser(UserDTO dto) throws SQLException {
//        Connection conn = null;
//        PreparedStatement stm = null;
//        try {
//            conn =  util.DBUtil.getConnection();
//            if (conn != null) {
//                String sql = "UPDATE tblUsers SET fullName = ?, roleID = ? WHERE userID=?";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, dto.getFullname());
//                stm.setString(2, dto.getRoleID());
//                stm.setString(3, dto.getuserID());
//                stm.executeUpdate();
//            }
//        } catch (Exception e) {
//        } finally {
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//    }
    public void insertUser(UserDTO dto) throws SQLException, ClassNotFoundException {

        try {
            conn = util.DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblUser (userID,fullName,address,email,phone,roleID,sex,password) VALUES(?,?,?,?,?,?,?,?)";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, dto.getUserID());
                pstm.setString(2, dto.getFullName());
                pstm.setString(3, dto.getAddress());
                pstm.setString(4, dto.getEmail());
                pstm.setString(5, dto.getPhone());
                pstm.setString(6, dto.getRoleID());
                pstm.setString(7, dto.getSex());
                pstm.setString(8, dto.getPassword());
                pstm.executeUpdate();
            }
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

  
}
