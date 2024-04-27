package Controlador;

import Modelo.Cita;
import Modelo.Sede;
import Modelo.Consultorio;
import Modelo.DAOCONSULTORIO;
import Modelo.DAOCITA;
import Modelo.DAOHORA;
import Modelo.DAOSEDE;
import Modelo.DAOUSUARIO;
import Modelo.Hora;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvCita", urlPatterns = {"/srvCita"})
public class srvCita extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                    case "listarCitas":
                        listarCitas(request, response);
                        break;
                    case "nuevaCita":
                        presentarFormularioCitas(request, response);
                        break;
                    case "leerCita":
                        presentarCita(request, response);
                        break;
                    case "actualizarCita":
                        actualizarCita(request, response);
                        break;
                    case "cargarHoras":
                        cargarHoras(request, response);
                        break;
                    case "registrarCita":
                        agendarCita(request, response);
                        break;
                    default:
                        response.sendRedirect("identificar.jsp");
                }
            } else if (request.getParameter("cambiarEstadoCita") != null) {
                cambiarEstadoCita(request, response);
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

    private void listarCitas(HttpServletRequest request, HttpServletResponse response) {
        DAOCITA dao;
        HttpSession session;
        List<Cita> cits;
        session = request.getSession();
        Usuario usu = (Usuario) session.getAttribute("usuario");
        dao = new DAOCITA();
        cits = null;
        try {
            cits = dao.listarCitas(usu);
            request.setAttribute("citas", cits);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las citas" + e.getMessage());
        } finally {
            dao = null;
        }
        try {
            switch (usu.getCargo().getCodigo()) {
                case 1:
                    this.getServletConfig().getServletContext()
                            .getRequestDispatcher("/vistas/Admin/Citas.jsp").forward(request, response);
                    break;
                case 2:
                    this.getServletConfig().getServletContext()
                            .getRequestDispatcher("/vistas/Paciente/Citas.jsp").forward(request, response);
                    break;
                case 3:
                    this.getServletConfig().getServletContext()
                            .getRequestDispatcher("/vistas/Doctor/Citas.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } catch (IOException | ServletException ex) {
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
        } catch (IOException | ServletException e) {
            request.setAttribute("msje", "No se pudo cargar la vista");
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

            switch (con.getCodigo()) {
                case 1:
                    cit.setDescripcion("Consulta de medicina familiar");
                    break;
                case 2:
                    cit.setDescripcion("Consulta de fisioterapia");
                    break;
                case 3:
                    cit.setDescripcion("Consulta de medicina interna");
                    break;
                case 4:
                    cit.setDescripcion("Consulta de psicología");
                    break;
                default:
                    cit.setDescripcion("Consulta médica");
                    throw new AssertionError();
            }
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
                response.sendRedirect("srvCita?accion=listarCitas&codi=" + paciente.getId_usuario() + "&carg=" + paciente.getCargo().getCodigo());
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo agendar la cita" + e.getMessage());
                request.setAttribute("usuario", paciente);
                this.presentarFormularioCitas(request, response);
            }
        }
    }

    private void presentarCita(HttpServletRequest request, HttpServletResponse response) {
        DAOCITA dao;
        Cita cit;
        if (request.getParameter("cod") != null) {
            cit = new Cita();
            cit.setCodigo(Integer.parseInt(request.getParameter("cod")));
            dao = new DAOCITA();
            try {
                cit = dao.leerCita(cit);
                if (cit != null) {
                    request.setAttribute("citN", cit);
                } else {
                    request.setAttribute("msje", "No se encontró la cita");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }

        try {
            this.cargarSedes(request);
            this.cargarConsultorios(request);
            this.cargarHoras(request, response);
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Paciente/ActualizarCita.jsp").forward(request, response);

        } catch (IOException | ServletException e) {
            request.setAttribute("msje", "No se pudo cargar la vista");
        }
    }

    private void actualizarCita(HttpServletRequest request, HttpServletResponse response) {
        DAOCITA dao;
        Cita cit;
        Date date;
        Time tim;
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (request.getParameter("idCita") != null
                && request.getParameter("fecha") != null
                && request.getParameter("hora") != null) {
            cit = new Cita();
            cit.setCodigo(Integer.parseInt(request.getParameter("idCita")));
            date = Date.valueOf(request.getParameter("fecha"));
            cit.setFecha(date);
            tim = Time.valueOf(request.getParameter("hora"));
            cit.setHora(tim);
            dao = new DAOCITA();
            try {
                dao.actualizarCitas(cit);
                response.sendRedirect("srvCita?accion=listarCitas&codi=" + usuario.getId_usuario() + "&carg=" + usuario.getCargo().getCodigo());
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar la cita" + e.getMessage());
            }
        }
    }

    private void cambiarEstadoCita(HttpServletRequest request, HttpServletResponse response) {
        DAOCITA dao;
        Cita cit;
        try {
            dao = new DAOCITA();
            cit = new Cita();
            if (request.getParameter("cambiarEstadoCita").equals("activar")) {
                cit.setEstado(true);
            } else {
                cit.setEstado(false);
            }
            if (request.getParameter("cod") != null) {
                cit.setCodigo(Integer.parseInt(request.getParameter("cod")));
                dao.cambiarVigencia(cit);
            } else {
                request.setAttribute("msje", "No se obtuvo el id de la cita");
            }
        } catch (Exception e) {
            request.setAttribute("msje", e.getMessage());
        }
        this.listarCitas(request, response);
    }
}
