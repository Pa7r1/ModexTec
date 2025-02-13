import React, { useState } from "react";
import ListaServicios from "../componentes/servicios/listaServicios";
import AgregarServicios from "../componentes/servicios/AgregarServicios";

const Servicios = () => {
  const [refrescar, setRefrescar] = useState(false);

  const actualizarServicios = () => {
    setRefrescar((prev) => !prev);
  };

  return (
    <div style={{ padding: "20px", backgroundColor: "#f5f5f5" }}>
      <h1>Gestión de Servicios</h1>
      <div
        style={{
          border: "1px solid #ddd",
          padding: "10px",
          borderRadius: "8px",
        }}
      >
        <AgregarServicios actualizarServicios={actualizarServicios} />
        <ListaServicios refrescar={refrescar} />
      </div>
    </div>
  );
};

export default Servicios;
