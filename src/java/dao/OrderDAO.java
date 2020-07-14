/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

/**
 *
 * @author se130
 */
public class OrderDAO {

    private Connection conn;
    private PreparedStatement pstm;
   

    public void insert(OrderDTO dto) throws SQLException, ClassNotFoundException {
        try {
            conn = util.DBUtil.getConnection();
            String sql = "Insert into tblOrder(orderID,userID,receiverName,receiverPhone,address) values(?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, dto.getOrderID());
            pstm.setString(2, dto.getUserID());
            pstm.setString(3, dto.getReceiverName());
            pstm.setString(4, dto.getReceiverPhone());
            pstm.setString(5, dto.getAddress());
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
