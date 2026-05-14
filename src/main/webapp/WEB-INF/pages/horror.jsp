<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Horror Collection | Nepal Reads</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/horror.css">
</head>
<body>
    <jsp:include page="header.jsp" /> 

    <main class="horror-container">
        <h2 class="horror-title">Horror Collection</h2>
        
        <div class="genre-page-grid">
            <div class="book-card">
                <div class="book-img-container"><img src="${pageContext.request.contextPath}/images/books/horror1.jpg" alt="Horror 1"></div>
                <div class="card-info"><h3>The IT</h3><span class="price">Rs. 1100</span>
                <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form></div>
            </div>
            <div class="book-card">
                <div class="book-img-container"><img src="${pageContext.request.contextPath}/images/books/horror2.jpg" alt="Horror 2"></div>
                <div class="card-info"><h3>The Shining</h3><span class="price">Rs. 950</span>
                <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form></div>
            </div>
            <div class="book-card">
                <div class="book-img-container"><img src="${pageContext.request.contextPath}/images/books/horror3.jpg" alt="Horror 3"></div>
                <div class="card-info"><h3>Dracula</h3><span class="price">Rs. 800</span>
                <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form></div>
            </div>
            <div class="book-card">
                <div class="book-img-container"><img src="${pageContext.request.contextPath}/images/books/horror4.jpg" alt="Horror 4"></div>
                <div class="card-info"><h3>The Exorcist</h3><span class="price">Rs. 1050</span>
                <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form></div>
            </div>
            <div class="book-card">
                <div class="book-img-container"><img src="${pageContext.request.contextPath}/images/books/horror5.jpg" alt="Horror 5"></div>
                <div class="card-info"><h3>Bird Box</h3><span class="price">Rs. 920</span>
                <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form></div>
            </div>
            <div class="book-card">
                <div class="book-img-container"><img src="${pageContext.request.contextPath}/images/books/horror6.jpg" alt="Horror 6"></div>
                <div class="card-info"><h3>Mexican Gothic</h3><span class="price">Rs. 1200</span>
                <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form></div>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>