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
                + "u.fecha_nacimiento, "
                + "u.LUGAR_NACIMIENTO, "
                + "u.EMAIL, "
                + "u.NUMERO_TELEFONO, "
                + "u.DIRECCION, "
                + "u.OCUPACION, "
                + "u.ESTADO_CIVIL, "
                + "u.NUMERO_DOCUMENTO "
                + "FROM persona u "
                + "WHERE u.IDUSUARIO = " + usu.getUsuario().getId_usuario();
        System.out.println(sql);
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
                person.setEdad(rs.getDate("fecha_nacimiento"));
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
                + "p.fecha_nacimiento, "
                + "p.LUGAR_NACIMIENTO, "
                + "p.EMAIL, "
                + "p.NUMERO_TELEFONO, "
                + "p.DIRECCION, "
                + "p.OCUPACION, "
                + "p.ESTADO_CIVIL, "
                + "p.NUMERO_DOCUMENTO "
                + "FROM persona p";

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
                persona.setEdad(rs.getDate("fecha_nacimiento"));
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

    public String obtenerNombre(Usuario usuario) throws Exception {
        String nombreCompleto = null;
        ResultSet rs = null;
        String sql = "SELECT NOMBRE_COMPLETO "
                + "FROM persona "
                + "WHERE IDUSUARIO = " + usuario.getId_usuario();
        System.out.println(sql);
        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            while (rs.next()) {
                nombreCompleto = rs.getString("NOMBRE_COMPLETO");
            }
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }

        return nombreCompleto;
    }

    public void registrarPersonas(Persona persona) throws Exception {
        String sql;

        sql = "INSERT INTO persona (nombre_completo, tipo_sangre, genero, fecha_nacimiento, lugar_nacimiento, "
                + "email, numero_telefono, direccion, ocupacion, estado_civil, numero_documento, IDUSUARIO) "
                + "VALUES ('" + persona.getNombre_completo() + "', '" + persona.getTipo_sangre() + "', '"
                + persona.getGenero() + "', '" + persona.getEdad() + "', '"
                + persona.getLugar_nacimiento() + "', '" + persona.getEmail() + "', '"
                + persona.getNumero_telefono() + "', '" + persona.getDireccion() + "', '"
                + persona.getOcupacion() + "', '" + persona.getEstado_civil() + "', '"
                + persona.getNumero_documento() + "', '" + persona.getUsuario().getId_usuario() + "')";

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }

    public void actualizarPersona(Persona persona) throws Exception {
        String sql = "UPDATE persona SET "
                + "nombre_completo='" + persona.getNombre_completo() + "', "
                + "tipo_sangre='" + persona.getTipo_sangre() + "', "
                + "genero='" + persona.getGenero() + "', "
                + "fecha_nacimiento='" + persona.getEdad() + "', "
                + "lugar_nacimiento='" + persona.getLugar_nacimiento() + "', "
                + "email='" + persona.getEmail() + "', "
                + "numero_telefono='" + persona.getNumero_telefono() + "', "
                + "direccion='" + persona.getDireccion() + "', "
                + "ocupacion='" + persona.getOcupacion() + "', "
                + "estado_civil='" + persona.getEstado_civil() + "', "
                + "numero_documento='" + persona.getNumero_documento() + "' "
                + "WHERE IDPERSONA=" + persona.getId_persona();
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
