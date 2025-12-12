package com.ecommerce.service;

import com.ecommerce.model.Product;
import com.ecommerce.repository.StaticDatabase;
import java.util.List;
import java.util.Comparator;

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

    // New method for sorting products
    public List<Product> sortProducts(List<Product> products, String sortBy) {
        if (products == null || products.isEmpty()) {
            return products;
        }

        return products.stream()
                .sorted(getComparator(sortBy))
                .toList();
    }

    // Helper method to get the appropriate comparator
    private Comparator<Product> getComparator(String sortBy) {
        if (sortBy == null) {
            return Comparator.comparing(Product::getName);
        }

        return switch (sortBy) {
            case "price_asc" -> Comparator.comparing(Product::getPrice);
            case "price_desc" -> Comparator.comparing(Product::getPrice).reversed();
            case "newest" -> Comparator.comparing(Product::getId).reversed(); // Assuming higher ID = newer
            default -> Comparator.comparing(Product::getName); // "name" or default
        };
    }
}