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

@WebServlet("/newsBanner")
public class NewsBanner extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDao news= new NewsDao();
		ArrayList<ArrayList<NewsBean>> newsdisp= new ArrayList<>();
		try {    
			
			ArrayList<NewsBean> BeS= news.doRetriveAll("Benessere e Salute");
			ArrayList<NewsBean> CeG= news.doRetriveAll("Comportamento e Gioco");
			
			newsdisp.add(BeS);
			newsdisp.add(CeG);
			request.getSession().setAttribute("newsdisp", newsdisp);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher disp= getServletContext().getRequestDispatcher("/Home.jsp");
	
		disp.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
