<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css">
<title>Hello ${credentials.firstName} !</title>
</head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" ></script>    
<script>
	var currentOffset = 0;
	function getInventory(offset) {
		$.get('Getitems', {
			offset : offset,
			filter : $('#filter').val()
		}, refresh);
	}
	
	function refresh(result) {
		var contents = "<tr><th>Category</th><th>Description</th><th>Value</th>"
				+ "<th>Serial Number</th><th>Date</th><th>Picture</th></tr>";

		for ( var i = 0; i < result.Items.length; i++) {
			contents += "<tr><td>" + result.Items[i].category + "</td><td>"
					+ result.Items[i].description + "</td><td class='alnright'>"
					+ result.Items[i].value + "</td><td>"
					+ result.Items[i].purchasedate+ "</td><td>"
					+ result.Items[i].warrantydate+ "</td><td>"
					+ result.Items[i].maintencedate + "</td><td>"
					+ result.Items[i].vendorphone + "</td><td>"
					+ result.Items[i].vendor + "</td><td>"
					+ result.Items[i].picture + "</td><td>"
					+ result.Items[i].serial + "</td></tr>\n";

		}
		$('#invtable').html(contents);
		if (result.atBottom) {
			$('#next').attr('disabled', 'disabled');
		} else {
			$('#next').removeAttr('disabled');
		}
		if (result.atTop) {
			$('#previous').attr('disabled', 'disabled');
		} else {
			$('#previous').removeAttr('disabled');
		}
		currentOffset = result.newOffset;

	}
	// Go to next batch
	function next () {
		getInventory(currentOffset+1);
	}

	// Go to previous batch
	function prev () {
		getInventory(currentOffset-1);
	}
	
</script>
<body onload="getInventory(0);">
	<div class="user">
		<h1 align="center">Welcome ${credentials.firstName}</h1>

		<form id="form1" name="form1" method="post" action="index.jsp">
			<input type="submit" name="Logout" id="logout" value="Logout" />
		</form>
		<h2>Home Inventory</h2>
		<p>
			Search: <input type="text" id="filter" size="10"
				onKeyUp="getInventory(0);" />
		</p>
		<table border="1" id="invtable"></table>
		<p>
			<input type="button" value="Next" id="next" onclick="next();" />
		
			<input type="button" value="Previous" id="previous" onclick="prev();" />
		</p>

	</div>
</body>
</html>
