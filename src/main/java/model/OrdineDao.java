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
				+ " (EMAIL, IMPORTO_TOTALE, STATO, DATA_ORDINE, INDIRIZZO, CAP, CARTA_CREDITO, ID_ORDINE) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, ordine.getEmail());
			preparedStatement.setDouble(2, ordine.getImportoTotale());
			preparedStatement.setString(3, ordine.getStato());
			preparedStatement.setString(4, ordine.getData());
			preparedStatement.setString(5, ordine.getIndirizzo());
			preparedStatement.setString(6, ordine.getCap());
			preparedStatement.setString(7, ordine.getCartaCredito());
			preparedStatement.setInt(8, ordine.getIdOrdine());



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


	public OrdineBean doRetrieve(int idOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		OrdineBean ordine = new OrdineBean();

		String search = "SELECT * FROM " + OrdineDao.TABLE_NAME 
						+ " WHERE ID_ORDINE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(search);
			preparedStatement.setInt(1, idOrdine);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ordine.setIdOrdine(rs.getInt("ID_ORDINE"));
				ordine.setEmail(rs.getString("EMAIL"));
				ordine.setImportoTotale(rs.getDouble("IMPORTO_TOTALE"));
				ordine.setStato(rs.getString("STATO"));
				ordine.setData(rs.getString("DATA_ORDINE"));
				ordine.setIndirizzo(rs.getString("INDIRIZZO"));
				ordine.setCap(rs.getString("CAP"));
				ordine.setCartaCredito(rs.getString("CARTA_CREDITO"));
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

	
	public synchronized ArrayList<OrdineBean> doRetrieveByEmail(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<OrdineBean> ordini = new ArrayList<OrdineBean>();
		
		String search = "SELECT * FROM " + OrdineDao.TABLE_NAME
						+ " WHERE EMAIL = ? ";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(search);
			preparedStatement.setString(1, email);

			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				OrdineBean ordine = new OrdineBean();
				ordine.setIdOrdine(rs.getInt("ID_ORDINE"));
				ordine.setEmail(rs.getString("EMAIL"));
				ordine.setImportoTotale(rs.getDouble("IMPORTO_TOTALE"));
				ordine.setStato(rs.getString("STATO"));
				ordine.setData(rs.getString("DATA_ORDINE"));
				ordine.setIndirizzo(rs.getString("INDIRIZZO"));
				ordine.setCap(rs.getString("CAP"));
				ordine.setCartaCredito(rs.getString("CARTA_CREDITO"));
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
	
	
	public synchronized ArrayList<OrdineBean> doRetrieveAll(String order) throws SQLException {
	
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<OrdineBean> ordini = new ArrayList<OrdineBean>();

		String search = "SELECT * FROM " + OrdineDao.TABLE_NAME;

		if (order != null && !order.equals("")) {
			search += " ORDER BY ? " ;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(search);
			preparedStatement.setString(1, order);

			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				OrdineBean ordine = new OrdineBean();
				ordine.setIdOrdine(rs.getInt("ID_ORDINE"));
				ordine.setEmail(rs.getString("EMAIL"));
				ordine.setImportoTotale(rs.getDouble("IMPORTO_TOTALE"));
				ordine.setStato(rs.getString("STATO"));
				ordine.setData(rs.getString("DATA_ORDINE"));
				ordine.setIndirizzo(rs.getString("INDIRIZZO"));
				ordine.setCap(rs.getString("CAP"));
				ordine.setCartaCredito(rs.getString("CARTA_CREDITO"));
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

}
