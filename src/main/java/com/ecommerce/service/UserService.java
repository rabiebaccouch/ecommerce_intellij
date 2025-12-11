package com.ecommerce.service;

import com.ecommerce.model.User;
import com.ecommerce.repository.StaticDatabase;
import com.ecommerce.util.PasswordUtil;

public class UserService {

    public User authenticate(String username, String password) {
        User user = StaticDatabase.findUserByUsername(username);
        if (user != null && PasswordUtil.verifyPassword(password, user.getPassword())) {
            return user;
        }
        return null;
    }

    public boolean register(User user) {
        // Check if username or email already exists
        if (StaticDatabase.findUserByUsername(user.getUsername()) != null) {
            return false;
        }
        if (StaticDatabase.findUserByEmail(user.getEmail()) != null) {
            return false;
        }

        // Hash password
        user.setPassword(PasswordUtil.hashPassword(user.getPassword()));

        // Set default role if not provided
        if (user.getRole() == null) {
            user.setRole("USER");
        }

        StaticDatabase.addUser(user);
        return true;
    }

    public User getUserByUsername(String username) {
        return StaticDatabase.findUserByUsername(username);
    }
}