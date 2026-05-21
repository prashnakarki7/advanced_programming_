<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer style="background: #000000; color: #ffffff; padding: 80px 0 40px; margin-top: 100px; font-family: 'Inter', sans-serif;">
    <div style="max-width: 1400px; margin: 0 auto; display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 40px; padding: 0 20px;">
        
        <div>
            <h4 style="color: #f472b6; font-size: 0.8rem; letter-spacing: 1.5px; margin-bottom: 25px; text-transform: uppercase;">Genres</h4>
            <ul style="list-style: none; padding: 0; margin: 0;">
                <li style="margin-bottom: 12px;">
                    <a href="${pageContext.request.contextPath}/nepaliliterature" style="color: #ccc; text-decoration: none; font-size: 0.9rem;">Nepali Literature</a>
                </li>
                <li style="margin-bottom: 12px;">
                    <a href="${pageContext.request.contextPath}/comedy" style="color: #ccc; text-decoration: none; font-size: 0.9rem;">Comedy</a>
                </li>
                <li style="margin-bottom: 12px;">
                    <a href="${pageContext.request.contextPath}/romance" style="color: #ccc; text-decoration: none; font-size: 0.9rem;">Romance</a>
                </li>
                <li style="margin-bottom: 12px;">
                    <a href="${pageContext.request.contextPath}/horror" style="color: #ccc; text-decoration: none; font-size: 0.9rem;">Horror</a>
                </li>
            </ul>
        </div>

        <div>
            <h4 style="color: #f472b6; font-size: 0.8rem; letter-spacing: 1.5px; margin-bottom: 25px; text-transform: uppercase;">Support</h4>
            <ul style="list-style: none; padding: 0; margin: 0;">
                <li style="margin-bottom: 12px;">
                    <a href="${pageContext.request.contextPath}/aboutus" style="color: #ccc; text-decoration: none; font-size: 0.9rem;">About Us</a>
                </li>
                <li style="margin-bottom: 12px;">
                    <a href="${pageContext.request.contextPath}/contact" style="color: #ccc; text-decoration: none; font-size: 0.9rem;">Contact Us</a>
                </li>
                <li style="margin-bottom: 12px;">
                    <a href="${pageContext.request.contextPath}/booklisting" style="color: #ccc; text-decoration: none; font-size: 0.9rem;">Browse All Books</a>
                </li>
                <li style="margin-bottom: 12px;">
                    <a href="${pageContext.request.contextPath}/faqs" style="color: #ccc; text-decoration: none; font-size: 0.9rem;">FAQs</a>
                </li>
            </ul>
        </div>

        <div>
            <h4 style="color: #f472b6; font-size: 0.8rem; letter-spacing: 1.5px; margin-bottom: 25px; text-transform: uppercase;">Connect With Us</h4>
            <div style="display: flex; gap: 20px; font-size: 1.5rem; margin-top: 10px;">
                <a href="https://facebook.com" target="_blank" style="color: #fff;"><i class="fab fa-facebook"></i></a>
                <a href="https://instagram.com" target="_blank" style="color: #fff;"><i class="fab fa-instagram"></i></a>
                <a href="https://twitter.com" target="_blank" style="color: #fff;"><i class="fab fa-twitter"></i></a>
                <a href="https://tiktok.com" target="_blank" style="color: #fff;"><i class="fab fa-tiktok"></i></a>
            </div>
            <p style="margin-top: 20px; font-size: 0.85rem; color: #888;">Follow us for daily book recommendations and updates.</p>
        </div>

        <div>
            <h4 style="color: #f472b6; font-size: 0.8rem; letter-spacing: 1.5px; margin-bottom: 25px; text-transform: uppercase;">Newsletter</h4>
            <p style="font-size: 0.85rem; color: #888; margin-bottom: 15px;">Join our community for exclusive deals.</p>
            <div style="display: flex; gap: 5px;">
                <input type="email" placeholder="Email" style="background: #1a1a1a; border: 1px solid #333; color: #fff; padding: 10px; border-radius: 4px; flex: 1; outline: none;">
                <button style="background: #f472b6; border: none; color: #fff; padding: 0 15px; border-radius: 4px; cursor: pointer;">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </div>
        </div>
    </div>

    <div style="border-top: 1px solid #1a1a1a; margin-top: 60px; padding-top: 30px; text-align: center; color: #4b5563; font-size: 0.8rem;">
        &copy; 2026 Nepal Reads. All rights reserved. Made for Book Lovers.
    </div>
</footer>