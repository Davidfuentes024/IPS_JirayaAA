package Controlador;

import Modelo.DAOPERSONA;
import Modelo.Persona;
import Modelo.Usuario;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "srvPersona", urlPatterns = {"/srvPersona"})
public class srvPersona extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                    case "listarPersonas":
                        listarPersonas(request, response);
                        break;
                    case "leerPersona":
                        presentarPersona(request, response);
                        break;
                    case "actualizarPersona":
                        actualizarPersona(request, response);
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

    private void listarPersonas(HttpServletRequest request, HttpServletResponse response) {
        DAOPERSONA dao = new DAOPERSONA();
        List<Persona> personas;
        try {
            personas = dao.listarPersonas();
            request.setAttribute("personas", personas);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las personas: " + e.getMessage());
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Admin/Personas.jsp").forward(request, response);
        } catch (IOException | ServletException ex) {
            request.setAttribute("msje", "No se pudo realizar la petición: " + ex.getMessage());
        }
    }

    private void actualizarPersona(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Persona persona = new Persona();
        persona.setId_persona(Integer.parseInt(request.getParameter("codigo")));
        String nombreCompleto = new String(request.getParameter("txtNombreCompleto").getBytes("ISO8859_1"), "UTF-8");
        persona.setNombre_completo(nombreCompleto);
        String lugarNacimiento = new String(request.getParameter("txtLugarNacimiento").getBytes("ISO8859_1"), "UTF-8");
        persona.setLugar_nacimiento(lugarNacimiento);
        String direccion = new String(request.getParameter("txtDireccion").getBytes("ISO8859_1"), "UTF-8");
        persona.setDireccion(direccion);
        String ocupacion = new String(request.getParameter("txtOcupacion").getBytes("ISO8859_1"), "UTF-8");
        persona.setOcupacion(ocupacion);
        persona.setTipo_sangre(request.getParameter("txtTipoSangre"));
        persona.setGenero(request.getParameter("cboGenero"));
        persona.setEdad(Date.valueOf(request.getParameter("txtFechaNacimiento")));
        persona.setEmail(request.getParameter("txtCorreoElectronico"));
        persona.setNumero_telefono(request.getParameter("txtNumeroTelefono"));
        persona.setEstado_civil(request.getParameter("cboEstadoCivil"));
        persona.setNumero_documento(request.getParameter("txtNumeroDocumento"));
        DAOPERSONA daoPersona = new DAOPERSONA();
        try {
            daoPersona.actualizarPersona(persona);
            response.sendRedirect("srvPersona?accion=listarPersonas");
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo actualizar la persona: " + e.getMessage());
            request.setAttribute("persona", persona);
        }
    }

    private void presentarPersona(HttpServletRequest request, HttpServletResponse response) {
        DAOPERSONA dao;
        Persona persona;
        if (request.getParameter("cod") != null) {
            persona = new Persona();
            persona.setUsuario(new Usuario());
            persona.getUsuario().setId_usuario((Integer.parseInt(request.getParameter("cod"))));
            dao = new DAOPERSONA();
            try {
                persona = dao.leerPersona(persona);
                if (persona != null) {
                    request.setAttribute("personaN", persona);
                } else {
                    request.setAttribute("msje", "No se encontró la persona");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }

        try {
            List<String> generos = Arrays.asList("Masculino", "Femenino");
            request.setAttribute("generos", generos);
            List<String> estadosCiviles = Arrays.asList("Soltero(a)", "Casado(a)", "Divorciado(a)", "Viudo(a)");
            request.setAttribute("estadosCiviles", estadosCiviles);
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Admin/ActualizarPersona.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            request.setAttribute("msje", "No se pudo cargar la vista");
        }
    }
}