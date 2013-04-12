<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script>

		function verifyLogin()
		{
			var username = document.getElementById("username");
			var pwd = document.getElementById("pwd");
			var re = /((?=.*[a-z])(?=.*\d)(?=.*[@#$%])(?=.*[A-Z]).{6,16})/i;
			if(username.value.length > 4 && pwd.value.match(re))
				document.jForm.submit();
			else
				document.getElementById("error").innerHTML="Failed Login";
		}
		
</script>

<title>Welcome!</title>
</head>

<body>
	<div class="Welcome">
<form id="jForm" name="jForm" method="post" action="inventory.jsp"> </form>

		<h1 align="center">WELCOME</h1>

		<form id="loginform" name="loginform" method="post" action="javascript:verifyLogin()">
			<table>
				<tr>
					<td><label for="username">User Name:</label> <input
						type="text" name="username" id="username" value="" /></td>
				</tr>
				<tr>
					<td><label for="pwd">Password:</label> <input type="password"
						name="pwd" id="pwd" value="" /></td>
				</tr>
				<tr>
					<td><input type="submit" name="login" id="login" value="Login" /></td>
				</tr>
			</table>
			<div style="color: red" id="error"></div>
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
