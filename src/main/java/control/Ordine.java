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
		
		UtenteBean id= (UtenteBean) request.getSession().getAttribute("currentSessionUser");
		OrdineDao ord  =new OrdineDao();
		try {
			
			if(id.isAmm() && details.equalsIgnoreCase("orders")) {
				String dataDa= request.getParameter("dataDa");
				String dataA= request.getParameter("dataA");
				String name= request.getParameter("nome");
				String surname= request.getParameter("cognome");
				
				if(dataDa!=null && dataA!=null) {
					ArrayList<OrdineBean> ordinidata= ord.doRetrieveAllByDate(dataDa, dataA);
					ArrayList<ArrayList<UtenteBean>> ute= new ArrayList<>();
					UtenteDao uteDao= new UtenteDao();


						for(OrdineBean ordine: ordinidata) {
							ArrayList<UtenteBean> utenti= uteDao.doRetriveAll(ordine.getIdUtente());
							
							ute.add(utenti);
							
						}

						request.getSession().setAttribute("utenti", ute);
						request.getSession().setAttribute("orders", ordinidata);
				}else if(name!= null && surname != null){
					ArrayList<OrdineBean> ordininame= ord.doRetrieveAll();
					ArrayList<ArrayList<UtenteBean>> ute= new ArrayList<>();
					UtenteDao uteDao= new UtenteDao();


					for(OrdineBean ordine: ordininame) {
						ArrayList<UtenteBean> utenti= uteDao.doRetriveAll(ordine.getIdUtente());
						for(UtenteBean user:utenti) {
							if(user.getNome().equalsIgnoreCase(name) && user.getCognome().equalsIgnoreCase(surname)) {
								ute.add(utenti);
							}
						}
						
					}

						request.getSession().setAttribute("utenti", ute);
						request.getSession().setAttribute("orders", ordininame);
				
						}else {
						ArrayList<OrdineBean> ordini= ord.doRetrieveAll();
						ArrayList<ArrayList<UtenteBean>> ute= new ArrayList<>();
						UtenteDao uteDao= new UtenteDao();
		
		
							for(OrdineBean ordine: ordini) {
								ArrayList<UtenteBean> utenti= uteDao.doRetriveAll(ordine.getIdUtente());
								ute.add(utenti);
								
							}
							request.getSession().setAttribute("utenti", ute);
							request.getSession().setAttribute("orders", ordini);
						}
					
					RequestDispatcher disp= getServletContext().getRequestDispatcher("/admin/OrdiniTotali.jsp");
					
					disp.forward(request, response);
				}else if(details.equalsIgnoreCase("details")) {
					
					int id_ord=Integer.parseInt(request.getParameter("idord"));
					InseritiDao insdao=new InseritiDao();
					ArrayList<InseritiBean> ins=insdao.doRetriveAll(id_ord);
				
					request.getSession().setAttribute("inse", ins);
					RequestDispatcher disp= getServletContext().getRequestDispatcher("/Dettagli.jsp");
					
					disp.forward(request, response);
				}else {
					ArrayList<OrdineBean> ordini= ord.doRetrieve(id.getId());
					
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
