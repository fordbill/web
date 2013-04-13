package beans;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.*;
import demo.Utils;

@WebServlet("/Getitems")
public class GetItems extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Defer to doPost
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * Returns JSON object of the form {atTop: true/false, atBottom: true/false,
	 * inventory: [...]}
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {

		// Turn off caching and grab the incoming prefix parameter
		rsp.setHeader("Cache-Control", "no-cache");
		rsp.setHeader("Pragma", "no-cache");
		boolean test = false;

		String login = (String) req.getAttribute("login");
		
		if (test)
			login = "user";
		if (login == null) {
			// not logged in
			req.getRequestDispatcher("/index.jsp").forward(req, rsp);
		}

		// Get the value of the offset parameter
		int offset = 0;
		try {
			offset = Integer.parseInt(req.getParameter("offset"));
		} catch (NumberFormatException e) {
		}

		// Get the value of the filter parameter
		String filter = req.getParameter("filter");
		boolean usefilter = true;

		if (filter == null || filter == "") {
			usefilter = false;
		}

		boolean useorderby = true;
		String sortby = req.getParameter("sortby");
		if (sortby == null || sortby == "") {
			useorderby = false;
		}

		int DisplayCount = 10;

		// Prepare to display Items
		JSONArray Items = new JSONArray();

		Connection dbInventory = null;

		boolean atTop = (offset == 0);
		boolean atBottom = true;

		if (!test) {
			try {

				// Open a connections
				if (!test)
					dbInventory = Utils.openConnection(this);

				// Get the next 11 books. We only return 10 of them, but this
				// will
				// tell us
				// if we're at the bottom.

				String query = "select * from inventory where login = ?";

				query += "order by ?";
				// query += "limit ? " + "offset ?";
				PreparedStatement stmt = dbInventory.prepareStatement(query);
				stmt.setString(1, login);
				/*
				 * int paramcount = 1; if (usefilter) {
				 * stmt.setString(paramcount++, "%" + filter + "%");
				 * paramcount++; }
				 * 
				 * if (useorderby) { stmt.setString(paramcount++, sortby); }
				 * 
				 * 
				 * stmt.setInt(paramcount++, DisplayCount + 1);
				 * stmt.setInt(paramcount, offset * DisplayCount);
				 */
				ResultSet results = stmt.executeQuery();

				// Put the DisplayCount results into the array. If there is
				// DisplayCount + 1, we're
				// not yet at the bottom.
				// user results.last() instead of count
				int count = 0;

				while (results.next()) {
					count++;
					if (count > DisplayCount) {
						atBottom = false;
					} else {
						// category description value serial date

						JSONObject obj = new JSONObject();
						obj.put("category", results.getString("category"));
						obj.put("description", results.getString("description"));
						obj.put("value", results.getString("value"));
						obj.put("serial", results.getString("serial"));
						obj.put("date", results.getString("date"));
						obj.put("fname", results.getString("fname"));
						Items.put(obj);
					}
				}

				// Clean up
				results.close();
				stmt.close();

			} catch (Exception e) {
				e.printStackTrace();
				return;
			} finally {
				Utils.close(dbInventory);

			}
		} else {
			try {
				JSONObject obj = new JSONObject();
				obj.put("category", "jewelry");
				obj.put("description", "Diamond Necklace");
				obj.put("value", "10000.00");
				obj.put("serial", "98712345");
				obj.put("date", "2013-04-12");
				obj.put("fname", "necklace.jpg");
				Items.put(obj);

				obj = new JSONObject();
				obj.put("category", "Car");
				obj.put("description", "Ford Expedition");
				obj.put("value", "10.00");
				obj.put("serial", "V12345678");
				obj.put("date", "2013-04-12");
				obj.put("fname", "car.jpg");
				Items.put(obj);

				obj = new JSONObject();
				obj.put("category", "Electronics");
				obj.put("description", "XBox");
				obj.put("value", "100.00");
				obj.put("serial", "98712345");
				obj.put("date", "2013-04-12");
				obj.put("fname", "xbox.jpg");
				Items.put(obj);

				obj = new JSONObject();
				obj.put("category", "Electronics");
				obj.put("description", "Laptop");
				obj.put("value", "500.00");
				obj.put("serial", "98712345");
				obj.put("date", "2013-04-12");
				obj.put("fname", "laptop.jpg");
				Items.put(obj);

			} catch (JSONException e) {

				e.printStackTrace();
			}

		}

		// Create a result object
		JSONObject result = new JSONObject();
		try {
			result.put("atTop", atTop);
			result.put("atBottom", atBottom);
			result.put("Items", Items);
			result.put("newOffset", offset);
		} catch (JSONException e) {
			e.printStackTrace();
		}

		// Send back the result as an HTTP response
		rsp.setContentType("application/json");
		rsp.getWriter().print(result);
		rsp.getWriter().close();
		req.getRequestDispatcher("/inventory.jsp").forward(req, rsp);

	}
}
