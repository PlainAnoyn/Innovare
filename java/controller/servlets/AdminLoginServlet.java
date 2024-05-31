package controller.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DbConnection;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		DbConnection con = new DbConnection();
		ResultSet record = con.adminLogin(email, password);
		
		if(record != null) {
			HttpSession session = request.getSession();
			session.removeAttribute("loggedInId");
			session.setAttribute("loggedInId", email);
			session.setAttribute("adminEmail", email);
			session.setMaxInactiveInterval(5*60);
			
			response.sendRedirect("./admin-page");
		}
		else {
			response.setContentType("text/html");
			response.sendRedirect("View/AdminLogin.jsp");

		}
	}
}
