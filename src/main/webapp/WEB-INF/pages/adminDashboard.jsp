<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Admin Dashboard | ${user.firstName}</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/adminDashboard.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

    <!-- HEADER -->
    <jsp:include page="header.jsp" />

    <div class="layout">

        <!-- SIDEBAR -->
        <nav class="sidebar">

            <div class="sidebar-header">
                ADMIN<span>HUB</span>
            </div>

            <a href="${pageContext.request.contextPath}/pages/adminDashboard.jsp"
               class="nav-item">
                <i class="fas fa-th-large"></i> Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/pages/manageuser.jsp"
               class="nav-item">
                <i class="fas fa-users"></i> USERS
            </a>

            <a href="#"
               class="nav-item">
                <i class="fas fa-box"></i> Products
            </a>

            <a href="${pageContext.request.contextPath}/pages/manageorder.jsp"
               class="nav-item">
                <i class="fas fa-box"></i> Orders
            </a>

            <a href="${pageContext.request.contextPath}/pages/profile.jsp"
               class="nav-item">
                <i class="fas fa-user-edit"></i> Edit Profile
            </a>

            <a href="${pageContext.request.contextPath}/logout"
               class="nav-item logout-btn">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>

        </nav>

        <!-- MAIN CONTENT -->
        <div class="main-content">

            <header>
                <div class="breadcrumb">
                    Overview / <strong>Dashboard</strong>
                </div>
            </header>

            <div class="container">

                <div class="welcome-banner">
                    <h1>Hello, ${user.firstName}!</h1>

                    <p>
                        Welcome back to your creative learning space.
                        Here is your current status.
                    </p>
                </div>

                <div class="grid">

                    <!-- ACCOUNT INFO -->
                    <div class="card">

                        <div class="card-title">
                            <i class="fas fa-id-badge"></i> Account Info
                        </div>

                        <div class="info-group">
                            <div class="info-label">Username</div>
                            <div class="info-value">@${user.userName}</div>
                        </div>

                    </div>

                    <!-- CONTACT -->
                    <div class="card">

                        <div class="card-title">
                            <i class="fas fa-envelope-open-text"></i> Contact
                        </div>

                        <div class="info-group">
                            <div class="info-label">Email Address</div>
                            <div class="info-value">${user.email}</div>
                        </div>

                        <div class="info-group">
                            <div class="info-label">Phone</div>
                            <div class="info-value">${user.number}</div>
                        </div>

                    </div>

                    <!-- PROFILE -->
                    <div class="card">

                        <div class="card-title">
                            <i class="fas fa-user-check"></i> Profile
                        </div>

                        <div class="info-group">
                            <div class="info-label">Birthday</div>

                            <div class="info-value">
                                <fmt:formatDate
                                    value="${user.dob}"
                                    pattern="dd MMM, yyyy" />
                            </div>
                        </div>

                        <div class="info-group">
                            <div class="info-label">Gender</div>

                            <div class="info-value"
                                 style="text-transform: capitalize;">
                                ${user.gender}
                            </div>
                        </div>

                        <div class="info-group">
                            <div class="info-label">
                                Your last login was:
                            </div>

                            <div class="info-value">
                                <c:out value="${cookie.last_login.value != null ? cookie.last_login.value : 'Cookie Not Found'}" />
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <!-- FOOTER -->
    <jsp:include page="footer.jsp" />

</body>
</html>