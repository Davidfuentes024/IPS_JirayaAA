package Controlador;

import Modelo.Cargo;
import Modelo.Cita;
import Modelo.Sede;
import Modelo.Consultorio;
import Modelo.DAOCONSULTORIO;
import Modelo.DAOCARGO;
import Modelo.DAOCITA;
import Modelo.DAOHORA;
import Modelo.DAOSEDE;
import Modelo.DAOUSUARIO;
import Modelo.Hora;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Time;
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
                    case "verificar":
                        verificar(request, response);
                        break;
                    case "cerrar":
                        cerrarsession(request, response);
                    case "listarUsuarios":
                        listarUsuarios(request, response);
                        break;
                    case "listarCitasD":
                        listarCitasD(request, response);
                        break;
                    case "listarCitasA":
                        listarCitasA(request, response);
                        break;
                    case "listarCitas":
                        listarCitas(request, response);
                        break;
                    case "nuevo":
                        presentarFormulario(request, response);
                        break;
                    case "nuevaCita":
                        presentarFormularioCitas(request, response);
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
                    case "eliminarUsuario":
                        eliminarUsuario(request, response);
                        break;
                    case "cargarHoras":
                        cargarHoras(request, response);
                        break;
                    case "registrarCita":
                        agendarCita(request, response);
                        break;
                    case "inicioDoctor":
                        inicioDoc(request, response);
                        break;
                    case "inicio":
                        inicio(request, response);
                        break;
                    case "inicioPaciente":
                        iniciopaciente(request, response);
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

            } catch (Exception ex) {
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
        Usuario usuario;
        usuario = this.obtenerUsuario(request);

        dao = new DAOUSUARIO();
        usuario = dao.identificarConCifrado(usuario);

        if (usuario != null && usuario.getCargo().getNombreCargo().equals("ADMINISTRADOR")) {
            sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/Admin/Inicio.jsp").forward(request, response);
        } else if (usuario != null && usuario.getCargo().getNombreCargo().equals("PACIENTE")) {
            sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/Paciente/Inicio.jsp").forward(request, response);
        } else if (usuario != null && usuario.getCargo().getNombreCargo().equals("DOCTOR")) {
            sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/Doctor/Inicio.jsp").forward(request, response);
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

    private Usuario obtenerUsuario(HttpServletRequest request) {
        Usuario u = new Usuario();
        u.setNombreUsuario(request.getParameter("txtUsu"));
        u.setClave(request.getParameter("txtPass"));
        return u;
    }

    private void listarCitas(HttpServletRequest request, HttpServletResponse response) {
        DAOCITA dao;
        Usuario usu;
        List<Cita> cits;

        if (request.getParameter("codi") != null) {
            dao = new DAOCITA();
            cits = null;
            usu = new Usuario();
            usu.setId_usuario(Integer.parseInt(request.getParameter("codi")));
            usu.setCargo(new Cargo());

            usu.getCargo().setCodigo(Integer.parseInt(request.getParameter("carg")));
            try {

                cits = dao.listarCitas(usu);

                request.setAttribute("citas", cits);

            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo listar las citas" + e.getMessage());
            } finally {
                dao = null;
            }
            try {
                this.getServletConfig().getServletContext()
                        .getRequestDispatcher("/vistas/Paciente/Citas.jsp").forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }

    }

    private void listarCitasD(HttpServletRequest request, HttpServletResponse response) {
        DAOCITA dao;
        Usuario usu;
        List<Cita> cits;

        if (request.getParameter("codi") != null) {
            dao = new DAOCITA();
            cits = null;
            usu = new Usuario();
            usu.setId_usuario(Integer.parseInt(request.getParameter("codi")));
            usu.setCargo(new Cargo());

            usu.getCargo().setCodigo(Integer.parseInt(request.getParameter("carg")));
            try {

                cits = dao.listarCitas(usu);

                request.setAttribute("citas", cits);

            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo listar las citas" + e.getMessage());
            } finally {
                dao = null;
            }
            try {
                this.getServletConfig().getServletContext()
                        .getRequestDispatcher("/vistas/Doctor/Citas.jsp").forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }

    }

    private void listarCitasA(HttpServletRequest request, HttpServletResponse response) {
        DAOCITA dao;
        Usuario usu;
        List<Cita> cits;

        if (request.getParameter("codi") != null) {
            dao = new DAOCITA();
            cits = null;
            usu = new Usuario();
            usu.setId_usuario(Integer.parseInt(request.getParameter("codi")));
            usu.setCargo(new Cargo());

            usu.getCargo().setCodigo(Integer.parseInt(request.getParameter("carg")));
            try {

                cits = dao.listarCitas(usu);

                request.setAttribute("citas", cits);

            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo listar las citas" + e.getMessage());
            } finally {
                dao = null;
            }
            try {
                this.getServletConfig().getServletContext()
                        .getRequestDispatcher("/vistas/Admin/Citas.jsp").forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }

    }

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
        } catch (Exception ex) {
            request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
        }

    }

    private void presentarFormularioCitas(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.cargarSedes(request);

            this.cargarConsultorios(request);
            this.cargarHoras(request, response);

            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Paciente/NuevaCita.jsp").forward(request, response);

        } catch (Exception e) {

            request.setAttribute("msje", "No se pudo cargar la vista");

        }
    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.cargarCargos(request);
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Admin/NuevoUsuario.jsp").forward(request, response);
        } catch (Exception e) {
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

    private void cargarSedes(HttpServletRequest request) {
        DAOSEDE dao = new DAOSEDE();
        List<Sede> sed = null;
        try {
            sed = dao.listarSedes();
            request.setAttribute("sedes", sed);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo cargar las sedes :( " + e.getMessage());
        } finally {
            sed = null;
            dao = null;
        }
    }

    private void cargarHoras(HttpServletRequest request, HttpServletResponse response) {

        DAOHORA dao = new DAOHORA();
        List<Hora> tim = null;
        Date date = null;
        Consultorio consul = new Consultorio();
        Sede sed = new Sede();
        if (request.getParameter("fecha") != null) {

            date = Date.valueOf(request.getParameter("fecha"));
            consul.setCodigo(Integer.parseInt(request.getParameter("consultorio")));
            sed.setCodigo(Integer.parseInt(request.getParameter("sede")));

            try {

                tim = dao.listarHoras(date, consul, sed);

                StringBuilder htmlBuilder = new StringBuilder();
                htmlBuilder.append("<select name=\"hora\">");
                htmlBuilder.append("<option value=\"0\">Seleccione una hora</option>");
                for (Hora hora : tim) {
                    if (hora.isEstado()) {
                        htmlBuilder.append("<option value=\"").append(hora.getNombre()).append("\">").append(hora.getNombre()).append("</option>");
                    }

                }
                htmlBuilder.append("</select>");

                response.setContentType("text/html;charset=UTF-8");
                response.setCharacterEncoding("UTF-8");
                try ( PrintWriter out = response.getWriter()) {
                    out.print(htmlBuilder.toString());
                    out.flush();
                }

            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo cargar las horas :( " + e.getMessage());
            } finally {
                tim = null;
                dao = null;
            }

        }

    }

    private void cargarConsultorios(HttpServletRequest request) {
        DAOCONSULTORIO dao = new DAOCONSULTORIO();
        List<Consultorio> con = null;
        try {
            con = dao.listarConsultorio();
            request.setAttribute("consultorios", con);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo cargar los consultorios :( " + e.getMessage());
        } finally {
            con = null;
            dao = null;
        }
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO daoUsu;
        Usuario usu = null;
        Cargo carg;
        if (request.getParameter("txtNombre") != null
                && request.getParameter("txtClave") != null
                && request.getParameter("cboCargo") != null) {

            usu = new Usuario();
            usu.setNombreUsuario(request.getParameter("txtNombre"));
            usu.setClave(request.getParameter("txtClave"));
            carg = new Cargo();
            carg.setCodigo(Integer.parseInt(request.getParameter("cboCargo")));
            usu.setCargo(carg);
            if (request.getParameter("chkEstado") != null) {
                usu.setEstado(true);
            } else {
                usu.setEstado(false);
            }
            daoUsu = new DAOUSUARIO();
            try {
                daoUsu.registrarUsuarios(usu);
                response.sendRedirect("srvUsuario?accion=listarUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo registrar el usuario" + e.getMessage());
                request.setAttribute("usuario", usu);
                this.presentarFormulario(request, response);
            }
        }
    }

    private void agendarCita(HttpServletRequest request, HttpServletResponse response) {

        DAOCITA daoCit;
        Cita cit = null;
        Sede sed;
        Consultorio con;
        Date date;
        Time tim;
        Usuario paciente;
        Usuario doctor;
        DAOUSUARIO daoUsu;
        if (request.getParameter("sede") != null
                && request.getParameter("consultorio") != null
                && request.getParameter("fecha") != null
                && request.getParameter("hora") != null) {

            cit = new Cita();
            sed = new Sede();
            sed.setCodigo(Integer.parseInt(request.getParameter("sede")));
            cit.setSede(sed);
            con = new Consultorio();
            con.setCodigo(Integer.parseInt(request.getParameter("consultorio")));
            cit.setConsultorio(con);
            cit.setDescripcion("Consulta médica");
            date = Date.valueOf(request.getParameter("fecha"));
            cit.setFecha(date);

            tim = Time.valueOf(request.getParameter("hora"));

            cit.setHora(tim);
            paciente = new Usuario();

            paciente = (Usuario) request.getSession().getAttribute("usuario");
            cit.setPaciente(paciente);
            daoUsu = new DAOUSUARIO();
            doctor = new Usuario();

            try {

                doctor = daoUsu.obtenerDoctor(con.getCodigo(), sed.getCodigo());
            } catch (Exception e) {
                doctor = null;
            }
            cit.setDoctor(doctor);
            daoCit = new DAOCITA();
            try {

                daoCit.agendarCitas(cit);

                response.sendRedirect("srvUsuario?accion=listarCitas&codi=" + paciente.getId_usuario() + "&carg=" + paciente.getCargo().getCodigo());
            } catch (Exception e) {

                request.setAttribute("msje",
                        "No se pudo agendar la cita" + e.getMessage());
                request.setAttribute("usuario", paciente);
                this.presentarFormularioCitas(request, response);
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
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
        }
    }

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO daoUsu;
        Usuario usus = null;
        Cargo car;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("txtNombre") != null
                && request.getParameter("txtClave") != null
                && request.getParameter("cboCargo") != null) {

            usus = new Usuario();
            usus.setId_usuario(Integer.parseInt(request.getParameter("hCodigo")));
            usus.setNombreUsuario(request.getParameter("txtNombre"));
            usus.setClave(request.getParameter("txtClave"));
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
            try {
                this.cargarCargos(request);
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/Admin/ActualizarUsuario.jsp"
                        ).forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("msje", "No se pudo realizar la operacion" + ex.getMessage());
            }
        }

    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao = new DAOUSUARIO();
        Usuario usus = new Usuario();
        if (request.getParameter("cod") != null) {
            usus.setId_usuario(Integer.parseInt(request.getParameter("cod")));
            try {
                dao.eliminarUsuario(usus);
                response.sendRedirect("srvUsuario?accion=listarUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontró el usuario");
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

    private void inicioDoc(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Doctor/Inicio.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
        }
    }

    private void inicio(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Admin/Inicio.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
        }
    }

    private void iniciopaciente(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Paciente/Inicio.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
        }
    }

}
