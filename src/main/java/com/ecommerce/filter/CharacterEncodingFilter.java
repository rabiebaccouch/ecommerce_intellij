package com.ecommerce.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class CharacterEncodingFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String path = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();

        // Remove context path if present
        if (contextPath != null && !contextPath.isEmpty() && path.startsWith(contextPath)) {
            path = path.substring(contextPath.length());
        }

        // Check if this is a static resource request
        if (isStaticResource(path)) {
            // Skip character encoding for static resources
            chain.doFilter(request, response);
            return;
        }

        // Apply character encoding for dynamic content (JSPs, servlets)
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }

    private boolean isStaticResource(String path) {
        if (path == null || path.isEmpty()) {
            return false;
        }

        // Check for static resource directories
        if (path.startsWith("/assets/") ||
                path.startsWith("/shared/") ||
                path.startsWith("/images/") ||
                path.startsWith("/css/") ||
                path.startsWith("/js/") ||
                path.startsWith("/img/") ||
                path.startsWith("/libraries/") ||
                path.startsWith("/webjars/") ||
                path.startsWith("/resources/")) {
            return true;
        }

        // Check for static resource file extensions
        String lowerPath = path.toLowerCase();
        return lowerPath.endsWith(".css") ||
                lowerPath.endsWith(".js") ||
                lowerPath.endsWith(".png") ||
                lowerPath.endsWith(".jpg") ||
                lowerPath.endsWith(".jpeg") ||
                lowerPath.endsWith(".gif") ||
                lowerPath.endsWith(".ico") ||
                lowerPath.endsWith(".svg") ||
                lowerPath.endsWith(".woff") ||
                lowerPath.endsWith(".woff2") ||
                lowerPath.endsWith(".ttf") ||
                lowerPath.endsWith(".eot") ||
                lowerPath.endsWith(".mp4") ||
                lowerPath.endsWith(".webm") ||
                lowerPath.endsWith(".mp3") ||
                lowerPath.endsWith(".wav") ||
                lowerPath.endsWith(".pdf") ||
                lowerPath.endsWith(".zip") ||
                lowerPath.endsWith(".rar") ||
                lowerPath.endsWith(".txt") ||
                lowerPath.endsWith(".xml") ||
                lowerPath.endsWith(".json");
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}