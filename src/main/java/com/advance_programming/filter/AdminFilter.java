package com.advance_programming.filter;

import com.advance_programming.utils.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebFilter(filterName = "AdminFilter", urlPatterns = {
    "/manageuser", "/manageorder", "/manageproduct",
    "/AddProduct", "/editProduct", "/dashboard"
})
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest  req = (HttpServletRequest)  request;
        HttpServletResponse res = (HttpServletResponse) response;

        if (SessionUtil.isAdminLoggedIn(req)) {
            chain.doFilter(request, response);
        } else if (SessionUtil.isUserLoggedIn(req)) {
            res.sendRedirect(req.getContextPath() + "/home?error=access_denied");
        } else {
            res.sendRedirect(req.getContextPath() + "/login");
        }
    }

    @Override
    public void destroy() {}
}