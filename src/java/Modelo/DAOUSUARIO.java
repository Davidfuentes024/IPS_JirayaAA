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
public class DAOUSUARIO extends Conexion {

    public Usuario identificar(Usuario user) throws Exception {
        Usuario usu = null;

        ResultSet rs = null;
        String sql = "SELECT U.IDUSUARIO, C.NOMBRECARGO FROM usuario "
                + "U INNER JOIN CARGO C ON U.IDCARGO = C.IDCARGO "
                + "WHERE U.ESTADO = 1 AND U.NOMBREUSUARIO =  '" + user.getNombreUsuario() + "'"
                + "AND U.CLAVE = '" + user.getClave() + "'";
        try {

            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                usu = new Usuario();
                usu.setId_usuario(rs.getInt("IDUSUARIO"));
                usu.setNombreUsuario(user.getNombreUsuario());
                usu.setCargo(new Cargo());
                usu.getCargo().setNombreCargo(rs.getString("NOMBRECARGO"));
                usu.setEstado(true);
            }
            rs.close();
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        } finally {
            this.cerrar(false);
        }
        return usu;

    }

    public List<Usuario> listarUsuarios() throws Exception {
        List<Usuario> usuarios;
        Usuario usu;
        ResultSet rs = null;
        String sql = "SELECT U.IDUSUARIO, U.NOMBREUSUARIO, U.CLAVE, U.ESTADO, C.NOMBRECARGO "
                + "FROM usuario U INNER JOIN cargo C "
                + "ON C.IDCARGO = U.IDCARGO "
                + "ORDER BY U.IDUSUARIO";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            usuarios = new ArrayList<>();
            while (rs.next() == true) {
                usu = new Usuario();
                usu.setId_usuario(rs.getInt("IDUSUARIO"));
                usu.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                usu.setClave(rs.getString("CLAVE"));
                usu.setEstado(rs.getBoolean("ESTADO"));
                usu.setCargo(new Cargo());
                usu.getCargo().setNombreCargo(rs.getString("NOMBRECARGO"));
                usuarios.add(usu);
            }
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return usuarios;
    }

    public void registrarUsuarios(Usuario usu) throws Exception {
        String sql;
        sql = "INSERT INTO Usuario (NOMBREUSUARIO, CLAVE, ESTADO, IDCARGO) "
                + "VALUES ('" + usu.getNombreUsuario() + "', '"
                + usu.getClave() + "', "
                + (usu.isEstado() == true ? "1" : "0")
                + ", " + usu.getCargo().getCodigo() + ")";
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }

    public Usuario leerUsuario(Usuario usu) throws Exception {
        Usuario usus = null;
        ResultSet rs = null;
        String sql = "SELECT U.IDUSUARIO, U.NOMBREUSUARIO, U.CLAVE, U.ESTADO, U.IDCARGO "
                + "FROM usuario U WHERE U.IDUSUARIO = " + usu.getId_usuario();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                usus = new Usuario();
                usus.setId_usuario(rs.getInt("IDUSUARIO"));
                usus.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                usus.setClave(rs.getString("CLAVE"));
                usus.setEstado(rs.getBoolean("ESTADO"));
                usus.setCargo(new Cargo());
                usus.getCargo().setCodigo(rs.getInt("IDCARGO"));
            }
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
        }
        return usus;
    }

    public void actualizarUsuarios(Usuario usu) throws Exception {
        String sql = "UPDATE usuario SET NOMBREUSUARIO = '"
                + usu.getNombreUsuario() + "', CLAVE = '"
                + usu.getClave() + "', ESTADO = "
                + (usu.isEstado() == true ? "1" : "0")
                + ", IDCARGO = "
                + usu.getCargo().getCodigo()
                + " WHERE IDUSUARIO = " + usu.getId_usuario();
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }

    public void eliminarUsuario(Usuario usu) throws Exception {
        String sql = "DELETE FROM USUARIO"
                + " WHERE IDUSUARIO = " + usu.getId_usuario();
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }

    public void cambiarVigencia(Usuario usus) throws Exception {
        String sql = "UPDATE usuario SET estado = "
                + (usus.isEstado() == true ? "1" : "0")
                + " WHERE idusuario = " + usus.getId_usuario();
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
