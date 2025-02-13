import { servicioModelo } from "../models/serviciosM.js";

const todos = async (req, res) => {
  try {
    const result = await servicioModelo.verServicios();
    res.status(200).send({ servicios: result[0] });
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: "Error al obtener servicios" });
  }
};

const nuevoServicio = async (req, res) => {
  const {
    id_equipo,
    id_cliente,
    id_empleado,
    id_tipo_servicio,
    descripcion,
    observaciones,
    costo,
    fecha_i,
  } = req.body;
  try {
    const result = await servicioModelo.agregarServicio(
      id_equipo,
      id_cliente,
      id_empleado,
      id_tipo_servicio,
      descripcion,
      observaciones,
      costo,
      fecha_i
    );
    res.status(200).send({ nuevo_servicio: result[0] });
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: "Error al agregar servicio" });
  }
};

export default {
  name: "servicios",
  serviciosActivos: todos,
  create: nuevoServicio,
};
