package Usuarios;

import BD.ControladorDeBDD;
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
 * @author Emilio
 */
public class Consultar extends HttpServlet {

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
            /*Si Ya se conoce el id*/
            String IDCliente = request.getParameter("IDCliente");
            String IDColaborador = request.getParameter("IDColaborador");

            Usuario user;
            ControladorDeBDD control = new ControladorDeBDD();

            String User;
            String Parametro;
            String Value = "Id";
            if (IDColaborador != null) {
                User="Empleado";
                Parametro = IDColaborador;
            } else if (IDCliente != null) {
                User="Cliente";
                Parametro = IDCliente;
            } else {
                Value = request.getParameter("optradio");
                User = request.getParameter("User");
                Parametro = request.getParameter("Buscar");
            }
            switch (Value) {
                case "Correo":
                    user = control.BuscarUsuario(Parametro, "Mail", User).getUser();
                    break;
                case "Id":
                    user = control.BuscarUsuario(Parametro, "Idusuario", User).getUser();
                    break;
                case "Name":
                    user = control.BuscarUsuario(Parametro, "Nombre", User).getUser();
                    break;
                default:
                    user = null;
                    sesion.setAttribute("Error", 1);
                    sesion.setAttribute("DescripcionError", "Parametros invaidos, ERROR LOGICO: USER-100");
                    break;
            }
            sesion.setAttribute("UsuarioConsultado", user);
            response.sendRedirect("/Empleados/Admin/Consultas.jsp");
        } catch (Exception e) {
            sesion.setAttribute("Error", 1);
            sesion.setAttribute("DescripcionError", e.toString());
            response.sendRedirect("/Empleados/Admin/Consultas.jsp");
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
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
