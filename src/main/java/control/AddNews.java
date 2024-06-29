package control;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.*;

/**
 * Servlet implementation class AddNews
 */
@WebServlet("/AddNews")
@MultipartConfig(fileSizeThreshold=1024*1024*2,
maxFileSize=1024*1024*10,
maxRequestSize=1024*1024*50)
public class AddNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String SAVE_DIR = "images";
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDao dao= new NewsDao();
		
		try {
			NewsBean news= new NewsBean();
			String savePath = request.getServletContext().getRealPath("") + File.separator + SAVE_DIR;
			String fileName= null;
			
			if (request.getParts() != null && request.getParts().size() > 0) {
				news.setTitolo(request.getParameter("titolo"));
				news.setCategoria(request.getParameter("cate"));
				news.setDataPlub(Date.valueOf(request.getParameter("dataPubl")));
				news.setAnimale(request.getParameter("animal"));
				
				for (Part part : request.getParts()) {
					fileName = extractFileName(part);
						if (fileName != null && !fileName.equals("")) {
							part.write(savePath + File.separator + fileName);
							news.setImmagine(fileName);
							}
				}
				
				news.setAutore(request.getParameter("aut"));
				news.setContenuto(request.getParameter("cont"));
				dao.doSave(news);
				
				response.sendRedirect(request.getContextPath()+"/common/Home.jsp");

			}
		}catch(SQLException e) {
			System.out.println("Error:" + e.getMessage());		
		}
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
