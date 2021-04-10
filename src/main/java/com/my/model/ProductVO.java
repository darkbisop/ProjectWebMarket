package com.my.model;

import java.util.Date;
import java.util.List;

public class ProductVO {

    private int productNum;
    private String productName;
    private String categoryCode;
    private String categoryName;
    private String categoryCodeRef;
    private int productPrice;
    private int productStock;
    private String productDescription;
    private String productImage;
    private Date regDate;
    private String productThumbnail;

    private int sale;

    private String productName_ja;
    private int productPrice_ja;
    private String productDescription_ja;

    public int getProductNum() {
        return productNum;
    }
    public void setProductNum(int productNum) {
        this.productNum = productNum;
    }

    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategoryCode() {
        return categoryCode;
    }
    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getCategoryName() {
        return categoryName;
    }
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryCodeRef() {
        return categoryCodeRef;
    }
    public void setCategoryCodeRef(String categoryCodeRef) {
        this.categoryCodeRef = categoryCodeRef;
    }

    public int getProductPrice() {
        return productPrice;
    }
    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductStock() {
        return productStock;
    }
    public void setProductStock(int productStock) {
        this.productStock = productStock;
    }

    public String getProductDescription() {
        return productDescription;
    }
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductImage() { return productImage; }
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public Date getRegDate() {
        return regDate;
    }
    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getProductThumbnail() { return productThumbnail; }
    public void setProductThumbnail(String productThumbnail) { this.productThumbnail = productThumbnail; }

    public int getSale() { return sale; }
    public void setSale(int sale) { this.sale = sale; }

    public String getProductName_ja() { return productName_ja; }
    public void setProductName_ja(String productName_ja) { this.productName_ja = productName_ja; }

    public int getProductPrice_ja() { return productPrice_ja; }
    public void setProductPrice_ja(int productPrice_ja) { this.productPrice_ja = productPrice_ja; }

    public String getProductDescription_ja() { return productDescription_ja; }
    public void setProductDescription_ja(String productDescription_ja) { this.productDescription_ja = productDescription_ja; }
}
