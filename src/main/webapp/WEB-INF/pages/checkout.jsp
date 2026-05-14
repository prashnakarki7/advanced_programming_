
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/checkout.css">

</head>
<body>
<jsp:include page="header.jsp" />

<div class="wrapper">

<h1>Checkout</h1>

<div class="checkout-box">

<!-- Smaller Shipping Box -->
<div class="left-box">

<h2>Shipping Details</h2>

<form action="placeOrder" method="post">

<input type="text"
name="fullName"
placeholder="Full Name">

<input type="text"
name="phone"
placeholder="Phone Number">

<input type="text"
name="address"
placeholder="Address">

<input type="text"
name="city"
placeholder="City">

<select name="payment">
<option>Cash On Delivery</option>
<option>eSewa</option>
<option>Khalti</option>
</select>

<button type="submit">
Place Order
</button>

</form>

</div>


<!-- Dynamic Order Summary -->
<div class="right-box">

<h2>Order Summary</h2>

<c:choose>

<c:when test="${not empty cartItems}">

<c:forEach var="item" items="${cartItems}">

<div class="line">
<span>
${item.title} x${item.quantity}
</span>

<span>
NPR ${item.price * item.quantity}
</span>
</div>

</c:forEach>

<hr>

<div class="line total">
<span>Total</span>
<span>NPR ${cartTotal}</span>
</div>

</c:when>

<c:otherwise>

<p>Your cart is empty.</p>

</c:otherwise>

</c:choose>

</div>

</div>

</div>
<jsp:include page="footer.jsp" />

</body>
</html>