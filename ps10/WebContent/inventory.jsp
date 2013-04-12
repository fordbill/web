<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<title>Hello USER!</title>
</head>
<script>
	function loadXMLDoc() {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("itemsDiv").innerHTML = xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET", "GetItems", true);
		xmlhttp.send();
	}
</script>
<body>
	<div class="user">
		<h1 align="center">Welcome User</h1>

		<form id="form1" name="form1" method="post" action="index.jsp">
			<input type="submit" name="Logout" id="logout" value="Logout" />
		</form>

		<table>
			<tr>
				<th>Category</th>
				<th>Description</th>
				<th>Value</th>
				<th>Serial #</th>
				<th>Date</th>
			</tr>

		</table>
		<div id="itemsDiv">
			<h2>Home Inventory</h2>
		</div>
		<button type="button" onclick="loadXMLDoc()">load inventory</button>
	</div>
</body>
</html>
