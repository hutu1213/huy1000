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
public class ErrorBookDTO {
     private String errBookID, errBookName, errAuthorID, errCaID, errPhID,errPublishingYear, errQuantity,errPrice;
    
    

    public ErrorBookDTO() {
    }

    public ErrorBookDTO(String errBookID, String errBookName, String errAuthorID, String errCaID, String errPhID, String errPublishingYear, String errQuantity, String errPrice) {
        this.errBookID = errBookID;
        this.errBookName = errBookName;
        this.errAuthorID = errAuthorID;
        this.errCaID = errCaID;
        this.errPhID = errPhID;
        this.errPublishingYear = errPublishingYear;
        this.errQuantity = errQuantity;
        this.errPrice = errPrice;
    }

    public String getErrBookID() {
        return errBookID;
    }

    public void setErrBookID(String errBookID) {
        this.errBookID = errBookID;
    }

    public String getErrBookName() {
        return errBookName;
    }

    public void setErrBookName(String errBookName) {
        this.errBookName = errBookName;
    }

    public String getErrAuthorID() {
        return errAuthorID;
    }

    public void setErrAuthorID(String errAuthorID) {
        this.errAuthorID = errAuthorID;
    }

    public String getErrCaID() {
        return errCaID;
    }

    public void setErrCaID(String errCaID) {
        this.errCaID = errCaID;
    }

    public String getErrPhID() {
        return errPhID;
    }

    public void setErrPhID(String errPhID) {
        this.errPhID = errPhID;
    }

    public String getErrPublishingYear() {
        return errPublishingYear;
    }

    public void setErrPublishingYear(String errPublishingYear) {
        this.errPublishingYear = errPublishingYear;
    }

    public String getErrQuantity() {
        return errQuantity;
    }

    public void setErrQuantity(String errQuantity) {
        this.errQuantity = errQuantity;
    }

    public String getErrPrice() {
        return errPrice;
    }

    public void setErrPrice(String errPrice) {
        this.errPrice = errPrice;
    }

   
    
}
