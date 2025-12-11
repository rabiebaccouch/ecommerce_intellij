package com.ecommerce.controller;

import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;
import com.ecommerce.service.CategoryService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductController", urlPatterns = {
        "/products", "/product/*", "/search"
})
public class ProductController extends HttpServlet {

    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if ("/products".equals(path)) {
            listProducts(request, response);
        } else if (path.startsWith("/product/")) {
            showProductDetails(request, response);
        } else if ("/search".equals(path)) {
            searchProducts(request, response);
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoryIdStr = request.getParameter("category");

        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            int categoryId = Integer.parseInt(categoryIdStr);
            var products = productService.getProductsByCategory(categoryId);
            var category = categoryService.getCategoryById(categoryId);

            request.setAttribute("products", products);
            request.setAttribute("category", category);
        } else {
            var products = productService.getAllProducts();
            request.setAttribute("products", products);
        }

        var categories = categoryService.getAllCategories();
        request.setAttribute("categories", categories);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/products.jsp");
        dispatcher.forward(request, response);
    }

    private void showProductDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        try {
            int productId = Integer.parseInt(pathInfo.substring(1));
            Product product = productService.getProductById(productId);

            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }

            request.setAttribute("product", product);

            // Get related products (same category)
            var relatedProducts = productService.getProductsByCategory(product.getCategoryId())
                    .stream()
                    .filter(p -> p.getId() != productId)
                    .limit(4)
                    .toList();

            request.setAttribute("relatedProducts", relatedProducts);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/product-details.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void searchProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("q");
        if (keyword == null || keyword.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        var products = productService.searchProducts(keyword);
        request.setAttribute("products", products);
        request.setAttribute("searchKeyword", keyword);

        var categories = categoryService.getAllCategories();
        request.setAttribute("categories", categories);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/products.jsp");
        dispatcher.forward(request, response);
    }
}