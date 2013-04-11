<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%-- This includes the core JSTL library --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html>

<head>
<title>All Registrants</title>
</head>

<body>

Here is the list of registrants:

<ul>

<%-- This uses JSTL tags to iterate through the array of registrants --%>
<c:forEach items="${registrants}" var="p">
   <li> Name: ${p.name} has phone number ${p.phone} </li>
</c:forEach>

</ul>

<a href="register.html">Register again</a>

</body>

</html>
