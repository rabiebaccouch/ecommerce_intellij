package com.ecommerce.service;

import com.ecommerce.model.CartItem;
import com.ecommerce.repository.StaticDatabase;
import java.util.List;

public class CartService {

    public List<CartItem> getUserCart(String username) {
        return StaticDatabase.getUserCart(username);
    }

    public void addToCart(String username, int productId, int quantity) {
        ProductService productService = new ProductService();
        var product = productService.getProductById(productId);
        if (product != null && product.getStock() >= quantity) {
            StaticDatabase.addToCart(username, product, quantity);
        }
    }

    public void removeFromCart(String username, int productId) {
        StaticDatabase.removeFromCart(username, productId);
    }

    public void updateCartItem(String username, int productId, int quantity) {
        StaticDatabase.updateCartItem(username, productId, quantity);
    }

    public void clearCart(String username) {
        StaticDatabase.clearCart(username);
    }

    public double getCartTotal(String username) {
        return StaticDatabase.getCartTotal(username);
    }

    public int getCartItemCount(String username) {
        return StaticDatabase.getUserCart(username).stream()
                .mapToInt(CartItem::getQuantity)
                .sum();
    }
}