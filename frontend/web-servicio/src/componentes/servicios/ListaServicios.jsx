import React, { useState, useEffect } from "react";
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Typography,
} from "@mui/material";
import { styled } from "@mui/system";
import url from "../../main";

const StyledTableCell = styled(TableCell)(({ theme }) => ({
  backgroundColor: theme.palette.primary.light,
  color: theme.palette.common.white,
}));

const ListaServicios = ({ refrescar }) => {
  const [servicios, setServicios] = useState([]);
  const [error, setError] = useState("");

  useEffect(() => {
    const fetchServicios = async () => {
      try {
        const response = await fetch(`${url}/servicios`);
        if (!response.ok) {
          throw new Error("Error al obtener los servicios.");
        }
        const data = await response.json();
        if (data && Array.isArray(data.servicios)) {
          setServicios(data.servicios);
        } else {
          console.error("La clave servicios no contiene un arreglo:", data);
          setServicios([]);
        }
      } catch (error) {
        setError(error.message);
      }
    };
    fetchServicios();
  }, [refrescar]);
  if (error) {
    return <p style={{ color: "red" }}>{error}</p>;
  }
  if (servicios.length === 0) {
    return <p>No hay servicios disponibles.</p>;
  }

  return (
    <TableContainer component={Paper}>
      <Typography
        variant="h6"
        component="div"
        sx={{ flexGrow: 1, textAlign: "center", margin: "20px 0" }}
      >
        Lista de Servicios
      </Typography>
      {error && <Typography color="error">{error}</Typography>}
      <Table>
        <TableHead>
          <TableRow>
            <StyledTableCell>ID Servicio</StyledTableCell>
            <StyledTableCell>Problema</StyledTableCell>
            <StyledTableCell>Observaciones</StyledTableCell>
            <StyledTableCell>Costo</StyledTableCell>
            <StyledTableCell>Fecha Inicio</StyledTableCell>
            <StyledTableCell>Fecha Fin</StyledTableCell>
            <StyledTableCell>Estado</StyledTableCell>
            <StyledTableCell>Equipo</StyledTableCell>
            <StyledTableCell>Cliente</StyledTableCell>
            <StyledTableCell>Empleado</StyledTableCell>
            <StyledTableCell>Tipo Servicio</StyledTableCell>
            <StyledTableCell>Descripción Servicio</StyledTableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {servicios.map((servicio) => (
            <TableRow key={servicio.ID_Servicio}>
              <TableCell>{servicio.ID_Servicio}</TableCell>
              <TableCell>{servicio.Problema}</TableCell>
              <TableCell>{servicio.Observaciones}</TableCell>
              <TableCell>{servicio.Costo}</TableCell>
              <TableCell>{servicio.Fecha_Inicio}</TableCell>
              <TableCell>{servicio.Fecha_Fin}</TableCell>
              <TableCell>{servicio.Estado}</TableCell>
              <TableCell>{servicio.Equipo}</TableCell>
              <TableCell>{servicio.Cliente}</TableCell>
              <TableCell>{servicio.Empleado}</TableCell>
              <TableCell>{servicio.Tipo_Servicio}</TableCell>
              <TableCell>{servicio.Descripcion_Servicio}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default ListaServicios;
