package com.ecommerce.controller;

import com.ecommerce.service.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HomeController", urlPatterns = {"/home", "/"})
public class HomeController extends HttpServlet {

    private ProductService productService = new ProductService();
    private PromotionService promotionService = new PromotionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get products and promotions
        var products = productService.getAllProducts();
        var promotions = promotionService.getActivePromotions();

        // Set attributes
        request.setAttribute("products", products);
        request.setAttribute("promotions", promotions);

        // Forward to home page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);
    }
}