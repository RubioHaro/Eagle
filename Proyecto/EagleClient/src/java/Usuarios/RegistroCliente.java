
package Usuarios;

import BD.ControladorDeBDD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class RegistroCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion = request.getSession();
            String Nombre = request.getParameter("Nombre");
            String apellidoP = request.getParameter("Paterno");
            String apellidoM = request.getParameter("Materno");
            String Mail = request.getParameter("Correo");
            String Pass = request.getParameter("Pass");
            String Pass2 = request.getParameter("Pass_2");
            String Empresa = request.getParameter("NombreEmpresa");
            String Calle = request.getParameter("Calle");
            String colonia = request.getParameter("Colonia");
            int NumExt = Integer.parseInt(request.getParameter("Num_ex"));
            int NumInt = Integer.parseInt(request.getParameter("Num_int"));
            String delegacion = request.getParameter("Delegacion");
            int codigoPostal = Integer.parseInt(request.getParameter("CP"));

            ///Aqui debe estar la validacion
            if (1 == 1) {
                ControladorDeBDD control = new ControladorDeBDD();
                String res = control.RegistrarCliente(Nombre, apellidoP, apellidoM, Empresa, Pass, Mail, colonia, codigoPostal, NumExt, NumInt, Calle, delegacion);
                sesion.setAttribute("Error", 1);
                sesion.setAttribute("DescripcionError", res);
                response.sendRedirect("/Index.jsp");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RegistroCliente.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegistroCliente.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegistroCliente.class.getName()).log(Level.SEVERE, null, ex);
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
