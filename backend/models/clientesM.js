import { db } from "./mysql.js";

const agregarCliente = async (
  nombre,
  responsable,
  direccion,
  telefono,
  email
) => {
  const sql = `CALL nuevo_cliente(?,?,?,?,?)`;
  const [result] = await db.execute(sql, [
    nombre,
    responsable,
    direccion,
    telefono,
    email,
  ]);
  return result;
};

const verClientes = async () => {
  const sql = `CALL ver_clientes()`;
  const [result] = await db.execute(sql);
  return result;
};

const editarCliente = async (
  id,
  nombre,
  responsable,
  direccion,
  telefono,
  email
) => {
  const sql = `CALL editar_cliente(?,?,?,?,?,?)`;
  const [result] = await db.execute(sql, [
    id,
    nombre,
    responsable,
    direccion,
    telefono,
    email,
  ]);
  return result;
};

const desactivarClientes = async (id) => {
  const sql = `CALL desactivar_cliente(?)`;
  const [result] = await db.execute(sql, [id]);
  return result;
};

const reactivarClientes = async (id) => {
  const sql = `CALL reactivar_cliente(?)`;
  const [result] = await db.execute(sql, [id]);
  return result;
};

export const clienteModelo = {
  agregarCliente,
  verClientes,
  editarCliente,
  desactivarClientes,
  reactivarClientes,
};
