<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nepal Reads | Premium Bookstore</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>

<jsp:include page="header.jsp" />

<main>
    <section class="hero-slider-full">
        <div class="slider-container">
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/slider_1.jpeg" class="slide-img" alt="Banner 1">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <span class="hero-badge">Nepal Reads Exclusive</span>
                        <h2>Discover Your Next <br>Great Read</h2>
                        <a href="${pageContext.request.contextPath}/booklisting" class="hero-btn">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/slider_2.jpeg" class="slide-img" alt="Banner 2">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <span class="hero-badge">Best Sellers 2026</span>
                        <h2>The World of <br>Modern Fiction</h2>
                        <a href="${pageContext.request.contextPath}/booklisting" class="hero-btn">Explore Now</a>
                    </div>
                </div>
            </div>
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/photo 1.jpeg" class="slide-img" alt="Banner 3">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <span class="hero-badge">Nepali Literature</span>
                        <h2>Voices From The <br>Himalayas</h2>
                        <a href="${pageContext.request.contextPath}/nepaliliterature" class="hero-btn">Browse Collection</a>
                    </div>
                </div>
            </div>
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/photo 2.jpeg" class="slide-img" alt="Banner 4">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <span class="hero-badge">Thrills & Suspense</span>
                        <h2>Chilling Tales <br>For Late Nights</h2>
                        <a href="${pageContext.request.contextPath}/horror" class="hero-btn">Enter If You Dare</a>
                    </div>
                </div>
            </div>
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/photo 3.jpeg" class="slide-img" alt="Banner 5">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <span class="hero-badge">Laugh Out Loud</span>
                        <h2>Stories To Brighten <br>Your Day</h2>
                        <a href="${pageContext.request.contextPath}/comedy" class="hero-btn">Explore Comedy</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="section-header">
            <h2 class="section-title">Browse Genres</h2>
        </div>
        <div class="genre-scroll">
            <a href="${pageContext.request.contextPath}/nepaliliterature" class="genre-item">
                <div class="circle-icon"><i class="fas fa-book-open"></i></div>
                <p>Nepali Literature</p>
            </a>
            <a href="${pageContext.request.contextPath}/comedy" class="genre-item">
                <div class="circle-icon"><i class="fas fa-laugh-beam"></i></div>
                <p>Comedy</p>
            </a>
            <a href="${pageContext.request.contextPath}/romance" class="genre-item">
                <div class="circle-icon"><i class="fas fa-heart"></i></div>
                <p>Romance</p>
            </a>
            <a href="${pageContext.request.contextPath}/horror" class="genre-item">
                <div class="circle-icon"><i class="fas fa-ghost"></i></div>
                <p>Horror</p>
            </a>
        </div>

        <div class="section-header">
            <h2 class="section-title">Featured Books</h2>
            <a href="${pageContext.request.contextPath}/booklisting" class="view-all">View All</a>
        </div>

        <c:choose>
            <c:when test="${not empty featuredBooks}">
                <div class="book-grid">
                    <c:forEach var="book" items="${featuredBooks}">
                        <div class="book-card">
                            <div class="book-img-container">
                                <c:choose>
                                    <c:when test="${not empty book.imagePath}">
                                        <img src="${pageContext.request.contextPath}/${book.imagePath}"
                                             alt="${book.productName}"
                                             onerror="this.src='https://via.placeholder.com/200x300?text=No+Image'">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://via.placeholder.com/200x300?text=${book.productName}"
                                             alt="${book.productName}">
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
                </div>
            </c:when>
            <c:otherwise>
                <div style="text-align:center;padding:60px;color:#888;">
                    <i class="fas fa-book-open" style="font-size:3rem;margin-bottom:20px;"></i>
                    <p>No books available yet. Check back soon!</p>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</main>

<jsp:include page="footer.jsp" />

</body>
</html>