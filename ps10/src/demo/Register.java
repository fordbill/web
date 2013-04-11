package demo;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import beans.*;

/**
 * Records a registration in the servlet context.
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/** 
	 * Defer to doPost
	 */
	public void doGet (HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		doPost(req, rsp);
	}


	/**
	 * Does the registration
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException 
	{
		/*
		// Grab the name and phone number
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");

		// Create a bean
		Person p = new Person(name, phone);

		// Record the new registrant.  The servlet context can record things only until the
		// server is restarted.
		ServletContext context = getServletContext();

		synchronized (context) {

			// Get the current list of registrants from the context object
			@SuppressWarnings("unchecked")
			ArrayList<Person> registrants = 
			    (ArrayList<Person>) context.getAttribute("registrants");

			// If there wasn't one, cerate it.
			if (registrants == null) {
				registrants = new ArrayList<Person>();
				context.setAttribute("registrants", registrants);
			}

			// Add the registrant
			registrants.add(p);
		}
		
		
		// Display an acknowledgment
		req.setAttribute("person", p);
		*/
		String login = req.getParameter("login");
		//8 chars 1 upper case and 1 number...
		/*
		 * ^                  # start-of-string
		 *	(?=.*[0-9])       # a digit must occur at least once
		 *	(?=.*[a-z])       # a lower case letter must occur at least once
		 *	(?=.*[A-Z])       # an upper case letter must occur at least once
		 *	(?=.*[@#$%^&+=])  # a special character must occur at least once
		 *	(?=\S+$)          # no whitespace allowed in the entire string
		 *	.{8,}             # anything, at least eight places though
		 * $                  # end-of-string	
		 */
		
		String pattern = "((?=.*[a-z])(?=.*\\d)(?=.*[@#$%])(?=.*[A-Z]).{6,16})";
		
		//String pattern2 = "^([a-z]|[A-Z]){4, 15}$";
		
		String pwd1 = req.getParameter("pwd1");
		String pwd2 = req.getParameter("pwd2");
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		boolean success = true;
		
		if(!pwd1.equals(pwd2))
		{
			//COMPLAIN... The passwords were not the same.
			pwd1 = "MIS-MATCH";
			success = false;
			
		}
		else if(!pwd1.matches(pattern))
		{
			//Complain... INVALID PASSWORD.. Must
			pwd1 = "INVALID";
			success = false;
		}
		
		
		//CHECK FIELDS.. 
		req.setAttribute("login", "NOT RIGHT!");
		
		//Person p = new Person(login, login, login);
		Credentials credentials = new Credentials(firstName, lastName, login, pwd1, phone, address);
		req.setAttribute("credentials", credentials);
		if(success) {
			if (registerUser(credentials))
				req.getRequestDispatcher("/WEB-INF/views/success.jsp").forward(req, rsp);
			else req.getRequestDispatcher("/register.jsp").forward(req, rsp);
		}
		else
			req.getRequestDispatcher("/register.jsp").forward(req, rsp);
	}


	private boolean registerUser(Credentials c) {
		Connection dbInventory = null;
		try {
			dbInventory= Utils.openConnection(this);
			String query = 
			"INSERT INTO users " +
			"(`login`, `password`,`name`,`address`,`phone`)" +
			"VALUES(?,?,?,?,?)";
			PreparedStatement stmt = dbInventory.prepareStatement(query);
			stmt.setString(1,c.getLogin());
			stmt.setString(1,c.getPassword());
			stmt.setString(1,c.getfirstName() + " " + c.getlastName());
			stmt.setString(1,c.getAddress());
			stmt.setString(1,c.getPhone());
			int rc = stmt.executeUpdate();
			stmt.close();
			dbInventory.close();
			return rc > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}

}

