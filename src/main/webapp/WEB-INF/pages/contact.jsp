<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Nepal Reads</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
</head>
<body>

    <jsp:include page="header.jsp" />

    <section class="contact-wrapper">
        <div class="contact-details">
            <h1>Let's Talk.</h1>
            <p>Have questions about a specific title or your recent order? Reach out and we'll get back to you within 24 hours.</p>

            <div class="contact-method">
                <div class="icon-box"><i class="fas fa-phone-alt"></i></div>
                <div class="method-text">
                    <h4>Phone Support</h4>
                    <span>+977 9851418678</span>
                </div>
            </div>

            <div class="contact-method">
                <div class="icon-box"><i class="fas fa-envelope"></i></div>
                <div class="method-text">
                    <h4>Email Inquiries</h4>
                    <span>hello@nepalreads.com</span>
                </div>
            </div>

            <div class="contact-method">
                <div class="icon-box"><i class="fas fa-map-marker-alt"></i></div>
                <div class="method-text">
                    <h4>Our Main Store</h4>
                    <span>Lakeside-6, Pokhara, Nepal</span>
                </div>
            </div>
        </div>

        <div class="contact-card">
            <c:if test="${not empty errorMessage}">
                <div class="alert-box alert-error" style="background-color: #fef2f2; color: #991b1b; padding: 15px; border-radius: 8px; border: 1px solid #fca5a5; margin-bottom: 20px; font-weight: 600; font-size: 0.9rem;">
                    <i class="fas fa-exclamation-circle" style="margin-right: 8px;"></i> ${errorMessage}
                </div>
            </c:if>
            
            <c:if test="${not empty successMessage}">
                <div class="alert-box alert-success" style="background-color: #f0fdf4; color: #166534; padding: 15px; border-radius: 8px; border: 1px solid #86efac; margin-bottom: 20px; font-weight: 600; font-size: 0.9rem;">
                    <i class="fas fa-check-circle" style="margin-right: 8px;"></i> ${successMessage}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/contact" method="POST">
                <div class="form-grid">
                    <div class="input-group">
                        <label>Your Name</label>
                        <input type="text" name="userName" placeholder="Name" value="${typedName}" required>
                    </div>
                    <div class="input-group">
                        <label>Email Address</label>
                        <input type="email" name="userEmail" placeholder="name@email.com" value="${typedEmail}" required>
                    </div>
                    <div class="input-group full-width">
                        <label>Subject</label>
                        <input type="text" name="userSubject" placeholder="What is this about?" value="${typedSubject}" required>
                    </div>
                    <div class="input-group full-width">
                        <label>Your Message</label>
                        <textarea name="userMessage" rows="6" placeholder="Write your message here..." required>${typedMessage}</textarea>
                    </div>
                </div>
                <button type="submit" class="submit-btn">Send Message</button>
            </form>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

</body>
</html>