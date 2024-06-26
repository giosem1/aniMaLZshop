package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UtenteDao user= new UtenteDao();
		
		try {
			
			UtenteBean ute=new UtenteBean();
			ute= user.doRetrive(request.getParameter("user"),request.getParameter("pwd"));
			if(request.getParameter("user").equals(ute.getEmail()) && request.getParameter("pwd").equals(ute.getPassword())) {
				HttpSession session = request.getSession(true);	    
			    session.setAttribute("currentSessionUser",ute);
			    response.sendRedirect(request.getContextPath()+"/common/Home.jsp");  
			}else {
				response.sendRedirect(request.getContextPath()+"/common/Login.jsp");
			}
					
		}catch(SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}


	}
}
