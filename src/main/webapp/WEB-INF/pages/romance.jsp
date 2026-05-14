<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <h2 class="romance-title">ROMANCE COLLECTION</h2>
        
        <div class="genre-page-grid">
            <div class="book-card">
                <div class="book-img-container"><img src="images/books/rom1.jpg" alt="Book 1"></div>
                <div class="card-info">
                    <h3>Summer Love</h3><span class="price">Rs. 900</span>
                    <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form>
                </div>
            </div>
            <div class="book-card">
                <div class="book-img-container"><img src="images/books/rom2.jpg" alt="Book 2"></div>
                <div class="card-info">
                    <h3>Saaya</h3><span class="price">Rs. 850</span>
                    <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form>
                </div>
            </div>
            <div class="book-card">
                <div class="book-img-container"><img src="images/books/rom3.jpg" alt="Book 3"></div>
                <div class="card-info">
                    <h3>The Love Hypothesis</h3><span class="price">Rs. 750</span>
                    <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container"><img src="images/books/rom4.jpg" alt="Book 4"></div>
                <div class="card-info">
                    <h3>It Ends With Us</h3><span class="price">Rs. 920</span>
                    <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form>
                </div>
            </div>
            <div class="book-card">
                <div class="book-img-container"><img src="images/books/rom5.jpg" alt="Book 5"></div>
                <div class="card-info">
                    <h3>Me Before You</h3><span class="price">Rs. 1100</span>
                    <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form>
                </div>
            </div>
            <div class="book-card">
                <div class="book-img-container"><img src="images/books/rom6.jpg" alt="Book 6"></div>
                <div class="card-info">
                    <h3>The Fault in our Stars</h3><span class="price">Rs. 990</span>
                    <form action="cart" method="post"><button type="submit" class="add-btn-submit">Add to Cart</button></form>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>