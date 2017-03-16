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
		res.setContentType("text/html");
		String fileName = "";
		java.io.PrintWriter out = res.getWriter( );
 		// Get absolute path of this running web application
		String appPath = req.getServletContext().getRealPath("");
		// Create path to the directory to save uploaded file
		String savePath = appPath + File.separator + SAVE_DIR;
		// Create the save directory if it does not exist
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists())
			fileSaveDir.mkdir();
		for (Part part : req.getParts()) {
			fileName = extractFileName(part);
			part.write(savePath + File.separator + fileName);
		}

		jarpath = savePath + File.separator + fileName;
		destdir = savePath;
		JarFile jarfile = new JarFile(jarpath);
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
		jarfile.close();

		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet upload</title>");  
		out.println("</head>");
		out.println("<body>");
		out.println("<p>Successfully Uploaded & Extracted</p>"); 
		out.println("</body>");
		out.println("</html>");
	}

}