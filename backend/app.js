import express from "express";
import cors from "cors";
import { dbConnection } from "./models/mysql.js";
import { configureRoutes } from "./direccionador.js";
import ejecutarAdmin from "./models/admin.js";

const PORT = 3000;
const app = express();

app.use(cors());
app.use(express.json());

await configureRoutes(app, "control");
console.log("configurador de rutas bien");

const Iniciar = async () => {
  await dbConnection();
  await ejecutarAdmin();
  console.log("recursos creados");
  app.listen(PORT, () => {
    console.log(`servidor levantado en el puerto: ${PORT}`);
  });
};

Iniciar();
