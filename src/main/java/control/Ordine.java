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
 * Servlet implementation class Ordine
 */
@WebServlet("/ordine")
public class Ordine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ordine() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String details= request.getParameter("azione");
		
		
		int id_ute=Integer.parseInt(request.getParameter("id"));
		
		OrdineDao ord  =new OrdineDao();
		try {
			if(details.equalsIgnoreCase("details")) {
				
				int id_ord=Integer.parseInt(request.getParameter("idord"));
				InseritiDao insdao=new InseritiDao();
				ArrayList<InseritiBean> ins=insdao.doRetriveAll(id_ord);	
				
				request.getSession().setAttribute("inse", ins);
				RequestDispatcher disp= getServletContext().getRequestDispatcher("/Dettagli.jsp");
				
				disp.forward(request, response);
			}else {
				ArrayList<OrdineBean> ordini= ord.doRetrieveAll(id_ute);
				
				request.getSession().setAttribute("ord", ordini);
				RequestDispatcher disp= getServletContext().getRequestDispatcher("/Ordini.jsp");
				
				disp.forward(request, response);
			}
		}catch(SQLException e) {
			System.out.println("Error:" + e.getMessage());		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
