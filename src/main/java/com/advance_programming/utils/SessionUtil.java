package com.advance_programming.utils;

import com.advance_programming.model.UserModel;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


public class SessionUtil {

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


    public static void setAttribute(HttpServletRequest request,
                                    String key,
                                    Object value) {
        setAttribute(request, key, value, 0);
    }


    public static Object getAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return null;
        }
        return session.getAttribute(key);
    }

   

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

  
    public static boolean isUserLoggedIn(HttpServletRequest request) {
        return getAttribute(request, "user") != null;
    }


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