<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Comedy Collection | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/comedy.css">
</head>
<body>
    <jsp:include page="header.jsp" /> 

    <main class="genre-container">
        <h2 class="genre-title">Comedy Collection</h2>
        
        <div class="genre-page-grid">
            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/comedy1.jpg" alt="Comedy 1">
                </div>
                <div class="card-info">
                    <p class="author">Author 1</p>
                    <h3>Funny Story</h3>
                    <span class="price">Rs. 850</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/comedy2.jpg" alt="Comedy 2">
                </div>
                <div class="card-info">
                    <p class="author">Author 2</p>
                    <h3>Born a Crime</h3>
                    <span class="price">Rs. 950</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/comedy3.jpg" alt="Comedy 3">
                </div>
                <div class="card-info">
                    <p class="author">Author 3</p>
                    <h3>Me Talk Pretty One Day</h3>
                    <span class="price">Rs. 700</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/comedy4.jpg" alt="Comedy 4">
                </div>
                <div class="card-info">
                    <p class="author">Author 4</p>
                    <h3>Is Everyone Hanging Out?</h3>
                    <span class="price">Rs. 1100</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/comedy5.jpg" alt="Comedy 5">
                </div>
                <div class="card-info">
                    <p class="author">Author 5</p>
                    <h3>The Hitchhiker's Guide</h3>
                    <span class="price">Rs. 1200</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/comedy6.jpg" alt="Comedy 6">
                </div>
                <div class="card-info">
                    <p class="author">Author 6</p>
                    <h3>Bossypants</h3>
                    <span class="price">Rs. 900</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>