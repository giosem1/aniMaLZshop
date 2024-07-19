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
 * Servlet implementation class Catalogo
 */
@WebServlet("/catalogo")
public class Catalogo extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProdottoDao prod=new ProdottoDao();
		String azione= request.getParameter("azione");

		ArrayList<ArrayList<ProdottoBean>> cata= new ArrayList<>();
		try{
			
			if(azione.equalsIgnoreCase("delete")) {
				String idel= request.getParameter("idprod");
		
				prod.doDelete(Integer.parseInt(idel));
			
				
			} 
			ArrayList<ProdottoBean>cane = prod.doRetriveAll("Cane", null);
			ArrayList<ProdottoBean>gatto= prod.doRetriveAll("Gatto", null);
			ArrayList<ProdottoBean>rettile= prod.doRetriveAll("Rettile", null);
			ArrayList<ProdottoBean>roditore= prod.doRetriveAll("Roditore", null);
			ArrayList<ProdottoBean>uccello= prod.doRetriveAll("Uccello", null);
			ArrayList<ProdottoBean>pesce= prod.doRetriveAll("Pesce", null);

			cata.add(cane);
			cata.add(gatto);
			cata.add(rettile);
			cata.add(roditore);
			cata.add(uccello);
			cata.add(pesce);
			
			
			
			
				request.getSession().setAttribute("catalogo", cata);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher disp= getServletContext().getRequestDispatcher("/admin/Catalogo.jsp");
	
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
