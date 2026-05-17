<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Romance Collection | Nepal Reads</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/romance.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="romance-container">
        <h2 class="romance-title"><i class="fas fa-heart"></i> Romance Collection</h2>

        <c:choose>
            <c:when test="${empty books}">
                <div style="text-align:center;padding:80px 20px;color:#6b7280">
                    <i class="fas fa-heart-broken" style="font-size:3rem;display:block;margin-bottom:16px"></i>
                    <p>No Romance books available yet. Check back soon!</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="genre-page-grid">
                    <c:forEach var="b" items="${books}">
                    <div class="book-card">
                        <div class="book-img-container">
                            <c:choose>
                                <c:when test="${not empty b.coverImage}">
                                    <img src="${pageContext.request.contextPath}/${b.coverImage}" alt="${b.title}"
                                         onerror="this.src='https://via.placeholder.com/200x300/ff6b9d/ffffff?text=${b.title}'">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://via.placeholder.com/200x300/ff6b9d/ffffff?text=${b.title}" alt="${b.title}">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-info">
                            <p class="author">${b.author}</p>
                            <h3>${b.title}</h3>
                            <span class="price">Rs. ${b.price}</span>
                            <form action="${pageContext.request.contextPath}/cart" method="post" class="add-cart-form">
                                <input type="hidden" name="bookId" value="${b.bookId}">
                                <input type="hidden" name="action" value="add">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" class="add-btn-submit"
                                            onclick="window.location='${pageContext.request.contextPath}/login'">Add to Cart</button>
                                    </c:otherwise>
                                </c:choose>
                            </form>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>
