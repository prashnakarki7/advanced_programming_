package com.advance_programming.controller;

import com.advance_programming.service.RegisterService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // 1. Fetch Form data (Ensure names match your register.jsp <input name="...">)
            String firstName = request.getParameter("first_name");
            String lastName  = request.getParameter("last_name");
            String username  = request.getParameter("username");
            String dob       = request.getParameter("dob");
            String gender    = request.getParameter("gender");
            String email     = request.getParameter("email");
            String number    = request.getParameter("number");
            String password  = request.getParameter("password");
            
            // REMOVED: programId parsing logic as it is no longer in the DB/DAO

            // 2. Call service to add user
            RegisterService service = new RegisterService();
            
            // Note: Service now only accepts 8 parameters
            service.addUser(firstName, lastName, username, dob, gender, email, number, password);
            
            // 3. Redirect to login page after successful registration 
            response.sendRedirect(request.getContextPath() + "/login");
            
        } catch (Exception e) {
            // Print to server console for debugging
            e.printStackTrace();
            // Provide a clear error message on the page
            response.getWriter().println("Error during registration: " + e.getMessage());
        }
    }
}