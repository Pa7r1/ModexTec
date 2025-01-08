import express from "express";
import cors from "cors";

const PORT = 3000;
const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.send("Hola mundo");
});

app.listen(PORT, () => {
  console.log(`servidor levantado en el puerto: ${PORT}`);
});
