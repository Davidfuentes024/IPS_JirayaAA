package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOSEDE extends Conexion {

    public List<Sede> listarSedes() throws Exception {
        List<Sede> sedes;
        Sede sed;
        ResultSet rs = null;
        String sql = "SELECT C.IDSEDE, C.NOMBRESEDE, C.ESTADO FROM sede C ORDER "
                + "BY C.IDSEDE";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            sedes = new ArrayList<>();
            while (rs.next() == true) {
                sed = new Sede();
                sed.setCodigo(rs.getInt("IDSEDE"));
                sed.setNombreSede(rs.getString("NOMBRESEDE"));
                sed.setEstado(rs.getBoolean("ESTADO"));
                sedes.add(sed);
            }            
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return sedes;
        
    }
}