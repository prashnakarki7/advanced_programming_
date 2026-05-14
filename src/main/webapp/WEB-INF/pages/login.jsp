<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Account</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<div class="login-card">

    <h2>Welcome Back</h2>
    <p class="subtitle">Login to continue</p>

    <form action="${pageContext.request.contextPath}/login" method="post">

        <div class="field">
            <label>Username</label>

            <div class="input-wrap">

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
   

                <input type="password"
                       name="password"
                       placeholder="Enter password"
                       required>
            </div>
        </div>

        <button class="submit-btn" type="submit">
            Login →
        </button>
    </form>

    <div class="footer-text">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/register">
            Sign Up
        </a>
    </div>

</div>

</body>
</html>