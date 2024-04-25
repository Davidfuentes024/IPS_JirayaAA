package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOCITA extends Conexion {

    public List<Cita> listarCitas(Usuario usu) throws Exception {
        List<Cita> citas;
        Cita cit;
        ResultSet rs = null;
        String sql = "SELECT U.IDCITAS, U.FECHA, U.HORA, U.DESCRIPCION, U.ESTADO, "
                + "U.PACIENTE_ID, C.NOMBREUSUARIO, D.NOMBREUSUARIO, S.NOMBRESEDE, "
                + "P.NOMBRECONSULTORIO FROM citas U INNER JOIN "
                + "usuario C ON C.IDUSUARIO = U.PACIENTE_ID INNER JOIN usuario "
                + "D ON D.IDUSUARIO = U.DOCTOR_ID INNER JOIN sede S ON S.IDSEDE "
                + "= U.IDSEDE INNER JOIN consultorio P ON P.IDCONSULTORIO = "
                + "U.IDCONSULTORIO ";
        if (usu.getCargo().getCodigo() == 2) {
            sql += "WHERE PACIENTE_ID = '" + usu.getId_usuario() + "'";
        } else if (usu.getCargo().getCodigo() == 3) {
            sql += "WHERE DOCTOR_ID = '" + usu.getId_usuario() + "'";
        } else {
            
        }
        
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            citas = new ArrayList<>();
            while (rs.next() == true) {
                cit = new Cita();
                cit.setCodigo(rs.getInt("IDCITAS"));
                cit.setFecha(rs.getDate("FECHA"));
                cit.setHora(rs.getTime("HORA"));
                cit.setDescripcion(rs.getString("DESCRIPCION"));
                cit.setEstado(rs.getBoolean("ESTADO"));
                cit.setPaciente(new Usuario());
                cit.getPaciente().setId_usuario(rs.getInt("PACIENTE_ID"));
                cit.getPaciente().setNombreUsuario(rs.getString("C.NOMBREUSUARIO"));
                cit.setDoctor(new Usuario());
                cit.getDoctor().setNombreUsuario(rs.getString("D.NOMBREUSUARIO"));
                cit.setSede(new Sede());
                cit.getSede().setNombreSede(rs.getString("NOMBRESEDE"));
                cit.setConsultorio(new Consultorio());
                cit.getConsultorio().setNombreConsultorio(rs.getString("NOMBRECONSULTORIO"));

                citas.add(cit);
            }
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return citas;
    }

    public void agendarCitas(Cita cit) throws Exception {
        String sql;
        
                
                

        sql = "INSERT INTO citas (FECHA, HORA, PACIENTE_ID, DOCTOR_ID, "
                + "DESCRIPCION, IDSEDE, IDCONSULTORIO)"
                + "VALUES ('" + cit.getFecha() + "', '" + cit.getHora()
                + "', " + cit.getPaciente().getId_usuario() + ","
                + cit.getDoctor().getId_usuario() + ", "
                + "'" + cit.getDescripcion() + "', " + cit.getSede().getCodigo()
                + ", " + cit.getConsultorio().getCodigo() + ");";
        
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }

    public Cita leerCita(Cita cit) throws Exception {
        Cita cits = null;

        ResultSet rs = null;
        String sql;
        
        sql = "SELECT U.IDCITAS, U.FECHA, U.HORA, U.DESCRIPCION, U.IDSEDE, "
                + "U.IDCONSULTORIO, C.NOMBREUSUARIO,"
                + " D.NOMBREUSUARIO, S.NOMBRESEDE, P.NOMBRECONSULTORIO"
                + " FROM citas U "
                + "INNER JOIN usuario C ON C.IDUSUARIO = U.PACIENTE_ID "
                + "INNER JOIN usuario D ON D.IDUSUARIO = U.DOCTOR_ID "
                + "INNER JOIN sede S ON S.IDSEDE = U.IDSEDE "
                + "INNER JOIN consultorio P ON P.IDCONSULTORIO = U.IDCONSULTORIO "
                + "WHERE U.IDCITAS = " + cit.getCodigo();
        System.out.println(sql);
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                cits = new Cita();
                cits.setCodigo(rs.getInt("IDCITAS"));
                cits.setFecha(rs.getDate("FECHA"));
                cits.setHora(rs.getTime("HORA"));
                cits.setDescripcion(rs.getString("DESCRIPCION"));
                cits.setPaciente(new Usuario());
                cits.getPaciente().setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                cits.setDoctor(new Usuario());
                cits.getDoctor().setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                cits.setSede(new Sede());
                cits.getSede().setCodigo(rs.getInt("IDSEDE"));
                
                cits.getSede().setNombreSede(rs.getString("NOMBRESEDE"));
                cits.setConsultorio(new Consultorio());
                cits.getConsultorio().setCodigo(rs.getInt("IDCONSULTORIO"));
                cits.getConsultorio().setNombreConsultorio(rs.getString("NOMBRECONSULTORIO"));
            }
            
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
        }
        return cits;
    }

    public void actualizarCitas(Cita cit) throws Exception {
        String sql = "UPDATE citas SET FECHA = '" + cit.getFecha() + "', "
                + "HORA = '" + cit.getHora() + "' "                
                + "WHERE IDCITAS = " + cit.getCodigo();
        System.out.println(sql);
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }
    
    public void cambiarVigencia(Cita cit) throws Exception {
        String sql = "UPDATE citas SET estado = "
                + (cit.isEstado() == true ? "1" : "0")
                + " WHERE IDCITAS = " + cit.getCodigo();
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
