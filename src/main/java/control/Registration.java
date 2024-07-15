package control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtenteDao dao = new UtenteDao();
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String dataNascita = request.getParameter("dataNascita");
        String telefono = request.getParameter("telefono");
        String pwd = request.getParameter("pwd");
        
        try {
            if (dao.isEmailExist(email)) {
                request.setAttribute("error", "L'email è già esistente.");
                request.getRequestDispatcher("./Registration.jsp").forward(request, response);
            } else {
                UtenteBean utente = new UtenteBean();
                utente.setNome(nome);
                utente.setCognome(cognome);
                utente.setEmail(email);
                utente.setDataNascita(Date.valueOf(dataNascita));
                utente.setTel(telefono);
                utente.setAmm(false);
                utente.setCap(0);
                utente.setNumCivico(null);
                utente.setVia(null);
                utente.setCartaCredito(null);
                utente.setPassword(pwd);
                dao.doSave(utente);
                response.sendRedirect(request.getContextPath() + "/Home.jsp");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
           
        }
    }
}


