<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Burger Tracker</title>
</head>
<body>
<h1>Burger Tracker</h1>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Burger Name</th>
        <th scope="col">Restaurant Name</th>
        <th scope="col">Rating(out of 5)</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <c:forEach var="burger" items="${burger}">
        <tr>
            <td> <a href="/${burger.id}"><c:out value="${burger.burgerName}"></c:out> </a> </td>
            <td> <c:out value="${burger.restaurantName}"></c:out> </td>
            <td> <c:out value="${burger.rating}"></c:out> </td>
        </tr>
    </c:forEach>
</table>

<a href="/new">Add a new Burger</a></body>
</html>