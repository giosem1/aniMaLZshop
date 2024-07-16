package model;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

public interface OrdineDaoInterface {
	
public void doSave(OrdineBean ordine) throws SQLException;
	
public ArrayList<OrdineBean> doRetrieve(int idUtente) throws SQLException;
	
	public ArrayList<OrdineBean> doRetrieveAll() throws SQLException;

	public ArrayList<OrdineBean> doRetrieveOrdersByDate(int idUtente, String date) throws SQLException;
	
	public ArrayList<OrdineBean> doRetrieveAllByDate(String dataDa,String dataA)throws SQLException;

}