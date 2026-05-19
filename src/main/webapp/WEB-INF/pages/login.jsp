<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Account | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<div class="login-card">
    <h2>Welcome Back</h2>
    <p class="subtitle">Login to continue</p>

    <%-- Error Alert Banner --%>
    <c:if test="${not empty error}">
        <div class="error-box">
            <i class="fas fa-exclamation-circle"></i>
            <span>${error}</span>
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="field">
            <label>Username</label>
            <div class="input-wrap">
                <i class="fas fa-user"></i>
                <input type="text"
                       name="username"
                       placeholder="Enter username"
                       value="${typedUser}"
                       required>
            </div>
        </div>

        <div class="field">
            <label>Password</label>
            <div class="input-wrap">
                <i class="fas fa-lock"></i>
                <input type="password"
                       name="password"
                       placeholder="Enter password"
                       required>
            </div>
        </div>

        <button class="submit-btn" type="submit">
            Login <i class="fas fa-arrow-right"></i>
        </button>
    </form>

    <div class="footer-text">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/register">Sign Up</a>
    </div>
</div>

</body>
</html>