<%@page import="catshap.img.interfaces.ImageInterface"%>
<%@page import="catshap.img.bean.Image"%>
<%@page import="java.util.List"%>
<%@page import="catshap.img.interfaces.ImageInterfaceImpl"%>
<%@page import="catshap.img.dao.ImageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ImageInterface ii = new ImageDao();
	List<Image> listImage = ii.selectImage();
	RequestDispatcher rd = request.getRequestDispatcher("catMain.jsp");
	System.out.print(listImage);
	request.setAttribute("listImage", listImage);
	
	rd.forword(request, response);
%>