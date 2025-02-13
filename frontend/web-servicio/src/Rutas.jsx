import { Routes, Route } from "react-router-dom";
import { Container } from "@mui/material";
import AdminPanelSettingsSharpIcon from "@mui/icons-material/AdminPanelSettingsSharp";
import NavBar from "./paginas/NavBar";
import Layout from "./paginas/Layout";
import Inicio from "./paginas/Inicio";
import Servicios from "./paginas/Servicios";
import Default from "./paginas/Default";

const hideNavList = [
  {
    path: "/servicios",
    icon: <AdminPanelSettingsSharpIcon />,
    tittle: "Servicios",
  },
];

const Rutas = () => {
  return (
    <>
      <NavBar hideNavList={hideNavList} />
      <Container sx={{ mt: 5 }}>
        <Routes>
          <Route path="/" element={<Layout />}>
            <Route index element={<Inicio />} />
            <Route path="/servicios" element={<Servicios />} />
            <Route path="/*" element={<Default />} />
          </Route>
        </Routes>
      </Container>
    </>
  );
};

export default Rutas;
