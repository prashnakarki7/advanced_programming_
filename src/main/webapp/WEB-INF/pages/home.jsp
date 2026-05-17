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
    <style>
        .genre-item { cursor: pointer; text-decoration: none; color: inherit; }
        .genre-item:hover .circle-icon { background: #2563eb; color: #fff; transform: scale(1.08); transition: .2s; }
        .skeleton { background: linear-gradient(90deg,#f0f0f0 25%,#e0e0e0 50%,#f0f0f0 75%); background-size:200% 100%; animation: shimmer 1.5s infinite; border-radius: 8px; }
        @keyframes shimmer { 0%{background-position:200% 0} 100%{background-position:-200% 0} }
        .empty-state { text-align:center; padding:60px 20px; color:#6b7280; }
        .empty-state i { font-size:3rem; display:block; margin-bottom:14px; color:#d1d5db; }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<main>
    <!-- HERO SLIDER -->
    <section class="hero-slider-full">
        <div class="slider-container">
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/slider_1.jpeg" class="slide-img" alt="Banner 1"
                     onerror="this.src='https://via.placeholder.com/1400x500/1e3a5f/ffffff?text=Nepal+Reads'">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <span class="hero-badge">Nepal Reads Exclusive</span>
                        <h2>Discover Your Next <br>Great Read</h2>
                        <a href="${pageContext.request.contextPath}/booklisting"><button class="hero-btn">Shop Now</button></a>
                    </div>
                </div>
            </div>
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/slider_2.jpeg" class="slide-img" alt="Banner 2"
                     onerror="this.src='https://via.placeholder.com/1400x500/2d1b69/ffffff?text=Best+Sellers+2026'">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <span class="hero-badge">Best Sellers 2026</span>
                        <h2>The World of <br>Modern Fiction</h2>
                        <a href="${pageContext.request.contextPath}/booklisting"><button class="hero-btn">Explore Now</button></a>
                    </div>
                </div>
            </div>
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/banner3.jpg" class="slide-img" alt="Banner 3"
                     onerror="this.src='https://via.placeholder.com/1400x500/064e3b/ffffff?text=New+Arrivals'">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <span class="hero-badge">New Arrivals</span>
                        <h2>Knowledge at <br>Your Fingertips</h2>
                        <a href="${pageContext.request.contextPath}/booklisting"><button class="hero-btn">View Deals</button></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <!-- GENRES SECTION — all linked to their pages -->
        <div class="section-header">
            <h2 class="section-title">Browse Genres</h2>
        </div>
        <div class="genre-scroll">
            <a href="${pageContext.request.contextPath}/booklisting?genre=Fiction" class="genre-item">
                <div class="circle-icon"><i class="fas fa-theater-masks"></i></div><p>Fiction</p>
            </a>
            <a href="${pageContext.request.contextPath}/horror" class="genre-item">
                <div class="circle-icon"><i class="fas fa-ghost"></i></div><p>Horror</p>
            </a>
            <a href="${pageContext.request.contextPath}/romance" class="genre-item">
                <div class="circle-icon"><i class="fas fa-heart"></i></div><p>Romance</p>
            </a>
            <a href="${pageContext.request.contextPath}/comedy" class="genre-item">
                <div class="circle-icon"><i class="fas fa-laugh"></i></div><p>Comedy</p>
            </a>
            <a href="${pageContext.request.contextPath}/nepaliliterature" class="genre-item">
                <div class="circle-icon"><i class="fas fa-om"></i></div><p>Nepali</p>
            </a>
            <a href="${pageContext.request.contextPath}/booklisting?genre=Science" class="genre-item">
                <div class="circle-icon"><i class="fas fa-flask"></i></div><p>Science</p>
            </a>
            <a href="${pageContext.request.contextPath}/booklisting?genre=History" class="genre-item">
                <div class="circle-icon"><i class="fas fa-history"></i></div><p>History</p>
            </a>
            <a href="${pageContext.request.contextPath}/booklisting?genre=Business" class="genre-item">
                <div class="circle-icon"><i class="fas fa-briefcase"></i></div><p>Business</p>
            </a>
            <a href="${pageContext.request.contextPath}/booklisting?genre=Kids" class="genre-item">
                <div class="circle-icon"><i class="fas fa-child"></i></div><p>Kids</p>
            </a>
            <a href="${pageContext.request.contextPath}/booklisting?genre=Self Help" class="genre-item">
                <div class="circle-icon"><i class="fas fa-hand-holding-heart"></i></div><p>Self Help</p>
            </a>
        </div>

        <!-- FEATURED BOOKS (dynamic from DB via HomeServlet) -->
        <div class="section-header">
            <h2 class="section-title">Featured Books</h2>
            <a href="${pageContext.request.contextPath}/booklisting" class="view-all">View All</a>
        </div>

        <c:choose>
            <c:when test="${empty featuredBooks}">
                <div class="empty-state">
                    <i class="fas fa-book-open"></i>
                    <p>No books yet. Admin can add books from the dashboard.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="book-grid">
                    <c:forEach var="b" items="${featuredBooks}">
                    <div class="book-card">
                        <div class="book-img-container">
                            <c:choose>
                                <c:when test="${not empty b.coverImage}">
                                    <img src="${pageContext.request.contextPath}/${b.coverImage}"
                                         alt="${b.title}"
                                         onerror="this.src='https://via.placeholder.com/200x300/e2e8f0/64748b?text=${b.title}'">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://via.placeholder.com/200x300/e2e8f0/64748b?text=${b.title}" alt="${b.title}">
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
            </c:otherwise>
        </c:choose>

        <!-- NEW ARRIVALS (2nd set from DB) -->
        <c:if test="${not empty newArrivals}">
        <div class="section-header">
            <h2 class="section-title">New Arrivals</h2>
            <a href="${pageContext.request.contextPath}/booklisting" class="view-all">View All</a>
        </div>
        <div class="book-grid">
            <c:forEach var="b" items="${newArrivals}">
            <div class="book-card">
                <div class="book-img-container">
                    <c:choose>
                        <c:when test="${not empty b.coverImage}">
                            <img src="${pageContext.request.contextPath}/${b.coverImage}"
                                 alt="${b.title}"
                                 onerror="this.src='https://via.placeholder.com/200x300/e2e8f0/64748b?text=${b.title}'">
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/200x300/e2e8f0/64748b?text=${b.title}" alt="${b.title}">
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
        </c:if>

    </div>
</main>

<jsp:include page="footer.jsp" />

</body>
</html>
