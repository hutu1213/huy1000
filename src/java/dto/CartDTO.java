/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author se130
 */
public class CartDTO {
    private String customerName;
    private Map<String, BookDTO> cart;

    public CartDTO() {
        
    }

    public CartDTO(String customerName, Map<String, BookDTO> cart) {
        this.customerName = customerName;
        this.cart = cart;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Map<String, BookDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, BookDTO> cart) {
        this.cart = cart;
    }
     public void add(BookDTO dto) {
        if (this.cart == null) {
            cart = new HashMap<>();
        }
        if (this.cart.containsKey(dto.getBookID())) {
            int quantity = cart.get(dto.getBookID()).getQuantity();
            dto.setQuantity(quantity + 1);
        }
        cart.put(dto.getBookID(), dto);
    }

    public void delete(String id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public void update(String id, BookDTO dto) {
        if (cart != null) {
            if (cart.containsKey(id)) {
                this.cart.replace(id, dto);
            }
        }
    }
       public float getTotal() {
        float result = 0;
        for (BookDTO dto : this.cart.values()) {
            result += dto.getPrice() * dto.getQuantity();
        }
        return result;
    }
}
