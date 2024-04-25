/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.ResultSet;
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
                + "OBSERVACION "
                + "FROM HISTORIAL_MEDICO "
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
    
}
