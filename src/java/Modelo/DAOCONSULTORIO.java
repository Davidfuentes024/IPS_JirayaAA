package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOCONSULTORIO extends Conexion {

    public List<Consultorio> listarConsultorio() throws Exception {
        List<Consultorio> consultorios;
        Consultorio con;
        ResultSet rs = null;
        String sql = "SELECT C.IDCONSULTORIO, C.NOMBRECONSULTORIO, C.ESTADO FROM consultorio C "
                + "ORDER BY C.IDCONSULTORIO";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            consultorios = new ArrayList<>();
            while (rs.next() == true) {
                con = new Consultorio();
                con.setCodigo(rs.getInt("IDCONSULTORIO"));
                con.setNombreConsultorio(rs.getString("NOMBRECONSULTORIO"));
                con.setEstado(rs.getBoolean("ESTADO"));
                consultorios.add(con);
            }
            
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return consultorios;
    }
}
