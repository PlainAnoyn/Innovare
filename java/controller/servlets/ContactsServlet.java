package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import model.AESEncryption;
import model.DbConnection;

@WebServlet("/contact")

public class ContactsServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String message = request.getParameter("message");

//		DbConnection con = new DbConnection();
		

//		String res = con.addContact(name, email, phoneNumber, message);

		System.out.println("Contact error is ;"+ email + name + phoneNumber + message);

		response.sendRedirect("./");
	}
}