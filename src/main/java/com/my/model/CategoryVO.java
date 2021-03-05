package com.my.model;

public class CategoryVO {

    private String categoryName;
    private String categoryCode;
    private String categoryCodeRef;
    private int depth;

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }
    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getCategoryCodeRef() {
        return categoryCodeRef;
    }

    public void setCategoryCodeRef(String categoryCodeRef) {
        this.categoryCodeRef = categoryCodeRef;
    }
}
