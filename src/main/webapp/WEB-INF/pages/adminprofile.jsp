<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile | Admin Hub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageproduct.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminprofile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="page-bg">
    <jsp:include page="header.jsp" />
    
    <div class="layout">
        <!-- ADMIN SIDEBAR -->
        <nav class="sidebar">
            <div class="sidebar-header">ADMIN<span>HUB</span></div>
            <a href="${pageContext.request.contextPath}/dashboard" class="nav-item"><i class="fas fa-th-large"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/manageuser" class="nav-item"><i class="fas fa-users"></i> Users</a>
            <a href="${pageContext.request.contextPath}/manageproduct" class="nav-item active"><i class="fas fa-book"></i> Products</a>
            <a href="${pageContext.request.contextPath}/manageorder" class="nav-item"><i class="fas fa-shopping-cart"></i> Orders</a>
            <a href="${pageContext.request.contextPath}/adminprofile" class="nav-item"><i class="fas fa-user-edit"></i> Edit Profile</a>
            <a href="${pageContext.request.contextPath}/logout" class="nav-item logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>

        <!-- MAIN CONTENT AREA -->
        <div class="listing-container">
            <div class="admin-profile-container">
                <div>
                    <h2>Admin Profile Details</h2>
                    <p class="subtitle">Update your administrator account information.</p>
                </div>

                <!-- DYNAMIC VALIDATION MESSAGES -->
                <c:if test="${param.success == '1'}">
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle"></i> Profile updated successfully!
                    </div>
                </c:if>

                <c:if test="${not empty param.error}">
                    <div class="alert alert-error">
                        <i class="fas fa-exclamation-circle"></i> 
                        <c:choose>
                            <c:when test="${param.error == 'database'}">Unable to save changes to the database.</c:when>
                            <c:when test="${param.error == 'system'}">A system error occurred. Please try again.</c:when>
                            <c:otherwise>An unexpected error occurred.</c:otherwise>
                        </c:choose>
                    </div>
                </c:if>

                <!-- CARD FRAMING WRAPPER -->
                <div class="admin-profile-card">
                    <form action="adminProfile" method="post" enctype="multipart/form-data">
                        
                        <div class="preview-container">
                            <i class="fas fa-user-shield preview-placeholder" id="placeholderIcon"></i>
                            <img id="imagePreview" src="#" alt="Preview" style="display: none;">
                        </div>

                        <div class="file-input-wrapper">
                            <label for="profileImage" class="custom-file-upload">
                                <i class="fas fa-camera"></i> Change Admin Photo
                            </label>
                            <input type="file" id="profileImage" name="profileImage" 
                                   accept="image/*" onchange="previewFile()">
                        </div>

                        <!-- TWO-COLUMN FIELD ROW -->
                        <div class="admin-form-row">
                            <div class="input-group">
                                <label>First Name</label>
                                <input type="text" name="firstName" value="${adminUser.firstName}" required>
                            </div>
                            
                            <div class="input-group">
                                <label>Last Name</label>
                                <input type="text" name="lastName" value="${adminUser.lastName}" required>
                            </div>
                        </div>

                        <div class="input-group">
                            <label>Date of Birth</label>
                            <input type="date" name="dob" value="${adminUser.dob}" required>
                        </div>

                        <div class="input-group">
                            <label>Email Address</label>
                            <input type="email" name="email" value="${adminUser.email}" required>
                        </div>

                        <div class="input-group">
                            <label>Phone Number</label>
                            <input type="tel" name="number" value="${adminUser.number}" required>
                        </div>

                        <button type="submit" class="btn-submit">Save Admin Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />

    <script>
        function previewFile() {
            const preview = document.getElementById('imagePreview');
            const file = document.querySelector('input[name=profileImage]').files[0];
            const reader = new FileReader();
            const placeholder = document.getElementById('placeholderIcon');

            reader.onloadend = function () {
                preview.src = reader.result;
                preview.style.display = 'block';
                placeholder.style.display = 'none';
            }

            if (file) {
                reader.readAsDataURL(file);
            }
        }
    </script>
</body>
</html>