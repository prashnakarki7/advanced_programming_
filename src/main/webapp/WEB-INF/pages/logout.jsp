<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%
    // If session exists here, redirect to logout servlet
    if (session != null && session.getAttribute("user") != null) {
        response.sendRedirect(request.getContextPath() + "/logout");
        return;
    }
    // Prevent back-button caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logged Out | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/logout.css">
</head>
<body>
    <div class="card-container">
        <div class="success-icon">&#10003;</div>
        <h2>You've been logged out</h2>
        <p>You have successfully signed out of your <strong>Nepal Reads</strong> account.</p>
        <a href="${pageContext.request.contextPath}/login" class="btn-primary">Login Again</a>
        <br><br>
        <small><a href="${pageContext.request.contextPath}/home" style="color:#95a5a6;">Go to Homepage</a></small>
    </div>
</body>
</html>