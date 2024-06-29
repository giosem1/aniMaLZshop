package control;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.*;
/**
 * Servlet implementation class AddProdoct
 */
@WebServlet("/AddProdoct")
@MultipartConfig(fileSizeThreshold=1024*1024*2,
		maxFileSize=1024*1024*10,
		maxRequestSize=1024*1024*50)
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String SAVE_DIR = "images";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProdottoDao dao= new ProdottoDao();
		
		try {
			ProdottoBean prod=new ProdottoBean();
			String savePath = request.getServletContext().getRealPath("") + File.separator + SAVE_DIR;
			String fileName= null;
			if (request.getParts() != null && request.getParts().size() > 0) {
			
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
			dao.doSave(prod);
			
		}catch(SQLException e) {
			System.out.println("Error:" + e.getMessage());		
		}
		response.sendRedirect(request.getContextPath()+"/common/Home.jsp");
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
