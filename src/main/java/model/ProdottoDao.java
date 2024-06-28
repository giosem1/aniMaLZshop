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


public class ProdottoDao implements ProdottoDaoInterface {
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

	private static final String TABLE_NAME = "prodotti";
	public void doSave(ProdottoBean prodotto) throws SQLException {
		try (Connection connection = ds.getConnection();
		         PreparedStatement preparedStatement = connection.prepareStatement(
		                 "INSERT INTO " + ProdottoDao.TABLE_NAME
		                         + " (NOME, PREZZO, GENERE, ANIMALE, TAGLIA, MARCA, DESCRIZIONE, IMMAGINE, QUANTITA) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
	
		        preparedStatement.setString(1, prodotto.getNome());
		        preparedStatement.setDouble(2, prodotto.getPrezzo());
		        preparedStatement.setString(3, prodotto.getGenere());
		        preparedStatement.setString(4, prodotto.getAnimale());
		        preparedStatement.setString(5, prodotto.getTaglia());
		        preparedStatement.setString(6, prodotto.getMarca());
		        preparedStatement.setString(7, prodotto.getDescrizione());
		        preparedStatement.setString(8, prodotto.getImmagine());
		        preparedStatement.setInt(9, prodotto.getQuantita());

		        preparedStatement.executeUpdate();
		    }
		}


	public ProdottoBean doRetrive(String nome, String animale, String genere) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement =null;
		ProdottoBean prod= new ProdottoBean();

		    String selectSQL = "SELECT * FROM " + ProdottoDao.TABLE_NAME + " WHERE NOME = ? AND ANIMALE= ? AND GENERE = ?";

		    try {
				connection =ds.getConnection();
				preparedStatement =connection.prepareStatement(selectSQL);
				preparedStatement.setString(1,nome);
				preparedStatement.setString(2, animale);
				preparedStatement.setString(3, genere);
				
				ResultSet rs= preparedStatement.executeQuery();
				boolean check =rs.next();
				//da modificare con il controllo della session
				if(check) {
		            	prod.setID_prodotti(rs.getInt("ID_prodotti"));
		            	prod.setNome(rs.getString("Nome"));
		            	prod.setPrezzo(rs.getFloat("Prezzo"));
		            	prod.setGenere(rs.getString("Genere"));
		            	prod.setAnimale(rs.getString("Animale"));
		            	prod.setTaglia( rs.getString("Taglia"));
		            	prod.setMarca(rs.getString("Marca"));
		            	prod.setDescrizione(rs.getString("Descrizione"));
		            	prod.setImmagine(rs.getString("Immagine"));
		            	prod.setQuantita(rs.getInt("Quantita"));
		            }
		    }catch(Exception ex) {
				System.out.println("Login failed");
			}finally {
				try {
					if(preparedStatement !=null)
						preparedStatement.close();
				}finally {
					if(connection != null)
						connection.close();
				}
			}
			return prod;
		}


	public synchronized boolean doDelete(int ID_Prodotto) throws SQLException {
		 int result = 0;

		    String deleteSQL = "DELETE FROM " + ProdottoDao.TABLE_NAME + " WHERE ID_PRODOTTO = ?";

		    try (Connection connection = ds.getConnection();
		         PreparedStatement preparedStatement = connection.prepareStatement(deleteSQL)) {

		        preparedStatement.setInt(1, ID_Prodotto);

		        result = preparedStatement.executeUpdate();
		    }

		    return (result != 0);
		}


	public ArrayList<ProdottoBean> doRetriveAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public void doUpdate(ProdottoBean prodotto) throws SQLException {
		  String updateSQL = "UPDATE " + ProdottoDao.TABLE_NAME
		            + " SET NOME = ? , QUANTITA = ?, DESCRIZIONE = ?, PREZZO = ?, GENERE = ?, ANIMALE = ?, TAGLIA = ?, MARCA = ?, DESCRIZIONE = ?, IMMAGINE = ?"
		            + " WHERE ID_PRODOTTO = ? ";

		    try (Connection connection = ds.getConnection();
		         PreparedStatement preparedStatement = connection.prepareStatement(updateSQL)) { 
	
		        preparedStatement.setString(1, prodotto.getNome());
		        preparedStatement.setInt(2, prodotto.getQuantita());
		        preparedStatement.setString(3, prodotto.getDescrizione());
		        preparedStatement.setDouble(4, prodotto.getPrezzo());
		        preparedStatement.setString(5, prodotto.getGenere());
		        preparedStatement.setString(6, prodotto.getAnimale());
		        preparedStatement.setString(7, prodotto.getTaglia());
		        preparedStatement.setString(8, prodotto.getMarca());
		        preparedStatement.setString(9, prodotto.getDescrizione());
		        preparedStatement.setString(10, prodotto.getImmagine());	    
		        preparedStatement.setInt(11, prodotto.getID_prodotti());

		        preparedStatement.executeUpdate();
		    }
    	}

}
