package control;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 * Servlet implementation class Home
 */
@WebServlet("/home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProdottoDao prod=new ProdottoDao();
		
		ArrayList<ArrayList<ProdottoBean>> anim= new ArrayList<>();
		
		try{
			ArrayList<ProdottoBean>cane = prod.doRetriveAll("Cane");
			ArrayList<ProdottoBean>gatto= prod.doRetriveAll("Gatto");
			ArrayList<ProdottoBean>rettile= prod.doRetriveAll("Rettile");
			ArrayList<ProdottoBean>roditore= prod.doRetriveAll("Roditore");
			ArrayList<ProdottoBean>uccello= prod.doRetriveAll("Uccello");
			ArrayList<ProdottoBean>pesce= prod.doRetriveAll("Pesce");

			anim.add(cane);
			anim.add(gatto);
			anim.add(rettile);
			anim.add(roditore);
			anim.add(uccello);
			anim.add(pesce);
			
			request.getSession().setAttribute("animale", anim);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher disp= getServletContext().getRequestDispatcher("/Home.jsp");
	
		disp.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
