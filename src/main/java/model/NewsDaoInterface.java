package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface NewsDaoInterface {
	
	public void doSave(NewsBean news) throws SQLException;
	
	public NewsBean doRetrive(String titolo, String categ) throws SQLException;
	
	public ArrayList<NewsBean> doRetriveAll() throws SQLException;
}
