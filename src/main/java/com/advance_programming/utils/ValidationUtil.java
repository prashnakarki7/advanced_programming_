package com.advance_programming.utils;

import java.time.LocalDate;
import java.time.Period;

public class ValidationUtil {

    // Regex patterns
    private static final String NAME_REGEX = "^[a-zA-Z\\s]{2,30}$"; // 2-30 letters/spaces
    private static final String PHONE_REGEX = "^\\d{10}$";
    private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@(.+)$";
    private static final String PASS_REGEX = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=\\S+$).{8,}$";

    public static boolean isValidName(String name) {
        return name != null && name.matches(NAME_REGEX);
    }

    public static boolean isValidPhone(String phone) {
        return phone != null && phone.matches(PHONE_REGEX);
    }

    public static boolean isValidEmail(String email) {
        return email != null && email.matches(EMAIL_REGEX);
    }

    public static boolean isValidPassword(String password) {
        return password != null && password.matches(PASS_REGEX);
    }

    public static boolean isValidGender(String gender) {
        return gender != null && (gender.equalsIgnoreCase("Male") || 
                                  gender.equalsIgnoreCase("Female") || 
                                  gender.equalsIgnoreCase("Other"));
    }

    public static boolean isOver10YearsOld(String dob) {
        try {
            return Period.between(LocalDate.parse(dob), LocalDate.now()).getYears() >= 10;
        } catch (Exception e) { return false; }
    }
}