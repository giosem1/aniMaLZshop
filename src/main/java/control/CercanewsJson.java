package control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.*;
/**
 * Servlet implementation class CercanewsJson
 */
@WebServlet("/cercanewsJson")
public class CercanewsJson extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NewsDao newsdao= new NewsDao();
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> resultImm= new ArrayList<>();
		ArrayList<String> resultAutore= new ArrayList<>();
		ArrayList<String> resultCont=new ArrayList<>();
		ArrayList<String> resultTitolo= new ArrayList<>();
		ArrayList<Date> resultData=new ArrayList<>();
		
		response.setContentType("application/json");
		String  Categoria= request.getParameter("news");
		ArrayList<NewsBean> news= new ArrayList<>();
		
		try {
			news= newsdao.doRetriveAll(Categoria);
			for(NewsBean n:news) {
				resultImm.add(n.getImmagine());
				resultAutore.add(n.getAutore());
				resultCont.add(n.getContenuto());
				resultTitolo.add(n.getTitolo());
				resultData.add(n.getDataPlub());
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		JSONObject json = new JSONObject();
		 json.put("functionName", "aggiornaDatiProdottoJSON");
	     json.put("result", resultImm);
	     json.put("resultTit", resultTitolo);
	     json.put("resultCont", resultCont);
	     json.put("resultAut", resultAutore);
	     json.put("resultDate", resultData);
		response.getWriter().print(json.toString());
	}
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
