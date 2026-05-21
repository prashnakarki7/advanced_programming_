<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Book | Admin Hub</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editproduct.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Added styles for the alert banners -->
    <style>
        .alert {
            padding: 12px 16px;
            margin-bottom: 20px;
            border-radius: 6px;
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .alert-success {
            color: #0f5132;
            background-color: #d1e7dd;
            border: 1px solid #badbcc;
        }
        .alert-danger {
            color: #842029;
            background-color: #f8d7da;
            border: 1px solid #f5c2c7;
        }
    </style>
</head>
<body style="background-color: #f9fafb; padding: 20px;">

    <div class="edit-form-container">
        <h2 class="form-title">Edit Book Details</h2>

        <!-- ========================================== -->
        <!-- SUCCESS & ERROR MESSAGE BLOCK              -->
        <!-- ========================================== -->
        <c:if test="${not empty sessionScope.message}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> 
                <span>${sessionScope.message}</span>
            </div>
            <c:remove var="message" scope="session" />
        </c:if>

        <c:if test="${not empty sessionScope.error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle"></i> 
                <span>${sessionScope.error}</span>
            </div>
            <c:remove var="error" scope="session" />
        </c:if>
        <!-- ========================================== -->

        <form action="${pageContext.request.contextPath}/editProduct" method="post" enctype="multipart/form-data">
            
            <input type="hidden" name="productId" value="${product.productId}">
            <input type="hidden" name="existingImagePath" value="${product.imagePath}">
            
            <div class="form-grid">
                
                <div class="form-group full-width" style="text-align: center; margin-bottom: 30px;">
                    <label>Current Cover Image</label>
                    <div style="width: 140px; height: 190px; margin: 10px auto; border-radius: 10px; overflow: hidden; border: 1px solid #e5e7eb; background: #f3f4f6; display: flex; align-items: center; justify-content: center;">
                        <c:choose>
                            <c:when test="${not empty product.imagePath}">
                                <img src="${pageContext.request.contextPath}/${product.imagePath}" style="width: 100%; height: 100%; object-fit: cover;" alt="Book Cover">
                            </c:when>
                            <c:otherwise>
                                <i class="fas fa-book" style="font-size: 2.5rem; color: #9ca3af;"></i>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="form-group full-width">
                    <label for="coverImage">Upload New Cover Image</label>
                    <input type="file" id="coverImage" name="coverImage" accept="image/*">
                </div>

                <div class="form-group">
                    <label>Book Title</label>
                    <input type="text" name="productName" value="${product.productName}" required>
                </div>
                
                <div class="form-group">
                    <label>Author Name</label>
                    <input type="text" name="authorName" value="${product.authorName}" required>
                </div>

                <div class="form-group">
                    <label>Genre / Category</label>
                    <input type="text" name="category" value="${product.category}" required>
                </div>

                <div class="form-group">
                    <label>Price (Rs.)</label>
                    <input type="number" step="0.01" name="price" value="${product.price}" required>
                </div>

                <div class="form-group full-width">
                     <label>Stock Level</label>
                     <input type="number" name="stock" value="${product.stock}" required>
                </div>

                <div class="form-group full-width">
                    <label>Description</label>
                    <textarea name="description" rows="4">${product.description}</textarea>
                </div>

                <div class="form-group full-width" style="margin-top: 20px;">
                    <button type="submit" class="btn-save">Save Changes</button>
                    <a href="${pageContext.request.contextPath}/manageproduct" class="btn-cancel">Cancel</a>
                </div>

            </div>
        </form>
    </div>

</body>
</html>