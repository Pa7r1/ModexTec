import { db } from "./mysql.js";

const agregarTipoServicio = async (nombre, descripcion) => {
  const sql = `CALL nuevo_tipo_servicio(?,?)`;
  const result = await db.execute(sql, [nombre, descripcion]);
  return [result];
};

export const tiposModelo = {
  agregarTipoServicio,
};
