<%@page import="catshap.butler.dao.ProductDao"%>
<%@ page import="catshap.butler.bean.Product" %>
<%@ page import="catshap.butler.interfaces.ProductInterface" %>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.logging.Logger"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");
    Logger logger = Logger.getLogger("ProductProc");

    String category = (String)request.getParameter("category");
    if (category == null || category.isEmpty()) {
         category = "ALL";
    }
        
    ProductInterface pi = new ProductDao();
    List<Product> productList = pi.selectAll(category);
        
    request.setAttribute("productList", productList);
    
    RequestDispatcher rd = request.getRequestDispatcher("productList.jsp");
    rd.forward(request, response);
%>
