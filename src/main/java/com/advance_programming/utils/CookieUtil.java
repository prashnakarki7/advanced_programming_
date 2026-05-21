package com.advance_programming.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class CookieUtil {


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


    public static void deleteCookie(HttpServletResponse response, String name) {
        addCookie(response, name, "", 0);
    }
}
