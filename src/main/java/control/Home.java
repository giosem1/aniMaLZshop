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
		ArrayList<ProdottoBean>cane= new ArrayList<>();
		ArrayList<ProdottoBean>gatto= new ArrayList<>();
		ArrayList<ProdottoBean>rettile= new ArrayList<>();
		ArrayList<ProdottoBean>roditore= new ArrayList<>();
		ArrayList<ProdottoBean>uccello= new ArrayList<>();
		ArrayList<ProdottoBean>pesce= new ArrayList<>();
		
		ArrayList<String> categ=new ArrayList<>();
		categ.add("Cibo");
		categ.add("Snack");
		categ.add("Farmaceutici");
		categ.add("Igenici");
		categ.add("Abbigliamento");
		categ.add("Accessori");
		categ.add("Giochi");
		
		try{
			for(String cate: categ) {
				ProdottoBean can=prod.doRetriveByGen("Cane", cate);
				ProdottoBean gat=prod.doRetriveByGen("Gatto",cate);
				ProdottoBean rod=prod.doRetriveByGen("Roditore", cate);
				ProdottoBean ret=prod.doRetriveByGen("Rettile", cate);
				ProdottoBean uc=prod.doRetriveByGen("Uccello", cate);
				ProdottoBean pes=prod.doRetriveByGen("Pesce", cate);

				if(can.getID_prodotti()!=0) {
					cane.add(can);	
				}
				if(gat.getID_prodotti()!=0) {
					gatto.add(gat);
				}
				if(rod.getID_prodotti()!=0) {
					roditore.add(rod);
				}
				if(ret.getID_prodotti()!=0) {
					rettile.add(ret);
				}
				if(uc.getID_prodotti()!=0) {
					uccello.add(uc);
				}
				if(pes.getID_prodotti()!=0) {
					pesce.add(pes);
				}

				
			}
			
		
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
