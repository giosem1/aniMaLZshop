package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Carrello;
import model.InfoCarrello;
import model.ProdottoDao;

@WebServlet("/carrello")
public class CarrelloServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ProdottoDao prodDao = new ProdottoDao();
		Carrello petBag = (Carrello)request.getSession().getAttribute("petBag");
		if( petBag == null) {
			petBag = new Carrello();
			request.getSession().setAttribute("petBag", petBag);
		}
		
		String action = request.getParameter("action");
		String quantita = request.getParameter("quantita");
		String redirectedPage = request.getParameter("page");
		
		
		try {
            if (action != null) {
                if (action.equalsIgnoreCase("addPB")) {
                	String animale = request.getParameter("animale");
                    String genere = request.getParameter("genere");
                    String nome = request.getParameter("nome");
                    petBag.aggiungiProdotto(prodDao.doRetrive( nome, animale, genere));
                } else if (action.equalsIgnoreCase("deletePB")) {
                	String animale = request.getParameter("animale");
                    String genere = request.getParameter("genere");
                    String nome = request.getParameter("nome");
                    petBag.rimuoviProdotto(prodDao.doRetrive( nome, animale, genere));
                }
            }
            if (quantita != null) {
            	String animale = request.getParameter("animale");
                String genere = request.getParameter("genere");
                String nome = request.getParameter("nome");
                InfoCarrello info = petBag.getInfo(nome, animale, genere);
				info.setQuantitaCarrello(Integer.parseInt(quantita));
            }
			
			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		request.getSession().setAttribute("petBag", petBag);
		request.setAttribute("petBag", petBag);
		
		
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/" + redirectedPage);
			dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
	

}
