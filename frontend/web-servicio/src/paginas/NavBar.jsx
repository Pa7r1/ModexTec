import React from "react";
import { AppBar, Toolbar, IconButton, Typography, Button } from "@mui/material";
import { Link } from "react-router-dom";

const NavBar = ({ hideNavList }) => {
  return (
    <AppBar position="static">
      <Toolbar>
        {hideNavList.map((item) => (
          <Button
            key={item.path}
            color="inherit"
            component={Link}
            to={item.path}
          >
            {item.icon}
            {item.tittle}
          </Button>
        ))}
      </Toolbar>
    </AppBar>
  );
};

export default NavBar;
