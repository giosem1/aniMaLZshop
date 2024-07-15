package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrdineDao implements OrdineDaoInterface {
	private static DataSource ds;
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/aniMaLZshop");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	private static final String TABLE_NAME = "ordine";

	public void doSave(OrdineBean ordine) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + OrdineDao.TABLE_NAME
				+ " ( IMPORTO, ID_UTENTE, DATA_ORDINE, QUANTITA) VALUES (?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setDouble(1, ordine.getImportoTotale());
			preparedStatement.setInt(2, ordine.getIdUtente());
			preparedStatement.setDate(3,(Date) ordine.getData());
			preparedStatement.setInt(4, ordine.getquantita());


			preparedStatement.executeUpdate();
			connection.commit();
		} 
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally {
				if (connection != null)
					connection.close();
			}
		}
	}


	public OrdineBean doRetrieve(int idUtente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		OrdineBean ordine = new OrdineBean();

		String search = "SELECT * FROM " + OrdineDao.TABLE_NAME 
						+ " WHERE ID_Utente = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(search);
			preparedStatement.setInt(1, idUtente);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ordine.setIdOrdine(rs.getInt("ID_ORDINE"));
				ordine.setImportoTotale(rs.getDouble("IMPORTO"));
				ordine.setData(rs.getDate("DATA_ORDINE"));
				ordine.setIdUtente(rs.getInt("ID_UTENTE"));
				ordine.setquantita(rs.getInt("QUANTITA"));
				
				
			}

		} 
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally {
				if (connection != null)
					connection.close();
			}
		}
		
		return ordine;
	}
	
	public synchronized ArrayList<OrdineBean> doRetrieveAll(int idUtente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		ArrayList<OrdineBean> ordini= new ArrayList<>();

		String search = "SELECT * FROM " + OrdineDao.TABLE_NAME 
						+ " WHERE ID_Utente = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(search);
			preparedStatement.setInt(1, idUtente);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrdineBean ordine = new OrdineBean();
				ordine.setIdOrdine(rs.getInt("ID_ORDINE"));
				ordine.setImportoTotale(rs.getDouble("IMPORTO"));
				ordine.setData(rs.getDate("DATA_ORDINE"));
				ordine.setIdUtente(rs.getInt("ID_UTENTE"));
				ordine.setquantita(rs.getInt("QUANTITA"));
				
				
				ordini.add(ordine);
			}

		} 
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally {
				if (connection != null)
					connection.close();
			}
		}
		
		return ordini;
		
	}

	 public ArrayList<OrdineBean> doRetrieveOrdersByDate(int idUtente, String date) throws SQLException {
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ArrayList<OrdineBean> ordini = new ArrayList<>();

	        String search = "SELECT * FROM " + TABLE_NAME + " WHERE ID_UTENTE = ? AND DATA_ORDINE = ?";
	        try {
	            connection = ds.getConnection();
	            preparedStatement = connection.prepareStatement(search);
	            preparedStatement.setInt(1, idUtente);
	            preparedStatement.setDate(2, Date.valueOf(date));

	            ResultSet rs = preparedStatement.executeQuery();
	            while (rs.next()) {
	                OrdineBean ordine = new OrdineBean();
	                ordine.setIdOrdine(rs.getInt("ID_ORDINE"));
	                ordine.setImportoTotale(rs.getDouble("IMPORTO"));
	                ordine.setData(rs.getDate("DATA_ORDINE"));
	                ordine.setIdUtente(rs.getInt("ID_UTENTE"));
	                ordine.setquantita(rs.getInt("QUANTITA"));
	                ordini.add(ordine);
	            }
	        } finally {
	            try {
	                if (preparedStatement != null)
	                    preparedStatement.close();
	            } finally {
	                if (connection != null)
	                    connection.close();
	            }
	        }
	        return ordini;
	    }
	}
