/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.RoleDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author se130
 */
public class RoleDAO {

    private Connection conn;
    private PreparedStatement pstm;
    private ResultSet rs;

    public RoleDTO getRoletByID(String roleID) throws SQLException, ClassNotFoundException {
        RoleDTO dto = null;
        try {
            conn = util.DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT roleName FROM tblRole WHERE roleID = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, roleID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    String roleName = rs.getString("roleName");
                    dto = new RoleDTO(roleID, roleName);
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
    public RoleDTO getRoletByName(String roleName) throws SQLException, ClassNotFoundException {
        RoleDTO dto = null;
        try {
            conn = util.DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT roleID FROM tblRole WHERE roleName = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, roleName);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    String roleID = rs.getString("roleID");
                    dto = new RoleDTO(roleID, roleName);
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

}
