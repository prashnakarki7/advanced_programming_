package com.advance_programming.model;

/**
 * OrderModel - POJO representing a placed order in Nepal Reads.
 */
public class OrderModel {

    private int orderId;
    private int userId;
    private String userName;      // joined for display
    private double totalAmount;
    private String status;        // "pending", "confirmed", "shipped", "delivered", "cancelled"
    private String shippingAddress;
    private String orderDate;
    private String updatedAt;

    // ── Constructors ────────────────────────────────────────────────────────

    public OrderModel() {}

    public OrderModel(int orderId, int userId, String userName,
                      double totalAmount, String status,
                      String shippingAddress, String orderDate) {
        this.orderId         = orderId;
        this.userId          = userId;
        this.userName        = userName;
        this.totalAmount     = totalAmount;
        this.status          = status;
        this.shippingAddress = shippingAddress;
        this.orderDate       = orderDate;
    }

    // ── Getters & Setters ────────────────────────────────────────────────────

    public int getOrderId()                  { return orderId; }
    public void setOrderId(int orderId)      { this.orderId = orderId; }

    public int getUserId()                   { return userId; }
    public void setUserId(int userId)        { this.userId = userId; }

    public String getUserName()                  { return userName; }
    public void setUserName(String userName)     { this.userName = userName; }

    public double getTotalAmount()                   { return totalAmount; }
    public void setTotalAmount(double totalAmount)   { this.totalAmount = totalAmount; }

    public String getStatus()                    { return status; }
    public void setStatus(String status)         { this.status = status; }

    public String getShippingAddress()                       { return shippingAddress; }
    public void setShippingAddress(String shippingAddress)   { this.shippingAddress = shippingAddress; }

    public String getOrderDate()                     { return orderDate; }
    public void setOrderDate(String orderDate)       { this.orderDate = orderDate; }

    public String getUpdatedAt()                     { return updatedAt; }
    public void setUpdatedAt(String updatedAt)       { this.updatedAt = updatedAt; }
}
