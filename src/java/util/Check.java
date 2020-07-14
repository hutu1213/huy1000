/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author se130
 */
public class Check {

    public static int checkEmail(String email) {
        if (email.matches("\\w{1,10}[@]{1}\\w{1,10}[.]{1}\\w{1,10}")) {
            return 1;
        } else if (email.matches("[!#$]")) {
            return 0;
        }
        return 0;
    }
    public static int checkPhoneNumber(String phone) {
        if (phone.matches("\\d{1,15}")) {
            return 1;
        }
        return 0;

    }
}
