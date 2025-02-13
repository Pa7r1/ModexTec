import { tiposModelo } from "../models/tipos_serviciosM.js";

const nuevoServicio = async (req, res) => {
  const { nombre, descripcion } = req.body;
  try {
    const result = await tiposModelo.agregarTipoServicio(nombre, descripcion);
    res.status(200).send({ nuevo_tipo: result[0] });
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: "Error al agregar tipo de servicio" });
  }
};

export default {
  name: "tipos_servicios",
  create: nuevoServicio,
};
