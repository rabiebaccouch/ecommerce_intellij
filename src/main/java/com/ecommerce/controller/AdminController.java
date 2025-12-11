package com.ecommerce.controller;

import com.ecommerce.model.*;
import com.ecommerce.service.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminController", urlPatterns = {
        "/admin/dashboard", "/admin/products", "/admin/categories", "/admin/promotions",
        "/admin/product/*", "/admin/category/*", "/admin/promotion/*"
})
public class AdminController extends HttpServlet {

    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();
    private PromotionService promotionService = new PromotionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String path = request.getServletPath();

        switch (path) {
            case "/admin/dashboard":
                showDashboard(request, response);
                break;
            case "/admin/products":
                manageProducts(request, response);
                break;
            case "/admin/categories":
                manageCategories(request, response);
                break;
            case "/admin/promotions":
                managePromotions(request, response);
                break;
            default:
                if (path.startsWith("/admin/product/")) {
                    handleProductAction(request, response);
                } else if (path.startsWith("/admin/category/")) {
                    handleCategoryAction(request, response);
                } else if (path.startsWith("/admin/promotion/")) {
                    handlePromotionAction(request, response);
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String path = request.getServletPath();

        switch (path) {
            case "/admin/products":
                saveProduct(request, response);
                break;
            case "/admin/categories":
                saveCategory(request, response);
                break;
            case "/admin/promotions":
                savePromotion(request, response);
                break;
        }
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productCount = productService.getAllProducts().size();
        int categoryCount = categoryService.getAllCategories().size();
        int promotionCount = promotionService.getAllPromotions().size();

        request.setAttribute("productCount", productCount);
        request.setAttribute("categoryCount", categoryCount);
        request.setAttribute("promotionCount", promotionCount);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin-dashboard.jsp");
        dispatcher.forward(request, response);
    }

    private void manageProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var products = productService.getAllProducts();
        var categories = categoryService.getAllCategories();

        request.setAttribute("products", products);
        request.setAttribute("categories", categories);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin-products.jsp");
        dispatcher.forward(request, response);
    }

    private void manageCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var categories = categoryService.getAllCategories();
        request.setAttribute("categories", categories);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin-categories.jsp");
        dispatcher.forward(request, response);
    }

    private void managePromotions(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var promotions = promotionService.getAllPromotions();
        request.setAttribute("promotions", promotions);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin-promotions.jsp");
        dispatcher.forward(request, response);
    }

    private void handleProductAction(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/admin/products");
            return;
        }

        String[] parts = pathInfo.substring(1).split("/");
        if (parts.length < 2) {
            response.sendRedirect(request.getContextPath() + "/admin/products");
            return;
        }

        String action = parts[0];
        int id = Integer.parseInt(parts[1]);

        if ("delete".equals(action)) {
            productService.deleteProduct(id);
        }

        response.sendRedirect(request.getContextPath() + "/admin/products");
    }

    private void handleCategoryAction(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/admin/categories");
            return;
        }

        String[] parts = pathInfo.substring(1).split("/");
        if (parts.length < 2) {
            response.sendRedirect(request.getContextPath() + "/admin/categories");
            return;
        }

        String action = parts[0];
        int id = Integer.parseInt(parts[1]);

        if ("delete".equals(action)) {
            categoryService.deleteCategory(id);
        }

        response.sendRedirect(request.getContextPath() + "/admin/categories");
    }

    private void handlePromotionAction(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/admin/promotions");
            return;
        }

        String[] parts = pathInfo.substring(1).split("/");
        if (parts.length < 2) {
            response.sendRedirect(request.getContextPath() + "/admin/promotions");
            return;
        }

        String action = parts[0];
        int id = Integer.parseInt(parts[1]);

        if ("delete".equals(action)) {
            promotionService.deletePromotion(id);
        }

        response.sendRedirect(request.getContextPath() + "/admin/promotions");
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        try {
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String imageUrl = request.getParameter("imageUrl");

            Product product;
            if (idStr != null && !idStr.isEmpty()) {
                // Update existing product
                int id = Integer.parseInt(idStr);
                product = productService.getProductById(id);
                product.setName(name);
                product.setDescription(description);
                product.setPrice(price);
                product.setCategoryId(categoryId);
                product.setStock(stock);
                product.setImageUrl(imageUrl);
                productService.updateProduct(product);
            } else {
                // Add new product
                product = new Product(0, name, description, price, categoryId, imageUrl, stock);
                productService.addProduct(product);
            }

            response.sendRedirect(request.getContextPath() + "/admin/products");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void saveCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        try {
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            Category category;
            if (idStr != null && !idStr.isEmpty()) {
                // Update existing category
                int id = Integer.parseInt(idStr);
                category = categoryService.getCategoryById(id);
                category.setName(name);
                category.setDescription(description);
                categoryService.updateCategory(category);
            } else {
                // Add new category
                category = new Category(0, name, description);
                categoryService.addCategory(category);
            }

            response.sendRedirect(request.getContextPath() + "/admin/categories");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void savePromotion(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        try {
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double discount = Double.parseDouble(request.getParameter("discount"));

            // For demo, using current date + 30 days as end date
            java.util.Date startDate = new java.util.Date();
            java.util.Date endDate = new java.util.Date(startDate.getTime() + (30L * 24 * 60 * 60 * 1000));

            Promotion promotion;
            if (idStr != null && !idStr.isEmpty()) {
                // Update existing promotion
                int id = Integer.parseInt(idStr);
                promotion = promotionService.getPromotionById(id);
                promotion.setName(name);
                promotion.setDescription(description);
                promotion.setDiscountPercentage(discount);
                promotion.setStartDate(startDate);
                promotion.setEndDate(endDate);
                promotionService.updatePromotion(promotion);
            } else {
                // Add new promotion
                promotion = new Promotion(0, name, description, discount, startDate, endDate);
                promotionService.addPromotion(promotion);
            }

            response.sendRedirect(request.getContextPath() + "/admin/promotions");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}