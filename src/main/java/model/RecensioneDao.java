package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RecensioneDao implements RecensioneDaoInterface{
	private static DataSource ds;
	static {
		try {
			Context initCtx=new InitialContext();
			Context envCtx= (Context) initCtx.lookup("java:comp/env");
			
			ds= (DataSource) envCtx.lookup("jdbc/aniMaLZshop");
		}
		catch(NamingException e){
			System.out.println("Error: "+e.getMessage());
		}
	}
	

	private static final String TABLE_NAME = "recensisce";
	public void doSave(RecensioneBean recensione) throws SQLException {
		Connection connection =null;
		PreparedStatement preparedStatement =null;
		
		String sqlInsert="INSERT INTO " + RecensioneDao.TABLE_NAME+ "(ID_UTENTE, ID_PRODOTTI, VOTO, RECENSIONE) VALUES (?, ?, ?, ?)";
		
		try {
	    	connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sqlInsert);
			  preparedStatement.setInt(1, recensione.getID_utente());
			  preparedStatement.setInt(2, recensione.getID_prodotti());
			  preparedStatement.setDouble(3, recensione.getVoto());
			  preparedStatement.setString(2, recensione.getRecensione());
			  
		        preparedStatement.executeUpdate();
				    }finally {
						try {
							if(preparedStatement !=null)
								preparedStatement.close();
						}finally {
							if(connection != null)
								connection.close();
						}
					}
				}
	public ArrayList<RecensioneBean> doRetriveAll(int ID_prodotto) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement =null;
		ArrayList<RecensioneBean> recensioni =new ArrayList<>();

		    String selectSQL = "SELECT * FROM " + RecensioneDao.TABLE_NAME +" WHERE ID_PRODOTTO = ?";
		    
		    try {
		    	connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				preparedStatement.setInt(1, ID_prodotto);
				ResultSet rs= preparedStatement.executeQuery();
				while(rs.next()) {
					RecensioneBean rec =new RecensioneBean();
					
					rec.setID_utente(rs.getInt("id_utente"));
					rec.setID_prodotti(rs.getInt("id_prodotto"));
					rec.setVoto(rs.getDouble("voto"));
					rec.setRecensione(rs.getString("recensione"));
					
					recensioni.add(rec);
				}
		    }finally {
				try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
		    }
		    
	    
		return recensioni;
	}
	public synchronized boolean doDelete(int ID_utente, int ID_prodotto) throws SQLException {
		 int result = 0;
		 Connection connection =null;
		 PreparedStatement preparedStatement =null;
		 String deleteSQL = "DELETE FROM " + RecensioneDao.TABLE_NAME + " WHERE ID_PRODOTTO = ? AND ID_UTENTE = ?";

		    try {
		    	connection = ds.getConnection();
		    	preparedStatement = connection.prepareStatement(deleteSQL);
		    	preparedStatement.setInt(1, ID_utente);
		    	preparedStatement.setInt(1, ID_prodotto);

		        result = preparedStatement.executeUpdate();
		    }finally {
				try {
					if(preparedStatement !=null)
						preparedStatement.close();
				}finally {
					if(connection != null)
						connection.close();
				}
			}

		    return (result != 0);
		}

	public void doUpdate(RecensioneBean recensione) throws SQLException {
		 String updateSQL = "UPDATE " + RecensioneDao.TABLE_NAME+
		 "SET VOTO = ?, RECENSIONE = ?" + "WHERE ID_PRODOTTO AND ID_UTENTE = ?";
		 
		Connection connection = null;
	    PreparedStatement preparedStatement = null; 
	     try { 
		    	connection = ds.getConnection();
		    	preparedStatement = connection.prepareStatement(updateSQL);
		    	preparedStatement.setInt(1, recensione.getID_utente());
			    preparedStatement.setInt(2, recensione.getID_prodotti());
			    preparedStatement.setDouble(3, recensione.getVoto());
			    preparedStatement.setString(4, recensione.getRecensione());
			    
		        preparedStatement.executeUpdate();
				    }finally {
						try {
							if (preparedStatement != null)
								preparedStatement.close();
						} finally {
							if (connection != null)
								connection.close();
						}
					}		
	}
}


