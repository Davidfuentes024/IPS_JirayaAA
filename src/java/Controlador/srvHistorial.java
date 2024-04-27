package Controlador;

import Modelo.DAOHISTORIAL;
import Modelo.DAOPERSONA;
import Modelo.HistorialMedico;
import Modelo.Persona;
import Modelo.Usuario;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvHistorial", urlPatterns = {"/srvHistorial"})
public class srvHistorial extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                    case "insertarHistorial":
                        insertarHistorial(request, response);
                        break;
                    case "historialMedicoPaciente":
                        historialMedicoPaciente(request, response);
                        break;
                    default:
                        response.sendRedirect("identificar.jsp");
                }
            } else if (request.getParameter("cambiarEstadoHistorial") != null) {
                cambiarEstadoHistorial(request, response);
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

    private void historialMedicoPaciente(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session;
        session = request.getSession();
        Usuario usu = (Usuario) session.getAttribute("usuario");
        DAOPERSONA daoPersona;
        Persona persona;
        DAOHISTORIAL dao2;
        if (request.getParameter("codi") != null) {
            persona = new Persona();
            persona.setUsuario(new Usuario());
            persona.getUsuario().setId_usuario(Integer.parseInt(request.getParameter("codi")));
            daoPersona = new DAOPERSONA();
            try {
                persona = daoPersona.leerPersona(persona);
                if (persona != null) {
                    dao2 = new DAOHISTORIAL();
                    List<HistorialMedico> historial = null;
                    historial = dao2.listarHistorialesPorPersona(persona);
                    request.setAttribute("personaN", persona);
                    request.setAttribute("historiales", historial);
                } else {
                    request.setAttribute("msje", "No se encontró la persona");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos: " + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se proporcionó el parámetro necesario");
        }
        switch (usu.getCargo().getCodigo()) {
            case 1:
                try {
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/Admin/HistorialMedico.jsp"
                        ).forward(request, response);
            } catch (IOException | ServletException e) {
                request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
            }
            break;
            case 3:
                try {

                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/Doctor/HistorialMedico.jsp"
                        ).forward(request, response);
            } catch (IOException | ServletException e) {
                request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
            }
            break;
            default:
                try {

                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/Paciente/HistorialMedico.jsp"
                        ).forward(request, response);
            } catch (IOException | ServletException e) {
                request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
            }
            break;
        }
    }

    private void insertarHistorial(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setContentType("text/html;charset=UTF-8");

        DAOHISTORIAL dao;
        HistorialMedico hist = new HistorialMedico();
        if (request.getParameter("motivo") != null && request.getParameter("observaciones") != null) {
            hist.setMotivo_cita(new String(request.getParameter("motivo").getBytes("ISO8859_1"), "UTF-8"));
            hist.setObservacion(new String(request.getParameter("observaciones").getBytes("ISO8859_1"), "UTF-8"));
            hist.setPersona(new Persona());
            hist.getPersona().setId_persona(Integer.parseInt(request.getParameter("codigo")));
            try {
                dao = new DAOHISTORIAL();
                dao.insertarHistorial(hist);
                response.sendRedirect("srvHistorial?accion=historialMedicoPaciente&codi=" + request.getParameter("codig"));
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo agregar el historial" + e.getMessage());
            }
        }
    }

    private void cambiarEstadoHistorial(HttpServletRequest request, HttpServletResponse response) {
        DAOHISTORIAL dao;
        HistorialMedico hist;
        System.out.println(request.getParameter("id"));
        try {
            dao = new DAOHISTORIAL();
            hist = new HistorialMedico();
            if (request.getParameter("cambiarEstadoHistorial").equals("activar")) {
                hist.setEstado(true);
                System.out.println(hist.isEstado());
            } else {
                hist.setEstado(false);
                System.out.println(hist.isEstado());
            }
            if (request.getParameter("id") != null) {
                hist.setId_historial(Integer.parseInt(request.getParameter("id")));
                System.out.println(hist.isEstado());
                dao.cambiarVigencia(hist);
            } else {
                request.setAttribute("msje", "No se obtuvo el id de la cita");
            }
        } catch (Exception e) {
            request.setAttribute("msje", e.getMessage());
        }
        try {
            response.sendRedirect("srvHistorial?accion=historialMedicoPaciente&codi=" + request.getParameter("codig"));
        } catch (IOException ex) {
            Logger.getLogger(srvHistorial.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
