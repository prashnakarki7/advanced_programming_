package com.advance_programming.filter;

import com.advance_programming.utils.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * AdminFilter - Intercepts all requests to admin pages and enforces that only
 * accounts with an "admin" session attribute may proceed.
 *
 * Protected URL patterns: /admin/*
 *
 * Logic:
 *   1. Admin session attribute present  → allow through.
 *   2. Regular user session present     → send to /home (access denied).
 *   3. No session at all                → redirect to /login.
 */
@WebFilter(filterName = "AdminFilter", urlPatterns = { "/admin/*" })
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Nothing to initialise
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest  req = (HttpServletRequest)  request;
        HttpServletResponse res = (HttpServletResponse) response;

        if (SessionUtil.isAdminLoggedIn(req)) {
            // Authenticated admin – continue to the requested resource
            chain.doFilter(request, response);

        } else if (SessionUtil.isUserLoggedIn(req)) {
            // Logged-in but not an admin – redirect to home (access denied)
            res.sendRedirect(req.getContextPath() + "/home");

        } else {
            // No session at all – go to login
            res.sendRedirect(req.getContextPath() + "/login");
        }
    }

    @Override
    public void destroy() {
        // Nothing to clean up
    }
}
