<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="layout">
        <nav class="sidebar">
            <div class="sidebar-header">ADMIN<span>HUB</span></div>
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-item active"><i class="fas fa-th-large"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/manageuser" class="nav-item"><i class="fas fa-users"></i> Users</a>
            <a href="${pageContext.request.contextPath}/manageproduct" class="nav-item"><i class="fas fa-book"></i> Products</a>
            <a href="${pageContext.request.contextPath}/manageorder" class="nav-item"><i class="fas fa-shopping-cart"></i> Orders</a>
            <a href="${pageContext.request.contextPath}/profile" class="nav-item"><i class="fas fa-user-edit"></i> Edit Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="nav-item logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
        <div class="main-content">
            <header>
                <div class="breadcrumb">Overview / <strong>Dashboard</strong></div>
            </header>
            <div class="container">
                <div class="welcome-banner">
                    <h1>Hello, ${sessionScope.user.firstName}!</h1>
                    <p>Welcome back to the Nepal Reads admin panel.</p>
                </div>
                <div class="grid">
                    <div class="card">
                        <div class="card-title"><i class="fas fa-user-shield"></i> Admin Info</div>
                        <div class="info-group">
                            <div class="info-label">Username</div>
                            <div class="info-value">@${sessionScope.user.userName}</div>
                        </div>
                        <div class="info-group">
                            <div class="info-label">Role</div>
                            <div class="info-value" style="color:#f472b6;font-weight:700;">Administrator</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-title"><i class="fas fa-envelope-open-text"></i> Contact</div>
                        <div class="info-group">
                            <div class="info-label">Email Address</div>
                            <div class="info-value">${sessionScope.user.email}</div>
                        </div>
                        <div class="info-group">
                            <div class="info-label">Phone</div>
                            <div class="info-value">${sessionScope.user.number}</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-title"><i class="fas fa-cogs"></i> Quick Actions</div>
                        <div style="display:flex;flex-direction:column;gap:10px;margin-top:10px;">
                            <a href="${pageContext.request.contextPath}/AddProduct"
                               style="display:flex;align-items:center;gap:8px;color:#f472b6;font-weight:600;text-decoration:none;padding:10px;background:#fff0f6;border-radius:8px;">
                                <i class="fas fa-plus-circle"></i> Add New Book
                            </a>
                            <a href="${pageContext.request.contextPath}/manageproduct"
                               style="display:flex;align-items:center;gap:8px;color:#374151;font-weight:600;text-decoration:none;padding:10px;background:#f3f4f6;border-radius:8px;">
                                <i class="fas fa-book"></i> Manage Books
                            </a>
                            <a href="${pageContext.request.contextPath}/manageuser"
                               style="display:flex;align-items:center;gap:8px;color:#374151;font-weight:600;text-decoration:none;padding:10px;background:#f3f4f6;border-radius:8px;">
                                <i class="fas fa-users"></i> Manage Users
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>