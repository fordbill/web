<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script src="http://code.jquery.com/jquery-1.5.js"></script>
<script>
	$(document).ready(function() {
		// wait for the DOM to be loaded 
		$(document).ready(function() {
			// bind 'myForm' and provide a simple callback function 
			$('#register_form').ajaxForm(function() {
				alert("Thank you for your comment!");
			});
		});


		$('#address').keypress(function(event) {
			var max = 45;
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

		$('#address').keyup(function(event) {
			var max = 45;
			var len = $(this).val().length;
			var char = max - len;

			$('#textleft').text(char + ' characters left');

		});

	});

	$(document).ready(function() {

		$('#phone').keypress(function(event) {
			var max = 10;
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

		$('#phone').keyup(function(event) {
			var max = 10;
			var len = $(this).val().length;
			var char = max - len;

			$('#textleft1').text(char + ' characters left');

		});

	});

	$(document).ready(function() {

		$('#login').keypress(function(event) {
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

		$('#login').keyup(function(event) {
			var max = 15;
			var len = $(this).val().length;
			var char = max - len;

			$('#textleft2').text(char + ' characters left');

		});

	});
</script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registration Page</title>



</head>


<body class = "login">
	<div align="center" class="register">
		<form id="register_form" name="register_form" method="post" action="Register">
			<h1>Please Register.</h1>
			<br>
			 
			<label for="login">Login:</label> 
			<input type="text" 	name="login" size="18" tabindex=1 id="login" />
			<div align="center" id="textleft2">15 characters left</div>
			
			<br> 
			<br> 
			
			<label for="pwd1">Password:</label> 
			<input type="password" name="pwd1" tabindex=2 id="pwd1" /> 
			
			<br> 
			<br>
			 
			<label for="pwd2">Verify Password:</label> 
			<input	type="password" name="pwd2" tabindex=3 id="pwd2" /> 
			
			<br> 
			<br> 
			
			<label	for="firstName">First Name:</label> 
			<input type="text" 	name="firstName" size="20" tabindex=4 id="firstName" /> 
			
			<br> 
			<br> 
			
			<label for="lastName">Last Name:</label> 
			<input type="text" name="lastName" size="20" tabindex=5 id="lastName" /> 
			
			<br>
			<br>
			 
			<label for="phone">Phone:</label>
			<input type="text" name="phone" size="16" tabindex=5 id="phone" />
			<div align="center" id="textleft1">10 characters left</div>
			
			<br>
			<br> 
			
			<label for="address">Address:</label>
			<textarea cols="30" rows="4" name="address" tabindex=5 id="address"></textarea>
			<div align="center" id="textleft">45 characters left</div>
			
			<br>
			<br> 
			
			<input type="submit" name="register" tabindex=6 id="register" value="Register" /> 
			<br>
			<br>
		</form>

		<form action="index.jsp" method="post">
			<p align="center">
			<input type="submit" name="cancel" tabindex=7 id="cancel" value="Cancel" />
			</p>
		</form>
	</div>
</body>
</html>
