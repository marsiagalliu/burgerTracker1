<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Burger</title>
</head>
<body>
<h1>New Burger</h1>
<%--@elvariable id="burger" type="java"--%>
<form:form action="/" method="post" modelAttribute="burger">
    <p>
        <form:label path="burgerName">Burger Name</form:label>
        <form:errors path="burgerName" class="text-danger"/>
        <form:input path="burgerName"/>
    </p>
    <p>
        <form:label path="restaurantName">Restaurant Name</form:label>
        <form:errors path="restaurantName" class="text-danger"/>
        <form:input path="restaurantName"/>
    </p>
    <p>
        <form:label path="rating">Rating(out of five)</form:label>
        <form:errors path="rating" class="text-danger"/>
        <form:input type="number" path="rating"/>
    </p>
    <p>
        <form:label path="notes">Notes</form:label>
        <form:errors path="notes" class="text-danger"/>
        <form:textarea  path="notes"/>
    </p>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>