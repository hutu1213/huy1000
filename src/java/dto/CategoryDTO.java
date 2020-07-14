/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author se130
 */
public class CategoryDTO {
    private String caID,caName;

    public CategoryDTO() {
    }

    public CategoryDTO(String caID, String caName) {
        this.caID = caID;
        this.caName = caName;
    }

    public String getCaID() {
        return caID;
    }

    public void setCaID(String caID) {
        this.caID = caID;
    }

    public String getCaName() {
        return caName;
    }

    public void setCaName(String caName) {
        this.caName = caName;
    }

  
}
