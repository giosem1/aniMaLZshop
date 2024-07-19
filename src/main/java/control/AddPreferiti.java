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




@WebServlet("/addPreferiti")
public class AddPreferiti extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ProdottoDao prodDao = new ProdottoDao();
		Preferiti petPref = (Preferiti)request.getSession().getAttribute("petPref");
		if( petPref == null) {
			petPref = new Preferiti();
			request.getSession().setAttribute("petPref", petPref);
		}
		
		String action = request.getParameter("action");
		String redirectedPage = request.getParameter("page");
		
		try {
            if (action != null) {
                if (action.equalsIgnoreCase("addPB")) {
                	int id=Integer.parseInt(request.getParameter("id"));
                    petPref.aggiungiProdotto(prodDao.doRetrive(id));
                } else if (action.equalsIgnoreCase("deletePB")) {
                	int id=Integer.parseInt(request.getParameter("id"));
                    petPref.rimuoviProdotto(prodDao.doRetrive(id));
                }
            }
            
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		request.getSession().setAttribute("petPref", petPref);
		request.setAttribute("petPref", petPref);
		
		
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/" + redirectedPage);
			dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
	

}
	
	
	
	
	
	

