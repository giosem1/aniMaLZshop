package control;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Preferiti;
import model.ProdottoDao;




@WebServlet("/AddPreferiti")
public class AddPreferiti extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ProdottoDao prodDao = new ProdottoDao();
		Preferiti petBag = (Preferiti)request.getSession().getAttribute("petBag");
		if( petBag == null) {
			petBag = new Preferiti();
			request.getSession().setAttribute("petBag", petBag);
		}
		
		String action = request.getParameter("action");
		String redirectedPage = request.getParameter("page");
		
		try {
            if (action != null) {
                if (action.equalsIgnoreCase("addPB")) {
                	int id=Integer.parseInt(request.getParameter("id"));
                    petBag.aggiungiProdotto(prodDao.doRetrive(id));
                } else if (action.equalsIgnoreCase("deletePB")) {
                	int id=Integer.parseInt(request.getParameter("id"));
                    petBag.rimuoviProdotto(prodDao.doRetrive(id));
                }
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
	
	
	
	
	
	

