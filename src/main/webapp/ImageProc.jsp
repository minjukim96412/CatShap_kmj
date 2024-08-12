<%@page import="catshap.butler.bean.Image"%>
<%@page import="catshap.butler.dao.ImageDao"%>
<%@page import="catshap.butler.interfaces.ImageInterface"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<%
	ImageInterface ii = new ImageDao();
	List<Image> listImage = ii.selectImage();
	RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
	System.out.print(listImage);
	request.setAttribute("listImage", listImage);
	
	rd.forward(request, response);
%>