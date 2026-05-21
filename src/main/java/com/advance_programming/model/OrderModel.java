package com.advance_programming.model;

import java.util.ArrayList;
import java.util.List;


public class OrderModel {

    private int orderId;
    private int userId;
    private String userName;      // joined for display
    private double totalAmount;
    private String status;        // "pending", "confirmed", "shipped", "delivered", "cancelled"
    private String shippingAddress;
    private String orderDate;
    
    // Holds the item summaries belonging to this order container block
    private List<OrderItemDetail> orderItems = new ArrayList<>();

 
    public static class OrderItemDetail {
        private String bookTitle;
        private int quantity;

        public String getBookTitle() { return bookTitle; }
        public void setBookTitle(String bookTitle) { this.bookTitle = bookTitle; }
        public int getQuantity() { return quantity; }
        public void setQuantity(int quantity) { this.quantity = quantity; }
    }



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

    public List<OrderItemDetail> getOrderItems() { return orderItems; }
    public void setOrderItems(List<OrderItemDetail> orderItems) { this.orderItems = orderItems; }
}
