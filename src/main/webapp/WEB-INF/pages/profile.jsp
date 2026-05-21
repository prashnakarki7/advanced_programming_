<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%-- ADDED THIS LINE: Required to make <c:if> tags work --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile | UserHub</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Ensuring basic inline styles for the alerts just in case they are missing from profile.css */
        .alert { padding: 12px; border-radius: 6px; margin-bottom: 20px; font-weight: 500; }
        .alert-success { background-color: #dcfce7; color: #16a34a; border: 1px solid #86efac; }
        .alert-error { background-color: #fee2e2; color: #dc2626; border: 1px solid #fca5a5; }
    </style>
</head>
<body>

    <div class="upload-card">
        <h2>Update Profile</h2>
        <p class="subtitle">Personalize your user account</p>

        <!-- ========================================== -->
        <!-- DYNAMIC VALIDATION MESSAGES                -->
        <!-- ========================================== -->
        
        <%-- Checks the URL for ?success=1 --%>
        <c:if test="${param.success == '1'}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> Profile updated successfully!
            </div>
        </c:if>

        <%-- Checks the URL for ?error=... --%>
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

        <!-- ========================================== -->

        <form action="profile" method="post" enctype="multipart/form-data">
            
            <div class="preview-container">
                <i class="fas fa-user preview-placeholder" id="placeholderIcon"></i>
                <img id="imagePreview" src="#" alt="Preview" style="display: none;">
            </div>

            <div class="file-input-wrapper">
                <label for="profileImage" class="custom-file-upload">
                    <i class="fas fa-camera"></i> Change Photo
                </label>
                <input type="file" id="profileImage" name="profileImage" 
                       accept="image/*" onchange="previewFile()">
            </div>

            <div class="input-group">
                <label>First Name</label>
                <input type="text" name="firstName" value="${user.firstName}" required>
            </div>
            
            <div class="input-group">
                <label>Last Name</label>
                <input type="text" name="lastName" value="${user.lastName}" required>
            </div>

            <div class="input-group">
                <label>Date of Birth</label>
                <input type="date" name="dob" value="${user.dob}" required>
            </div>

            <div class="input-group">
                <label>Email Address</label>
                <input type="email" name="email" value="${user.email}" required>
            </div>

            <div class="input-group">
                <label>Phone Number</label>
                <input type="tel" name="number" value="${user.number}" required>
            </div>

            <button type="submit" class="btn-submit">Save Changes</button>
        </form>

        <a href="${pageContext.request.contextPath}/dashboard" class="back-link">
            <i class="fas fa-arrow-left"></i> Go to Dashboard
        </a>
    </div>

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