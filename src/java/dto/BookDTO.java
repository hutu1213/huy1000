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
public class BookDTO {
    private String bookID, bookName, authorName, caID, publishingHouse;
    private int publishingYear, quantity;
    private float price;

    public BookDTO() {
    }

    public BookDTO(String bookID, String bookName, String authorName, String caID, String publishingHouse, int publishingYear, int quantity, float price) {
        this.bookID = bookID;
        this.bookName = bookName;
        this.authorName = authorName;
        this.caID = caID;
        this.publishingHouse = publishingHouse;
        this.publishingYear = publishingYear;
        this.quantity = quantity;
        this.price = price;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getCaID() {
        return caID;
    }

    public void setCaID(String caID) {
        this.caID = caID;
    }

    public String getPublishingHouse() {
        return publishingHouse;
    }

    public void setPublishingHouse(String publishingHouse) {
        this.publishingHouse = publishingHouse;
    }

    public int getPublishingYear() {
        return publishingYear;
    }

    public void setPublishingYear(int publishingYear) {
        this.publishingYear = publishingYear;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    

}
