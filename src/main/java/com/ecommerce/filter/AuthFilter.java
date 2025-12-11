package com.ecommerce.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String contextPath = httpRequest.getContextPath();
        String loginURI = contextPath + "/login";
        String registerURI = contextPath + "/register";

        boolean loggedIn = session != null && session.getAttribute("user") != null;
        boolean adminUser = loggedIn && "ADMIN".equals(session.getAttribute("role"));
        boolean loginRequest = httpRequest.getRequestURI().equals(loginURI) ||
                httpRequest.getRequestURI().equals(registerURI);

        if (loggedIn && adminUser) {
            chain.doFilter(request, response);
        } else if (loginRequest) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(contextPath + "/login");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}