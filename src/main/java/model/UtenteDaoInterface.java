package model;
import java.sql.SQLException;
import java.util.ArrayList;
public interface UtenteDaoInterface {
	public void doSave(UtenteBean utente) throws SQLException;
	
	public UtenteBean doRetrive(String email, String pwd) throws SQLException;
	
	public ArrayList<UtenteBean> doRetriveAll(String order) throws SQLException;
	
	public void doUpdateSpedizione(String email, String via, String cap) throws SQLException;
	
	public void doUpdatePagamento(String email, String cartaCredito) throws SQLException;

}