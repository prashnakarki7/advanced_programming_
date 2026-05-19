<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout | Nepal Reads</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="wrapper">
    <h1><i class="fas fa-shopping-bag"></i> Checkout</h1>
    <c:if test="${not empty error}">
        <div style="background:#fee2e2;border:1px solid #fca5a5;color:#dc2626;padding:14px 20px;border-radius:8px;margin-bottom:20px;">
            <i class="fas fa-exclamation-circle"></i> ${error}
        </div>
    </c:if>
    <div class="checkout-box">
        <div class="left-box">
            <h2><i class="fas fa-truck"></i> Shipping Details</h2>
            <form action="${pageContext.request.contextPath}/checkout" method="post">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="fullName" value="${sessionScope.user.firstName} ${sessionScope.user.lastName}" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" value="${sessionScope.user.email}" required>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="tel" name="phone" value="${sessionScope.user.number}" required>
                </div>
                <div class="form-group">
                    <label>Delivery Address</label>
                    <textarea name="shippingAddress" rows="3" placeholder="Street, City, Province" required></textarea>
                </div>
                <div class="form-group">
                    <label>Payment Method</label>
                    <select name="payment">
                        <option value="cod">Cash On Delivery</option>
                        <option value="esewa">eSewa</option>
                        <option value="khalti">Khalti</option>
                    </select>
                </div>
                <button type="submit" class="place-order-btn">
                    <i class="fas fa-check-circle"></i> Place Order
                </button>
            </form>
        </div>
        <div class="right-box">
            <h2><i class="fas fa-receipt"></i> Order Summary</h2>
            <c:choose>
                <c:when test="${not empty cartBooks}">
                    <c:set var="grandTotal" value="${0}" />
                    <c:forEach var="book" items="${cartBooks}">
                        <%-- FIXED: Removed .toString() to prevent EL syntax compilation failure --%>
                        <c:set var="qty" value="${cartItems[book.productId]}" />
                        <c:if test="${empty qty}"><c:set var="qty" value="1" /></c:if>
                        <c:set var="subtotal" value="${book.price * qty}" />
                        <c:set var="grandTotal" value="${grandTotal + subtotal}" />
                        <div class="order-item">
                            <div>
                                <span class="item-name">${book.productName}</span>
                                <span class="item-author">${book.authorName}</span>
                            </div>
                            <div class="item-price">
                                <span class="qty">x${qty}</span>
                                <span>NPR <fmt:formatNumber value="${subtotal}" pattern="#,##0.00"/></span>
                            </div>
                        </div>
                    </c:forEach>
                    <hr style="border-color:#e5e7eb;margin:20px 0;">
                    <div class="summary-row"><span>Subtotal</span><span>NPR <fmt:formatNumber value="${grandTotal}" pattern="#,##0.00"/></span></div>
                    <div class="summary-row"><span>Delivery</span><span style="color:#16a34a;">Free</span></div>
                    <hr style="border-color:#e5e7eb;margin:10px 0;">
                    <div class="summary-row total"><span>Grand Total</span><span>NPR <fmt:formatNumber value="${grandTotal}" pattern="#,##0.00"/></span></div>
                </c:when>
                <c:otherwise>
                    <div style="text-align:center;padding:40px;color:#888;">
                        <i class="fas fa-shopping-cart" style="font-size:2rem;margin-bottom:15px;display:block;"></i>
                        <p>Your cart is empty.</p>
                        <a href="${pageContext.request.contextPath}/booklisting" style="color:#f472b6;font-weight:600;">Browse Books</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>