<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script>
	$(document).ready(function() {
		// wait for the DOM to be loaded 
		$(document).ready(function() {
			$('#loginform').ajaxForm(function() {
				// if logged in the hide the login variables and show the userloggedin
			});
		});

		$('#username').keypress(function(event) {
			var max = 15;
			var len = $(this).val().length;

			if (event.which < 0x20) {
				// e.which < 0x20, then it's not a printable character
    	      // e.which === 0 - Not a character
    	      return; // Do nothing
    	    }

    	    if (len >= max) {
				event.preventDefault();
			}

		});

		$('#username').keyup(function(event) {
			var max = 15;
			var len = $(this).val().length;
			var char = max - len;

			$('#textleft1').text(char + ' characters left');

		});

	});
</script>

<title>Welcome!</title>
</head>

<body>
	<div class="Welcome">


		<h1 align="center">WELCOME</h1>

		<form id="loginform" name="loginform" method="post" action="inventory.jsp">
			<table>
				<tr>
					<td><label for="username">User Name:</label> <input
						type="text" name="username" id="username" value="" /></td>
						<div align="center" id="textleft1">10 characters left</div>
				</tr>
				<tr>
					<td><label for="pwd">Password:</label> <input type="password"
						name="pwd" id="pwd" value="" /></td>
						<div align="center" id="textleft2">10 characters left</div>
				</tr>
				<tr>
					<td><input type="submit" name="login" id="login" value="Login" /></td>
				</tr>
			</table>
		</form>

		<form action="register.jsp" method="post">
			<p align="right">
				<input type="submit" name="signup" id="signup" value="Register" />
			</p>
		</form>
		</div>


		<blockquote>
			<p>Home Inventory. </p>
		</blockquote>
		<div class="intro">
		Home Inventory is used to keep track of all your valuables.  This could include your car, lawn mower, 
		big screen TV or Jewelry.  You can take pictures of all of these items and store them into the database.
		Then if a fire, earthquake, or burglary happens you can login and print a report for any missing item.
		</div>



	

		
	
</body>
</html>
