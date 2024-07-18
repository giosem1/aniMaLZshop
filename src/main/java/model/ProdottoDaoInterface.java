package model;
import java.sql.SQLException;
import java.util.ArrayList;


public interface ProdottoDaoInterface {
	public void doSave(ProdottoBean prodotto) throws SQLException;
	
	public ProdottoBean doRetrive(int idProd) throws SQLException;
	
	public boolean doDelete(int ID_Prodotto) throws SQLException;
	

	public ArrayList<ProdottoBean> doRetriveAll(String anim ) throws SQLException;

	
	public void doUpdate(ProdottoBean prodotto) throws SQLException;

	public void doUpdateQuantita(int id,int quantita) throws SQLException;
	
	public ArrayList<ProdottoBean> doRetriveAllByName() throws SQLException;
	
}