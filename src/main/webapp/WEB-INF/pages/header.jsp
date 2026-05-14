<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<header style="background:#ffffff;border-bottom:1px solid #e5e7eb;padding:12px 0;
               position:sticky;top:0;z-index:1000;font-family:'Inter',sans-serif;">
    <div style="max-width:1400px;margin:0 auto;display:flex;align-items:center;
                justify-content:space-between;padding:0 20px;">

        <!-- Logo -->
        <div class="logo">
            <a href="${pageContext.request.contextPath}/home"
               style="text-decoration:none;color:#000;font-weight:900;font-size:1.5rem;letter-spacing:-1px;">
                nepal<span style="color:#f472b6;">reads</span>
            </a>
        </div>

        <!-- Search Bar (public – no login required) -->
        <div style="flex:0 1 500px;position:relative;">
            <form action="${pageContext.request.contextPath}/search" method="get">
                <input type="text" name="q" placeholder="What do you want to read?"
                       style="width:100%;background:#f3f4f6;border:1px solid #ddd;
                              padding:10px 20px;border-radius:8px;font-size:0.9rem;outline:none;">
                <button type="submit"
                        style="position:absolute;right:5px;top:50%;transform:translateY(-50%);
                               background:none;border:none;cursor:pointer;">
                    <i class="fas fa-search" style="color:#9ca3af;"></i>
                </button>
            </form>
        </div>

        <!-- Navigation Actions -->
        <div style="display:flex;gap:25px;align-items:center;font-size:1.2rem;">

            <%-- BUG FIX 1: Cart link – protected, but icon visible to all.
                 The filter handles the redirect-to-login if not authenticated. --%>
            <a href="${pageContext.request.contextPath}/cart"
               style="color:#4b5563;text-decoration:none;position:relative;">
                <i class="fas fa-shopping-basket"></i>
                <c:if test="${not empty sessionScope.cart}">
                    <span style="position:absolute;top:-8px;right:-8px;background:#f472b6;
                                 color:white;border-radius:50%;font-size:0.7rem;
                                 padding:2px 5px;font-weight:bold;">
                        ${sessionScope.cart.size()}
                    </span>
                </c:if>
            </a>

            <%-- Wishlist icon (visible to all; filter redirects if not logged in) --%>
            <a href="${pageContext.request.contextPath}/wishlist"
               style="color:#4b5563;text-decoration:none;">
                <i class="fas fa-heart"></i>
            </a>

            <%-- BUG FIX 2: Auth display –
                 sessionScope.user is a UserModel object, NOT a String.
                 Use the correct property (e.g. .firstName or .username) from UserModel.
                 BUG FIX 3: login link points to /login servlet, not login.jsp --%>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <div style="display:flex;align-items:center;gap:15px;">
                        <%-- Use the actual field name from UserModel; adjust if different --%>
                        <a href="${pageContext.request.contextPath}/profile"
                           style="font-size:0.9rem;font-weight:600;color:#111;text-decoration:none;">
                            Hi, ${sessionScope.user.firstName}
                        </a>
                        <a href="${pageContext.request.contextPath}/logout"
                           style="text-decoration:none;color:#f472b6;font-weight:700;font-size:0.9rem;">
                            Logout
                        </a>
                    </div>
                </c:when>
                <c:when test="${not empty sessionScope.admin}">
                    <div style="display:flex;align-items:center;gap:15px;">
                        <a href="${pageContext.request.contextPath}/admin/dashboard"
                           style="font-size:0.9rem;font-weight:600;color:#111;text-decoration:none;">
                            Admin Panel
                        </a>
                        <a href="${pageContext.request.contextPath}/logout"
                           style="text-decoration:none;color:#f472b6;font-weight:700;font-size:0.9rem;">
                            Logout
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login"
                       style="text-decoration:none;color:#000;font-weight:700;font-size:0.9rem;
                              border:1.5px solid #000;padding:6px 15px;border-radius:6px;transition:0.3s;">
                        Login
                    </a>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</header>
