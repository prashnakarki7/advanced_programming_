<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Books | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/booklisting.css">
    <style>
        .book-img-container img { width:100%; height:220px; object-fit:cover; border-radius:8px; }
        .book-img-container { background:#f3f4f6; border-radius:8px; overflow:hidden; }
        .empty-state { text-align:center; padding:80px 20px; color:#6b7280; }
        .empty-state i { font-size:3rem; display:block; margin-bottom:14px; color:#d1d5db; }
    </style>
</head>
<body style="background-color:#f8f9fa;">

    <jsp:include page="header.jsp" />

    <div class="listing-container">

        <!-- SIDEBAR FILTER -->
        <aside class="sidebar-filter">
            <form method="get" action="${pageContext.request.contextPath}/booklisting">
                <div class="filter-group">
                    <h4>Categories</h4>
                    <ul class="filter-list">
                        <li><a href="${pageContext.request.contextPath}/booklisting">All Books</a></li>
                        <li><a href="${pageContext.request.contextPath}/booklisting?genre=Fiction">Fiction</a></li>
                        <li><a href="${pageContext.request.contextPath}/horror">Horror</a></li>
                        <li><a href="${pageContext.request.contextPath}/romance">Romance</a></li>
                        <li><a href="${pageContext.request.contextPath}/comedy">Comedy</a></li>
                        <li><a href="${pageContext.request.contextPath}/nepaliliterature">Nepali Literature</a></li>
                        <li><a href="${pageContext.request.contextPath}/booklisting?genre=Science">Science</a></li>
                        <li><a href="${pageContext.request.contextPath}/booklisting?genre=History">History</a></li>
                        <li><a href="${pageContext.request.contextPath}/booklisting?genre=Business">Business</a></li>
                        <li><a href="${pageContext.request.contextPath}/booklisting?genre=Kids">Kids</a></li>
                        <li><a href="${pageContext.request.contextPath}/booklisting?genre=Self+Help">Self Help</a></li>
                    </ul>
                </div>
            </form>
        </aside>

        <!-- MAIN CONTENT -->
        <main class="books-main">
            <div class="listing-header">
                <h2>
                    <c:choose>
                        <c:when test="${not empty selectedGenre}">${selectedGenre} Books</c:when>
                        <c:otherwise>All Books</c:otherwise>
                    </c:choose>
                </h2>
                <span style="color:#6b7280;font-size:.9rem">${books.size()} book(s) found</span>
            </div>

            <c:choose>
                <c:when test="${empty books}">
                    <div class="empty-state">
                        <i class="fas fa-book-open"></i>
                        <p>No books found
                            <c:if test="${not empty selectedGenre}"> in the "${selectedGenre}" category</c:if>.
                        </p>
                        <a href="${pageContext.request.contextPath}/booklisting" style="color:#2563eb">View all books</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="books-grid">
                        <c:forEach var="b" items="${books}">
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
                                <small style="color:#9ca3af">${b.genre}</small>
                                <span class="price" style="display:block;margin:6px 0;font-weight:800;font-size:1.1rem">Rs. ${b.price}</span>
                                <c:choose>
                                    <c:when test="${b.stock > 0}">
                                        <form action="${pageContext.request.contextPath}/cart" method="post">
                                            <input type="hidden" name="bookId" value="${b.bookId}">
                                            <input type="hidden" name="action" value="add">
                                            <c:choose>
                                                <c:when test="${not empty sessionScope.user}">
                                                    <button type="submit" class="add-btn">Add to Cart</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" class="add-btn"
                                                        onclick="window.location='${pageContext.request.contextPath}/login?next=%2Fcart'">
                                                        Add to Cart
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="add-btn" disabled style="background:#9ca3af;cursor:not-allowed">Out of Stock</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </main>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
