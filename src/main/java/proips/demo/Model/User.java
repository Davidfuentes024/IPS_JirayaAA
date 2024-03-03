package proips.demo.Model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "numero_identificacion", unique = true)
    private long numeroIdentificacion;

    @Column(name = "nombre")
    private String name;

    @Column(name = "apellido")
    private String lastName;

    @Column(name = "contrasena")
    private String password;

    @Column(name = "fecha_nacimiento")
    private Date birthDate;

    @Column(name = "direccion")
    private String address;

    @Column(name = "especialidad")
    private String especiality;

    @Column(name = "tipo_usuario")
    private int userType;

    public User(long numeroIdentificacion, long id, String name, String lastName, String password, Date birthDate,
            String address, String especiality, int userType) {
        this.numeroIdentificacion = numeroIdentificacion;
        this.id = id;
        this.name = name;
        this.lastName = lastName;
        this.password = password;
        this.birthDate = birthDate;
        this.address = address;
        this.especiality = especiality;
        this.userType = userType;
    }

    public long getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public long getNumeroIdentificacion() {
        return numeroIdentificacion;
    }

    public void setNumeroIdentificacion(long numeroIdentificacion) {
        this.numeroIdentificacion = numeroIdentificacion;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEspecialidad() {
        return especiality;
    }

    public void setEspecialidad(String especiality) {
        this.especiality = especiality;
    }

    public int getTipoDeUsuario() {
        return userType;
    }

    public void setTipoDeUsuario(int userType) {
        this.userType = userType;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

}
