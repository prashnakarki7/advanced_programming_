<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Books | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/booklisting.css">
</head>
<body style="background-color:#f8f9fa;font-family:'Inter',sans-serif;">
    <jsp:include page="header.jsp" />
    <div class="listing-container">
        <aside class="sidebar-filter">
            <div class="filter-group">
                <h4>Categories</h4>
                <ul class="filter-list" style="list-style:none;padding:0;">
                    <li><a href="${pageContext.request.contextPath}/booklisting" style="color:#374151;text-decoration:none;font-size:0.9rem;">All Books</a></li>
                    <li><a href="${pageContext.request.contextPath}/nepaliliterature" style="color:#374151;text-decoration:none;font-size:0.9rem;">Nepali Literature</a></li>
                    <li><a href="${pageContext.request.contextPath}/romance" style="color:#374151;text-decoration:none;font-size:0.9rem;">Romance</a></li>
                    <li><a href="${pageContext.request.contextPath}/comedy" style="color:#374151;text-decoration:none;font-size:0.9rem;">Comedy</a></li>
                    <li><a href="${pageContext.request.contextPath}/horror" style="color:#374151;text-decoration:none;font-size:0.9rem;">Horror</a></li>
                </ul>
            </div>
        </aside>
        <main class="product-area">
            <div class="listing-header">
                <h2>
                    <c:choose>
                        <c:when test="${not empty books}">Showing ${books.size()} Books</c:when>
                        <c:otherwise>No Books Found</c:otherwise>
                    </c:choose>
                </h2>
            </div>
            <c:choose>
                <c:when test="${not empty books}">
                    <div class="listing-grid">
                        <c:forEach var="book" items="${books}">
                            <div class="book-card">
                                <div class="cover-placeholder">
                                    <c:choose>
                                        <c:when test="${not empty book.coverImage}">
                                            <img src="${pageContext.request.contextPath}/${book.coverImage}"
                                                 alt="${book.title}"
                                                 style="width:100%;height:200px;object-fit:cover;border-radius:6px;"
                                                 onerror="this.src='https://via.placeholder.com/150x200?text=No+Image'">
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-book" style="font-size:3rem;opacity:0.3;"></i>
                                            <h4 style="margin-top:15px;">${book.title}</h4>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="card-info">
                                    <p style="color:#6b7280;font-size:0.8rem;margin:0;">${book.author}</p>
                                    <h3 style="font-size:1rem;margin:5px 0;">${book.title}</h3>
                                    <span style="font-weight:800;font-size:1.1rem;">Rs. <fmt:formatNumber value="${book.price}" pattern="#,##0.00"/></span>
                                    <form action="${pageContext.request.contextPath}/cart" method="post">
                                        <input type="hidden" name="bookId" value="${book.bookId}">
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
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="text-align:center;padding:80px 20px;color:#888;">
                        <i class="fas fa-book-open" style="font-size:4rem;margin-bottom:20px;display:block;color:#d1d5db;"></i>
                        <h3 style="color:#374151;">No books in this category yet.</h3>
                        <p>Admin can add books from the dashboard.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </main>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>