<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Inventory | Nepal Reads Admin</title>
    
    <!-- External CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageproduct.css">
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="page-bg">

    <!-- Header -->
    <jsp:include page="header.jsp" />

    <div class="layout">
        <!-- Sidebar -->
        <nav class="sidebar">
            <div class="sidebar-header">
                ADMIN<span>HUB</span>
            </div>
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-item"><i class="fas fa-th-large"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/manageuser" class="nav-item"><i class="fas fa-users"></i> USERS</a>
            <a href="${pageContext.request.contextPath}/manageproduct"  class="nav-item"><i class="fas fa-box"></i> Products</a>
            <a href="${pageContext.request.contextPath}/manageorder" class="nav-item"><i class="fas fa-box"></i> Orders</a>
            <a href="${pageContext.request.contextPath}/profile" class="nav-item"><i class="fas fa-user-edit"></i> Edit Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="nav-item logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>

        <!-- Main Content -->
        <div class="listing-container">
            <div class="admin-controls">
                <div>
                    <h2>Product Inventory</h2>
                    <p>Manage your book catalog, prices, and stock levels.</p>
                </div>
                <a href="${pageContext.request.contextPath}/AddProduct" class="btn-add-new">
                    <i class="fas fa-plus"></i> Add New Book
                </a>
            </div>

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
                        <!-- Example Row 1 -->
                        <tr>
                            <td>
                                <div class="book-info">
                                    <div class="book-icon"><i class="fas fa-book"></i></div>
                                    <div>
                                        <div class="book-title">Palpasa Café</div>
                                        <div class="book-author">Narayan Wagle</div>
                                    </div>
                                </div>
                            </td>
                            <td>Fiction</td>
                            <td>Rs. 450</td>
                            <td><span class="stock-badge in-stock">42 in stock</span></td>
                            <td>
                                <div class="action-btns">
                                    <button class="btn-edit" title="Edit Product"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete" title="Delete Product" onclick="return confirm('Are you sure you want to delete this book?')"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>

                        <!-- Example Row 2 -->
                        <tr>
                            <td>
                                <div class="book-info">
                                    <div class="book-icon"><i class="fas fa-book"></i></div>
                                    <div>
                                        <div class="book-title">Muna Madan</div>
                                        <div class="book-author">Laxmi Prasad Devkota</div>
                                    </div>
                                </div>
                            </td>
                            <td>Nepali Literature</td>
                            <td>Rs. 150</td>
                            <td><span class="stock-badge in-stock">105 in stock</span></td>
                            <td>
                                <div class="action-btns">
                                    <button class="btn-edit" title="Edit Product"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete" title="Delete Product" onclick="return confirm('Are you sure you want to delete this book?')"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div class="pagination">
                    <p>Showing 1-10 of 120 books</p>
                    <div class="pagination-controls">
                        <button class="btn-page">Previous</button>
                        <button class="btn-page active">Next</button>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>