package com.advance_programming.utils;

import com.advance_programming.model.UserModel;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 * SessionUtil – Centralizes all HttpSession operations.
 * Updated to support role-based authorization for the AdminFilter.
 */
public class SessionUtil {

    // ── Write ─────────────────────────────────────────────────────────────────

    /**
     * Stores an attribute in the session.
     */
    public static void setAttribute(HttpServletRequest request,
                                    String key,
                                    Object value,
                                    int maxAgeSeconds) {
        HttpSession session = request.getSession(true);
        if (maxAgeSeconds > 0) {
            session.setMaxInactiveInterval(maxAgeSeconds);
        }
        session.setAttribute(key, value);
    }

    /**
     * Overload using default timeout.
     */
    public static void setAttribute(HttpServletRequest request,
                                    String key,
                                    Object value) {
        setAttribute(request, key, value, 0);
    }

    // ── Read ──────────────────────────────────────────────────────────────────

    /**
     * Retrieves an attribute from the existing session.
     */
    public static Object getAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return null;
        }
        return session.getAttribute(key);
    }

    // ── Remove ────────────────────────────────────────────────────────────────

    public static void removeAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(key);
        }
    }

    // ── Destroy ───────────────────────────────────────────────────────────────

    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }

    // ── Updated Convenience Checks ────────────────────────────────────────────

    /** 
     * Returns true if any user (Admin or Regular) is currently logged in. 
     */
    public static boolean isUserLoggedIn(HttpServletRequest request) {
        return getAttribute(request, "user") != null;
    }

    /** 
     * Returns true if the logged-in user has the "admin" role. 
     * This checks the internal role property set by UserDAO.
     */
    public static boolean isAdminLoggedIn(HttpServletRequest request) {
        Object userObj = getAttribute(request, "user");
        
        if (userObj instanceof UserModel) {
            UserModel user = (UserModel) userObj;
            // Checks the "admin" string assigned in your UserDAO logic
            return user.getRole() != null && "admin".equalsIgnoreCase(user.getRole());
        }
        return false;
    }
}