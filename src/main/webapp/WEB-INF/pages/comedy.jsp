<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comedy Books | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/comedy.css">
</head>
<body>
    <jsp:include page="header.jsp" /> 

    <main class="genre-container">
        <h2 class="genre-title">Comedy & Humorous Collection</h2>
        
        <div class="genre-page-grid">
            <c:choose>
                <c:when test="${not empty genreBooks}">
                    <c:forEach var="book" items="${genreBooks}">
                        <div class="book-card">
                            <div class="book-img-container">
                                <c:choose>
                                    <c:when test="${not empty book.imagePath}">
                                        <img src="${pageContext.request.contextPath}/${book.imagePath}" 
                                             alt="${book.productName}"
                                             onerror="this.src='https://via.placeholder.com/200x300?text=No+Cover'">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://via.placeholder.com/200x300?text=${book.productName}" alt="${book.productName}">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="card-info">
                                <p class="author">${book.authorName}</p>
                                <h3>${book.productName}</h3>
                                <span class="price">Rs. ${book.price}</span>
                                
                                <form action="${pageContext.request.contextPath}/cart" method="post" class="add-cart-form">
                                    <input type="hidden" name="bookId" value="${book.productId}">
                                    <input type="hidden" name="action" value="add">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.user}">
                                            <button type="submit" class="add-btn-submit">Add to Cart</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="add-btn-submit"
                                                    onclick="window.location='${pageContext.request.contextPath}/login?next=%2Fcart'">
                                                Add to Cart
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div style="grid-column: 1 / -1; text-align: center; padding: 60px; color: #888;">
                        <i class="fas fa-laugh-beam" style="font-size: 3rem; margin-bottom: 20px;"></i>
                        <p>No comedy additions found. We'll add some laughs here shortly!</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>