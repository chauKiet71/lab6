<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product</title>
</head>
<body>
<table border="1" style="width:100%">
    <tr>
        <th>Loại hàng</th>
        <th>Tổng giá</th>
        <th>Số sản phẩm</th>
    </tr>
    <c:forEach var="item" items="${items}">
        <tr>
            <td>${item.group.name}</td>
            <td>${item.sum}</td>
            <td>${item.count}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
