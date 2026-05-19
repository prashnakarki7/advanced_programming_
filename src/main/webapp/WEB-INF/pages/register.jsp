<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    
    
</head>
<body>

<div class="layout single">
    <div class="form-card centered">
        <h2>Create Your Account</h2>
        <p class="subtitle">Enter your details to get started</p>
        
        <%-- ADD THIS RIGHT ABOVE THE <form> TAG --%>
<c:if test="${not empty error}">
    <div style="background:#fee2e2; border:1px solid #fca5a5; color:#dc2626; padding:12px; border-radius:8px; margin-bottom:20px; font-size:0.9rem; font-weight:600;">
        <i class="fa fa-exclamation-circle"></i> ${error}
    </div>
</c:if>

        <form action="${pageContext.request.contextPath}/register" method="post">
            
            <div class="row">
                <div class="field">
                    <label>First Name</label>
                    <div class="input-wrap">
                        <i class="fa fa-user"></i>
                        <input type="text" name="first_name" placeholder="simon" required>
                    </div>
                </div>
                <div class="field">
                    <label>Last Name</label>
                    <div class="input-wrap">
                        <i class="fa fa-user"></i>
                        <input type="text" name="last_name" placeholder="karki" required>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="field">
                    <label>Username</label>
                    <div class="input-wrap">
                        <i class="fa fa-user-circle"></i>
                        <input type="text" name="username" placeholder="simonkarki" required>
                    </div>
                </div>
                <div class="field">
                    <label>Phone Number</label>
                    <div class="input-wrap">
                        <i class="fa fa-phone"></i>
                        <input type="tel" name="number" placeholder="+977..." required>
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
       					 	<option>Male</option>
        					<option>Female</option>
    					</select>
					</div>
                </div>
            </div>

            <div class="row">
                <div class="field">
                    <label>Email</label>
                    <div class="input-wrap">
                        <i class="fa fa-envelope"></i>
                        <input type="email" name="email" placeholder="name@example.com" required>
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