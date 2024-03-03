package proips.demo.Service;

import java.util.List;

import proips.demo.Model.Sede;

public interface SedeService {

    List<Sede> obtenerTodasLasSedes();

    Sede obtenerSedePorId(long id);

    Sede guardarSede(Sede operador);

    void eliminarSedePorId(long id);

    Sede modificarOperador(long id, Sede operador);
}