<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Users | Nepal Reads</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageuser.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>

    <!-- Header -->
    <jsp:include page="header.jsp" />
    
    <div class="layout">
        <nav class="sidebar">
            <div class="sidebar-header">
                ADMIN<span>HUB</span>
            </div>
            <!-- Updated Sidebar Links to hit Servlets instead of JSPs directly for security -->
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-item"><i class="fas fa-th-large"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/manageuser" class="nav-item"><i class="fas fa-users"></i> USERS</a>
            <a href="${pageContext.request.contextPath}/manageproduct"  class="nav-item"><i class="fas fa-box"></i> Products</a>
            <a href="${pageContext.request.contextPath}/manageorder" class="nav-item"><i class="fas fa-box"></i> Orders</a>
            <a href="${pageContext.request.contextPath}/adminprofile" class="nav-item"><i class="fas fa-user-edit"></i> Edit Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="nav-item logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
            

        <div class="main-content">
            <div class="container">
                <div class="dashboard-header">
                    <div>
                        <h1 class="page-title">User Management</h1>
                        <p class="subtitle">View and manage user roles and accounts</p>
                    </div>
                </div>

                <!-- STATS SECTION (Static or can be calculated from userList size) -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <p>Total Users</p>
                        <h2 class="stat-value">${userList.size()}</h2>
                    </div>
                </div>

                <!-- TABLE SECTION -->
                <div class="card">
                    <c:if test="${not empty error}">
                        <div style="color: red; padding: 10px;">${error}</div>
                    </c:if>

                    <table class="user-table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Phone</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- DYNAMIC LOOP: Iterates over the list sent by ManageUserServlet -->
                            <c:forEach var="user" items="${userList}">
                                <tr>
                                    <td class="user-name">${user.firstName} ${user.lastName}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <!-- Displays the role assigned by UserDAO logic -->
                                        <span class="badge ${user.role == 'admin' ? 'admin' : 'user'}">
                                            ${user.role}
                                        </span>
                                    </td>
                                    <td>${user.number}</td>
                                    <td>
                                        <div class="action-group">
                                            <!-- Delete Action using the Servlet -->
                                            <form action="${pageContext.request.contextPath}/manageuser" method="post" 
                                                  onsubmit="return confirm('Are you sure you want to delete ${user.userName}?');">
                                                <input type="hidden" name="userId" value="${user.userId}">
                                                <input type="hidden" name="action" value="delete">
                                                <button type="submit" class="btn-icon btn-delete" title="Delete User">🗑</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            
                            <c:if test="${empty userList}">
                                <tr>
                                    <td colspan="5" style="text-align: center;">No users found in database.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>