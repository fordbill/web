package demo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Credentials;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, rsp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String login = req.getParameter("username");
		String pwd1 = req.getParameter("pwd");
		beans.Authenticate l = new beans.Authenticate(login, pwd1);
		// CHECK FIELDS..
		req.setAttribute("login", "NOT RIGHT!");

		// Person p = new Person(login, login, login);

		String name = CheckUser(login, pwd1);
		if (name != "") {
			Credentials credentials = new Credentials(name, "", "", "", "", "");
			req.setAttribute("credentials", credentials);
			req.setAttribute("login", l);
			req.getRequestDispatcher("/inventory.jsp").forward(req,rsp);

		} else {
			req.getRequestDispatcher("/index.jsp").forward(req, rsp);
		}
	}

	private String CheckUser(String login, String password) {
		Connection dbInventory = null;
		try {
			String result;
			dbInventory = Utils.openConnection(this);
			String query = "SELECT * from users where login = ? and password = ?";

			PreparedStatement stmt = dbInventory.prepareStatement(query);
			stmt.setString(1, login);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				
				result = rs.getString("name");
			} else {
				result = "";
			}
			stmt.close();
			dbInventory.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return "";}
	}
	
	

}
