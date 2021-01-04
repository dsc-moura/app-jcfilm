<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>

	<s:url value="/resources/css" var="cssPath"/>
	<s:url value="/resources/js" var="jsPath"/>
	<s:url value="/resources/img" var="imgPath"/>
	
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
	<link rel="stylesheet" href="${cssPath}/menu.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css">
	
	<style>
		#centro {
		 	width:350px;
   			height:250px;
   			position:absolute;
		    top:50%;
		    left:50%;
		    margin-top:-110px;
		    margin-left:-50px;
		}
	</style>

</head>
<body>
	<div class="page-wrapper chiller-theme toggled">
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<main class="page-content">		
		<div class="container-fluid">
				<img alt="logo-jcfilm" src="${imgPath}/logo-jcfilm.jpg" id="centro">
			</div>
		</main>
	</div>
	
	<script type="text/javascript" src="${jsPath}/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${jsPath}/bootstrap.min.js"></script>
	<script type="text/javascript" src="${jsPath}/menu.js"></script>
   
	 
</body>
</html>