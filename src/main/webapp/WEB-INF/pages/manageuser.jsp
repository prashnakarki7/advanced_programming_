<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

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
            <a href="${pageContext.request.contextPath}/pages/adminDashboard.jsp" class="nav-item"><i class="fas fa-th-large"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/pages/manageuser.jsp" class="nav-item"><i class="fas fa-users"></i> USERS</a>
            <a href="#" class="nav-item"><i class="fas fa-box"></i> Products</a>
            <a href="${pageContext.request.contextPath}/pages/manageorder.jsp" class="nav-item"><i class="fas fa-box"></i> Orders</a>
            <a href="${pageContext.request.contextPath}/pages/profile.jsp" class="nav-item"><i class="fas fa-user-edit"></i> Edit Profile</a>
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

            <!-- STATS SECTION -->
            <div class="stats-grid">
                <div class="stat-card">
                    <p>Total Users</p>
                    <h2 class="stat-value">5</h2>
                </div>
                <div class="stat-card featured">
                    <p>Admin Users</p>
                    <h2 class="stat-value">1</h2>
                </div>
                <div class="stat-card">
                    <p>Regular Users</p>
                    <h2 class="stat-value">4</h2>
                </div>
            </div>

            <!-- TABLE SECTION -->
            <div class="card">
                <table class="user-table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Joined Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- USER 1 -->
                        <tr>
                            <td class="user-name">Prashna Karki</td>
                            <td>prashna@mail.com</td>
                            <td><span class="badge user">user</span></td>
                            <td>15 Jan 2024</td>
                            <td>
                                <div class="action-group">
                                    <form action="ToggleRoleServlet" method="post">
                                        <input type="hidden" name="userId" value="1">
                                        <button class="btn-icon btn-edit" title="Toggle Role">⚙</button>
                                    </form>
                                    <form action="DeleteUserServlet" method="post">
                                        <input type="hidden" name="userId" value="1">
                                        <button class="btn-icon btn-delete" title="Delete User">🗑</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <!-- USER 2 -->
                        <tr>
                            <td class="user-name">Simon K.C.</td>
                            <td>simon@mail.com</td>
                            <td><span class="badge user">user</span></td>
                            <td>20 Feb 2024</td>
                            <td>
                                <div class="action-group">
                                    <form action="ToggleRoleServlet" method="post">
                                        <input type="hidden" name="userId" value="2">
                                        <button class="btn-icon btn-edit">⚙</button>
                                    </form>
                                    <form action="DeleteUserServlet" method="post">
                                        <input type="hidden" name="userId" value="2">
                                        <button class="btn-icon btn-delete">🗑</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <!-- ADMIN -->
                        <tr>
                            <td class="user-name">Admin User</td>
                            <td>admin@example.com</td>
                            <td><span class="badge admin">admin</span></td>
                            <td>01 Dec 2023</td>
                            <td>
                                <div class="action-group">
                                    <form action="ToggleRoleServlet" method="post">
                                        <input type="hidden" name="userId" value="3">
                                        <button class="btn-icon btn-edit">⚙</button>
                                    </form>
                                    <form action="DeleteUserServlet" method="post">
                                        <input type="hidden" name="userId" value="3">
                                        <button class="btn-icon btn-delete">🗑</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>