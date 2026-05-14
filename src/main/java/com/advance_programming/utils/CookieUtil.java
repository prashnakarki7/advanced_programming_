package com.advance_programming.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * CookieUtil - Centralises all cookie operations for Nepal Reads.
 *
 * Cookies used in the application:
 *   "last_login"      – records the timestamp of the user's last login
 *   "remembered_user" – stores email when "Remember Me" is checked
 */
public class CookieUtil {

    // ── Write ─────────────────────────────────────────────────────────────────

    /**
     * Adds (or overwrites) a cookie on the response.
     *
     * @param response      current HTTP response
     * @param name          cookie name
     * @param value         cookie value
     * @param maxAgeSeconds positive value = lifetime in seconds;
     *                      0 = delete immediately;
     *                      -1 = session cookie (deleted on browser close)
     */
    public static void addCookie(HttpServletResponse response,
                                 String name,
                                 String value,
                                 int maxAgeSeconds) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAgeSeconds);
        cookie.setPath("/");          // visible to all paths under the app
        cookie.setHttpOnly(true);     // not accessible via JavaScript
        response.addCookie(cookie);
    }

    // ── Read ──────────────────────────────────────────────────────────────────

    /**
     * Returns the value of the first cookie matching {@code name}, or
     * {@code null} if no such cookie exists on the request.
     *
     * @param request current HTTP request
     * @param name    cookie name to look up
     * @return cookie value, or {@code null}
     */
    public static String getCookieValue(HttpServletRequest request, String name) {
        if (request.getCookies() == null) {
            return null;
        }
        for (Cookie c : request.getCookies()) {
            if (name.equals(c.getName())) {
                return c.getValue();
            }
        }
        return null;
    }

    // ── Delete ────────────────────────────────────────────────────────────────

    /**
     * Instructs the browser to delete the named cookie by setting its
     * max-age to 0.
     *
     * @param response current HTTP response
     * @param name     cookie name to remove
     */
    public static void deleteCookie(HttpServletResponse response, String name) {
        addCookie(response, name, "", 0);
    }
}
