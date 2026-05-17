package com.advance_programming.controller;

import com.advance_programming.DAO.UserDAO;
import com.advance_programming.model.UserModel;
import com.advance_programming.service.LoginService;
import com.advance_programming.utils.CookieUtil;
import com.advance_programming.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Fetch User Information from Form
		String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Call LoginService
        LoginService service= new LoginService();
        String status = service.authenticate(username, password);

        // Handle the response status
        if ("Success".equals(status)) {
        	// DAO is used to fetch Student Data
        	UserDAO student=new UserDAO();
            try {
            	// Student data is stored in studentdata object after DAO operation
            	UserModel studentdata=student.getUserByUsername(username);
            	
            	// Used Session's setAttribute method to store studentdata object in server memory
            	// No need to set and pass data to jsp when used with session
            	// Just use EL and JSTL to show data in dashboard.jsp 
            	SessionUtil.setAttribute(request, "user", studentdata, 3600);
            	
            	// Capture and format the current time
            	LocalDateTime now = LocalDateTime.now();
            	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH:mm:ss");
            	String loginTime = now.format(formatter);
            	
            	// Cookie is created to record last login time
            	// look at browser cookie section to verify it
            	CookieUtil.addCookie(response, "last_login", loginTime, 3600);
			} catch (Exception e) {
				// Print error in console of server
				e.printStackTrace();
			}
            // Goto dashboard page
            response.sendRedirect(request.getContextPath() + "/home");
        }
        else {
        	// Set error and forward it to login page
            request.setAttribute("error", status);
            // To keep the username in the box
            request.setAttribute("typedUser", username); 
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
        }
    }
