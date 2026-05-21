package com.advance_programming.filter;

import com.advance_programming.utils.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;


@WebFilter(
    filterName = "AuthenticationFilter",
    urlPatterns = {
        "/profile",
        "/cart",
        "/checkout",
        "/order",
        "/wishlist"
    }
)
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest  req = (HttpServletRequest)  request;
        HttpServletResponse res = (HttpServletResponse) response;

        boolean loggedIn = SessionUtil.isUserLoggedIn(req)
                        || SessionUtil.isAdminLoggedIn(req);

        if (loggedIn) {
            // Authenticated – let the request through
            chain.doFilter(request, response);
        } else {
            // Not logged in – capture the full requested path + query string
            // so we can send the user back after login.
            String requestedPath = req.getRequestURI();
            String query         = req.getQueryString();
            String fullPath      = (query != null) ? requestedPath + "?" + query : requestedPath;

            String encodedNext = URLEncoder.encode(fullPath, StandardCharsets.UTF_8);
            res.sendRedirect(req.getContextPath() + "/login?next=" + encodedNext);
        }
    }

    @Override
    public void destroy() {
        // Nothing to clean up
    }
}
