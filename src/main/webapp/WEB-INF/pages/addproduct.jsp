<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book | Nepal Reads Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageuser.css">
    <style>
        .product-card { background:#fff;padding:40px;border-radius:12px;box-shadow:0 4px 6px -1px rgba(0,0,0,0.05);width:100%;border:1px solid #f3f4f6; }
        .form-group { margin-bottom:24px; }
        .form-row { display:grid;grid-template-columns:1fr 1fr;gap:30px; }
        label { display:block;font-weight:600;margin-bottom:10px;color:#374151;font-size:15px; }
        input, select, textarea { width:100%;padding:14px;border:1px solid #d1d5db;border-radius:10px;font-size:15px;outline:none;font-family:inherit; }
        input:focus, select:focus, textarea:focus { border-color:#ec4899;box-shadow:0 0 0 3px rgba(236,72,153,0.1); }
        textarea { resize:vertical;min-height:120px; }
        .form-actions { margin-top:40px;display:flex;gap:20px;justify-content:flex-end; }
        .btn-save { background:#ec4899;color:white;border:none;padding:14px 35px;border-radius:10px;font-weight:700;cursor:pointer; }
        .btn-save:hover { background:#db2777; }
        .btn-cancel { background:#f3f4f6;color:#4b5563;border:1px solid #d1d5db;padding:14px 35px;border-radius:10px;text-decoration:none;font-weight:600; }
        .image-preview { width:120px;height:160px;object-fit:cover;border-radius:8px;border:2px solid #e5e7eb;margin-top:10px;display:none; }
        .image-preview-placeholder { width:120px;height:160px;background:#f3f4f6;border-radius:8px;border:2px dashed #d1d5db;display:flex;align-items:center;justify-content:center;flex-direction:column;color:#9ca3af;cursor:pointer; }
        .upload-area { display:flex;gap:20px;align-items:flex-start;flex-wrap:wrap; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="layout">
        <nav class="sidebar">
            <div class="sidebar-header">ADMIN<span>HUB</span></div>
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-item"><i class="fas fa-th-large"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/manageuser" class="nav-item"><i class="fas fa-users"></i> Users</a>
            <a href="${pageContext.request.contextPath}/manageproduct" class="nav-item active"><i class="fas fa-book"></i> Products</a>
            <a href="${pageContext.request.contextPath}/manageorder" class="nav-item"><i class="fas fa-shopping-cart"></i> Orders</a>
            <a href="${pageContext.request.contextPath}/profile" class="nav-item"><i class="fas fa-user-edit"></i> Edit Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="nav-item logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
        <div class="main-content">
            <div class="container">
                <div class="dashboard-header">
                    <h1 class="page-title">Add New Book</h1>
                    <p class="subtitle">Enter the details below to list a new book in the store.</p>
                </div>

                <c:if test="${not empty param.error}">
                    <div style="background:#fee2e2;border:1px solid #fca5a5;color:#dc2626;padding:14px 20px;border-radius:8px;margin-bottom:20px;">
                        <i class="fas fa-exclamation-circle"></i>
                        <c:choose>
                            <c:when test="${param.error == 'db'}">Failed to save book to database. Please try again.</c:when>
                            <c:otherwise>An error occurred. Please try again.</c:otherwise>
                        </c:choose>
                    </div>
                </c:if>

                <div class="product-card">
                    <form action="${pageContext.request.contextPath}/AddProduct" method="post" enctype="multipart/form-data">

                        <!-- Book Cover Image Upload -->
                        <div class="form-group">
                            <label>Book Cover Image</label>
                            <div class="upload-area">
                                <div>
                                    <div class="image-preview-placeholder" id="imgPlaceholder" onclick="document.getElementById('bookImage').click()">
                                        <i class="fas fa-camera" style="font-size:1.5rem;margin-bottom:8px;"></i>
                                        <span style="font-size:0.8rem;">Click to upload</span>
                                    </div>
                                    <img id="imagePreview" class="image-preview" alt="Preview">
                                </div>
                                <div style="flex:1;">
                                    <input type="file" id="bookImage" name="bookImage" accept="image/*"
                                           style="display:none;" onchange="previewImage(this)">
                                    <label for="bookImage" style="display:inline-block;background:#f3f4f6;border:1px solid #d1d5db;padding:10px 20px;border-radius:8px;cursor:pointer;font-weight:600;margin-bottom:10px;">
                                        <i class="fas fa-upload"></i> Choose Image
                                    </label>
                                    <p style="font-size:0.8rem;color:#6b7280;margin-top:5px;">
                                        Supported: JPG, PNG, WEBP (max 5MB)<br>
                                        Or enter an image URL below:
                                    </p>
                                    <input type="text" name="imageUrl" placeholder="https://example.com/book-cover.jpg"
                                           style="margin-top:8px;">
                                </div>
                            </div>
                        </div>

                        <!-- Book Title -->
                        <div class="form-group">
                            <label for="title">Book Title *</label>
                            <input type="text" id="title" name="title" placeholder="e.g., Palpasa Café" required>
                        </div>

                        <!-- Author and Category -->
                        <div class="form-row">
                            <div class="form-group">
                                <label for="author">Author *</label>
                                <input type="text" id="author" name="author" placeholder="Author name" required>
                            </div>
                            <div class="form-group">
                                <label for="category">Category *</label>
                                <select id="category" name="category" required>
                                    <option value="">Select Category</option>
                                    <option value="Fiction">Fiction</option>
                                    <option value="Nepali Literature">Nepali Literature</option>
                                    <option value="Romance">Romance</option>
                                    <option value="Comedy">Comedy</option>
                                    <option value="Horror">Horror</option>
                                    <option value="Business">Business</option>
                                    <option value="Self Help">Self Help</option>
                                    <option value="Biography">Biography</option>
                                    <option value="Science Fiction">Science Fiction</option>
                                    <option value="Mystery">Mystery</option>
                                </select>
                            </div>
                        </div>

                        <!-- Price and Stock -->
                        <div class="form-row">
                            <div class="form-group">
                                <label for="price">Price (Rs.) *</label>
                                <input type="number" id="price" name="price" min="0" step="0.01" placeholder="e.g. 450" required>
                            </div>
                            <div class="form-group">
                                <label for="stock">Stock Quantity *</label>
                                <input type="number" id="stock" name="stock" min="0" placeholder="e.g. 50" required>
                            </div>
                        </div>

                        <!-- Description -->
                        <div class="form-group">
                            <label for="description">Book Description</label>
                            <textarea id="description" name="description" placeholder="A brief summary of the book..."></textarea>
                        </div>

                        <div class="form-actions">
                            <a href="${pageContext.request.contextPath}/manageproduct" class="btn-cancel">Cancel</a>
                            <button type="submit" class="btn-save"><i class="fas fa-save"></i> Save Book</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
    <script>
        function previewImage(input) {
            const preview = document.getElementById('imagePreview');
            const placeholder = document.getElementById('imgPlaceholder');
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                    placeholder.style.display = 'none';
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</body>
</html>