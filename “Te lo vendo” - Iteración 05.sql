-- "Te lo vendo" - Iteración 05 - Trabajo grupal
/*
Integrantes:
	NICOLÁS MUÑOZ
   CRISTIAN MATURANA
   FRANCISCO CARREÑO
	ERICK DÍAZ
*/

-- Crear una base de datos;
CREATE SCHEMA `aplicacion`;
use aplicacion;

-- Crear dos tablas.
-- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).
CREATE TABLE `aplicacion`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `zona_horaria` VARCHAR(45) NOT NULL DEFAULT 'UTC-3',
  `genero` ENUM('M', 'F', 'Otro') NOT NULL,
  `telefono` INT NOT NULL,
  PRIMARY KEY (`id_usuario`));

-- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).
CREATE TABLE `aplicacion`.`ingreso` (
  `id_ingreso` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `fecha_hora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ingreso`));

-- Modifique el UTC por defecto. Desde UTC-3 a UTC-2.
ALTER TABLE `aplicacion`.`usuario` 
CHANGE COLUMN `zona_horaria` `zona_horaria` VARCHAR(45) NOT NULL DEFAULT 'UTC-2' ;

-- Cree 8 registros en cada tabla.
INSERT INTO `aplicacion`.`usuario` (`nombre`, `apellido`, `contraseña`, `genero`, `telefono`) VALUES ('Juan', 'Farias', 'jj11234', 'M', '87546312');
INSERT INTO `aplicacion`.`usuario` (`nombre`, `apellido`, `contraseña`, `genero`, `telefono`) VALUES ('Maria', 'Contreras', 'ma4578', 'F', '65987412');
INSERT INTO `aplicacion`.`usuario` (`nombre`, `apellido`, `contraseña`, `genero`, `telefono`) VALUES ('Daniel', 'Fernandez', 'daf45789', 'M', '98963641');
INSERT INTO `aplicacion`.`usuario` (`nombre`, `apellido`, `contraseña`, `genero`, `telefono`) VALUES ('Diego', 'Lopez', 'die4596', 'M', '74894563');
INSERT INTO `aplicacion`.`usuario` (`nombre`, `apellido`, `contraseña`, `genero`, `telefono`) VALUES ('Fernanda', 'Baeza', 'ferb1467', 'F', '66889945');
INSERT INTO `aplicacion`.`usuario` (`nombre`, `apellido`, `contraseña`, `genero`, `telefono`) VALUES ('Isabel', 'Allende', 'isaa78963', 'F', '45781236');
INSERT INTO `aplicacion`.`usuario` (`nombre`, `apellido`, `contraseña`, `genero`, `telefono`) VALUES ('Yajaira', 'Martinez', 'yaja45963', 'Otro', '77998844');
INSERT INTO `aplicacion`.`usuario` (`nombre`, `apellido`, `contraseña`, `genero`, `telefono`) VALUES ('El-Barbie', 'Garcia', 'elbar12456', 'Otro', '66553322');

INSERT INTO `aplicacion`.`ingreso` (`id_usuario`) VALUES ('5');
INSERT INTO `aplicacion`.`ingreso` (`id_usuario`) VALUES ('4');
INSERT INTO `aplicacion`.`ingreso` (`id_usuario`) VALUES ('6');
INSERT INTO `aplicacion`.`ingreso` (`id_usuario`) VALUES ('8');
INSERT INTO `aplicacion`.`ingreso` (`id_usuario`) VALUES ('4');
INSERT INTO `aplicacion`.`ingreso` (`id_usuario`) VALUES ('3');
INSERT INTO `aplicacion`.`ingreso` (`id_usuario`) VALUES ('1');
INSERT INTO `aplicacion`.`ingreso` (`id_usuario`) VALUES ('7');

-- Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
/*
Sí, es óptimo porque usamos INT en los IDs y teléfonos, VARCHAR en nombre, apellido y contraseña, ENUM para definir 3 tipos de género; y para el campo fecha_hora utilizamos TIMESTAMP.
*/

-- Creen una nueva tabla llamada contactos (id_contacto, id_usuario, numero de telefono, correo electronico).
CREATE TABLE `aplicacion`.`contactos` (
  `id_contacto` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `telefono` INT NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_contacto`));

-- Modifique la tabla de contactos, para crear un vínculo entre ella y la tabla de usuarios.
ALTER TABLE `aplicacion`.`contactos` 
ADD INDEX `fk_01_idx` (`id_usuario` ASC) VISIBLE;
;
ALTER TABLE `aplicacion`.`contactos` 
ADD CONSTRAINT `fk_01`
  FOREIGN KEY (`id_usuario`)
  REFERENCES `aplicacion`.`usuario` (`id_usuario`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;