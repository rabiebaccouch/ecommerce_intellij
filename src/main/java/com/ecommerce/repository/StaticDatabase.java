package com.ecommerce.repository;

import com.ecommerce.model.*;
import java.util.*;

public class StaticDatabase {
    // In-memory storage
    private static List<User> users = new ArrayList<>();
    private static List<Product> products = new ArrayList<>();
    private static List<Category> categories = new ArrayList<>();
    private static List<Promotion> promotions = new ArrayList<>();
    private static Map<String, List<CartItem>> userCarts = new HashMap<>();

    // ID counters
    private static int userIdCounter = 1;
    private static int productIdCounter = 1;
    private static int categoryIdCounter = 1;
    private static int promotionIdCounter = 1;

    // Static initialization block
    static {
        initializeData();
    }

    private static void initializeData() {
        // Call DatabaseInitializer to populate with sample data
        DatabaseInitializer.initialize();

        // Load data from DatabaseInitializer
        loadInitializedData();
    }

    private static void loadInitializedData() {
        // This method ensures our counters are synchronized with initialized data
        // In a real app, you'd load from a persistent storage
        // For this static demo, we just ensure IDs are unique

        // Update counters based on initialized data
        if (!users.isEmpty()) {
            userIdCounter = users.stream().mapToInt(User::getId).max().orElse(0) + 1;
        }

        if (!products.isEmpty()) {
            productIdCounter = products.stream().mapToInt(Product::getId).max().orElse(0) + 1;
        }

        if (!categories.isEmpty()) {
            categoryIdCounter = categories.stream().mapToInt(Category::getId).max().orElse(0) + 1;
        }

        if (!promotions.isEmpty()) {
            promotionIdCounter = promotions.stream().mapToInt(Promotion::getId).max().orElse(0) + 1;
        }
    }

    // User methods
    public static User findUserByUsername(String username) {
        return users.stream()
                .filter(u -> u.getUsername().equals(username))
                .findFirst()
                .orElse(null);
    }

    public static User findUserByEmail(String email) {
        return users.stream()
                .filter(u -> u.getEmail().equals(email))
                .findFirst()
                .orElse(null);
    }

    public static void addUser(User user) {
        if (user.getId() == 0) {
            user.setId(userIdCounter++);
        }
        users.add(user);
    }

    public static List<User> getAllUsers() {
        return new ArrayList<>(users);
    }

    // Product methods
    public static List<Product> getAllProducts() {
        return new ArrayList<>(products);
    }

    public static Product getProductById(int id) {
        return products.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .orElse(null);
    }

    public static void addProduct(Product product) {
        if (product.getId() == 0) {
            product.setId(productIdCounter++);
        }
        products.add(product);
    }

