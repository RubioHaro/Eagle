/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import Usuarios.Usuario;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author CECyT9
 */
public class ProfileChange extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Usuario user = (Usuario) sesion.getAttribute("Usuario");

        for (Part part : request.getParts()) {
            //logger.info(part.getName()); 
            try (InputStream is = request.getPart(part.getName()).getInputStream()) {
                int i = is.available();
                byte[] b = new byte[i];
                is.read(b);
                //logger.log(Level.INFO, "Length : {0}", b.length);
                String fileName = getFileName(part);
                //logger.log(Level.INFO, "File name : {0}", fileName);
                FileOutputStream os = new FileOutputStream("C:\\Users\\CECyT9\\Documents\\Eagle\\web\\Img\\profiloUtentiImage/User_" + user.getIdusuario());
                os.write(b);
            }
        }
    }

    private String getFileName(Part part) {
        String partHeader = part.getHeader("content-disposition");
        //logger.log(Level.INFO, "Part Header = {0}", partHeader); 
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim()
                        .replace("\"", "");
            }
        }
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
