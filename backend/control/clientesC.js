import { clienteModelo } from "../models/clientesM.js";

const nuevoCliente = async (req, res) => {
  const { nombre, responsable, direccion, telefono, email } = req.body;
  try {
    const result = await clienteModelo.agregarCliente(
      nombre,
      responsable,
      direccion,
      telefono,
      email
    );
    res.send({ nuevo_cliente: result[0] });
  } catch (error) {
    res.send({ error: error.message });
  }
};

const clientesActivos = async (req, res) => {
  try {
    const result = await clienteModelo.verClientes();
    res.send({ clientes: result[0] });
  } catch (error) {
    res.send({ error: error.message });
  }
};

const actualizarCliente = async (req, res) => {
  const { id } = req.params;
  const { nombre, responsable, direccion, telefono, email } = req.body;
  try {
    const result = await clienteModelo.editarCliente(
      id,
      nombre,
      responsable,
      direccion,
      telefono,
      email
    );
    res.send({ cliente_actualizado: result[0] });
  } catch (error) {
    res.send({ error: error.message });
  }
};

const eliminarCliente = async (req, res) => {
  try {
    const { id } = req.params;
    const result = await clienteModelo.desactivarClientes(id);
    res.send({ cliente_eliminado: result[0] });
  } catch (error) {
    res.send({ error: error.message });
  }
};

const activarCliente = async (req, res) => {
  try {
    const { id } = req.params;
    const result = await clienteModelo.reactivarClientes(id);
    res.send({ cliente_reactivado: result[0] });
  } catch (error) {
    res.send({ error: error.message });
  }
};

export default {
  name: "clientes",
  create: nuevoCliente,
  clientesActivos: clientesActivos,
  reactivarClientes: activarCliente,
  update: actualizarCliente,
  delete: eliminarCliente,
};
