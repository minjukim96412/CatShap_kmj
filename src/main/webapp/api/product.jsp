<%@page import="catshap.butler.dao.ProductDao"%>
<%@ page contentType="application/json; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="catshap.butler.bean.Product" %>
<%@ page import="catshap.butler.interfaces.ProductInterface" %>
<%@ page import="com.google.gson.Gson" %>

<%
    response.setContentType("application/json; charset=UTF-8");

    String category = request.getParameter("prdCatname");
    if (category == null || category.isEmpty()) {
        category = "ALL";
    }

    ProductInterface pi = new ProductDao();
    List<Product> productList = pi.selectAll(category);

    Gson gson = new Gson();
    String jsonProductList = gson.toJson(productList);

    out.print(jsonProductList);
%>
