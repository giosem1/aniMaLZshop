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

public class UtenteDao implements UtenteDaoInterface{
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
	
	private static final String TABLE_NAME="utente";
	
	public void doSave(UtenteBean utente) throws SQLException {
		Connection connection= null;
		PreparedStatement preparedStatement= null;
		String insertSQL="INSERT INTO "+ UtenteDao.TABLE_NAME+
				"(PWD, EMAIL, NOME, COGNOME, DATA_DI_NASCITA, VIA, NUM_CIVICO, CAP, TELEFONO, CARTA_DI_CREDITO, ISAMM) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try{
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, utente.getPassword());
			preparedStatement.setString(2, utente.getEmail());
			preparedStatement.setString(3, utente.getNome());
			preparedStatement.setString(4, utente.getCognome());
			preparedStatement.setDate(5,(Date) utente.getDataNascita());
			preparedStatement.setString(6, utente.getVia());
			preparedStatement.setString(7, utente.getNumCivico());
			preparedStatement.setInt(8, (int) utente.getCap());
			preparedStatement.setString(9, utente.getTel());
			preparedStatement.setInt(10, (int)utente.getCartaCredito());
			preparedStatement.setBoolean(11, (boolean) utente.isAmm());
			
			preparedStatement.executeUpdate();
			connection.commit();
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

	public UtenteBean doRetrive(String email, String pwd) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement =null;
		UtenteBean ute= new UtenteBean();
		
		String search="SELECT * FROM"+UtenteDao.TABLE_NAME+"WHERE EMAIL= ?"+ "AND PWD= ?";
		try {
			connection =ds.getConnection();
			preparedStatement =connection.prepareStatement(search);
			preparedStatement.setString(1,email);
			preparedStatement.setString(2, pwd);
			ResultSet rs= preparedStatement.executeQuery();
			boolean check =rs.next();
			//da modificare con il controllo della session
			if(check) {
				ute.setPassword(rs.getString("pwd"));
				ute.setEmail(rs.getString("email"));
				ute.setNome(rs.getString("nome"));
				ute.setCognome(rs.getString("cognome"));
				ute.setDataNascita(rs.getDate("data_nascita"));
				ute.setVia(rs.getString("via"));
				ute.setNumCivico(rs.getString("num_civico"));
				ute.setCap(rs.getInt("cap"));
				ute.setCartaCredito(rs.getInt("carta_credito"));
				ute.setAmm(rs.getBoolean("isAmm"));
				
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
		return ute;
	}
	//da implementare con la gestione dell'ordine
	public ArrayList<UtenteBean> doRetriveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	//da implementare con la gestione delle spedizioni
	public void doUpdateSpedizione(String email, String via, String cap) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	//da implementare con la gestione dell'acquisto
	public void doUpdatePagamento(String email, String cartaCredito) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
