
package Usuarios;

import BD.ControladorDeBDD;
import BD.ResultsSetDB;
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
public class Login extends HttpServlet {

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

        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion = request.getSession();
            String User = request.getParameter("Usuario");
            String Pass = request.getParameter("Pass");
            if (User != null && Pass != null && !User.equals("") && !Pass.equals("")) {
                ControladorDeBDD control = new ControladorDeBDD();
                ResultsSetDB res = control.IniciarSesion(User, Pass);                
                if (res != null && res.getErrores() == 0 && res.getCondicion() && (res.getUser().getTipo().equals("Colaborador") || res.getUser().getTipo().equals("Cliente"))) {
                    Usuario user = res.getUser();
                    sesion.setAttribute("Usuario", user);
                    String Tipo = user.getTipo();                    
                    if (Tipo.equals("Colaborador")) {
                        response.sendRedirect("/Empleados/Admin/AdminIndex.jsp");
                    }
                    if (Tipo.equals("Cliente")) {
                        response.sendRedirect("/Clientes/IndexClient.jsp");
                    }                
                } else {
                    sesion.setAttribute("Error", 1);
                    sesion.setAttribute("DescripcionError", res.getEstaus());                                        
                    response.sendRedirect("/Index.jsp");
                }
            } else {
                sesion.setAttribute("Error", 1);
                sesion.setAttribute("DescripcionError", "DatosInvalidos");
                response.sendRedirect("/Index.jsp");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">    
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
