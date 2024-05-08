package Modelo;

/**
 *
 * @author caki-
 */
public class Usuario {
    private int id_usuario;
    private String nombreUsuario;
    private String clave;
    private boolean estado;
    private Cargo cargo;

    public int getId_especialidad() {
        return id_especialidad;
    }

    public void setId_especialidad(int id_especialidad) {
        this.id_especialidad = id_especialidad;
    }

    public int getId_residencia() {
        return id_residencia;
    }

    public void setId_residencia(int id_residencia) {
        this.id_residencia = id_residencia;
    }
    private int id_especialidad;
    private int id_residencia;

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }
    
    
}
