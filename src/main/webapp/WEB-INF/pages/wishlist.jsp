<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>

<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Wishlist | Nepal Reads</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/wishlist.css">

</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="container">

        <%
            List wishlist = (List) request.getAttribute("wishlistItems");

            if (wishlist == null) {
                wishlist = new ArrayList();
            }
        %>

        <!-- HEADER -->
        <header class="wishlist-header">

            <div class="header-content">

                <span class="badge">
                    Personal Collection
                </span>

                <h1>My Wishlist</h1>

                <p>
                    You have
                    <strong><%= wishlist.size() %></strong>
                    stories waiting for a home.
                </p>

            </div>

        </header>

        <!-- EMPTY WISHLIST -->
        <% if (wishlist.isEmpty()) { %>

            <div class="empty-wishlist">

                <div class="heart-icon">
                    🤍
                </div>

                <h2>Your wishlist is empty</h2>

                <p>
                    Explore our collection and save the books
                    that speak to you.
                </p>

                <a href="index.jsp" class="btn-primary">
                    Browse Books
                </a>

            </div>

        <% } else { %>

            <!-- WISHLIST GRID -->
            <div class="wishlist-grid">

                <%
                    for (Object obj : wishlist) {

                        Map item = (Map) obj;
                %>

                <!-- CARD -->
                <div class="wishlist-card">

                    <div class="image-box">

                        <img
                            src="<%= request.getContextPath() + "/" + item.get("image") %>"
                            alt="<%= item.get("title") %>">

                        <!-- REMOVE -->
                        <form action="RemoveFromWishlist"
                              method="post"
                              class="remove-form">

                            <input type="hidden"
                                   name="id"
                                   value="<%= item.get("id") %>">

                            <button type="submit"
                                    class="remove-icon-btn"
                                    title="Remove">
                                &times;
                            </button>

                        </form>

                    </div>

                    <!-- DETAILS -->
                    <div class="card-details">

                        <h3 class="item-title">
                            <%= item.get("title") %>
                        </h3>

                        <p class="item-author">
                            <%= item.get("author") %>
                        </p>

                        <div class="item-price">
                            NPR <%= item.get("price") %>
                        </div>

                        <!-- MOVE TO CART -->
                        <form action="AddToCart"
                              method="post">

                            <input type="hidden"
                                   name="id"
                                   value="<%= item.get("id") %>">

                            <button type="submit"
                                    class="add-cart-btn">
                                Move to Cart
                            </button>

                        </form>

                    </div>

                </div>

                <% } %>

            </div>

        <% } %>

    </main>

    <jsp:include page="footer.jsp" />

</body>

</html>