<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Explore Categories | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/categories.css">

</head>

<body>

<!-- HEADER -->
<jsp:include page="header.jsp" />

<div class="container">

    <div class="header">
        <h2>Explore Categories</h2>
        <p>Discover books by genre</p>
    </div>

    <%
        List<Map<String, String>> categories = new ArrayList<>();

        Map<String, String> horror = new HashMap<>();
        horror.put("name", "Horror");
        horror.put("desc", "Spooky and thrilling stories");
        horror.put("image", "images/books/horror.jpeg");
        categories.add(horror);

        Map<String, String> romance = new HashMap<>();
        romance.put("name", "Romance");
        romance.put("desc", "Love and emotional stories");
        romance.put("image", "images/books/romance.jpeg");
        categories.add(romance);

        Map<String, String> sciFi = new HashMap<>();
        sciFi.put("name", "Science Fiction");
        sciFi.put("desc", "Future, space and technology");
        sciFi.put("image", "images/books/scifi.jpeg");
        categories.add(sciFi);

        Map<String, String> fantasy = new HashMap<>();
        fantasy.put("name", "Fantasy");
        fantasy.put("desc", "Magic and mythical worlds");
        fantasy.put("image", "images/books/fantasy.jpeg");
        categories.add(fantasy);
        
        Map<String, String> adventure = new HashMap<>();
        adventure.put("name", "Adventure");
        adventure.put("desc", "Adventurous World");
        adventure.put("image", "images/books/adventure.jpeg");
        categories.add(adventure);
        
        Map<String, String> selfhelp = new HashMap<>();
        selfhelp.put("name", "Self Help");
        selfhelp.put("desc", "The only way is through");
        selfhelp.put("image", "images/books/selfhelp.jpeg");
        categories.add(selfhelp);
        
        Map<String, String> biography = new HashMap<>();
        biography.put("name", "Biography");
        biography.put("desc", "Real life Wisdom");
        biography.put("image", "images/books/biography.jpeg");
        categories.add(biography);

        Map<String, String> mystery = new HashMap<>();
        mystery.put("name", "Mystery");
        mystery.put("desc", "Reality to Experience");
        mystery.put("image", "images/books/mystery.jpeg");
        categories.add(mystery);

    %>

    <div class="grid">

        <% for (Map<String, String> cat : categories) { %>

        <div class="card">

            <img src="<%= request.getContextPath() + "/" + cat.get("image") %>" />

            <div class="card-content">

                <h3><%= cat.get("name") %></h3>

                <p><%= cat.get("desc") %></p>

                <a class="btn" href="category?name=<%= cat.get("name") %>">
                    Explore
                </a>

            </div>

        </div>

        <% } %>

    </div>

</div>

<!-- FOOTER -->
<jsp:include page="footer.jsp" />

</body>
</html>