package Controlador;

import Modelo.Cargo;
import Modelo.DAOCARGO;
import Modelo.DAOPERSONA;
import Modelo.DAOUSUARIO;
import Modelo.Persona;
import Modelo.Usuario;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvUsuario", urlPatterns = {"/srvUsuario"})
public class srvUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                    case "listarUsuarios":
                        listarUsuarios(request, response);
                        break;
                    case "nuevo":
                        presentarFormulario(request, response);
                        break;
                    case "registrar":
                        registrarUsuario(request, response);
                        break;
                    case "leerUsuario":
                        presentarUsuario(request, response);
                        break;
                    case "actualizarUsuario":
                        actualizarUsuario(request, response);
                        break;
                    case "inicio":
                        inicio(request, response);
                        break;
                    default:
                        response.sendRedirect("identificar.jsp");
                }
            } else if (request.getParameter("cambiar") != null) {
                cambiarEstado(request, response);
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

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao = new DAOUSUARIO();
        List<Usuario> usus = null;
        try {
            usus = dao.listarUsuarios();

            request.setAttribute("usuarios", usus);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los usuarios" + e.getMessage());
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Admin/Usuarios.jsp").forward(request, response);
        } catch (IOException | ServletException ex) {
            request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
        }
    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.cargarCargos(request);
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Admin/NuevoUsuario.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            request.setAttribute("msje", "No se pudo cargar la vista");
        }
    }

    private void cargarCargos(HttpServletRequest request) {
        DAOCARGO dao = new DAOCARGO();
        List<Cargo> car = null;
        try {
            car = dao.listarCargos();
            request.setAttribute("cargos", car);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo cargar los cargos :( " + e.getMessage());
        } finally {
            car = null;
            dao = null;
        }
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Usuario usu = null;
        Cargo carg;
        if (request.getParameter("txtNombreUsuario") != null
                && request.getParameter("txtClave") != null
                && request.getParameter("cboCargo") != null) {
            usu = new Usuario();
            // Ajustamos la codificación de los parámetros
            String nombreUsuario = new String(request.getParameter("txtNombreUsuario").getBytes("ISO8859_1"), "UTF-8");
            String clave = new String(request.getParameter("txtClave").getBytes("ISO8859_1"), "UTF-8");
            usu.setNombreUsuario(nombreUsuario);
            usu.setClave(clave);
            carg = new Cargo();
            carg.setCodigo(Integer.parseInt(request.getParameter("cboCargo")));
            usu.setCargo(carg);
            usu.setEstado(true);
            Persona persona = new Persona();
            // Ajustamos la codificación de los parámetros para nombre completo, lugar de nacimiento, dirección y ocupación
            String nombreCompleto = new String(request.getParameter("txtNombreCompleto").getBytes("ISO8859_1"), "UTF-8");
            String lugarNacimiento = new String(request.getParameter("txtLugarNacimiento").getBytes("ISO8859_1"), "UTF-8");
            String direccion = new String(request.getParameter("txtDireccion").getBytes("ISO8859_1"), "UTF-8");
            String ocupacion = new String(request.getParameter("txtOcupacion").getBytes("ISO8859_1"), "UTF-8");
            persona.setNombre_completo(nombreCompleto);
            persona.setTipo_sangre(request.getParameter("txtTipoSangre"));
            persona.setGenero(request.getParameter("cboGenero"));
            persona.setEdad(Date.valueOf(request.getParameter("txtFechaNacimiento")));
            persona.setLugar_nacimiento(lugarNacimiento);
            persona.setEmail(request.getParameter("txtCorreoElectronico"));
            persona.setNumero_telefono(request.getParameter("txtNumeroTelefono"));
            persona.setDireccion(direccion);
            persona.setOcupacion(ocupacion);
            persona.setEstado_civil(request.getParameter("cboEstadoCivil"));
            persona.setNumero_documento(request.getParameter("txtNumeroDocumento"));
            DAOUSUARIO daoUsu = new DAOUSUARIO();
            DAOPERSONA daoPersona = new DAOPERSONA();
            try {
                usu = daoUsu.registrarUsuarios(usu);
                persona.setUsuario(usu);
                daoPersona.registrarPersonas(persona);
                response.sendRedirect("srvUsuario?accion=listarUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo registrar el usuario" + e.getMessage());
                request.setAttribute("usuario", usu);
                this.presentarFormulario(request, response);
            }
        }
    }

    private void presentarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao;
        Usuario usus;
        if (request.getParameter("cod") != null) {
            usus = new Usuario();
            usus.setId_usuario(Integer.parseInt(request.getParameter("cod")));
            dao = new DAOUSUARIO();
            try {
                usus = dao.leerUsuario(usus);
                if (usus != null) {
                    request.setAttribute("usuarioN", usus);
                } else {
                    request.setAttribute("msje", "No se encontró el usuario");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }
        try {
            this.cargarCargos(request);
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/Admin/ActualizarUsuario.jsp"
                    ).forward(request, response);
        } catch (IOException | ServletException e) {
            request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
        }
    }

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        DAOUSUARIO daoUsu;
        Usuario usus = null;
        Cargo car;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("txtNombre") != null
                && request.getParameter("txtClave") != null
                && request.getParameter("cboCargo") != null) {

            usus = new Usuario();
            usus.setId_usuario(Integer.parseInt(request.getParameter("hCodigo")));
            // Ajustamos la codificación de los parámetros
            String nombreUsuario = new String(request.getParameter("txtNombre").getBytes("ISO8859_1"), "UTF-8");
            usus.setNombreUsuario(nombreUsuario);
            String clave = new String(request.getParameter("txtClave").getBytes("ISO8859_1"), "UTF-8");
            usus.setClave(clave);
            car = new Cargo();
            car.setCodigo(Integer.parseInt(request.getParameter("cboCargo")));
            usus.setCargo(car);
            if (request.getParameter("chkEstado") != null) {
                usus.setEstado(true);
            } else {
                usus.setEstado(false);
            }
            daoUsu = new DAOUSUARIO();
            try {
                daoUsu.actualizarUsuarios(usus);
                response.sendRedirect("srvUsuario?accion=listarUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar el usuario" + e.getMessage());
                request.setAttribute("usuario", usus);
            }
        }
    }

    private void cambiarEstado(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao;
        Usuario usu;
        try {
            dao = new DAOUSUARIO();
            usu = new Usuario();

            if (request.getParameter("cambiar").equals("activar")) {
                usu.setEstado(true);
            } else {
                usu.setEstado(false);
            }
            if (request.getParameter("cod") != null) {
                usu.setId_usuario(Integer.parseInt(request.getParameter("cod")));
                dao.cambiarVigencia(usu);
            } else {
                request.setAttribute("msje", "No se obtuvo el id del usuario");
            }
        } catch (Exception e) {
            request.setAttribute("msje", e.getMessage());
        }
        this.listarUsuarios(request, response);
    }

    private void inicio(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session;
        session = request.getSession();
        Usuario usu = (Usuario) session.getAttribute("usuario");
        switch (usu.getCargo().getCodigo()) {
            case 1:
                try {
                this.getServletConfig().getServletContext()
                        .getRequestDispatcher("/vistas/Admin/Inicio.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
            }
            break;
            case 3:
                try {
                this.getServletConfig().getServletContext()
                        .getRequestDispatcher("/vistas/Doctor/Inicio.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
            }
            break;
            default:
                try {
                this.getServletConfig().getServletContext()
                        .getRequestDispatcher("/vistas/Paciente/Inicio.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
            }
            break;
        }
    }
}
