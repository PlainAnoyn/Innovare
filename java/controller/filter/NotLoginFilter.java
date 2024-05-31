package controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;	
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns={"/View/Login.jsp","/View/Register.jsp","/View/AdminLogin.jsp"})
public class NotLoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		System.out.print(session.getAttribute("loggedInId"));
		if(session.getAttribute("loggedInId") == null) {
			session.setAttribute("loginError","Do login First!");
			chain.doFilter(request, response);

		}
		else {
			((HttpServletResponse)response).sendRedirect("../index.jsp");

		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
}