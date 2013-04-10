<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" ></script>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registration Page</title>



</head>

<body>
<div class="register">
  <form id="register_form" name="register_form" method="post" action="Register">
  <h1> </h1>
  <p align="center">&nbsp;</p>
    <p align="center">
      <label for="login">Login</label>
      <input type="text" name="login" tabindex=1 id="login" />
    </p>
    <p align="center">
      <label for="pwd1">Password</label>
      <input type="password" name="pwd1" tabindex=2 id="pwd1" />
    </p>
    <p align="center">
      <label for="pwd2">Verify Password</label>
      <input type="password" name="pwd2" tabindex=3 id="pwd2" />
    </p>
    <p align="center">
      <label for="firstName">First Name</label>
      <input type="text" name="firstName" tabindex=4 id="firstName" />
    </p>
    <p align="center">
      <label for="lastName">Last Name</label>
      <input type="text" name="lastName" tabindex=5 id="lastName" />
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
