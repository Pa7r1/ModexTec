import React, { useState } from "react";

const AgregarServicios = ({ actualizarServicios }) => {
  const [idEquipo, setIdEquipo] = useState("");
  const [idCliente, setIdCliente] = useState("");
  const [idEmpleado, setIdEmpleado] = useState("");
  const [idTipoServicio, setIdTipoServicio] = useState("");
  const [descripcion, setDescripcion] = useState("");
  const [observaciones, setObservaciones] = useState("");
  const [costo, setCosto] = useState("");
  const [fechaInicio, setFechaInicio] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    const nuevoServicio = {
      idEquipo,
      idCliente,
      idEmpleado,
      idTipoServicio,
      descripcion,
      observaciones,
      costo,
      fechaInicio,
    };
    actualizarServicios(nuevoServicio);
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        value={idEquipo}
        onChange={(e) => setIdEquipo(e.target.value)}
        placeholder="ID Equipo"
      />
      <input
        type="text"
        value={idCliente}
        onChange={(e) => setIdCliente(e.target.value)}
        placeholder="ID Cliente"
      />
      <input
        type="text"
        value={idEmpleado}
        onChange={(e) => setIdEmpleado(e.target.value)}
        placeholder="ID Empleado"
      />
      <input
        type="text"
        value={idTipoServicio}
        onChange={(e) => setIdTipoServicio(e.target.value)}
        placeholder="ID Tipo Servicio"
      />
      <input
        type="text"
        value={descripcion}
        onChange={(e) => setDescripcion(e.target.value)}
        placeholder="Descripción"
      />
      <input
        type="text"
        value={observaciones}
        onChange={(e) => setObservaciones(e.target.value)}
        placeholder="Observaciones"
      />
      <input
        type="text"
        value={costo}
        onChange={(e) => setCosto(e.target.value)}
        placeholder="Costo"
      />
      <input
        type="date"
        value={fechaInicio}
        onChange={(e) => setFechaInicio(e.target.value)}
        placeholder="Fecha Inicio"
      />
      <button type="submit">Agregar Servicio</button>
    </form>
  );
};

export default AgregarServicios;
