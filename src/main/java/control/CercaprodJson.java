package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.*;
/**
 * Servlet implementation class CercaprodJson
 */
@WebServlet("/cercaprodJson")
public class CercaprodJson extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProdottoDao prodao= new ProdottoDao();
    
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> result= new ArrayList<>();
		ArrayList<Integer> id= new ArrayList<>();
		response.setContentType("application/json");
		String nomeprod= request.getParameter("prodotto");
		ArrayList<ProdottoBean> match= new ArrayList<>();
	
		
		try {
			ArrayList<ProdottoBean> prods= prodao.doRetriveAllByName();			
			
			for(ProdottoBean prod :prods) {
				String nome=prod.getNome();

				if(nome.contains(nomeprod)) {
					ProdottoBean mathcprod= prod;
					match.add(mathcprod);
				}
			}
			for(ProdottoBean prod : match) {
				result.add(prod.getNome());
				id.add(prod.getID_prodotti());
			}
			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		JSONObject json = new JSONObject();
		 json.put("functionName", "aggiornaDatiProdottoJSON");
	     json.put("result", result);
	     json.put("id", id);
		response.getWriter().print(json.toString());
		
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
