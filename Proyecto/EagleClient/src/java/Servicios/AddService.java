
package Servicios;

import BD.ControladorDeBDD;
import Catalogo.Producto;
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
 * @author Rod y Miguel
 */
public class AddService extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            System.out.println("Hola");
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
            ControladorDeBDD control = new ControladorDeBDD();System.out.println("Hola3");
            int IdProduct = Integer.parseInt(request.getParameter("ADD").trim());
            Producto prodc;
            prodc = control.GetProducto(IdProduct);            
                              
            String mensj = control.AddService(prodc.getNombreProducto(), User.getIdusuario(),"2017/12/29", prodc.getCosto());
            sesion.setAttribute("Error", 1);
            sesion.setAttribute("DescripcionError", mensj);
            System.out.println("Hola3");
            response.sendRedirect("/Clientes/IndexClient.jsp");
        } catch (Exception e) {
            sesion.setAttribute("Error", 1);
            sesion.setAttribute("DescripcionError", e.getLocalizedMessage());
            response.sendRedirect("/Clientes/IndexClient.jsp");
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddService.class.getName()).log(Level.SEVERE, null, ex);
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
