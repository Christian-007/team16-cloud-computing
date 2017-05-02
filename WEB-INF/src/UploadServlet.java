import java.io.File;
import java.io.IOException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
import java.sql.*;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
				maxFileSize=1024*1024*10, // 10MB
				maxRequestSize=1024*1024*50) // 50MB

public class UploadServlet extends HttpServlet {
	
	private static final String SAVE_DIR = "uploadedFiles";
	private static String jarpath = "source/path/MyJar.jar";
	private static String destdir = "target/path/";

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length()-1);
			}
		}
		return "";
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String app_name = req.getParameter("app_name");
		String description = req.getParameter("description");
		String uploaded_file_name=""; String icon_name="";
		HttpSession session = req.getSession(true);	    
		Integer userID = (Integer) session.getAttribute("userID");

		// String phone = req.getParameter("phone");
		// String password = req.getParameter("password");

		res.setContentType("text/html");
		String fileName = ""; String jarExtension = "";
		java.io.PrintWriter out = res.getWriter( );
 		// Get absolute path of this running web application
		String appPath = req.getServletContext().getRealPath("");
		// String appPath = req.getServletContext().getResourceAsStream("");
		File pathFile = new File(appPath);
		// Create path to the directory to save uploaded file
		String savePath = appPath + File.separator + SAVE_DIR;
		// Create the save directory if it does not exist
		// File fileSaveDir = new File(savePath);
		// if (!fileSaveDir.exists())
		// 	fileSaveDir.mkdir();
		// out.println("<p>App Name: " + app_name + "</p>");
		// out.println("<p>Description: " + description + "</p>");
		for (Part part : req.getParts()) {
			
			fileName = extractFileName(part);
			if(!fileName.isEmpty()){
				jarExtension = getFileExtension(fileName);

				if(jarExtension.equals("war")) {
					uploaded_file_name = fileName;
					savePath = pathFile.getParent() + File.separator + fileName;
					part.write(savePath);		
				}else {
					icon_name = fileName;
					part.write(appPath + File.separator + "images" + File.separator + fileName);
				}
			}
		}
		savePath = "";
		jarpath = pathFile.getParent() + File.separator + fileName;
		destdir = pathFile.getParent();

		try (
			Connection conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/platform?useSSL=false", "root", "sunardi");
			Statement stmt = conn.createStatement();
		) {
			// INSERT a record
			String sqlInsert = "insert into applications (app_name,file_name,description,icon_name,user_id) values ('" + app_name + "', '" + uploaded_file_name + "', '" + description + "', '" + icon_name + "', '" + userID + "')";
			System.out.println("The SQL query is: " + sqlInsert);  // Echo for debugging
			int countInserted = stmt.executeUpdate(sqlInsert);
			System.out.println(countInserted + " records inserted.\n");

			// Redirect user if it's successful and send session attribute to index.jsp
			res.sendRedirect("index.jsp");

			// out.println("<html><body>");
			// out.println("Successfully registered!");
			// out.println("</body></html>");
	 
		} catch(SQLException ex) {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");  
			out.println("</head>");
			out.println("<body>");
			out.println("<p>Error occurred.</p>"); 
			out.println("</body>");
			out.println("</html>");
			ex.printStackTrace();
		}
		/* JarFile jarfile = new JarFile(jarpath);
		for (Enumeration<JarEntry> iter = jarfile.entries(); iter.hasMoreElements();) {
			JarEntry entry = iter.nextElement();
			System.out.println("Processing: " + entry.getName());
			File outfile = new File(destdir, entry.getName());
			if (! outfile.exists())
				outfile.getParentFile().mkdirs(); // create dir structure
			if (! entry.isDirectory()) {
				InputStream instream = jarfile.getInputStream(entry);
				FileOutputStream outstream = new FileOutputStream(outfile);
				while (instream.available() > 0) {
					outstream.write(instream.read());
				}
				outstream.close();
				instream.close();
			} // end if
		} // end for
		jarfile.close();*/
	}

	private String getFileExtension(String fileName){
		if (fileName.length() == 3) {
			return fileName;
		} else if (fileName.length() > 3) {
			return fileName.substring(fileName.length() - 3);
		} else {
			return "Error";
		}
	}

}