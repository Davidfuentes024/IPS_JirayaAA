package Modelo;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author caki-
 */
public class DAOHISTORIAL extends Conexion {

    public List<HistorialMedico> listarHistorialesPorPersona(Persona persona) throws Exception {
        List<HistorialMedico> historiales = new ArrayList<>();
        ResultSet rs = null;
        String sql = "SELECT "
                + "IDHISTORIAL, "
                + "IDPERSONA, "
                + "FECHA, "
                + "MOTIVO_CITA, "
                + "OBSERVACION, "
                + "estado "
                + "FROM historial_medico "
                + "WHERE IDPERSONA = " + persona.getId_persona();
        System.out.println(sql);
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            while (rs.next()) {
                HistorialMedico historial = new HistorialMedico();
                historial.setId_historial(rs.getInt("IDHISTORIAL"));
                historial.setPersona(new Persona());
                historial.getPersona().setId_persona(rs.getInt("IDPERSONA"));
                historial.setFecha(rs.getDate("FECHA"));
                historial.setMotivo_cita(rs.getString("MOTIVO_CITA"));
                historial.setObservacion(rs.getString("OBSERVACION"));
                historial.setEstado(rs.getBoolean("estado"));
                historiales.add(historial);
            }
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
        }
        return historiales;
    }

    public void insertarHistorial(HistorialMedico hist) throws Exception {
        LocalDate fechaHoy = LocalDate.now();
        String sql = "INSERT INTO `historial_medico` "
                + "(`IDPERSONA`, `FECHA`, `OBSERVACION`, `MOTIVO_CITA`) "
                + "VALUES (" + hist.getPersona().getId_persona() + ", "
                + "'" + fechaHoy + "', '" + hist.getObservacion()+ "', "
                + "'" + hist.getMotivo_cita() + "');";
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }
    public void cambiarVigencia(HistorialMedico hist) throws Exception {
        String sql = "UPDATE historial_medico SET estado = "
                + (hist.isEstado() == true ? "1" : "0")
                + " WHERE IDHISTORIAL = " + hist.getId_historial();
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }
}
