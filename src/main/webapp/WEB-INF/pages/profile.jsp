<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile | StudentHub</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    

  
</head>
<body>

    <div class="upload-card">
        <h2>Update Profile</h2>
        <p class="subtitle">Personalize your student account</p>

        <c:if test="${not empty message}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> ${message}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i> ${error}
            </div>
        </c:if>

        <form action="profile" method="post" enctype="multipart/form-data">
            
            <div class="preview-container">
                <i class="fas fa-user preview-placeholder" id="placeholderIcon"></i>
                <img id="imagePreview" src="#" alt="Preview">
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
            
            <!-- INSERTED CODE -->
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

        <a href="${pageContext.request.contextPath}/pages/adminDashboard.jsp" class="back-link">
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