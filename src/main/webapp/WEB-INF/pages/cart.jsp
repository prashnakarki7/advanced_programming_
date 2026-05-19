<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container" style="max-width:900px;margin:40px auto;padding:0 20px;">
        <div class="section-header">
            <h2 class="section-title">Your Cart</h2>
        </div>
        <c:choose>
            <c:when test="${empty cartBooks}">
                <div style="text-align:center;padding:80px 20px;color:#888;">
                    <i class="fas fa-shopping-cart" style="font-size:4rem;margin-bottom:20px;display:block;color:#d1d5db;"></i>
                    <h2 style="margin-bottom:10px;color:#374151;">Your cart is empty</h2>
                    <p>Add some books to get started!</p>
                    <a href="${pageContext.request.contextPath}/booklisting"
                       style="display:inline-block;margin-top:20px;background:#f472b6;color:white;padding:12px 30px;border-radius:8px;text-decoration:none;font-weight:700;">
                        Browse Books
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <table style="width:100%;border-collapse:collapse;background:#fff;border-radius:12px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
                    <thead>
                        <tr style="background:#f9fafb;border-bottom:2px solid #e5e7eb;">
                            <th style="padding:16px 20px;text-align:left;font-size:0.85rem;color:#6b7280;text-transform:uppercase;letter-spacing:0.5px;">Book</th>
                            <th style="padding:16px 20px;text-align:center;font-size:0.85rem;color:#6b7280;text-transform:uppercase;letter-spacing:0.5px;">Price</th>
                            <th style="padding:16px 20px;text-align:center;font-size:0.85rem;color:#6b7280;text-transform:uppercase;letter-spacing:0.5px;">Qty</th>
                            <th style="padding:16px 20px;text-align:right;font-size:0.85rem;color:#6b7280;text-transform:uppercase;letter-spacing:0.5px;">Subtotal</th>
                            <th style="padding:16px 20px;text-align:center;font-size:0.85rem;color:#6b7280;text-transform:uppercase;letter-spacing:0.5px;">Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="cartTotal" value="${0}" />
                        <c:forEach var="book" items="${cartBooks}">
                            <%-- FIXED: Removed .toString() and .concat() entirely to bypass old IDE validators --%>
                            <c:set var="qty" value="${cartItems[book.productId]}" />
                            <c:if test="${empty qty}"><c:set var="qty" value="1" /></c:if>
                            <c:set var="sub" value="${book.price * qty}" />
                            <c:set var="cartTotal" value="${cartTotal + sub}" />
                            <tr style="border-bottom:1px solid #f3f4f6;">
                                <td style="padding:16px 20px;">
                                    <div style="display:flex;align-items:center;gap:14px;">
                                        <c:choose>
                                            <c:when test="${not empty book.imagePath}">
                                                <img src="${pageContext.request.contextPath}/${book.imagePath}" alt="${book.productName}"
                                                     style="width:50px;height:70px;object-fit:cover;border-radius:4px;"
                                                     onerror="this.src='https://via.placeholder.com/50x70?text=Book'">
                                            </c:when>
                                            <c:otherwise>
                                                <div style="width:50px;height:70px;background:#f3f4f6;border-radius:4px;display:flex;align-items:center;justify-content:center;">
                                                    <i class="fas fa-book" style="color:#d1d5db;"></i>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <div>
                                            <div style="font-weight:700;font-size:0.95rem;">${book.productName}</div>
                                            <div style="font-size:0.8rem;color:#6b7280;">${book.authorName}</div>
                                            <div style="font-size:0.78rem;color:#9ca3af;">${book.category}</div>
                                        </div>
                                    </div>
                                </td>
                                <td style="padding:16px 20px;text-align:center;font-weight:600;">Rs. <fmt:formatNumber value="${book.price}" pattern="#,##0.00"/></td>
                                <td style="padding:16px 20px;text-align:center;">
                                    <form action="${pageContext.request.contextPath}/cart" method="post" style="display:flex;align-items:center;justify-content:center;gap:5px;">
                                        <input type="hidden" name="bookId" value="${book.productId}">
                                        <input type="hidden" name="action" value="update">
                                        <input type="number" name="qty" value="${qty}" min="1" max="99"
                                               style="width:55px;padding:6px;border:1px solid #d1d5db;border-radius:6px;text-align:center;font-size:0.9rem;"
                                               onchange="this.form.submit()">
                                    </form>
                                </td>
                                <td style="padding:16px 20px;text-align:right;font-weight:700;color:#111;">Rs. <fmt:formatNumber value="${sub}" pattern="#,##0.00"/></td>
                                <td style="padding:16px 20px;text-align:center;">
                                    <form action="${pageContext.request.contextPath}/cart" method="post">
                                        <input type="hidden" name="bookId" value="${book.productId}">
                                        <input type="hidden" name="action" value="remove">
                                        <button type="submit" style="background:#fee2e2;border:none;color:#dc2626;width:34px;height:34px;border-radius:50%;cursor:pointer;font-size:0.85rem;">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div style="margin-top:24px;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:16px;">
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="clear">
                        <button type="submit" onclick="return confirm('Clear all items from cart?')"
                                style="background:#f3f4f6;border:1px solid #d1d5db;color:#4b5563;padding:12px 24px;border-radius:8px;cursor:pointer;font-weight:600;">
                            <i class="fas fa-trash"></i> Clear Cart
                        </button>
                    </form>
                    <div style="background:#fff;border-radius:12px;padding:20px 30px;border:1px solid #e5e7eb;text-align:right;">
                        <div style="font-size:0.9rem;color:#6b7280;margin-bottom:6px;">Order Total</div>
                        <div style="font-size:1.6rem;font-weight:800;color:#111;">Rs. <fmt:formatNumber value="${cartTotal}" pattern="#,##0.00"/></div>
                        <a href="${pageContext.request.contextPath}/checkout"
                           style="display:block;margin-top:14px;background:#f472b6;color:white;padding:12px 30px;border-radius:8px;text-decoration:none;font-weight:700;text-align:center;">
                            Proceed to Checkout <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>