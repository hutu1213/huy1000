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
public class UserErrorDTO {

    private String userIDErr, fullNameErr, addressErr, emailErr, passwordErr,rePasswordErr,phoneErr;


    public UserErrorDTO() {
    }

    public UserErrorDTO(String userIDErr, String fullNameErr, String addressErr, String emailErr, String passwordErr, String rePasswordErr, String phoneErr) {
        this.userIDErr = userIDErr;
        this.fullNameErr = fullNameErr;
        this.addressErr = addressErr;
        this.emailErr = emailErr;
        this.passwordErr = passwordErr;
        this.rePasswordErr = rePasswordErr;
        this.phoneErr = phoneErr;
    }

    public String getUserIDErr() {
        return userIDErr;
    }

    public void setUserIDErr(String userIDErr) {
        this.userIDErr = userIDErr;
    }

    public String getFullNameErr() {
        return fullNameErr;
    }

    public void setFullNameErr(String fullNameErr) {
        this.fullNameErr = fullNameErr;
    }

    public String getAddressErr() {
        return addressErr;
    }

    public void setAddressErr(String addressErr) {
        this.addressErr = addressErr;
    }

    public String getEmailErr() {
        return emailErr;
    }

    public void setEmailErr(String emailErr) {
        this.emailErr = emailErr;
    }

    public String getPasswordErr() {
        return passwordErr;
    }

    public void setPasswordErr(String passwordErr) {
        this.passwordErr = passwordErr;
    }

    public String getRePasswordErr() {
        return rePasswordErr;
    }

    public void setRePasswordErr(String rePasswordErr) {
        this.rePasswordErr = rePasswordErr;
    }

    public String getPhoneErr() {
        return phoneErr;
    }

    public void setPhoneErr(String phoneErr) {
        this.phoneErr = phoneErr;
    }

   
}
