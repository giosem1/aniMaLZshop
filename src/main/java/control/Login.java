package control;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import model.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        UtenteDao userDao = new UtenteDao();
	        response.setContentType("application/json");

	        try { 
	            BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
	            Gson gson = new Gson();
	            JsonObject json = gson.fromJson(reader, JsonObject.class);

	            String username = json.get("user").getAsString();
	            String password = json.get("pwd").getAsString();
	            
	            // Hash the incoming password using MD5
	            String hashedPassword = hashPasswordMD5(password);

	            UtenteBean user = userDao.doRetrive(username, hashedPassword);

	            if (user != null && username.equals(user.getEmail()) && hashedPassword.equals(user.getPassword())) {
	                HttpSession session = request.getSession(true);
	                session.setAttribute("currentSessionUser", user);
	                response.getWriter().write("{\"status\": \"success\", \"redirect\": \"" + request.getContextPath() + "/Home.jsp\"}");
	            } else {
	                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	                response.getWriter().write("{\"status\": \"error\", \"message\": \"Email o password non valida\"}");
	            }
	        } catch (SQLException e) {
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            response.getWriter().write("{\"status\": \"error\", \"message\": \"Errore durante il login\"}");
	            e.printStackTrace();
	        } catch (Exception e) {
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            response.getWriter().write("{\"status\": \"error\", \"message\": \"Errore interno del server\"}");
	            e.printStackTrace();
	        }
	    }

	    // Method to hash a password using MD5
	    private String hashPasswordMD5(String password) {
	        try {
	            MessageDigest md = MessageDigest.getInstance("MD5");
	            md.update(password.getBytes());
	            byte[] digest = md.digest();
	            StringBuilder sb = new StringBuilder();
	            for (byte b : digest) {
	                sb.append(String.format("%02x", b));
	            }
	            return sb.toString();
	        } catch (NoSuchAlgorithmException e) {
	            throw new RuntimeException(e);
	        }
	    }
	}