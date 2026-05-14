<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart | Nepal Reads</title>
    <%-- Ensure your CSS path is correct --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="section-header">
            <h2 class="section-title">Your Cart</h2>
        </div>

        <%-- 2. Use sessionScope to explicitly find the cart --%>
        <c:choose>
            <c:when test="${empty sessionScope.cart}">
                <div class="empty" style="text-align: center; padding: 50px;">
                    <h2>Your Cart is Empty</h2>
                    <p>Start adding your favorite books!</p>
                    <a href="home" class="view-all">Go back to Shop</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="book-grid">
                    <%-- 3. Loop through the Map. Entry 'key' is the ID, 'value' is the Quantity --%>
                    <c:forEach var="entry" items="${sessionScope.cart}">
                        <div class="book-card" style="display: flex; flex-direction: row; align-items: center; padding: 20px;">
                            <div class="card-info" style="flex-grow: 1;">
                                <p class="author">Book ID</p>
                                <h3>${entry.key}</h3>
                                <p class="price">Quantity: ${entry.value}</p>
                            </div>
                            
                            <div class="actions">
                                <form action="cart" method="post">
                                    <input type="hidden" name="bookId" value="${entry.key}">
                                    <input type="hidden" name="action" value="remove">
                                    <button type="submit" class="add-btn" style="background: #ef4444; width: auto; padding: 10px 20px;">
                                        Remove
                                    </button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div style="margin-top: 30px; text-align: right;">
                    <a href="${pageContext.request.contextPath}/checkout" class="hero-btn" style="text-decoration: none;">Proceed to Checkout</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>