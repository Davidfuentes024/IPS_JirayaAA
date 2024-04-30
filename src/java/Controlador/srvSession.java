package Controlador;


import Modelo.DAOPERSONA;
import Modelo.DAOUSUARIO;
import Modelo.Usuario;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvSession", urlPatterns = {"/srvSession"})
public class srvSession extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                    case "verificar":
                        verificar(request, response);
                        break;
                    case "cerrar":
                        cerrarsession(request, response);
                        break;                    
                    default:
                        response.sendRedirect("identificar.jsp");
                }            
            } else {
                response.sendRedirect("identificar.jsp");
            }
        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/mensaje.jsp").forward(request, response);

            } catch (IOException | ServletException ex) {
                System.out.println("Error" + e.getMessage());
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
        processRequest(request, response);
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
        processRequest(request, response);
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

    private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion;
        DAOUSUARIO dao;
        DAOPERSONA dao2;
        Usuario usuario;
        usuario = this.obtenerUsuario(request);
        dao = new DAOUSUARIO();
        usuario = dao.identificarConCifrado(usuario);
        if (usuario != null) {
            dao2 = new DAOPERSONA();
            String nombre = dao2.obtenerNombre(usuario);
            switch (usuario.getCargo().getCodigo()) {
                case 1:
                    sesion = request.getSession();
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("nombre", nombre);
                    request.setAttribute("msje", "Bienvenido al sistema");
                    this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/Admin/Inicio.jsp").forward(request, response);
                    break;
                case 2:
                    sesion = request.getSession();
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("nombre", nombre);
                    this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/Paciente/Inicio.jsp").forward(request, response);
                    break;
                case 3:
                    sesion = request.getSession();
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("nombre", nombre);
                    this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/Doctor/Inicio.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } else {
            request.setAttribute("msje", "Credenciales Incorrectas");
            request.getRequestDispatcher("identificar.jsp").forward(request, response);
        }
    }

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", null);
        sesion.invalidate();
        response.sendRedirect("identificar.jsp");

    }

    private Usuario obtenerUsuario(HttpServletRequest request) throws UnsupportedEncodingException {
        Usuario u = new Usuario();
        // Ajustamos la codificación de los parámetros
        String nombreUsuario = new String(request.getParameter("txtUsu").getBytes("ISO8859_1"), "UTF-8");
        String clave = new String(request.getParameter("txtPass").getBytes("ISO8859_1"), "UTF-8");
        u.setNombreUsuario(nombreUsuario);
        u.setClave(clave);
        return u;
    }      
}