package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface RecensioneDaoInterface {
	
	public void doSave(RecensioneBean recensione) throws SQLException;
	
	public ArrayList<RecensioneBean> doRetriveAll(int ID_prodotto) throws SQLException;
	
	public boolean doDelete(int ID_utente, int ID_prodotto) throws SQLException;
	
	public void doUpdate(RecensioneBean recensione) throws SQLException;
	
}
