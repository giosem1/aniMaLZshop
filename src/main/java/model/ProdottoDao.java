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
		Connection connection =null;
		PreparedStatement preparedStatement =null;
		String sqlInsert="INSERT INTO " + ProdottoDao.TABLE_NAME+ " (NOME, PREZZO, GENERE, ANIMALE, TAGLIA, MARCA, DESCRIZIONE, IMMAGINE, QUANTITA) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
		    	connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(sqlInsert);
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


	public ProdottoBean doRetrive(int idProd) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement =null;
		ProdottoBean prod= new ProdottoBean();

		    String selectSQL = "SELECT * FROM " + ProdottoDao.TABLE_NAME + " WHERE ID_PRODOTTI = ?";

		    try {
				connection =ds.getConnection();
				preparedStatement =connection.prepareStatement(selectSQL);
				preparedStatement.setInt(1,idProd);
				
				ResultSet rs= preparedStatement.executeQuery();
				boolean check =rs.next();
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
		 Connection connection =null;
		 PreparedStatement preparedStatement =null;
		 String deleteSQL = "DELETE FROM " + ProdottoDao.TABLE_NAME + " WHERE ID_PRODOTTI = ?";

		    try {
		    	connection = ds.getConnection();
		    	preparedStatement = connection.prepareStatement(deleteSQL);
		    	preparedStatement.setInt(1, ID_Prodotto);

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


	public ArrayList<ProdottoBean> doRetriveAll(String anim) throws SQLException {
		Connection connection = null;
	    PreparedStatement preparedStatement = null; 
	    
	    ArrayList<ProdottoBean> prodotti=new ArrayList<>();
	   
	    String selectSQL="SELECT * FROM "+ ProdottoDao.TABLE_NAME +" WHERE ANIMALE = ?";
	   
	    
		    try {
		    	connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				preparedStatement.setString(1, anim);
				ResultSet rs= preparedStatement.executeQuery();
				while(rs.next()) {
					ProdottoBean prod =new ProdottoBean();
					
					prod.setID_prodotti(rs.getInt("ID_prodotti"));
					prod.setNome(rs.getString("nome"));
					prod.setPrezzo(rs.getDouble("prezzo"));
					prod.setGenere(rs.getString("genere"));
					prod.setAnimale(rs.getString("animale"));
					prod.setTaglia(rs.getString("taglia"));
					prod.setMarca(rs.getString("marca"));
					prod.setDescrizione(rs.getString("descrizione"));
					prod.setImmagine(rs.getString("immagine"));
					prod.setQuantita(rs.getInt("quantita"));
			
	

					prodotti.add(prod);
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
		    
	    
		return prodotti;
	}

	public void doUpdate(ProdottoBean prodotto) throws SQLException {
		  String updateSQL = "UPDATE " + ProdottoDao.TABLE_NAME
		            + " SET NOME = ? , QUANTITA = ?, DESCRIZIONE = ?, PREZZO = ?, GENERE = ?, ANIMALE = ?, TAGLIA = ?, MARCA = ?, DESCRIZIONE = ?, IMMAGINE = ?"
		            + " WHERE ID_PRODOTTI = ? ";

		     Connection connection = null;
		     PreparedStatement preparedStatement = null; 
		        		
		      try { 
		    	connection = ds.getConnection();
		    	preparedStatement = connection.prepareStatement(updateSQL);
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


	@Override
	public void doUpdateQuantita(int id,int quantita) throws SQLException {
		  String updateSQL = "UPDATE " + ProdottoDao.TABLE_NAME
		            + " SET QUANTITA = ?"
		            + " WHERE ID_PRODOTTI = ? ";

		     Connection connection = null;
		     PreparedStatement preparedStatement = null; 
		        		
		      try { 
		    	connection = ds.getConnection();
		    	preparedStatement = connection.prepareStatement(updateSQL);
		        preparedStatement.setInt(1, quantita);
		        preparedStatement.setInt(2, id);
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
