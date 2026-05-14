
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discover Books | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
</head>
<body>

<jsp:include page="header.jsp" />

<main class="container">
    <%
        String query = request.getParameter("q");
        if (query == null) query = "";

        List books = (List) request.getAttribute("books");
        if (books == null) books = new ArrayList();
    %>

    <header class="search-header">
        <div class="header-content">
            <span class="badge">Discovery Mode</span>
            <h1>Search Results</h1>
            <p>We found <strong><%= books.size() %></strong> gems for <span class="query-text">"<%= query %>"</span></p>
        </div>
    </header>

    <% if (books.isEmpty()) { %>
        <div class="no-results">
            <div class="empty-icon">📖</div>
            <h2>A quiet shelf...</h2>
            <p>We couldn't find matches for that specific keyword. <br> Perhaps try searching for a genre or a different author?</p>
            <a href="index.jsp" class="btn-secondary">Go Back Home</a>
        </div>
    <% } else { %>
        <div class="book-grid">
            <%
                for (Object obj : books) {
                    Map book = (Map) obj;
            %>
            <div class="book-card">
                <div class="image-container">
                    <img src="<%= request.getContextPath() + "/" + book.get("image") %>" alt="<%= book.get("title") %>">
                    <div class="hover-overlay">
                        <span class="overlay-text">Click to explore</span>
                    </div>
                </div>

                <div class="card-body">
                    <h3 class="book-title"><%= book.get("title") %></h3>
                    <p class="book-author">by <%= book.get("author") %></p>
                    <div class="price-tag">NPR <%= book.get("price") %></div>
                    <a href="<%= request.getContextPath() %>/book?id=<%= book.get("id") %>" class="view-btn">View Details</a>
                </div>
            </div>
            <% } %>
        </div>
    <% } %>
</main>

<jsp:include page="footer.jsp" />

</body>
</html>