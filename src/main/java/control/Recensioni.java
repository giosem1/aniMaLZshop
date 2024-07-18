package control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoBean;
import model.ProdottoDao;
import model.RecensioneBean;
import model.RecensioneDao;
import model.UtenteBean;

/**
 * Servlet implementation class Recensioni
 */
@WebServlet("/recensioni")
public class Recensioni extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recensioni() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecensioneDao recDao=new RecensioneDao();
		RecensioneBean recens= new RecensioneBean();
		
		UtenteBean ute=(UtenteBean) request.getSession().getAttribute("currentSessionUser");
		
		String insert = request.getParameter("azione");
		int id=Integer.parseInt(request.getParameter("id"));
		
		try {	
				if(insert.equalsIgnoreCase("insert")) {
					String recensione= request.getParameter("rece");
					int voto= Integer.parseInt(request.getParameter("voto"));
					
					java.util.Date now = new java.util.Date();
					String pattern = "yyyy-MM-dd";
					SimpleDateFormat formatter = new SimpleDateFormat(pattern);
					String mysqlDateString = formatter.format(now);
					recens.setID_utente(ute.getId());
					recens.setID_prodotti(id);
					recens.setRecensione(recensione);
					recens.setVoto(voto);
					recens.setDataPubl(Date.valueOf(mysqlDateString));
					
					recDao.doSave(recens);
				}else if(insert.equalsIgnoreCase("delete")) {
					int idute=Integer.parseInt(request.getParameter("idute"));
					recDao.doDelete(idute, id);
				}
		
				request.getSession().removeAttribute("recs");
				ArrayList<RecensioneBean> rece= recDao.doRetriveAll(id);
				
				request.getSession().setAttribute("recs", rece);
				
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		response.sendRedirect(request.getContextPath() + "/Prodotto.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
