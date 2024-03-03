package proips.demo.Model;

public class HistoriaClinica {

    private long id;
    private String notas;
    private User medico;

    public HistoriaClinica(long id, String notas, User medico) {
        this.id = id;
        this.notas = notas;
        this.medico = medico;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public User getMedico() {
        return medico;
    }

    public void setMedico(User medico) {
        this.medico = medico;
    }

}
