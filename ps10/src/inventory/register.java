package inventory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

//import org.json.*;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
		
			//JSONObject result = new JSONObject();
			String login = request.getParameter("login").toString();
		
			//JSONArray resultArray = new JSONArray();
			//String login = result.get("login").toString();
			
//			String pwd1= result.getString("pwd1");
//			String pwd2= result.getString("pwd2");
//			String firstName = result.getString("firstName");
//			String lastName = result.getString("lastName");
			out.println(login);
//			out.println(pwd1);
//			out.println(pwd2);
//			out.println(firstName);
//			out.println(lastName);
			//result.put("breeds", resultArray);
			//result.put("caption", caption);
			//result.put("picture", picture);
			
			// Send back the result as an HTTP response
			response.setContentType("application/json");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			
			out.close();

		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
