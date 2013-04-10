<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" ></script>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
 <script src="http://code.jquery.com/jquery-1.5.js"></script>
    <script>
    $(document).ready(function () {

    	  $('#address').keypress(function (event) {
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

    	  $('#address').keyup(function (event) {
    	    var max = 45;
    	    var len = $(this).val().length;
    	    var char = max - len;

    	    $('#textleft').text(char + ' characters left');

    	  });

    	});
    
    $(document).ready(function () {

  	  $('#phone').keypress(function (event) {
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

  	  $('#phone').keyup(function (event) {
  	    var max = 10;
  	    var len = $(this).val().length;
  	    var char = max - len;

  	    $('#textleft1').text(char + ' characters left');

  	  });

  	});
    
    
    $(document).ready(function () {

  	  $('#login').keypress(function (event) {
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

  	  $('#login').keyup(function (event) {
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

<body>
<div class="register">
  <form id="register_form" name="register_form" method="post" action="Register">
  <h1> </h1>
  <p align="center">&nbsp;</p>
    <p align="center">
      <label for="login">Login:</label>
      <input type="text" name="login" size="18" tabindex=1 id="login" />
      <div align="center" id="textleft2">15 characters left</div>
    </p>
    <p align="center">
      <label for="pwd1">Password:</label>
      <input type="password" name="pwd1" tabindex=2 id="pwd1" />
    </p>
    <p align="center">
      <label for="pwd2">Verify Password:</label>
      <input type="password" name="pwd2" tabindex=3 id="pwd2" />
    </p>
    <p align="center">
      <label for="firstName">First Name:</label>
      <input type="text" name="firstName" size="20" tabindex=4 id="firstName" />
    </p>
    <p align="center">
      <label for="lastName">Last Name:</label>
      <input type="text" name="lastName" size="20" tabindex=5 id="lastName" />
    </p>
    <p align="center">
      <label for="phone">Phone:</label>
      <input type="text" name="phone" size="16" tabindex=5 id="phone" />
      <div align="center" id="textleft1">10 characters left</div>
    </p>
    <p align="center">
      <label for="address">Address:</label>
      <textarea cols="30" rows="4" name="address" size="45" tabindex=5 id="address"></textarea>
       <div align="center" id="textleft">45 characters left</div>
    </p>
    <p align="center">
      <input type="submit" name="register" tabindex=6 id="register" value="Register" />
    </p>
    </form>
    
    <form action="index.jsp" method="post">
    <p align="center">
      <input type="submit" name="cancel"  tabindex=7 id="cancel" value="Cancel" /> 
      </form>

    </p>
  <p align="center">&nbsp;</p>
  

</div>
</body>
</html>
