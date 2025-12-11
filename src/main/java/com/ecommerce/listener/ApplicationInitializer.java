package com.ecommerce.listener;

import com.ecommerce.repository.DatabaseInitializer;
import jakarta.servlet.*;

public class ApplicationInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("=== E-Commerce Application Starting ===");

        // Initialize database with sample data
        DatabaseInitializer.initialize();

        System.out.println("=== Database Initialized Successfully ===");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("=== E-Commerce Application Shutting Down ===");
    }
}