<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Successful</title>
</head>
<h2>You successfully logged in!</h2>
<body>

<form action="inventory.jsp">   <button>View Inventory</button>  </form>

<p>
Login:  ${credentials.login}

</p>




</body>
</html>