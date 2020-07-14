/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import dto.OrderDetailDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

/**
 *
 * @author se130
 */
public class OrderDetailDAO {
    private Connection conn;
    private PreparedStatement pstm;

    public void insert(OrderDetailDTO dto) throws SQLException, ClassNotFoundException {
        try {
            conn = util.DBUtil.getConnection();
            String sql = "Insert into tblOrderDetails(orderID,bookID,quantity,orderDate,payDate,price) values(?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, dto.getOrderID());
            pstm.setString(2, dto.getBookID());
            pstm.setInt(3, dto.getQuantity());
            pstm.setString(4, dto.getOrderDate());
            pstm.setString(5, dto.getPayDate());
            pstm.setFloat(6, dto.getPrice());
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
}
