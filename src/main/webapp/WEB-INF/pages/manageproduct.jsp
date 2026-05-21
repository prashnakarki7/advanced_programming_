<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Inventory | Nepal Reads Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageproduct.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="page-bg">
    <jsp:include page="header.jsp" />
    <div class="layout">
        <nav class="sidebar">
            <div class="sidebar-header">ADMIN<span>HUB</span></div>
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-item"><i class="fas fa-th-large"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/manageuser" class="nav-item"><i class="fas fa-users"></i> Users</a>
            <a href="${pageContext.request.contextPath}/manageproduct" class="nav-item active"><i class="fas fa-book"></i> Products</a>
            <a href="${pageContext.request.contextPath}/manageorder" class="nav-item"><i class="fas fa-shopping-cart"></i> Orders</a>
            <a href="${pageContext.request.contextPath}/adminprofile" class="nav-item"><i class="fas fa-user-edit"></i> Edit Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="nav-item logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
        <div class="listing-container">
            <div class="admin-controls">
                <div>
                    <h2>Book Inventory</h2>
                    <p>Manage your book catalog, prices, and stock levels.</p>
                </div>
                <a href="${pageContext.request.contextPath}/AddProduct" class="btn-add-new">
                    <i class="fas fa-plus"></i> Add New Book
                </a>
            </div>

            <!-- ========================================== -->
            <!-- NOTIFICATION/ALERT BANNERS                 -->
            <!-- ========================================== -->
            
            <%-- URL Parameter: Book added successfully --%>
            <c:if test="${not empty param.success}">
                <div style="background:#dcfce7;border:1px solid #86efac;color:#16a34a;padding:12px 20px;border-radius:8px;margin-bottom:20px;">
                    <i class="fas fa-check-circle"></i> Book added successfully!
                </div>
            </c:if>
            
            <%-- URL Parameter: Book action cancelled by user --%>
            <c:if test="${not empty param.cancelled}">
                <div style="background:#e0f2fe;border:1px solid #bae6fd;color:#0369a1;padding:12px 20px;border-radius:8px;margin-bottom:20px;">
                    <i class="fas fa-info-circle"></i> Operation cancelled. No changes were made.
                </div>
            </c:if>
            
            <%-- URL Parameter or Session: Book deleted successfully --%>
            <c:if test="${not empty param.deleted}">
                <div style="background:#dcfce7;border:1px solid #86efac;color:#16a34a;padding:12px 20px;border-radius:8px;margin-bottom:20px;">
                    <i class="fas fa-check-circle"></i> Book deleted successfully!
                </div>
            </c:if>

            <%-- Session Attribute: Book properties altered / deleted via SessionUtil --%>
            <c:if test="${not empty sessionScope.message}">
                <div style="background:#dcfce7;border:1px solid #86efac;color:#16a34a;padding:12px 20px;border-radius:8px;margin-bottom:20px;">
                    <i class="fas fa-check-circle"></i> ${sessionScope.message}
                </div>
                <c:remove var="message" scope="session" />
            </c:if>
            
            <%-- Request Attribute Error --%>
            <c:if test="${not empty error}">
                <div style="background:#fee2e2;border:1px solid #fca5a5;color:#dc2626;padding:12px 20px;border-radius:8px;margin-bottom:20px;">
                    <i class="fas fa-exclamation-circle"></i> ${error}
                </div>
            </c:if>

            <%-- Session Attribute Error --%>
            <c:if test="${not empty sessionScope.error}">
                <div style="background:#fee2e2;border:1px solid #fca5a5;color:#dc2626;padding:12px 20px;border-radius:8px;margin-bottom:20px;">
                    <i class="fas fa-exclamation-circle"></i> ${sessionScope.error}
                </div>
                <c:remove var="error" scope="session" />
            </c:if>

            <!-- ========================================== -->
            <!-- INVENTORY TABLE AREA                       -->
            <!-- ========================================== -->
            <main class="inventory-area">
                <table class="inventory-table">
                    <thead>
                        <tr>
                            <th>Book Details</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty productList}">
                                <c:forEach var="product" items="${productList}">
                                    <tr>
                                        <td>
                                            <div class="book-info">
                                                <c:choose>
                                                    <c:when test="${not empty product.imagePath}">
                                                        <img src="${pageContext.request.contextPath}/${product.imagePath}"
                                                             alt="${product.productName}"
                                                             style="width:40px;height:55px;object-fit:cover;border-radius:4px;margin-right:12px;"
                                                             onerror="this.style.display='none';this.nextSibling.style.display='flex'">
                                                        <div class="book-icon" style="display:none;"><i class="fas fa-book"></i></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="book-icon"><i class="fas fa-book"></i></div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div>
                                                    <div class="book-title">${product.productName}</div>
                                                    <div class="book-author">${product.authorName}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${product.category}</td>
                                        <td>Rs. <fmt:formatNumber value="${product.price}" pattern="#,##0.00"/></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${product.stock > 10}">
                                                    <span class="stock-badge in-stock">${product.stock} in stock</span>
                                                </c:when>
                                                <c:when test="${product.stock > 0}">
                                                    <span class="stock-badge" style="background:#fef3c7;color:#d97706;">${product.stock} low stock</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="stock-badge" style="background:#fee2e2;color:#dc2626;">Out of stock</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="action-btns">
                                                <a href="${pageContext.request.contextPath}/editProduct?id=${product.productId}"
                                                   class="btn-edit" title="Edit Book"><i class="fas fa-edit"></i></a>
                                                
                                                <!-- Dynamic confirmation dialog via JavaScript inside onsubmit -->
                                                <form action="${pageContext.request.contextPath}/manageproduct" method="post"
                                                      style="display:inline;"
                                                      onsubmit="return confirm('Are you sure you want to permanently delete \'${product.productName}\'?')">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="productId" value="${product.productId}">
                                                    <button type="submit" class="btn-delete" title="Delete Book">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" style="text-align:center;padding:60px;color:#888;">
                                        <i class="fas fa-book-open" style="font-size:2rem;margin-bottom:15px;display:block;"></i>
                                        No books in inventory. <a href="${pageContext.request.contextPath}/AddProduct" style="color:#f472b6;font-weight:600;">Add one now</a>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </main>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>