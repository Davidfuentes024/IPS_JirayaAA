/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;


import java.sql.ResultSet;


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
            System.out.println("Error "+ e.getMessage());
        }finally{
           this.cerrar(false);
        }
        return usu;
    }
}
