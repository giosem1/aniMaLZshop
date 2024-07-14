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

public class InseritiDao implements InseritiDaoInterface {
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

	private static final String TABLE_NAME = "inseriti";
	@Override
	public void doSave(InseritiBean prodotto) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public InseritiBean doRetrive(int idOrd) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<InseritiBean> doRetriveAll( int idOrd) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ArrayList<InseritiBean> inse= new ArrayList<>();
	
		
		String search = "SELECT * FROM " + InseritiDao.TABLE_NAME 
				+ " WHERE ID_ORDINE = ?";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(search);
			preparedStatement.setInt(1, idOrd);

			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				InseritiBean ins= new InseritiBean();
				ins.setID_ordine(rs.getInt("ID_ordine"));
				ins.setID_prodotti(rs.getInt("ID_prodotti"));
				ins.setNome(rs.getString("nome"));
				ins.setPrezzo(rs.getDouble("prezzo"));
				ins.setQuantita(rs.getInt("quantita"));
				
				inse.add(ins);

				
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
		return inse;
	}

}
