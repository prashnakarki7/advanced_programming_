<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Orders | Nepal Reads</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageorder.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

    <jsp:include page="header.jsp" />
    
    <div class="layout">
        <nav class="sidebar">
            <div class="sidebar-header">
                ADMIN<span>HUB</span>
            </div>
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
                    <h1 class="page-title">Order Management</h1>
                    
                    <div class="filter-box">
                        <%-- Fixed action mapping context path resolution --%>
                        <form method="get" action="${pageContext.request.contextPath}/manageorder">
                            <span>Filter:</span>
                            <select name="status" onchange="this.form.submit()" class="status-dropdown">
                                <option value="all" ${param.status == 'all' || empty param.status ? 'selected' : ''}>All Orders</option>
                                <option value="pending" ${param.status == 'pending' ? 'selected' : ''}>Pending</option>
                                <option value="confirmed" ${param.status == 'confirmed' ? 'selected' : ''}>Confirmed</option>
                                <option value="processing" ${param.status == 'processing' ? 'selected' : ''}>Processing</option>
                                <option value="shipped" ${param.status == 'shipped' ? 'selected' : ''}>Shipped</option>
                                <option value="delivered" ${param.status == 'delivered' ? 'selected' : ''}>Delivered</option>
                                <option value="cancelled" ${param.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
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
                                <th>Items Ordered</th>
                                <th>Total Price</th>
                                <th>Payment Method</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%-- Guard rail loop processing data checks --%>
                            <c:choose>
                                <c:when test="${not empty orders}">
                                    <c:forEach var="order" items="${orders}">
                                        <%-- Filter items entirely inside client layer to account for missing servlet parameter hooks --%>
                                        <c:if test="${param.status == 'all' || empty param.status || order.status.toLowerCase() == param.status.toLowerCase()}">
                                            <tr>
                                                <td><strong>#${order.orderId}</strong></td>
                                                <td>${order.orderDate}</td>
                                                <td><c:out value="${order.userName}" /></td>
                                                <td>
                                                    <ul style="list-style-type: none; padding-left: 0; margin: 0; text-align: left;">
                                                        <c:forEach var="item" items="${order.orderItems}">
                                                            <li style="margin-bottom: 4px; font-size: 0.95em;">
                                                                📚 <em><c:out value="${item.bookTitle}"/></em> 
                                                                <strong style="color: #555;">(x${item.quantity})</strong>
                                                            </li>
                                                        </c:forEach>
                                                        <c:if test="${empty order.orderItems}">
                                                            <li style="font-style: italic; color: #999; font-size: 0.9em;">
                                                                Standard Checkout Package
                                                            </li>
                                                        </c:if>
                                                    </ul>
                                                </td>
                                                <td class="amount">NPR <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.00"/></td>
                                                <td><span class="pay-tag">COD</span></td>
                                                <td>
                                                    <span class="status-badge ${order.status.toLowerCase()}">
                                                        ${order.status}
                                                    </span>
                                                </td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/manageorder?action=updateStatus" method="post" class="update-form">
                                                        <input type="hidden" name="orderId" value="${order.orderId}">
                                                        <select name="status">
                                                            <option value="pending" ${order.status == 'pending' ? 'selected' : ''}>Pending</option>
                                                            <option value="confirmed" ${order.status == 'confirmed' ? 'selected' : ''}>Confirmed</option>
                                                            <option value="processing" ${order.status == 'processing' ? 'selected' : ''}>Processing</option>
                                                            <option value="shipped" ${order.status == 'shipped' ? 'selected' : ''}>Shipped</option>
                                                            <option value="delivered" ${order.status == 'delivered' ? 'selected' : ''}>Delivered</option>
                                                            <option value="cancelled" ${order.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
                                                        </select>
                                                        <button type="submit" class="btn-primary">Update</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="8" style="text-align: center; padding: 30px; color: #888;">
                                            No processing customer order items found in the dashboard database records.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
                
                <%-- Quiet Debug Element: Will remain visible to you if your collection attribute is completely null --%>
                <c:if test="${orders == null}">
                    <div style="margin-top: 15px; padding: 10px; background: #fee2e2; color: #991b1b; border-radius: 6px; font-weight: bold; text-align: center; font-size: 0.9em;">
                        ⚠️ Debug Alert: The request attribute 'orders' is completely null! Verify your Admin Sidebar url targets '/manageorder' and not the raw path.
                    </div>
                </c:if>

            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
<div style="background: #1e293b; color: #f8fafc; padding: 20px; font-family: monospace; font-size: 13px; line-height: 1.6; border-bottom: 5px solid #e11d48; z-index: 9999; position: relative;">
    <h3 style="color: #f43f5e; margin-top: 0; font-size: 16px; border-bottom: 1px solid #334155; padding-bottom: 8px;">
        ⚙️ Backend Pipeline Live Diagnostics
    </h3>
    <table style="width: 100%; border-collapse: collapse; text-align: left;">
        <tr>
            <td style="width: 250px; color: #94a3b8; font-weight: bold; padding: 4px 0;">Request Context Path:</td>
            <td style="color: #38bdf8;">${pageContext.request.contextPath}</td>
        </tr>
        <tr>
            <td style="color: #94a3b8; font-weight: bold; padding: 4px 0;">Is 'orders' List Null?</td>
            <td>
                <c:choose>
                    <c:when test="${orders == null}"><span style="background: #991b1b; padding: 2px 6px; border-radius: 4px; color: white; font-weight: bold;">YES (The Servlet didn't pass anything!)</span></c:when>
                    <c:otherwise><span style="background: #166534; padding: 2px 6px; border-radius: 4px; color: white; font-weight: bold;">NO (Attribute exists)</span></c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td style="color: #94a3b8; font-weight: bold; padding: 4px 0;">'orders' List Size:</td>
            <td style="color: #a7f3d0; font-weight: bold;">
                <c:out value="${orders.size()}" default="0 (Or list is null/empty)" />
            </td>
        </tr>
        <tr>
            <td style="color: #94a3b8; font-weight: bold; padding: 4px 0;">Active Filter Parameter:</td>
            <td style="color: #fef08a;">"${param.status}" <c:if test="${empty param.status}"><span style="color: #64748b;">(Defaulting to showing all records)</span></c:if></td>
        </tr>
    </table>
</div>
</html>