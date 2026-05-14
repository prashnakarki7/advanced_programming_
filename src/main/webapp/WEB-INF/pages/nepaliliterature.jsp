<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nepali Literature | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nepaliliterature.css">
</head>
<body>
    <jsp:include page="header.jsp" /> 

    <main class="genre-container">
        <h2 class="genre-title">Nepali Literature Collection</h2>
        
        <div class="genre-page-grid">
            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/nepali1.jpg" alt="Muna Madan">
                </div>
                <div class="card-info">
                    <p class="author">Laxmi Prasad Devkota</p>
                    <h3>Muna Madan</h3>
                    <span class="price">Rs. 450</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/nepali2.jpg" alt="Palpasa Cafe">
                </div>
                <div class="card-info">
                    <p class="author">Narayan Wagle</p>
                    <h3>Palpasa Cafe</h3>
                    <span class="price">Rs. 650</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/nepali3.jpg" alt="Seto Dharti">
                </div>
                <div class="card-info">
                    <p class="author">Amar Neupane</p>
                    <h3>Seto Dharti</h3>
                    <span class="price">Rs. 550</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/nepali4.jpg" alt="Karnali Blues">
                </div>
                <div class="card-info">
                    <p class="author">Buddhisagar</p>
                    <h3>Karnali Blues</h3>
                    <span class="price">Rs. 600</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/nepali5.jpg" alt="Sumnima">
                </div>
                <div class="card-info">
                    <p class="author">B.P. Koirala</p>
                    <h3>Sumnima</h3>
                    <span class="price">Rs. 400</span>
                    <form action="cart" method="post">
                        <button type="submit" class="add-btn-submit">Add to Cart</button>
                    </form>
                </div>
            </div>

            <div class="book-card">
                <div class="book-img-container">
                    <img src="${pageContext.request.contextPath}/images/books/nepali6.jpg" alt="Sirish Ko Phool">
                </div>
                <div class="card-info">
                    <p class="author">Parijat</p>
                    <h3>Sirish Ko Phool</h3>
                    <span class="price">Rs. 500</span>
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