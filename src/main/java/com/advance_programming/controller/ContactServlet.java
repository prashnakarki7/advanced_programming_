package com.advance_programming.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String name = request.getParameter("userName");
        String email = request.getParameter("userEmail");
        String subject = request.getParameter("userSubject");
        String message = request.getParameter("userMessage");

        
        request.setAttribute("typedName", name);
        request.setAttribute("typedEmail", email);
        request.setAttribute("typedSubject", subject);
        request.setAttribute("typedMessage", message);

        // 3. Server-Side Data Validation
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Name field cannot be left blank.");
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
            return;
        }

        if (email == null || email.trim().isEmpty() || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            request.setAttribute("errorMessage", "Please provide a valid email address.");
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
            return;
        }

        if (subject == null || subject.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please provide a subject title line.");
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
            return;
        }

        if (message == null || message.trim().isEmpty() || message.trim().length() < 10) {
            request.setAttribute("errorMessage", "Your message body text must be at least 10 characters long.");
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
            return;
        }

        
        name = sanitizeInput(name);
        email = sanitizeInput(email);
        subject = sanitizeInput(subject);
        message = sanitizeInput(message);

        
        System.out.println("Processing Secure Contact Form Submission:");
        System.out.println("Sender: " + name + " (" + email + ")");
        System.out.println("Subject: " + subject);
        System.out.println("Message Content: " + message);

        // 6. Execution Success Workflow
        request.setAttribute("successMessage", "Thank you, " + name + "! Your message has been sent successfully.");
        
        
        request.removeAttribute("typedName");
        request.removeAttribute("typedEmail");
        request.removeAttribute("typedSubject");
        request.removeAttribute("typedMessage");

        request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
    }

    private String sanitizeInput(String input) {
        if (input == null) return "";
        return input.replaceAll("&", "&amp;")
                    .replaceAll("<", "&lt;")
                    .replaceAll(">", "&gt;")
                    .replaceAll("\"", "&quot;")
                    .replaceAll("'", "&#x27;");
    }
}