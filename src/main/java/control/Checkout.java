package control;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		OrdineDao  daoOrd= new OrdineDao();
		InseritiDao daoIns = new InseritiDao();
		
		UtenteBean utente = (UtenteBean) request.getSession().getAttribute("currentSessionUser");
		UtenteDao uteDao = new UtenteDao();
		OrdineBean ordine = new OrdineBean();
		ProdottoDao prodao=new ProdottoDao();
		
		Carrello cart = (Carrello) request.getSession().getAttribute("petBag");
		Double prezzoTot = cart.calcolaCosto();
		int quantitaTot = cart.calcolaQuantitaTotale();
		
		java.util.Date now = new java.util.Date();
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		String mysqlDateString = formatter.format(now);
		
		String via = request.getParameter("via");
		String Civico = request.getParameter("numCivico");
		String cap = request.getParameter("cap");
		String cartaDiCredito = request.getParameter("cartaDiCredito");

		try {
	    uteDao.doUpdateSpedizione(utente.getEmail(),via, Integer.parseInt(cap), Civico);
	    uteDao.doUpdatePagamento(utente.getEmail(), cartaDiCredito);
	    
	    ordine.setImportoTotale(prezzoTot);
	    ordine.setIdUtente(utente.getId());
	    ordine.setData(Date.valueOf(mysqlDateString));
	    
	    ordine.setquantita(quantitaTot);
        daoOrd.doSave(ordine);
        
        ArrayList<OrdineBean> idOrdine = daoOrd.doRetrieveOrdersByDate(utente.getId(), mysqlDateString);
  
        for(OrdineBean ord : idOrdine)
        {
            InseritiBean ins = daoIns.doRetrive(ord.getIdOrdine());	
            if(ins == null)
            {
            	for (InfoProdotto info : cart.getArticoli()) {   
                	InseritiBean inserito = new InseritiBean();
                    inserito.setID_ordine(ord.getIdOrdine());
                    inserito.setID_prodotti(info.getID());
                    inserito.setNome(info.getNome());
                    inserito.setPrezzo(info.getPrezzo());
                    inserito.setQuantita(info.getQuantitaCarrello());
                          
                    daoIns.doSave(inserito);
                    
                    ProdottoBean prodnew= prodao.doRetrive(info.getID());
                    prodnew.setQuantita((prodnew.getQuantita()-info.getQuantitaCarrello()));
                    prodao.doUpdateQuantita(prodnew.getID_prodotti(),prodnew.getQuantita());
            	}  
            }
        }
        cart.svuota();
        
        
        RequestDispatcher disp = getServletContext().getRequestDispatcher("/Home.jsp");
		disp.forward(request, response);
        
        } catch (SQLException e) {
            throw new ServletException("Errore nel salvataggio dell'ordine", e);
        }  
	}
}

