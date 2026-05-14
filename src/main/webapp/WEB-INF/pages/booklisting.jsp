<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>All Books | Nepal Reads</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/booklisting.css">

</head>

<body style="background-color: #f8f9fa;">

    <jsp:include page="header.jsp" />

    <div class="listing-container">

        <!-- SIDEBAR -->
        <aside class="sidebar-filter">

            <div class="filter-group">

                <h4>Categories</h4>

                <ul class="filter-list">
                    <li><input type="checkbox"> Fiction</li>
                    <li><input type="checkbox"> Nepali Literature</li>
                    <li><input type="checkbox"> Business</li>
                    <li><input type="checkbox"> Self Help</li>
                    <li><input type="checkbox"> Kids & Teens</li>
                </ul>

            </div>

            <div class="filter-group">

                <h4>Price Range</h4>

                <ul class="filter-list">
                    <li><input type="checkbox"> Under Rs. 500</li>
                    <li><input type="checkbox"> Rs. 500 - Rs. 1000</li>
                    <li><input type="checkbox"> Rs. 1000 - Rs. 2000</li>
                    <li><input type="checkbox"> Above Rs. 2000</li>
                </ul>

            </div>

            <div class="filter-group">

                <h4>Language</h4>

                <ul class="filter-list">
                    <li><input type="checkbox"> English</li>
                    <li><input type="checkbox"> Nepali</li>
                </ul>

            </div>

        </aside>

        <!-- PRODUCT AREA -->
        <main class="product-area">

            <div class="listing-header">

                <h2>Showing 120 Books</h2>

                <select class="sort-select">
                    <option>Sort by: Newest Arrivals</option>
                    <option>Price: Low to High</option>
                    <option>Price: High to Low</option>
                    <option>Most Popular</option>
                </select>

            </div>

            <!-- BOOK GRID -->
            <div class="listing-grid">

                <!-- BOOK 1 -->
                <div class="book-card">

                    <div class="cover-placeholder">
                        <i class="fas fa-book"
                           style="font-size:3rem; opacity:0.3;"></i>

                        <h4 style="margin-top:15px;">
                            Palpasa Café
                        </h4>
                    </div>

                    <div class="card-info">

                        <p style="color:#6b7280; font-size:0.8rem; margin:0;">
                            Narayan Wagle
                        </p>

                        <h3 style="font-size:1rem; margin:5px 0;">
                            Palpasa Café
                        </h3>

                        <span style="font-weight:800; font-size:1.1rem;">
                            Rs. 450
                        </span>

                        <button class="add-btn">
                            Add to Cart
                        </button>

                    </div>

                </div>

                <!-- BOOK 2 -->
                <div class="book-card">

                    <div class="cover-placeholder">
                        <i class="fas fa-book"
                           style="font-size:3rem; opacity:0.3;"></i>

                        <h4 style="margin-top:15px;">
                            Muna Madan
                        </h4>
                    </div>

                    <div class="card-info">

                        <p style="color:#6b7280; font-size:0.8rem; margin:0;">
                            Laxmi Prasad Devkota
                        </p>

                        <h3 style="font-size:1rem; margin:5px 0;">
                            Muna Madan
                        </h3>

                        <span style="font-weight:800; font-size:1.1rem;">
                            Rs. 150
                        </span>

                        <button class="add-btn">
                            Add to Cart
                        </button>

                    </div>

                </div>

            </div>

            <!-- PAGINATION -->
            <div style="margin-top: 50px;
                        text-align: center;
                        display: flex;
                        justify-content: center;
                        gap: 10px;">

                <button style="padding:10px 15px;">
                    1
                </button>

                <button style="padding:10px 15px;">
                    2
                </button>

                <button style="padding:10px 15px;">
                    3
                </button>

                <button style="padding:10px 20px;
                               background:black;
                               color:white;
                               border:none;">
                    Next
                </button>

            </div>

        </main>

    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>