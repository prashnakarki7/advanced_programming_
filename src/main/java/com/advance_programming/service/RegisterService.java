package com.advance_programming.service;

import com.advance_programming.DAO.UserDAO;
import com.advance_programming.utils.PasswordUtil;

public class RegisterService {
    UserDAO dao = new UserDAO();

    // REMOVED: programId from the parameter list
    public void addUser(String firstName, String lastName, String username, String dob,
                           String gender, String email, String number, String password) throws Exception {
        
        // 1. Hash the password before sending it to the DAO
        // Ensure your PasswordUtil method name is correct (e.g., getHashPassword or hashPassword)
        String hashedPassword = PasswordUtil.getHashPassword(password); 
    	
        // 2. Call the DAO's insert method without the programId
        dao.insertUser(firstName, lastName, username, dob, gender, email, number, hashedPassword);
    }
}