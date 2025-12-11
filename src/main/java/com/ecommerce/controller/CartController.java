package com.ecommerce.controller;

import com.ecommerce.model.CartItem;
import com.ecommerce.service.CartService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartController", urlPatterns = {
        "/cart", "/cart/add", "/cart/remove", "/cart/update", "/cart/clear", "/checkout"
})
public class CartController extends HttpServlet {

    private CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if ("/cart".equals(path)) {
            showCart(request, response);
        } else if ("/checkout".equals(path)) {
            showCheckout(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String username = (String) session.getAttribute("username");

        switch (path) {
            case "/cart/add":
                addToCart(request, response, username);
                break;

            case "/cart/remove":
                removeFromCart(request, response, username);
                break;

            case "/cart/update":
                updateCart(request, response, username);
                break;

            case "/cart/clear":
                clearCart(request, response, username);
                break;
        }
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String username = (String) session.getAttribute("username");

        List<CartItem> cartItems = cartService.getUserCart(username);
        double total = cartService.getCartTotal(username);

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("total", total);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/cart.jsp");
        dispatcher.forward(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response, String username)
            throws IOException {

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            cartService.addToCart(username, productId, quantity);
            response.sendRedirect(request.getContextPath() + "/cart");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response, String username)
            throws IOException {

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));

            cartService.removeFromCart(username, productId);
            response.sendRedirect(request.getContextPath() + "/cart");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response, String username)
            throws IOException {

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            cartService.updateCartItem(username, productId, quantity);
            response.sendRedirect(request.getContextPath() + "/cart");

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void clearCart(HttpServletRequest request, HttpServletResponse response, String username)
            throws IOException {

        cartService.clearCart(username);
        response.sendRedirect(request.getContextPath() + "/cart");
    }

    private void showCheckout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String username = (String) session.getAttribute("username");

        List<CartItem> cartItems = cartService.getUserCart(username);
        double total = cartService.getCartTotal(username);

        if (cartItems == null || cartItems.size() == 0) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("total", total);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout.jsp");
        dispatcher.forward(request, response);
    }
}
