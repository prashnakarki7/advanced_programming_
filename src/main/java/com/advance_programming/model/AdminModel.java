<<<<<<< HEAD
package com.advance_programming.model;


public class AdminModel {

    private int adminId;
    private String fullName;
    private String email;
    private String password;     // hashed
    private String phone;
    private String profileImage;
    private String createdAt;

  
    public AdminModel() {}

    public AdminModel(int adminId, String fullName, String email,
                      String password, String phone,
                      String profileImage, String createdAt) {
        this.adminId      = adminId;
        this.fullName     = fullName;
        this.email        = email;
        this.password     = password;
        this.phone        = phone;
        this.profileImage = profileImage;
        this.createdAt    = createdAt;
    }

    // ── Getters & Setters ────────────────────────────────────────────────────

    public int getAdminId()              { return adminId; }
    public void setAdminId(int adminId)  { this.adminId = adminId; }

    public String getFullName()                  { return fullName; }
    public void setFullName(String fullName)     { this.fullName = fullName; }

    public String getEmail()                     { return email; }
    public void setEmail(String email)           { this.email = email; }

    public String getPassword()                  { return password; }
    public void setPassword(String password)     { this.password = password; }

    public String getPhone()                     { return phone; }
    public void setPhone(String phone)           { this.phone = phone; }

    public String getProfileImage()                      { return profileImage; }
    public void setProfileImage(String profileImage)     { this.profileImage = profileImage; }

    public String getCreatedAt()                     { return createdAt; }
    public void setCreatedAt(String createdAt)       { this.createdAt = createdAt; }
}
=======
package com.advance_programming.model;

/**
 * AdminModel - POJO representing an administrator account for Nepal Reads.
 */
public class AdminModel {

    private int adminId;
    private String fullName;
    private String email;
    private String password;     // hashed
    private String phone;
    private String profileImage;
    private String createdAt;

    // ── Constructors ────────────────────────────────────────────────────────

    public AdminModel() {}

    public AdminModel(int adminId, String fullName, String email,
                      String password, String phone,
                      String profileImage, String createdAt) {
        this.adminId      = adminId;
        this.fullName     = fullName;
        this.email        = email;
        this.password     = password;
        this.phone        = phone;
        this.profileImage = profileImage;
        this.createdAt    = createdAt;
    }

    // ── Getters & Setters ────────────────────────────────────────────────────

    public int getAdminId()              { return adminId; }
    public void setAdminId(int adminId)  { this.adminId = adminId; }

    public String getFullName()                  { return fullName; }
    public void setFullName(String fullName)     { this.fullName = fullName; }

    public String getEmail()                     { return email; }
    public void setEmail(String email)           { this.email = email; }

    public String getPassword()                  { return password; }
    public void setPassword(String password)     { this.password = password; }

    public String getPhone()                     { return phone; }
    public void setPhone(String phone)           { this.phone = phone; }

    public String getProfileImage()                      { return profileImage; }
    public void setProfileImage(String profileImage)     { this.profileImage = profileImage; }

    public String getCreatedAt()                     { return createdAt; }
    public void setCreatedAt(String createdAt)       { this.createdAt = createdAt; }
}
>>>>>>> branch 'prashna' of https://github.com/prashnakarki7/advanced_programming_.git
