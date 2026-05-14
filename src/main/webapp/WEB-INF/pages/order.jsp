order
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Reading Journey | Order History</title>
    <link rel="stylesheet"
href="${pageContext.request.contextPath}/css/Order.css">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">

    <h1>My Reading Journey</h1>

    <div class="empty" style="display: none;">
        <div class="empty-icon">📚</div>
        <h2>No orders yet</h2>
        <p>Start shopping and your literary adventures will appear here.</p>
        <button class="btn">Browse Books</button>
    </div>

    <div class="orders">

        <div class="order-card">
            <div class="order-header">
                <div class="order-meta">
                    <h3>Order #12345</h3>
                    <p>April 12, 2026 • <strong>Payment:</strong> Cash on Delivery</p>
                </div>
                <span class="status pending">Processing</span>
            </div>

            <div class="items-container">
                <div class="book-row">
                    <div class="book-details">
                        <p class="book-title">The Midnight Library</p>
                        <p class="book-qty">Quantity: 2</p>
                    </div>
                    <p class="book-price">NPR 1,000</p>
                </div>

                <div class="book-row">
                    <div class="book-details">
                        <p class="book-title">Atomic Habits</p>
                        <p class="book-qty">Quantity: 1</p>
                    </div>
                    <p class="book-price">NPR 500</p>
                </div>
            </div>

            <div class="order-summary-footer">
                <div class="shipping-info">
                    <p class="label">Shipping to:</p>
                    <p class="address-text">Kathmandu, Nepal</p>
                </div>

                <div class="total-section">
                    <p class="label">Grand Total</p>
                    <h2 class="grand-total-price">NPR 1,500</h2>
                </div>
            </div>
        </div>

    </div>

</div>
<jsp:include page="footer.jsp" />
</body>
</html>