    public static void updateProduct(Product product) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == product.getId()) {
                products.set(i, product);
                break;
            }
        }
    }

    public static void deleteProduct(int id) {
        products.removeIf(p -> p.getId() == id);
    }

    public static List<Product> getProductsByCategory(int categoryId) {
        return products.stream()
                .filter(p -> p.getCategoryId() == categoryId)
                .toList();
    }

    public static List<Product> searchProducts(String keyword) {
        return products.stream()
                .filter(p -> p.getName().toLowerCase().contains(keyword.toLowerCase()) ||
                        p.getDescription().toLowerCase().contains(keyword.toLowerCase()))
                .toList();
    }

    // Category methods
    public static List<Category> getAllCategories() {
        return new ArrayList<>(categories);
    }

    public static Category getCategoryById(int id) {
        return categories.stream()
                .filter(c -> c.getId() == id)
                .findFirst()
                .orElse(null);
    }

    public static void addCategory(Category category) {
        if (category.getId() == 0) {
            category.setId(categoryIdCounter++);
        }
        categories.add(category);
    }

    public static void updateCategory(Category category) {
        for (int i = 0; i < categories.size(); i++) {
            if (categories.get(i).getId() == category.getId()) {
                categories.set(i, category);
                break;
            }
        }
    }

    public static void deleteCategory(int id) {
        categories.removeIf(c -> c.getId() == id);
    }

    // Promotion methods
    public static List<Promotion> getAllPromotions() {
        return new ArrayList<>(promotions);
    }

    public static Promotion getPromotionById(int id) {
        return promotions.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .orElse(null);
    }

    public static void addPromotion(Promotion promotion) {
        if (promotion.getId() == 0) {
            promotion.setId(promotionIdCounter++);
        }
        promotions.add(promotion);
    }

    public static void updatePromotion(Promotion promotion) {
        for (int i = 0; i < promotions.size(); i++) {
            if (promotions.get(i).getId() == promotion.getId()) {
                promotions.set(i, promotion);
                break;
            }
        }
    }

    public static void deletePromotion(int id) {
        promotions.removeIf(p -> p.getId() == id);
    }

    public static List<Promotion> getActivePromotions() {
        Date now = new Date();
        return promotions.stream()
                .filter(p -> p.isActive() &&
                        p.getStartDate().before(now) &&
                        p.getEndDate().after(now))
                .toList();
    }

    // Cart methods
    public static List<CartItem> getUserCart(String username) {
        return userCarts.getOrDefault(username, new ArrayList<>());
    }

    public static void addToCart(String username, Product product, int quantity) {
        List<CartItem> cart = userCarts.getOrDefault(username, new ArrayList<>());

        // Check if product already in cart
        boolean found = false;
        for (CartItem item : cart) {
            if (item.getProduct().getId() == product.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                found = true;
                break;
            }
        }

        // If not found, add new item
        if (!found) {
            cart.add(new CartItem(product, quantity));
        }

        userCarts.put(username, cart);
    }

    public static void removeFromCart(String username, int productId) {
        List<CartItem> cart = userCarts.get(username);
        if (cart != null) {
            cart.removeIf(item -> item.getProduct().getId() == productId);
        }
    }

    public static void updateCartItem(String username, int productId, int quantity) {
        List<CartItem> cart = userCarts.get(username);
        if (cart != null) {
            for (CartItem item : cart) {
                if (item.getProduct().getId() == productId) {
                    item.setQuantity(quantity);
                    break;
                }
            }
        }
    }

    public static void clearCart(String username) {
        userCarts.remove(username);
    }

    public static double getCartTotal(String username) {
        List<CartItem> cart = getUserCart(username);
        return cart.stream()
                .mapToDouble(CartItem::getTotalPrice)
                .sum();
    }

    public static int getCartItemCount(String username) {
        List<CartItem> cart = getUserCart(username);
        return cart.stream()
                .mapToInt(CartItem::getQuantity)
                .sum();
    }

    // Statistics methods
    public static Map<String, Object> getDashboardStats() {
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalUsers", users.size());
        stats.put("totalProducts", products.size());
        stats.put("totalCategories", categories.size());
        stats.put("totalPromotions", promotions.size());
        stats.put("totalCarts", userCarts.size());

        // Calculate total inventory value
        double inventoryValue = products.stream()
                .mapToDouble(p -> p.getPrice() * p.getStock())
                .sum();
        stats.put("inventoryValue", inventoryValue);

        return stats;
    }

    // Reset method for testing
    public static void resetDatabase() {
        users.clear();
        products.clear();
        categories.clear();
        promotions.clear();
        userCarts.clear();

        userIdCounter = 1;
        productIdCounter = 1;
        categoryIdCounter = 1;
        promotionIdCounter = 1;

        // Re-initialize
        DatabaseInitializer.initialize();
        loadInitializedData();
    }

    // Utility method to get database status
    public static String getDatabaseStatus() {
        return String.format(
                "Database Status:\n" +
                        "- Users: %d\n" +
                        "- Products: %d\n" +
                        "- Categories: %d\n" +
                        "- Promotions: %d\n" +
                        "- Active Carts: %d",
                users.size(), products.size(), categories.size(), promotions.size(), userCarts.size()
        );
    }
}