-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema serviciotecnico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema serviciotecnico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `serviciotecnico` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `serviciotecnico` ;

-- -----------------------------------------------------
-- Table `serviciotecnico`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciotecnico`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `responsable` VARCHAR(100) NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `estado` ENUM('activo', 'inactivo') NULL DEFAULT 'activo',
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `serviciotecnico`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciotecnico`.`empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `puesto` VARCHAR(50) NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `estado` ENUM('activo', 'inactivo') NULL DEFAULT 'activo',
  `salario` DECIMAL(10,2) NULL DEFAULT NULL,
  `fecha_contratacion` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `serviciotecnico`.`equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciotecnico`.`equipos` (
  `id_equipo` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `descripcion` TEXT NOT NULL,
  `marca` VARCHAR(50) NULL DEFAULT NULL,
  `modelo` VARCHAR(50) NULL DEFAULT NULL,
  `procesador` VARCHAR(50) NULL DEFAULT NULL,
  `placa_base` VARCHAR(50) NULL DEFAULT NULL,
  `memoria_ram` VARCHAR(50) NULL DEFAULT NULL,
  `almacenamiento` VARCHAR(50) NULL DEFAULT NULL,
  `sistema_operativo` VARCHAR(50) NULL DEFAULT NULL,
  `arreglo` VARCHAR(20) NULL DEFAULT 'pendiente',
  `activo` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`id_equipo`),
  INDEX `id_cliente` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `equipos_ibfk_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `serviciotecnico`.`clientes` (`id_cliente`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `serviciotecnico`.`tipos_servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciotecnico`.`tipos_servicios` (
  `id_tipo_servicio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_servicio`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `serviciotecnico`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciotecnico`.`servicios` (
  `id_servicio` INT NOT NULL AUTO_INCREMENT,
  `id_equipo` INT NOT NULL,
  `id_empleado` INT NULL DEFAULT NULL,
  `id_tipo_servicio` INT NOT NULL,
  `descripcion_problema` TEXT NOT NULL,
  `observaciones` TEXT NULL DEFAULT NULL,
  `costo` DECIMAL(10,2) NULL DEFAULT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NULL DEFAULT NULL,
  `estado` VARCHAR(20) NULL DEFAULT 'Pendiente',
  `id_cliente` INT NOT NULL,
  `activo` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`id_servicio`),
  INDEX `id_equipo` (`id_equipo` ASC) VISIBLE,
  INDEX `id_empleado` (`id_empleado` ASC) VISIBLE,
  INDEX `servicios_ibfk_4` (`id_cliente` ASC) VISIBLE,
  INDEX `servicios_ibfk_3` (`id_tipo_servicio` ASC) VISIBLE,
  CONSTRAINT `servicios_ibfk_1`
    FOREIGN KEY (`id_equipo`)
    REFERENCES `serviciotecnico`.`equipos` (`id_equipo`)
    ON DELETE CASCADE,
  CONSTRAINT `servicios_ibfk_2`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `serviciotecnico`.`empleados` (`id_empleado`)
    ON DELETE SET NULL,
  CONSTRAINT `servicios_ibfk_3`
    FOREIGN KEY (`id_tipo_servicio`)
    REFERENCES `serviciotecnico`.`tipos_servicios` (`id_tipo_servicio`)
    ON DELETE CASCADE,
  CONSTRAINT `servicios_ibfk_4`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `serviciotecnico`.`clientes` (`id_cliente`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `serviciotecnico`.`fichasservicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciotecnico`.`fichasservicio` (
  `id_ficha` INT NOT NULL AUTO_INCREMENT,
  `id_servicio` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `numero_ficha` INT NOT NULL,
  `firma_cliente` VARCHAR(100) NULL DEFAULT NULL,
  `firma_recepcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_ficha`),
  UNIQUE INDEX `numero_ficha` (`numero_ficha` ASC) VISIBLE,
  INDEX `id_servicio` (`id_servicio` ASC) VISIBLE,
  CONSTRAINT `fichasservicio_ibfk_1`
    FOREIGN KEY (`id_servicio`)
    REFERENCES `serviciotecnico`.`servicios` (`id_servicio`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `serviciotecnico`.`gastos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciotecnico`.`gastos` (
  `id_gasto` INT NOT NULL AUTO_INCREMENT,
  `descripcion` TEXT NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`id_gasto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `serviciotecnico`.`repuestosaccesorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciotecnico`.`repuestosaccesorios` (
  `id_repuesto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  `cantidad_disponible` INT NULL DEFAULT '0',
  `precio_unitario` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_repuesto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `serviciotecnico`.`usorepuestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciotecnico`.`usorepuestos` (
  `id_uso` INT NOT NULL AUTO_INCREMENT,
  `id_servicio` INT NOT NULL,
  `id_repuesto` INT NOT NULL,
  `cantidad_usada` INT NOT NULL,
  PRIMARY KEY (`id_uso`),
  INDEX `id_servicio` (`id_servicio` ASC) VISIBLE,
  INDEX `id_repuesto` (`id_repuesto` ASC) VISIBLE,
  CONSTRAINT `usorepuestos_ibfk_1`
    FOREIGN KEY (`id_servicio`)
    REFERENCES `serviciotecnico`.`servicios` (`id_servicio`)
    ON DELETE CASCADE,
  CONSTRAINT `usorepuestos_ibfk_2`
    FOREIGN KEY (`id_repuesto`)
    REFERENCES `serviciotecnico`.`repuestosaccesorios` (`id_repuesto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `serviciotecnico`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciotecnico`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `rol` ENUM('administrador', 'empleado') NULL DEFAULT 'empleado',
  `id_empleado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE,
  INDEX `id_empleado` (`id_empleado` ASC) VISIBLE,
  CONSTRAINT `usuarios_ibfk_1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `serviciotecnico`.`empleados` (`id_empleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `serviciotecnico` ;

-- -----------------------------------------------------
-- procedure desactivar_cliente
-- -----------------------------------------------------

DELIMITER $$
USE `serviciotecnico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `desactivar_cliente`(IN p_id INT)
BEGIN
	UPDATE clientes
    SET estado = 'inactivo'
    WHERE id_cliente = p_id;
    
    UPDATE equipos
    SET activo = 0
    WHERE id_cliente = p_id;
    
    UPDATE servicios
    SET activo = 0
    WHERE id_cliente = p_id;
    
    SELECT c.nombre as nombre, p_id as id FROM clientes c
    WHERE p_id = id_cliente;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure editar_cliente
-- -----------------------------------------------------

DELIMITER $$
USE `serviciotecnico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_cliente`(
    IN p_id_cliente INT,
    IN p_nombre VARCHAR(100),
    IN p_responsable VARCHAR(100),
    IN p_direccion VARCHAR(200),
    IN p_telefono VARCHAR(15),
    IN p_email VARCHAR(100)
    )
BEGIN
	IF NOT EXISTS ( SELECT 1 FROM clientes WHERE id_cliente = p_id_cliente) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'cliente existe';
	END IF;
    
    IF EXISTS (SELECT 1 FROM clientes WHERE email = p_email AND id_cliente != p_id_cliente) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'correo ya existe';
    END IF;
    
    UPDATE clientes
    SET nombre = p_nombre,
        responsable = p_responsable,
        direccion = p_direccion,
        telefono = p_telefono,
        email = p_email
    WHERE id_cliente = p_id_cliente;
    
    SELECT p_id_cliente as id, p_nombre as nombre;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure nuevo_cliente
-- -----------------------------------------------------

DELIMITER $$
USE `serviciotecnico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevo_cliente`(
IN p_nombre VARCHAR(100),
IN p_responsable VARCHAR(100),
IN p_direccion VARCHAR(200),
IN p_telefono VARCHAR(15),
IN p_email VARCHAR(100)
)
BEGIN
IF NOT EXISTS (
        SELECT 1 FROM clientes WHERE email = p_email
    ) THEN
        INSERT INTO clientes (nombre, responsable, direccion, telefono, email)
        VALUES (p_nombre, p_responsable, p_direccion, p_telefono, p_email);
    END IF;
SELECT p_nombre as nombre, p_responsable as responsable;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure nuevo_empleado
-- -----------------------------------------------------

DELIMITER $$
USE `serviciotecnico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevo_empleado`(
IN i_nombre VARCHAR(100),
IN i_puesto VARCHAR(50),
IN i_telefono VARCHAR(20),
IN i_email VARCHAR (100),
IN i_salario DECIMAL(10,2),
IN i_fecha_contratacion DATE,
IN i_username VARCHAR(50),
IN i_password VARCHAR(255)
)
BEGIN
 DECLARE v_id_empleado INT;
 
IF EXISTS (SELECT 1 FROM usuarios WHERE username = i_username) THEN
	SIGNAL SQLSTATE '45000' 
	SET MESSAGE_TEXT = 'El nombre de usuario ya existe.';
END IF;

INSERT INTO empleados (nombre, puesto, telefono, email, salario, fecha_contratacion)
VALUES (i_nombre, i_puesto, i_telefono, i_email, i_salario, i_fecha_contratacion);

SET v_id_empleado = LAST_INSERT_ID();

INSERT INTO usuarios ( username, password, id_empleado)
VALUES (i_username, i_password, v_id_empleado);

SELECT i_username AS username, i_puesto AS puesto;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure nuevo_equipo
-- -----------------------------------------------------

DELIMITER $$
USE `serviciotecnico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevo_equipo`(
    IN p_id_cliente INT,
    IN p_descripcion TEXT,
    IN p_marca VARCHAR(50),
    IN p_modelo VARCHAR(50),
    IN p_procesador VARCHAR(50),
    IN p_placa_base VARCHAR(50),
    IN p_memoria_ram VARCHAR(50),
    IN p_almacenamiento VARCHAR(50),
    IN p_sistema_operativo VARCHAR(50)
)
BEGIN
	IF NOT EXISTS (
        SELECT 1 FROM equipos 
        WHERE id_cliente = p_id_cliente AND descripcion = p_descripcion
    ) THEN
        INSERT INTO equipos (id_cliente, descripcion, marca, modelo, procesador, placa_base, memoria_ram, almacenamiento, sistema_operativo, estado)
        VALUES (p_id_cliente, p_descripcion, p_marca, p_modelo, p_procesador, p_placa_base, p_memoria_ram, p_almacenamiento, p_sistema_operativo, 'activo');
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure nuevo_servicio
-- -----------------------------------------------------

DELIMITER $$
USE `serviciotecnico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevo_servicio`( 
    IN p_id_equipo INT,
    IN p_id_cliente INT,
    IN p_id_empleado INT,
    IN p_id_tipo_servicio INT,
    IN p_descripcion_problema TEXT,
    IN p_observaciones TEXT,
    IN p_costo DECIMAL(10,2),
    IN p_fecha_inicio DATE
)
BEGIN
IF NOT EXISTS( SELECT 1 FROM equipos WHERE id_equipo = p_id_equipo) THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'equipo no existe';
END IF;

IF NOT EXISTS( SELECT 1 FROM clientes WHERE id_cliente = p_id_cliente) THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'cliente no existe';
END IF;

IF NOT EXISTS( SELECT 1 FROM empleados WHERE id_empleado = p_id_empleado) THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'empleado no existe';
END IF;

IF NOT EXISTS( SELECT 1 FROM tipos_servicios WHERE id_tipo_servicio = p_id_tipo_servicio) THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'tipo de servicio no existe';
END IF;

INSERT INTO servicios (id_equipo, id_cliente, id_empleado, id_tipo_servicio, descripcion_problema, observaciones, costo, fecha_inicio, estado)
VALUES (p_id_equipo, p_id_cliente, p_id_empleado, p_id_tipo_servicio, p_descripcion_problema, p_observaciones, p_costo, p_fecha_inicio, 'pendiente');

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure nuevo_tipo_servicio
-- -----------------------------------------------------

DELIMITER $$
USE `serviciotecnico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevo_tipo_servicio`(
IN p_nombre VARCHAR(100),
IN p_descripcion TEXT
)
BEGIN
 IF EXISTS (SELECT 1 FROM tipos_servicios WHERE nombre = p_nombre) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'servicio ya existe';
    ELSE
     INSERT INTO tipos_servicios (nombre, descripcion)
        VALUES (p_nombre, p_descripcion);
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure reactivar_cliente
-- -----------------------------------------------------

DELIMITER $$
USE `serviciotecnico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `reactivar_cliente`(IN p_id INT)
BEGIN
	UPDATE clientes 
    SET estado = 'activo'
    WHERE id_cliente= p_id;

    UPDATE equipos 
    SET activo = 1 
    WHERE id_cliente = p_id;
    
    UPDATE servicios 
    SET activo = 1 
    WHERE id_cliente = p_id;
    
    SELECT c.nombre as nombre, p_id as id FROM clientes c
    WHERE p_id = id_cliente;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ver_clientes
-- -----------------------------------------------------

DELIMITER $$
USE `serviciotecnico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_clientes`()
BEGIN
	SELECT
     c.nombre as nombre,
     c.responsable as responsable,
     c.email as correo_electronico,
     c.telefono as numero_telefono,
     e.marca as equipo,
     e.modelo as modelo,
     e.descripcion as descipcion,
     e.arreglo as estado_trabajo
	FROM clientes c
    INNER JOIN equipos e ON e.id_cliente = c.id_cliente
    WHERE c.estado = 'activo'; 
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ver_servicios
-- -----------------------------------------------------

DELIMITER $$
USE `serviciotecnico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_servicios`()
BEGIN
SELECT 
	s.id_servicio AS ID_Servicio,
  s.descripcion_problema AS Problema,
	s.observaciones AS Observaciones,
	s.costo AS Costo,
	s.fecha_inicio AS Fecha_Inicio,
	s.fecha_fin AS Fecha_Fin,
	s.estado AS Estado,
	e.marca AS Equipo,
	c.nombre AS Cliente,
	emp.nombre AS Empleado,
	ts.nombre AS Tipo_Servicio,
	ts.descripcion AS Descripcion_Servicio
    
FROM servicios s
INNER JOIN equipos e ON s.id_equipo = e.id_equipo
INNER JOIN clientes c ON s.id_cliente = c.id_cliente
INNER JOIN empleados emp ON s.id_empleado = emp.id_empleado
INNER JOIN tipos_servicios ts ON s.id_tipo_servicio = ts.id_tipo_servicio
WHERE s.activo = 1
ORDER BY s.fecha_inicio DESC;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
