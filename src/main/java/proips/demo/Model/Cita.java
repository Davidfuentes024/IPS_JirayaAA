package proips.demo.Model;

import java.util.Date;

public class Cita {

    private long id;
    private Date date;
    private String razon;
    private User paciente;
    private User medico;
    private Sede sede;

    public Cita(long id, Date date, String razon, User paciente, User medico, Sede sede) {
        this.id = id;
        this.date = date;
        this.razon = razon;
        this.paciente = paciente;
        this.medico = medico;
        this.sede = sede;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getRazon() {
        return razon;
    }

    public void setRazon(String razon) {
        this.razon = razon;
    }

    public User getPaciente() {
        return paciente;
    }

    public void setPaciente(User paciente) {
        this.paciente = paciente;
    }

    public User getMedico() {
        return medico;
    }

    public void setMedico(User medico) {
        this.medico = medico;
    }

    public Sede getSede() {
        return sede;
    }

    public void setSede(Sede sede) {
        this.sede = sede;
    }

}
