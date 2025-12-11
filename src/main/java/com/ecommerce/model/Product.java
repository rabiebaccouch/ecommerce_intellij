package com.ecommerce.model;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private int categoryId;
    private String imageUrl;
    private int stock;
    private boolean hasPromotion;
    private double discountPrice;

    public Product() {}

    public Product(int id, String name, String description, double price,
                   int categoryId, String imageUrl, int stock) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
        this.stock = stock;
        this.hasPromotion = false;
        this.discountPrice = price;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }

    public boolean isHasPromotion() { return hasPromotion; }
    public void setHasPromotion(boolean hasPromotion) { this.hasPromotion = hasPromotion; }

    public double getDiscountPrice() { return discountPrice; }
    public void setDiscountPrice(double discountPrice) { this.discountPrice = discountPrice; }

    public double getFinalPrice() {
        return hasPromotion ? discountPrice : price;
    }
}