package com.ecommerce.service;

import com.ecommerce.model.Product;
import com.ecommerce.repository.StaticDatabase;
import java.util.List;

public class ProductService {

    public List<Product> getAllProducts() {
        return StaticDatabase.getAllProducts();
    }

    public Product getProductById(int id) {
        return StaticDatabase.getProductById(id);
    }

    public List<Product> getProductsByCategory(int categoryId) {
        return StaticDatabase.getProductsByCategory(categoryId);
    }

    public void addProduct(Product product) {
        StaticDatabase.addProduct(product);
    }

    public void updateProduct(Product product) {
        StaticDatabase.updateProduct(product);
    }

    public void deleteProduct(int id) {
        StaticDatabase.deleteProduct(id);
    }

    public List<Product> searchProducts(String keyword) {
        return StaticDatabase.getAllProducts().stream()
                .filter(p -> p.getName().toLowerCase().contains(keyword.toLowerCase()) ||
                        p.getDescription().toLowerCase().contains(keyword.toLowerCase()))
                .toList();
    }
}