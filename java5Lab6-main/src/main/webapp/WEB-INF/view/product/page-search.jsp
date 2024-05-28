<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		.pagination {
			text-align: center;
			margin-top: 20px;
		}
		.pagination a {
			padding: 8px;
			text-decoration: none;
			margin-right: 10px;
			background-color: #f2f2f2;
			color: black;
			border: 1px solid #ddd;
		}
		.pagination a:hover {
			background-color: #ddd;
		}
		.pagination .active {
			background-color: #4CAF50;
			color: white;
			border: 1px solid #4CAF50;
		}
	</style>
</head>
<body>
<form action="/product/search-and-page" method="post">
<input name="keywords" value="${keywords}">
<button>Search</button>
	</form>
	<table border="1" style="width:100%">
		<c:forEach var="item" items="${page.content}">
			<tr>
				<td>${item.id }</td>
				<td>${item.name }</td>
				<td>${item.image }</td>
				<td>${item.price }</td>
				<td>${item.createDate }</td>
				<td>${item.categoryId }</td>
			</tr>
		</c:forEach>
	</table>
	<div class="pagination">
		<a href="/product/search-and-page?p=0">First</a>
		<a href="/product/search-and-page?p=${page.number-1}">Previous</a>
		<a href="/product/search-and-page?p=${page.number+1}">Next</a>
		<a href="/product/search-and-page?p=${page.totalPages-1}">Last</a>
	</div>
	<ul>
		<li>Số thực thể hiện tại: ${page.numberOfElements}</li>
		<li>Trang số: ${page.number}</li>
		<li>Kích thước trang: ${page.size}</li>
		<li>Tổng số thực thể: ${page.totalElements}</li>
		<li>Tổng số trang: ${page.totalPages}</li>
	</ul>

</body>
</html>