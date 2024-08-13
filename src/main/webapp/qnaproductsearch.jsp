<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="catshap.butler.bean.QnaProduct"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Search</title>
    <script>
        function selectProduct(prodNo, prodName) {
            window.opener.selectProduct(prodNo, prodName);
            window.close();
        }
    </script>
</head>
<body>
    <h1>Product Search</h1>
    <form method="get" action="${pageContext.request.contextPath}/searchProduct">
        <input type="text" name="keyword" placeholder="Search">
        <button type="submit">Search</button>
    </form>

    <!-- 검색 결과 출력 -->
    <c:if test="${not empty products}">
        <h2>Search Results:</h2>
        <ul>
            <c:forEach var="product" items="${products}">
                <li>${product.prodName} (${product.prodNo})
                    <button type="button" onclick="selectProduct(${product.prodNo}, '${product.prodName}')">선택</button>
                </li>
            </c:forEach>
        </ul>
    </c:if>
</body>
</html>
