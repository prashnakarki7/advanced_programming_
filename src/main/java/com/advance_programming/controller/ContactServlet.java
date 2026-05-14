package com.advance_programming.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ContactServlet() {
        super();
    }

    /**
     * Handles displaying the Contact Form
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder htmlBuilder = new StringBuilder();

        htmlBuilder.append("<div class='contact-container' style='padding: 20px; max-width: 500px; margin: auto;'>");
        htmlBuilder.append("  <h2>Contact Us</h2>");
        htmlBuilder.append("  <form action='contact' method='post'>");
        htmlBuilder.append("    <div style='margin-bottom: 10px;'>");
        htmlBuilder.append("      <label>Name:</label><br>");
        htmlBuilder.append("      <input type='text' name='userName' style='width: 100%;' required>");
        htmlBuilder.append("    </div>");
        htmlBuilder.append("    <div style='margin-bottom: 10px;'>");
        htmlBuilder.append("      <label>Email:</label><br>");
        htmlBuilder.append("      <input type='email' name='userEmail' style='width: 100%;' required>");
        htmlBuilder.append("    </div>");
        htmlBuilder.append("    <div style='margin-bottom: 10px;'>");
        htmlBuilder.append("      <label>Message:</label><br>");
        htmlBuilder.append("      <textarea name='userMessage' rows='5' style='width: 100%;' required></textarea>");
        htmlBuilder.append("    </div>");
        htmlBuilder.append("    <button type='submit' style='background: #34495e; color: white; border: none; padding: 10px 20px; cursor: pointer;'>Send Message</button>");
        htmlBuilder.append("  </form>");
        htmlBuilder.append("</div>");

        request.setAttribute("contactHtml", htmlBuilder.toString());
        request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
    }

    /**
     * Handles the form submission
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Capture the data from the form
        String name = request.getParameter("userName");
        String email = request.getParameter("userEmail");
        String message = request.getParameter("userMessage");

        // 2. Process the data (In a real app, you'd send an email or save to a DB)
        System.out.println("Contact Form Submission:");
        System.out.println("From: " + name + " (" + email + ")");
        System.out.println("Message: " + message);

        // 3. Set a success message to display on the page
        String successHtml = "<div style='color: green; text-align: center;'><h3>Thank you, " + name + "! Your message has been sent.</h3></div>";
        request.setAttribute("contactHtml", successHtml);
        
        // Forward back to contact.jsp to show the success message
        request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
    }
} 