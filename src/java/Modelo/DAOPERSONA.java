/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author caki-
 */
public class DAOPERSONA extends Conexion {

    public Persona leerPersona(Persona usu) throws Exception {
        Persona person = null;
        ResultSet rs = null;
        String sql;
        sql = "SELECT "
                + "u.IDPERSONA, "
                + "u.IDUSUARIO, "
                + "u.NOMBRE_COMPLETO, "
                + "u.TIPO_SANGRE, "
                + "u.GENERO, "
                + "u.EDAD, "
                + "u.LUGAR_NACIMIENTO, "
                + "u.EMAIL, "
                + "u.NUMERO_TELEFONO, "
                + "u.DIRECCION, "
                + "u.OCUPACION, "
                + "u.ESTADO_CIVIL, "
                + "u.NUMERO_DOCUMENTO "
                + "FROM PERSONA u "
                + "WHERE U.IDUSUARIO = " + usu.getUsuario().getId_usuario();
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            if (rs.next() == true) {
                person = new Persona();
                person.setId_persona(rs.getInt("IDPERSONA"));
                person.setUsuario(new Usuario());
                person.getUsuario().setId_usuario(rs.getInt("IDUSUARIO"));
                person.setNombre_completo(rs.getString("NOMBRE_COMPLETO"));
                person.setTipo_sangre(rs.getString("TIPO_SANGRE"));
                person.setGenero(rs.getString("GENERO"));
                person.setEdad(rs.getString("EDAD"));
                person.setLugar_nacimiento(rs.getString("LUGAR_NACIMIENTO"));
                person.setEmail(rs.getString("EMAIL"));
                person.setNumero_telefono(rs.getString("NUMERO_TELEFONO"));
                person.setDireccion(rs.getString("DIRECCION"));
                person.setOcupacion(rs.getString("OCUPACION"));
                person.setEstado_civil(rs.getString("ESTADO_CIVIL"));
                person.setNumero_documento(rs.getString("NUMERO_DOCUMENTO"));
            }
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
        }
        return person;
    }

    public ArrayList<Persona> listarPersonas() throws Exception {
        ArrayList<Persona> personas = new ArrayList<>();
        ResultSet rs = null;
        String sql = "SELECT "
                + "p.IDPERSONA, "
                + "p.IDUSUARIO, "
                + "p.NOMBRE_COMPLETO, "
                + "p.TIPO_SANGRE, "
                + "p.GENERO, "
                + "p.EDAD, "
                + "p.LUGAR_NACIMIENTO, "
                + "p.EMAIL, "
                + "p.NUMERO_TELEFONO, "
                + "p.DIRECCION, "
                + "p.OCUPACION, "
                + "p.ESTADO_CIVIL, "
                + "p.NUMERO_DOCUMENTO "
                + "FROM PERSONA p";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            while (rs.next()) {
                Persona persona = new Persona();
                persona.setId_persona(rs.getInt("IDPERSONA"));
                persona.setUsuario(new Usuario());
                persona.getUsuario().setId_usuario(rs.getInt("IDUSUARIO"));
                persona.setNombre_completo(rs.getString("NOMBRE_COMPLETO"));
                persona.setTipo_sangre(rs.getString("TIPO_SANGRE"));
                persona.setGenero(rs.getString("GENERO"));
                persona.setEdad(rs.getString("EDAD"));
                persona.setLugar_nacimiento(rs.getString("LUGAR_NACIMIENTO"));
                persona.setEmail(rs.getString("EMAIL"));
                persona.setNumero_telefono(rs.getString("NUMERO_TELEFONO"));
                persona.setDireccion(rs.getString("DIRECCION"));
                persona.setOcupacion(rs.getString("OCUPACION"));
                persona.setEstado_civil(rs.getString("ESTADO_CIVIL"));
                persona.setNumero_documento(rs.getString("NUMERO_DOCUMENTO"));

                personas.add(persona);
            }
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
        }
        return personas;
    }
}
