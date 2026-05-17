<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
                        <button class="hero-btn">Shop Now</button>
                    </div>
                </div>
            </div>
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/slider_2.jpeg" class="slide-img" alt="Banner 2">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <span class="hero-badge">Best Sellers 2026</span>
                        <h2>The World of <br>Modern Fiction</h2>
                        <button class="hero-btn">Explore Now</button>
                    </div>
                </div>
            </div>
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/banner3.jpg" class="slide-img" alt="Banner 3">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <span class="hero-badge">New Arrivals</span>
                        <h2>Knowledge at <br>Your Fingertips</h2>
                        <button class="hero-btn">View Deals</button>
                    </div>
                </div>
            </div>
            <div class="slide">
                <img src="${pageContext.request.contextPath}/images/books/banner1.jpg" class="slide-img" alt="Banner 1">
                <div class="hero-overlay"></div>
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
            <h2 class="section-title">Best Sellers</h2>
            <a href="#" class="view-all">View All</a>
        </div>
        
        <div class="book-grid">
            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/the_alchemist.jpg" alt="The Alchemist" onerror="this.src='https://via.placeholder.com/200x300?text=The+Alchemist'">
                </div>
                <div class="card-info">
                    <p class="author">Paulo Coelho</p>
                    <h3>The Alchemist</h3>
                    <span class="price">Rs. 850</span>
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="add-cart-form">
                        <input type="hidden" name="bookId" value="BK101">
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

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/hari_bahadur.jpg" alt="Hari Bahadur" onerror="this.src='https://via.placeholder.com/200x300?text=Hari+Bahadur'">
                </div>
                <div class="card-info">
                    <p class="author">Madan Krishna Shrestha</p>
                    <h3>Hari Bahadur</h3>
                    <span class="price">Rs. 650</span>
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="add-cart-form">
                        <input type="hidden" name="bookId" value="BK102">
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

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/it_ends_with_us.jpg" alt="It Ends With Us" onerror="this.src='https://via.placeholder.com/200x300?text=It+Ends+With+Us'">
                </div>
                <div class="card-info">
                    <p class="author">Colleen Hoover</p>
                    <h3>It Ends With Us</h3>
                    <span class="price">Rs. 920</span>
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="add-cart-form">
                        <input type="hidden" name="bookId" value="BK103">
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

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/a_little_life.jpg" alt="A Little Life" onerror="this.src='https://via.placeholder.com/200x300?text=A+Little+Life'">
                </div>
                <div class="card-info">
                    <p class="author">Hanya Yanagihara</p>
                    <h3>A Little Life</h3>
                    <span class="price">Rs. 1,150</span>
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="add-cart-form">
                        <input type="hidden" name="bookId" value="BK104">
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
        </div>

        <div class="section-header">
            <h2 class="section-title">New Arrivals</h2>
            <a href="#" class="view-all">View All</a>
        </div>
        
        <div class="book-grid">
            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/the_summer_i_turned_pretty.jpg" alt="The Summer I Turned Pretty" onerror="this.src='https://via.placeholder.com/200x300?text=Summer+Pretty'">
                </div>
                <div class="card-info">
                    <p class="author">Jenny Han</p>
                    <h3>The Summer I Turned Pretty</h3>
                    <span class="price">Rs. 880</span>
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="add-cart-form">
                        <input type="hidden" name="bookId" value="BK201">
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

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/better_than_movies.webp" alt="Better Than The Movies" onerror="this.src='https://via.placeholder.com/200x300?text=New+Book+A'">
                </div>
                <div class="card-info">
                    <p class="author">Lynn Painter</p>
                    <h3>Better Than The Movies</h3>
                    <span class="price">Rs. 750</span>
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="add-cart-form">
                        <input type="hidden" name="bookId" value="BK202">
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

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/Karnali_Blues.jpg" alt="Karnali Blues" onerror="this.src='https://via.placeholder.com/200x300?text=New+Book+B'">
                </div>
                <div class="card-info">
                    <p class="author">Buddhi Sagar</p>
                    <h3>Karnali Blues</h3>
                    <span class="price">Rs. 990</span>
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="add-cart-form">
                        <input type="hidden" name="bookId" value="BK203">
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

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/palpasa_cafe.jpg" alt="Palpasa Cafe" onerror="this.src='https://via.placeholder.com/200x300?text=New+Book+C'">
                </div>
                <div class="card-info">
                    <p class="author">Narayan Wagle</p>
                    <h3>Palpasa Cafe</h3>
                    <span class="price">Rs. 1,250</span>
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="add-cart-form">
                        <input type="hidden" name="bookId" value="BK204">
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
        </div>
    </div>
</main>

<jsp:include page="footer.jsp" />

</body>
</html>