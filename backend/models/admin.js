import { db } from "./mysql.js";
import bcrypt from "bcrypt";

// funciones de conteo y creacion.

const usuario = {
  contarAdmin: async () => {
    const sql = `SELECT COUNT(*) AS count FROM usuarios WHERE rol = 'administrador'`;
    const [result] = await db.execute(sql);
    return result[0].count;
  },

  crearAdmin: async () => {
    const username = process.env.USERNAME_ADMIN;
    const password = process.env.PASSWORD_ADMIN;
    const passwordHash = await bcrypt.hash(password, 10);
    const sql = `INSERT INTO usuarios (username, password, rol) VALUES (?,?, 'administrador')`;
    await db.execute(sql, [username, passwordHash]);
    console.log("administrador creado");
  },
};

//ejecucion de recursos.

const ejecutarAdmin = async () => {
  const count = await usuario.contarAdmin();
  if (count === 0) {
    await usuario.crearAdmin();
  } else {
    console.log("administrador ya existe");
  }
};

export default ejecutarAdmin;
