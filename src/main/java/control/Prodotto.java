package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class Prodotto
 */
@WebServlet("/Prodotto")
public class Prodotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Prodotto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    ProdottoDao prodDao = new ProdottoDao();
		
		try {		
				String nome = request.getParameter("nome");
				String animale = request.getParameter("animale");
                String genere = request.getParameter("genere");
				request.getSession().removeAttribute("prodotto");
				 ProdottoBean Prodotto= prodDao.doRetrive(nome, animale, genere);
				request.getSession().setAttribute("prodotto", Prodotto);
			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		response.sendRedirect(request.getContextPath() + "/common/Prodotto.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
