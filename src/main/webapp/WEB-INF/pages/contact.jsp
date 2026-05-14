<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
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
            <form action="ContactServlet" method="POST">
                <div class="form-grid">
                    <div class="input-group">
                        <label>Your Name</label>
                        <input type="text" name="userName" placeholder="Name" required>
                    </div>
                    <div class="input-group">
                        <label>Email Address</label>
                        <input type="email" name="userEmail" placeholder="name@email.com" required>
                    </div>
                    <div class="input-group full-width">
                        <label>Subject</label>
                        <input type="text" name="subject" placeholder="What is this about?" required>
                    </div>
                    <div class="input-group full-width">
                        <label>Your Message</label>
                        <textarea name="message" rows="6" placeholder="Write your message here..." required></textarea>
                    </div>
                </div>
                <button type="submit" class="submit-btn">Send Message</button>
            </form>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

</body>
</html>