package com.advance_programming.service;

import com.advance_programming.DAO.UserDAO;
import com.advance_programming.utils.PasswordUtil;

public class RegisterService {
    public boolean addUser(String firstName, String lastName, String username, String dob,
                           String gender, String email, String number, String password) throws Exception {
        
        
        String hashed = PasswordUtil.getHashPassword(password);
        
        // Create DAO inside the method to ensure it's always fresh
        UserDAO dao = new UserDAO();
        return dao.insertUser(firstName, lastName, username, dob, gender, email, number, hashed);
    }
}