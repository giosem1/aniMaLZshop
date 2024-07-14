package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface InseritiDaoInterface {
	public void doSave(InseritiBean prodotto) throws SQLException;
	
	public InseritiBean  doRetrive(int idOrd) throws SQLException;
	
	public ArrayList<InseritiBean > doRetriveAll(int idOrd) throws SQLException;
}
