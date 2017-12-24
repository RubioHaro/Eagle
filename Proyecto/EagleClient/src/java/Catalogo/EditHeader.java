
package Catalogo;

import BD.ControladorDeBDD;
import Usuarios.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hiram
 */
public class EditHeader extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,ClassNotFoundException,NullPointerException {
        
        HttpSession sesion = request.getSession();
        
        response.setContentType("text/html;charset=UTF-8");
        sesion.setAttribute("Error", 1);
        try (PrintWriter out = response.getWriter()) {
            System.out.println("Test 1");
            String Title = request.getParameter("Titulo");
            String Subtitulo = request.getParameter("Subtitulo");
            
            Usuario user = (Usuario) sesion.getAttribute("Usuario");
            ControladorDeBDD control = new ControladorDeBDD();
            String mensj = control.setEncabezado(Title, Subtitulo, user.getIdusuario());        
            System.out.println(mensj);
            sesion.setAttribute("DescripcionError", mensj);
        }catch(Exception exception){
            sesion.setAttribute("DescripcionError", exception.toString());
        }finally{         
            
            response.sendRedirect("/Empleados/Admin/AdminIndex.jsp");
        }
    }

    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | NullPointerException ex) {
            Logger.getLogger(EditHeader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
