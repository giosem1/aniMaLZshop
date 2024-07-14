package control;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.*;
/**
 * Servlet implementation class Modifica
 */
@WebServlet("/Modifica")
@MultipartConfig(fileSizeThreshold=0,
		maxFileSize=52428800,
		maxRequestSize=52428800)
public class Modifica extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String SAVE_DIR = "images";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modifica() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProdottoDao dao= new ProdottoDao();
		try {
			ProdottoBean prod=new ProdottoBean();
			String savePath = request.getServletContext().getRealPath("") + File.separator + SAVE_DIR;
			String fileName= null;
			if (request.getParts() != null && request.getParts().size() > 0) {
			prod.setID_prodotti(Integer.parseInt(request.getParameter("idprod")));
			prod.setNome(request.getParameter("nomeprod"));
			prod.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
			prod.setGenere(request.getParameter("genere"));
			prod.setAnimale(request.getParameter("cate"));
			prod.setTaglia(request.getParameter("taglia"));
			prod.setMarca(request.getParameter("marca"));
			prod.setDescrizione(request.getParameter("desc"));
			
				for (Part part : request.getParts()) {
					fileName = extractFileName(part);
						if (fileName != null && !fileName.equals("")) {
							part.write(savePath + File.separator + fileName);
							prod.setImmagine(fileName);
							}
				}
			
			prod.setQuantita(Integer.valueOf(request.getParameter("quant")));
			}
			dao.doUpdate(prod);
		}catch(SQLException e) {
			System.out.println("Error:" + e.getMessage());		
		}
		response.sendRedirect(request.getContextPath()+"/admin/Catalogo.jsp");
		
	}
	private String extractFileName(Part part) {
		// content-disposition: form-data; name="file"; filename="file.txt"
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
