<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Product</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}
		h1 {
			text-align: center;
			margin-top: 20px;
		}
		form {
			text-align: center;
			margin-bottom: 20px;
		}
		input[type="text"] {
			padding: 8px;
			width: 150px;
			margin: 5px;
		}
		button {
			padding: 8px 16px;
			background-color: #4CAF50;
			color: white;
			border: none;
			cursor: pointer;
		}
		button:hover {
			background-color: #45a049;
		}
		table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 20px;
		}
		th, td {
			border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}
		th {
			background-color: #f2f2f2;
		}
		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
	</style>
</head>
<body>
<h1>Search By Price</h1>
<form action="/product/search" method="post">
	<input type="text" name="min" placeholder="Min price?">
	<input type="text" name="max" placeholder="Max price?">
	<button type="submit">Tìm kiếm</button>
</form>
<table border="1" style="width: 100%">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Image</th>
		<th>Price</th>
		<th>Create Date</th>
		<th>CategoryID</th>
	</tr>
	<c:forEach var="itemm" items="${items}">
		<tr>
			<td>${itemm.id }</td>
			<td>${itemm.name }</td>
			<td>${itemm.image }</td>
			<td>${itemm.price }</td>
			<td>${itemm.createDate }</td>
			<td>${itemm.categoryId }</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>
