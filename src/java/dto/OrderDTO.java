/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.UUID;

/**
 *
 * @author se130
 */
public class OrderDTO {

    private String orderID, userID, receiverName, address;
    private String receiverPhone;

    public OrderDTO(String userID, String receiverName, String address, String receiverPhone) {
        UUID randomCode = UUID.randomUUID();
        this.orderID = randomCode.toString();

        this.userID = userID;
        this.receiverName = receiverName;
        this.address = address;
        this.receiverPhone = receiverPhone;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

}
