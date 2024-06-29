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

public class NewsDao implements NewsDaoInterface {
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
	private static String TABLE_NAME="news";
	
	public void doSave(NewsBean news) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement= null;
		
		String insertSQL="INSERT INTO "+NewsDao.TABLE_NAME+" (TITOLO, CATEGORIA, DATA_PUBLICAZIONE, ANIMALE, IMMAGINE, AUTORE, CONTENUTO) VALUES(?, ?, ?, ?, ?, ?, ?)";
		try{
			connection =ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, news.getTitolo());
			preparedStatement.setString(2, news.getCategoria());
			preparedStatement.setDate(3, news.getDataPlub());
			preparedStatement.setString(4, news.getAnimale());
			preparedStatement.setString(5, news.getImmagine());
			preparedStatement.setString(6, news.getAutore());
			preparedStatement.setString(7, news.getContenuto());
			
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

	public NewsBean doRetrive(String titolo, String categ) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement= null;
		NewsBean news= new NewsBean();
		
		String serach= "SELECT * FROM "+NewsDao.TABLE_NAME+" WHERE TITOLO= ?"+"AND CATEGORIA0 ?";
		try {
			connection =ds.getConnection();
			preparedStatement =connection.prepareStatement(serach);
			preparedStatement.setString(1, titolo);
			preparedStatement.setString(2, categ);
			ResultSet rs= preparedStatement.executeQuery();
			while(rs.next()) {
				news.setTitolo(rs.getString("titolo"));
				news.setCategoria(rs.getString("categoria"));
				news.setDataPlub(rs.getDate("data_publicazione"));
				news.setAnimale(rs.getString("animale"));
				news.setImmagine(rs.getString("immagine"));
				news.setAutore(rs.getString("autore"));
				news.setContenuto(rs.getString("contenuto"));
			
			}
		}finally {
			try {
				if(preparedStatement !=null)
					preparedStatement.close();
			}finally {
				if(connection != null)
					connection.close();
			}
		}
		return news;
	}

	public ArrayList<NewsBean> doRetriveAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
