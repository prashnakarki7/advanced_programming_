<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Reading Journey | Order History</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Order.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">

    <h1>My Reading Journey</h1>

    <c:if test="${not empty successOrderId}">
        <div style="background: #d1fae5; border: 1px solid #10b981; color: #065f46; padding: 15px; border-radius: 8px; margin-bottom: 25px; display: flex; align-items: center; gap: 10px; font-weight: 600;">
            <i class="fas fa-check-circle" style="color: #10b981; font-size: 1.2rem;"></i>
            <span>Thank you! Your order has been placed successfully. Order Reference Identification: #${successOrderId}</span>
        </div>
    </c:if>

    <c:choose>
        <%-- Case A: User has zero orders inside the system database --%>
        <c:when test="${empty orders}">
            <div class="empty" style="display: block; text-align: center; padding: 40px;">
                <div class="empty-icon" style="font-size: 3rem; margin-bottom: 10px;">📚</div>
                <h2>No orders yet</h2>
                <p>Start shopping and your literary adventures will appear here.</p>
                <a href="${pageContext.request.contextPath}/booklisting" class="btn" style="display:inline-block; text-decoration:none; text-align:center; padding:10px 20px; background:#f472b6; color:white; border-radius:5px; margin-top:10px; font-weight:600;">Browse Books</a>
            </div>
        </c:when>

        <%-- Case B: Loop and show real dynamic user data cards --%>
        <c:otherwise>
            <div class="orders">
                <c:forEach var="order" items="${orders}">
                    <div class="order-card" style="margin-bottom: 25px;">
                        <div class="order-header">
                            <div class="order-meta">
                                <h3>Order #${order.orderId}</h3>
                                <p>${order.orderDate} • <strong>Payment:</strong> Cash on Delivery</p>
                            </div>
                            <span class="status ${order.status.toLowerCase()}">${order.status}</span>
                        </div>

                        <div class="items-container">
                            <div class="shipping-info" style="padding: 15px 0 5px 0;">
                                <p class="label" style="color: #6b7280; font-size: 0.9em; margin: 0;">Shipping to:</p>
                                <p class="address-text" style="margin: 4px 0 0 0; font-weight: 600; color: #374151;"><c:out value="${order.shippingAddress}" /></p>
                            </div>
                        </div>

                        <div class="order-summary-footer">
                            <div></div> <div class="total-section">
                                <p class="label">Grand Total</p>
                                <h2 class="grand-total-price">NPR <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.00"/></h2>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>

</div>
<jsp:include page="footer.jsp" />
</body>
</html>