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
 * Servlet implementation class Products
 */
@WebServlet("/products")
public class Products extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Products() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
		 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                 
		        String animale = request.getParameter("animale");
		        String categoria= request.getParameter("Categoria");

		        ProdottoDao prodottoDao = new ProdottoDao();
		        ArrayList<ProdottoBean> prodotti = null;
		        
		        try {
	
		            prodotti = prodottoDao.doRetriveAll(animale, categoria);
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }

		        request.getSession().setAttribute("prodotti", prodotti);
                
		        RequestDispatcher dispatcher = request.getRequestDispatcher("./Products.jsp");
		        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
