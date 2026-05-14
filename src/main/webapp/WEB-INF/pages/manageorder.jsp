<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Orders | Nepal Reads</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageorder.css">
    
</head>
<body>

    <!-- Header Included Here -->
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
                <h1 class="page-title">Order Management</h1>
                
                <div class="filter-box">
                    <form method="get" action="manageOrders.jsp">
                        <span>Filter:</span>
                        <select name="status" onchange="this.form.submit()" class="status-dropdown">
                            <option value="all">All Orders</option>
                            <option value="pending">Pending</option>
                            <option value="processing">Processing</option>
                            <option value="delivered">Delivered</option>
                            <option value="cancelled">Cancelled</option>
                        </select>
                    </form>
                </div>
            </div>

            <div class="card">
                <table class="order-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Customer</th>
                            <th>Items</th>
                            <th>Total</th>
                            <th>Payment</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Row 1 -->
                        <tr>
                            <td><strong>#101</strong></td>
                            <td>01 Apr 2026</td>
                            <td>Ram Prasad</td>
                            <td>2</td>
                            <td class="amount">NPR 1200</td>
                            <td><span class="pay-tag">COD</span></td>
                            <td><span class="status-badge pending">pending</span></td>
                            <td>
                                <form action="UpdateOrderStatusServlet" method="post" class="update-form">
                                    <input type="hidden" name="orderId" value="101">
                                    <select name="status">
                                        <option value="pending">Pending</option>
                                        <option value="processing">Processing</option>
                                        <option value="delivered">Delivered</option>
                                    </select>
                                    <button type="submit" class="btn-primary">Update</button>
                                </form>
                            </td>
                        </tr>
                        <!-- Row 2 -->
                        <tr>
                            <td><strong>#102</strong></td>
                            <td>05 Apr 2026</td>
                            <td>Sita Kumari</td>
                            <td>1</td>
                            <td class="amount">NPR 700</td>
                            <td><span class="pay-tag">Online</span></td>
                            <td><span class="status-badge delivered">delivered</span></td>
                            <td>
                                <form action="UpdateOrderStatusServlet" method="post" class="update-form">
                                    <input type="hidden" name="orderId" value="102">
                                    <select name="status">
                                        <option value="pending">Pendingg</option>
                                        <option value="delivered" selected>Delivered</option>
                                    </select>
                                    <button type="submit" class="btn-primary">Update</button>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
   </div>

    <!-- Footer Included Here -->
    <jsp:include page="footer.jsp" />

</body>
</html>