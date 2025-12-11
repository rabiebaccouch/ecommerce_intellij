package com.ecommerce.util;

public class PasswordUtil {
    // Simple password hashing (for demo purposes)
    // In production, use BCrypt or similar
    public static String hashPassword(String password) {
        return String.valueOf(password.hashCode());
    }

    public static boolean verifyPassword(String password, String hashedPassword) {
        return hashPassword(password).equals(hashedPassword);
    }
}