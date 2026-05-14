package com.advance_programming.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.advance_programming.model.UserModel;
import com.advance_programming.DAO.UserDAO; 
import com.advance_programming.utils.FileUploadUtil;
import com.advance_programming.utils.SessionUtil;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException; 
import java.util.Date;

@WebServlet("/profile")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "webapp_uploads";
    private UserDAO UserDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        UserModel student = (UserModel) SessionUtil.getAttribute(request, "user");
        
        if (student == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Fetch data from profile form and store it
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String number = request.getParameter("number");
        
        try {
            // Use studentDAO.updateStudent method to update data in database
            int rowsAffected = UserDAO.updateUser(
                student.getUserId(), 
                firstName, 
                lastName, 
                dob, 
                email, 
                number
            );

            if (rowsAffected > 0) {
                
                java.sql.Date sqlDate = java.sql.Date.valueOf(dob);
                
                // Update student object attribute like firstName, lastName, dob, email and number using setter method
                student.setFirstName(firstName);
                student.setLastName(lastName);
                student.setDob(sqlDate);
                student.setEmail(email);
                student.setNumber(number);
                
                // Update Session to reflect changes in dashboard.
                SessionUtil.setAttribute(request, "user", student, 3600); // Set appropriate timeout
                
                Part filePart = request.getPart("profileImage");
                if (filePart != null && filePart.getSize() > 0) {
                    if (FileUploadUtil.isImage(filePart)) {
                        String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
                        String fileName = student.getUserName() + extension;
                        FileUploadUtil.saveFile(filePart, UPLOAD_DIR, fileName);
                        SessionUtil.setAttribute(request, "message", "Profile and photo updated!", 60);
                    } else {
                        SessionUtil.setAttribute(request, "error", "Info updated, but invalid image type.", 60);
                    }
                } else {
                    SessionUtil.setAttribute(request, "message", "Profile details updated successfully.", 60);
                }
            } else {
                SessionUtil.setAttribute(request, "error", "No changes were made to the profile.", 60);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            SessionUtil.setAttribute(request, "error", "Database Error: " + e.getMessage(), 60);
            
        } catch (Exception e) {
            e.printStackTrace();
            SessionUtil.setAttribute(request, "error", "General Error: " + e.getMessage(), 60);
        }

        response.sendRedirect(request.getContextPath() + "/profile");   
    }
}