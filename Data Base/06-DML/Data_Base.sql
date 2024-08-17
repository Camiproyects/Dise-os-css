-- MySQL Script generated by MySQL Workbench
-- Sat Aug 17 14:38:06 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tienda_ropa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tienda_ropa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tienda_ropa` DEFAULT CHARACTER SET utf8mb4 ;
USE `tienda_ropa` ;

-- -----------------------------------------------------
-- Table `tienda_ropa`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`categoria` (
  `CategoriaID` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CategoriaID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`persona` (
  `Identificacion` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(255) NULL DEFAULT NULL,
  `Apellidos` VARCHAR(255) NULL DEFAULT NULL,
  `Direccion` VARCHAR(255) NULL DEFAULT NULL,
  `Telefono` VARCHAR(50) NULL DEFAULT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Identificacion`),
  UNIQUE INDEX `Email` (`Email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`rol` (
  `Codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE INDEX `Nombre` (`Nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`cliente` (
  `ClienteID` INT(11) NOT NULL AUTO_INCREMENT,
  `PersonaID` INT(11) NULL DEFAULT NULL,
  `FechaRegistro` DATETIME NULL DEFAULT NULL,
  `RolID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ClienteID`),
  INDEX `PersonaID` (`PersonaID` ASC) VISIBLE,
  INDEX `RolID` (`RolID` ASC) VISIBLE,
  CONSTRAINT `cliente_ibfk_1`
    FOREIGN KEY (`PersonaID`)
    REFERENCES `tienda_ropa`.`persona` (`Identificacion`),
  CONSTRAINT `cliente_ibfk_2`
    FOREIGN KEY (`RolID`)
    REFERENCES `tienda_ropa`.`rol` (`Codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`proveedor` (
  `ProveedorID` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(255) NULL DEFAULT NULL,
  `Direccion` VARCHAR(255) NULL DEFAULT NULL,
  `Telefono` VARCHAR(50) NULL DEFAULT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `CalidadProducto` VARCHAR(255) NULL DEFAULT NULL,
  `CantidadSuministrada` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ProveedorID`),
  UNIQUE INDEX `Email` (`Email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`compra` (
  `CompraID` INT(11) NOT NULL AUTO_INCREMENT,
  `ProveedorID` INT(11) NULL DEFAULT NULL,
  `Fecha` DATETIME NOT NULL,
  `Total` DECIMAL(10,2) NOT NULL,
  `OrdenCompra` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CompraID`),
  INDEX `ProveedorID` (`ProveedorID` ASC) VISIBLE,
  CONSTRAINT `compra_ibfk_1`
    FOREIGN KEY (`ProveedorID`)
    REFERENCES `tienda_ropa`.`proveedor` (`ProveedorID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`producto` (
  `ProductoID` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(255) NULL DEFAULT NULL,
  `Precio` DECIMAL(10,2) NOT NULL,
  `Talla` VARCHAR(50) NULL DEFAULT NULL,
  `Color` VARCHAR(50) NULL DEFAULT NULL,
  `Stock` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ProductoID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`compradetalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`compradetalle` (
  `CompraID` INT(11) NOT NULL,
  `ProductoID` INT(11) NOT NULL,
  `Cantidad` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CompraID`, `ProductoID`),
  INDEX `ProductoID` (`ProductoID` ASC) VISIBLE,
  CONSTRAINT `compradetalle_ibfk_1`
    FOREIGN KEY (`CompraID`)
    REFERENCES `tienda_ropa`.`compra` (`CompraID`),
  CONSTRAINT `compradetalle_ibfk_2`
    FOREIGN KEY (`ProductoID`)
    REFERENCES `tienda_ropa`.`producto` (`ProductoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`credencial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`credencial` (
  `CredencialID` INT(11) NOT NULL AUTO_INCREMENT,
  `PersonaID` INT(11) NULL DEFAULT NULL,
  `Correo` VARCHAR(255) NOT NULL,
  `Contrasena` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CredencialID`),
  UNIQUE INDEX `Correo` (`Correo` ASC) VISIBLE,
  INDEX `PersonaID` (`PersonaID` ASC) VISIBLE,
  CONSTRAINT `credencial_ibfk_1`
    FOREIGN KEY (`PersonaID`)
    REFERENCES `tienda_ropa`.`persona` (`Identificacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`rolempleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`rolempleado` (
  `RolEmpleadoID` INT(11) NOT NULL AUTO_INCREMENT,
  `RolID` INT(11) NULL DEFAULT NULL,
  `Cargo` VARCHAR(255) NULL DEFAULT NULL,
  `Salario` DECIMAL(10,2) NULL DEFAULT NULL,
  `Turno` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`RolEmpleadoID`),
  INDEX `RolID` (`RolID` ASC) VISIBLE,
  CONSTRAINT `rolempleado_ibfk_1`
    FOREIGN KEY (`RolID`)
    REFERENCES `tienda_ropa`.`rol` (`Codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`empleado` (
  `EmpleadoID` INT(11) NOT NULL AUTO_INCREMENT,
  `PersonaID` INT(11) NULL DEFAULT NULL,
  `FechaContratacion` DATETIME NULL DEFAULT NULL,
  `RolEmpleadoID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`EmpleadoID`),
  INDEX `PersonaID` (`PersonaID` ASC) VISIBLE,
  INDEX `RolEmpleadoID` (`RolEmpleadoID` ASC) VISIBLE,
  CONSTRAINT `empleado_ibfk_1`
    FOREIGN KEY (`PersonaID`)
    REFERENCES `tienda_ropa`.`persona` (`Identificacion`),
  CONSTRAINT `empleado_ibfk_2`
    FOREIGN KEY (`RolEmpleadoID`)
    REFERENCES `tienda_ropa`.`rolempleado` (`RolEmpleadoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`pedido` (
  `PedidoID` INT(11) NOT NULL AUTO_INCREMENT,
  `ClienteID` INT(11) NULL DEFAULT NULL,
  `Fecha` DATETIME NOT NULL,
  `IVA` DECIMAL(10,2) NULL DEFAULT NULL,
  `Total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`PedidoID`),
  INDEX `ClienteID` (`ClienteID` ASC) VISIBLE,
  CONSTRAINT `pedido_ibfk_1`
    FOREIGN KEY (`ClienteID`)
    REFERENCES `tienda_ropa`.`cliente` (`ClienteID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`preferenciacliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`preferenciacliente` (
  `PreferenciaID` INT(11) NOT NULL AUTO_INCREMENT,
  `ClienteID` INT(11) NULL DEFAULT NULL,
  `Preferencia` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`PreferenciaID`),
  INDEX `ClienteID` (`ClienteID` ASC) VISIBLE,
  CONSTRAINT `preferenciacliente_ibfk_1`
    FOREIGN KEY (`ClienteID`)
    REFERENCES `tienda_ropa`.`cliente` (`ClienteID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `tienda_ropa`.`productoproveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_ropa`.`productoproveedor` (
  `ProductoID` INT(11) NOT NULL,
  `ProveedorID` INT(11) NOT NULL,
  PRIMARY KEY (`ProductoID`, `ProveedorID`),
  INDEX `ProveedorID` (`ProveedorID` ASC) VISIBLE,
  CONSTRAINT `productoproveedor_ibfk_1`
    FOREIGN KEY (`ProductoID`)
    REFERENCES `tienda_ropa`.`producto` (`ProductoID`),
  CONSTRAINT `productoproveedor_ibfk_2`
    FOREIGN KEY (`ProveedorID`)
    REFERENCES `tienda_ropa`.`proveedor` (`ProveedorID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
