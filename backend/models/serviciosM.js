import { db } from "./mysql.js";

const verServicios = async () => {
  const sql = `CALL ver_servicios()`;
  const [result] = await db.execute(sql);
  return result;
};

const agregarServicio = async (
  id_equipo,
  id_cliente,
  id_empleado,
  id_tipo_servicio,
  descripcion,
  observaciones,
  costo,
  fecha_i
) => {
  const sql = `CALL nuevo_servicio(?,?,?,?,?,?)`;
  const [result] = await db.execute(sql, [
    id_equipo,
    id_cliente,
    id_empleado,
    id_tipo_servicio,
    descripcion,
    observaciones,
    costo,
    fecha_i,
  ]);
  return result;
};

export const servicioModelo = {
  agregarServicio,
  verServicios,
};
