<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    
    <style>
        /* This hides the error box entirely when not needed */
        .error-message {
            display: ${empty error ? 'none' : 'block'};
            background-color: #fff8f8; 
            border-left: 5px solid #dc2626; 
            color: #b91c1c; 
            padding: 15px; 
            margin-bottom: 20px; 
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="layout single">
    <div class="form-card centered">
        <h2>Create Your Account</h2>
        <p class="subtitle">Enter your details to get started</p>
        
        <div class="error-message">
            <strong>Registration Issue:</strong> ${error}
        </div>

        <form action="${pageContext.request.contextPath}/register" method="post">
            
            <div class="row">
                <div class="field">
                    <label>First Name</label>
                    <div class="input-wrap">
                        <i class="fa fa-user"></i>
                        <input type="text" name="first_name" value="${firstName}" placeholder="simon" required>
                    </div>
                </div>
                <div class="field">
                    <label>Last Name</label>
                    <div class="input-wrap">
                        <i class="fa fa-user"></i>
                        <input type="text" name="last_name" value="${lastName}" placeholder="karki" required>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="field">
                    <label>Username</label>
                    <div class="input-wrap">
                        <i class="fa fa-user-circle"></i>
                        <input type="text" name="username" value="${username}" placeholder="simonkarki" required>
                    </div>
                </div>
                <div class="field">
                    <label>Phone Number</label>
                    <div class="input-wrap">
                        <i class="fa fa-phone"></i>
                        <input type="tel" name="number" value="${number}" placeholder="+977..." required>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="field">
                    <label>Birthday</label>
                    <div class="input-wrap">
                        <i class="fa fa-calendar-days"></i>
                        <input type="date" name="dob" required>
                    </div>
                </div>
                <div class="field">
                    <label>Gender</label>
                    <div class="input-wrap">
                        <select name="gender" required>
                            <option value="" disabled selected hidden>Select</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="field">
                    <label>Email</label>
                    <div class="input-wrap">
                        <i class="fa fa-envelope"></i>
                        <input type="email" name="email" value="${email}" placeholder="name@example.com" required>
                    </div>
                </div>
            </div>

            <div class="field">
                <label>Password</label>
                <div class="input-wrap">
                    <i class="fa fa-lock"></i>
                    <input type="password" name="password" required>
                </div>
            </div>

            <button class="submit-btn" type="submit">
                Create Account <i class="fa fa-arrow-right"></i>
            </button>
        </form>

        <div class="footer-text">
            Have an account? 
            <a href="${pageContext.request.contextPath}/login">Sign In</a>
        </div>
    </div>
</div>

</body>
</html>