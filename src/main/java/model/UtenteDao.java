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
				"(PWD, EMAIL, NOME, COGNOME, DATA_DI_NASCITA, VIA, NUM_CIVICO, CAP, TELEFONO, CARTA_DI_CREDITO, ISAMM) VALUES(MD5(?), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
			preparedStatement.setString(10, utente.getCartaCredito());
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
		
		String search="SELECT * FROM "+UtenteDao.TABLE_NAME+" WHERE PWD= ?"+ " AND EMAIL= ?";
		try {
			connection =ds.getConnection();

			preparedStatement =connection.prepareStatement(search);
			preparedStatement.setString(1,pwd);
			preparedStatement.setString(2, email);

			ResultSet rs= preparedStatement.executeQuery();
			boolean check= rs.next();

			if(check) {

				ute.setPassword(rs.getString("pwd"));
				ute.setEmail(rs.getString("email"));
				ute.setNome(rs.getString("nome"));
				ute.setCognome(rs.getString("cognome"));
				ute.setDataNascita(rs.getDate("data_di_nascita"));
				ute.setVia(rs.getString("via"));
				ute.setNumCivico(rs.getString("num_civico"));
				ute.setCap(rs.getInt("cap"));
				ute.setTel(rs.getString("telefono"));
				ute.setCartaCredito(rs.getString("carta_di_credito"));
				ute.setAmm(rs.getBoolean("isAmm"));
				ute.setId(rs.getInt("ID_Utente"));

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
	public ArrayList<UtenteBean> doRetriveAll(int order) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement =null;
		ArrayList<UtenteBean> utenti = new ArrayList<>();
		String search="SELECT * FROM "+UtenteDao.TABLE_NAME+" WHERE ID_UTENTE= ? ";
		
		try {
			connection =ds.getConnection();

			preparedStatement =connection.prepareStatement(search);
			preparedStatement.setInt(1,order);

			ResultSet rs= preparedStatement.executeQuery();

			while(rs.next()) {
				UtenteBean ute= new UtenteBean();
				
				ute.setId(rs.getInt("id_utente"));
				ute.setPassword(rs.getString("pwd"));
				ute.setEmail(rs.getString("email"));
				ute.setNome(rs.getString("nome"));
				ute.setCognome(rs.getString("cognome"));
				ute.setDataNascita(rs.getDate("data_di_nascita"));
				ute.setVia(rs.getString("via"));
				ute.setNumCivico(rs.getString("num_civico"));
				ute.setCap(rs.getInt("cap"));
				ute.setTel(rs.getString("telefono"));
				ute.setCartaCredito(rs.getString("carta_di_credito"));
				ute.setAmm(rs.getBoolean("isAmm"));
				
				utenti.add(ute);
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
		return utenti;
	}
	//da implementare con la gestione delle spedizioni
	public void doUpdateSpedizione(String email, String via, int cap, String numCivico) throws SQLException {
		 String updateSQL = "UPDATE " + UtenteDao.TABLE_NAME
		            + " SET  VIA = ?, NUM_CIVICO = ?, CAP = ?"
		            + " WHERE EMAIL = ? ";

		    try (Connection connection = ds.getConnection();
		         PreparedStatement preparedStatement = connection.prepareStatement(updateSQL)) {
		        
		        preparedStatement.setString(1, via);       
		        preparedStatement.setString(2, numCivico);
		        preparedStatement.setInt(3, cap);
		        preparedStatement.setString(4, email);;
		        preparedStatement.executeUpdate();
		    } catch (SQLException ex) {
		        System.out.println("An error occurred while updating shipping information: " + ex.getMessage());
		        throw ex;
		    }
		}

	//da implementare con la gestione dell'acquisto
	public void doUpdatePagamento(String email, String cartaCredito) throws SQLException {
		  String updateSQL = "UPDATE " + UtenteDao.TABLE_NAME
		            + " SET CARTA_DI_CREDITO = ?"
		            + " WHERE EMAIL = ? ";

		    try (Connection connection = ds.getConnection();
		         PreparedStatement preparedStatement = connection.prepareStatement(updateSQL)) {
		        
		        preparedStatement.setString(1, cartaCredito);
		        preparedStatement.setString(2, email);
		        preparedStatement.executeUpdate();
		    } catch (SQLException ex) {
		        System.out.println("An error occurred while updating payment information: " + ex.getMessage());
		        throw ex; 
		    }
		}

public boolean isEmailExist(String email) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    boolean emailExists = false;
    
    String query = "SELECT COUNT(*) FROM " + UtenteDao.TABLE_NAME + " WHERE EMAIL = ?";
    try {
        connection = ds.getConnection();
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, email);
        ResultSet rs = preparedStatement.executeQuery();
        
        if (rs.next()) {
            emailExists = rs.getInt(1) > 0;
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
    return emailExists;
}

}