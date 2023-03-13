-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SistemaDeNotas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SistemaDeNotas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SistemaDeNotas` DEFAULT CHARACTER SET utf8 ;
USE `SistemaDeNotas` ;

-- -----------------------------------------------------
-- Table `SistemaDeNotas`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaDeNotas`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `e-mail` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaDeNotas`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaDeNotas`.`notas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `ultima_modif` DATE NOT NULL,
  `descripcion` TEXT NOT NULL,
  `eliminable` TINYINT NOT NULL,
  `categoria_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `notas_usuarios_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `notas_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SistemaDeNotas`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaDeNotas`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaDeNotas`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaDeNotas`.`nota_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaDeNotas`.`nota_categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nota_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `nota_categoria_notas_idx` (`nota_id` ASC) VISIBLE,
  INDEX `nota_categoria_categorias_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `nota_categoria_notas`
    FOREIGN KEY (`nota_id`)
    REFERENCES `SistemaDeNotas`.`notas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nota_categoria_categorias`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `SistemaDeNotas`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `SistemaDeNotas`.`usuarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `SistemaDeNotas`;
INSERT INTO `SistemaDeNotas`.`usuarios` (`id`, `nombre`, `e-mail`) VALUES (1, 'Ezequiel', 'svariumfoo@gmail.com');
INSERT INTO `SistemaDeNotas`.`usuarios` (`id`, `nombre`, `e-mail`) VALUES (2, 'Muñoz', 'svarium@gmail.com');
INSERT INTO `SistemaDeNotas`.`usuarios` (`id`, `nombre`, `e-mail`) VALUES (3, 'Oscar', 'sva@gmail.com');
INSERT INTO `SistemaDeNotas`.`usuarios` (`id`, `nombre`, `e-mail`) VALUES (4, 'Pamela', 'pamela@gmail.com');
INSERT INTO `SistemaDeNotas`.`usuarios` (`id`, `nombre`, `e-mail`) VALUES (5, 'Pame', 'pame@gmail.com');
INSERT INTO `SistemaDeNotas`.`usuarios` (`id`, `nombre`, `e-mail`) VALUES (6, 'lupis', 'lupis@gmail.com');
INSERT INTO `SistemaDeNotas`.`usuarios` (`id`, `nombre`, `e-mail`) VALUES (7, 'emi', 'emi@gmail.com');
INSERT INTO `SistemaDeNotas`.`usuarios` (`id`, `nombre`, `e-mail`) VALUES (8, 'flor', 'flor@gmail.com');
INSERT INTO `SistemaDeNotas`.`usuarios` (`id`, `nombre`, `e-mail`) VALUES (9, 'ana', 'ana@gmail.com');
INSERT INTO `SistemaDeNotas`.`usuarios` (`id`, `nombre`, `e-mail`) VALUES (10, 'vane', 'vane@gmail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SistemaDeNotas`.`notas`
-- -----------------------------------------------------
START TRANSACTION;
USE `SistemaDeNotas`;
INSERT INTO `SistemaDeNotas`.`notas` (`id`, `titulo`, `fecha_creacion`, `ultima_modif`, `descripcion`, `eliminable`, `categoria_id`, `usuario_id`) VALUES (1, 'El corto de acción real de \'Naruto\'', '2023/03/12', '2023/03/13', 'El anime está siendo más popular que nunca respecto a otros años. Las plataformas de streaming lo saben y encargan así anime original para su extenso catálogo, como es Netflix y series como Kakegurui, Dorohedoro o Kotaro vive solo. Pero también lo hacen así las adaptaciones a acción real de estos populares animes que no han tenido el mismo éxito, como Death Note de Netflix o la que se hizo en su día de Dragon Ball en 2009.', 0, 6, 1);
INSERT INTO `SistemaDeNotas`.`notas` (`id`, `titulo`, `fecha_creacion`, `ultima_modif`, `descripcion`, `eliminable`, `categoria_id`, `usuario_id`) VALUES (2, 'HASTA EL CIELO: LA SERIE', '2023/03/12', '2023/03/13', 'El anime está siendo más popular que nunca respecto a otros años. Las plataformas de streaming lo saben y encargan así anime original para su extenso catálogo, como es Netflix y series como Kakegurui, Dorohedoro o Kotaro vive solo. Pero también lo hacen así las adaptaciones a acción real de estos populares animes que no han tenido el mismo éxito, como Death Note de Netflix o la que se hizo en su día de Dragon Ball en 2009.', 1, 7, 2);
INSERT INTO `SistemaDeNotas`.`notas` (`id`, `titulo`, `fecha_creacion`, `ultima_modif`, `descripcion`, `eliminable`, `categoria_id`, `usuario_id`) VALUES (3, 'Plan de fuga: quién es Esteban Alvarado', '2023/03/12', '2023/03/13', 'Antes de convertirse en traficante, comandaba una banda que robaba automóviles de alta gama en la zona norte del conurbano y los comercializaba en Rosario; aunque pasó preso los últimos diez años, manejó su banda desde la cárcel y llegó a tener una oficina en el calabozo', 1, 5, 3);
INSERT INTO `SistemaDeNotas`.`notas` (`id`, `titulo`, `fecha_creacion`, `ultima_modif`, `descripcion`, `eliminable`, `categoria_id`, `usuario_id`) VALUES (4, 'Evitó un control en La Plata', '2023/03/12', '2023/03/13', 'Un hombre que manejaba un Volkswagen Bora desautorizó la orden de Seguridad Vial y se dio a la fuga', 0, 5, 4);
INSERT INTO `SistemaDeNotas`.`notas` (`id`, `titulo`, `fecha_creacion`, `ultima_modif`, `descripcion`, `eliminable`, `categoria_id`, `usuario_id`) VALUES (5, 'Juicio en Entre Ríos.', '2023/03/12', '2023/03/13', 'Condenaron a 14 años y medio de prisión a un intendente del PJ por abusar de tres mujeres', 0, 3, 5);
INSERT INTO `SistemaDeNotas`.`notas` (`id`, `titulo`, `fecha_creacion`, `ultima_modif`, `descripcion`, `eliminable`, `categoria_id`, `usuario_id`) VALUES (6, 'Alerta ambiental en el Delta', '2023/03/12', '2023/03/13', 'En tres años de bajante y sequía ya se quemó el equivalente a 67 veces la superficie de Rosario', 1, 10, 6);
INSERT INTO `SistemaDeNotas`.`notas` (`id`, `titulo`, `fecha_creacion`, `ultima_modif`, `descripcion`, `eliminable`, `categoria_id`, `usuario_id`) VALUES (7, 'Se fueron de la ciudad y reabrieron un icónico almacén', '2023/03/12', '2023/03/13', 'Mariana López Rabuini y Roberto Fernández se mudaron a San Antonio de Areco y decidieron devolverle la vida a la histórica pulpería Los Principios', 0, 3, 7);
INSERT INTO `SistemaDeNotas`.`notas` (`id`, `titulo`, `fecha_creacion`, `ultima_modif`, `descripcion`, `eliminable`, `categoria_id`, `usuario_id`) VALUES (8, 'Se levantó el corte en Puente Pueyrredón', '2023/03/12', '2023/03/13', 'Desde las 7 exempleados de Garbarino, Megaflex y EMA se concentraron en la subida de Avellaneda del Puente Pueyrredón; se esperan piquetes para la tarde', 1, 4, 8);
INSERT INTO `SistemaDeNotas`.`notas` (`id`, `titulo`, `fecha_creacion`, `ultima_modif`, `descripcion`, `eliminable`, `categoria_id`, `usuario_id`) VALUES (9, 'Los “bichitos” que invadieron el AMBA', '2023/03/12', '2023/03/13', 'qué son los trips y cómo cuidarse ante el contacto con la piel', 0, 3, 9);
INSERT INTO `SistemaDeNotas`.`notas` (`id`, `titulo`, `fecha_creacion`, `ultima_modif`, `descripcion`, `eliminable`, `categoria_id`, `usuario_id`) VALUES (10, 'Piden suspender las clases en la ciudad de Buenos Aires por la ola de calor', '2023/03/12', '2023/03/13', '“Así no se puede enseñar ni aprender”', 1, 3, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SistemaDeNotas`.`categorias`
-- -----------------------------------------------------
START TRANSACTION;
USE `SistemaDeNotas`;
INSERT INTO `SistemaDeNotas`.`categorias` (`id`, `categoria`) VALUES (1, 'Musica');
INSERT INTO `SistemaDeNotas`.`categorias` (`id`, `categoria`) VALUES (2, 'Entretenimiento');
INSERT INTO `SistemaDeNotas`.`categorias` (`id`, `categoria`) VALUES (3, 'Actualidad');
INSERT INTO `SistemaDeNotas`.`categorias` (`id`, `categoria`) VALUES (4, 'Economia');
INSERT INTO `SistemaDeNotas`.`categorias` (`id`, `categoria`) VALUES (5, 'Política');
INSERT INTO `SistemaDeNotas`.`categorias` (`id`, `categoria`) VALUES (6, 'Cine');
INSERT INTO `SistemaDeNotas`.`categorias` (`id`, `categoria`) VALUES (7, 'Series');
INSERT INTO `SistemaDeNotas`.`categorias` (`id`, `categoria`) VALUES (8, 'Infantiles');
INSERT INTO `SistemaDeNotas`.`categorias` (`id`, `categoria`) VALUES (9, 'Moda');
INSERT INTO `SistemaDeNotas`.`categorias` (`id`, `categoria`) VALUES (10, 'Mundo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SistemaDeNotas`.`nota_categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `SistemaDeNotas`;
INSERT INTO `SistemaDeNotas`.`nota_categoria` (`id`, `nota_id`, `categoria_id`) VALUES (1, 1, 1);
INSERT INTO `SistemaDeNotas`.`nota_categoria` (`id`, `nota_id`, `categoria_id`) VALUES (2, 2, 2);
INSERT INTO `SistemaDeNotas`.`nota_categoria` (`id`, `nota_id`, `categoria_id`) VALUES (3, 3, 3);
INSERT INTO `SistemaDeNotas`.`nota_categoria` (`id`, `nota_id`, `categoria_id`) VALUES (4, 5, 6);
INSERT INTO `SistemaDeNotas`.`nota_categoria` (`id`, `nota_id`, `categoria_id`) VALUES (5, 6, 7);
INSERT INTO `SistemaDeNotas`.`nota_categoria` (`id`, `nota_id`, `categoria_id`) VALUES (6, 8, 9);
INSERT INTO `SistemaDeNotas`.`nota_categoria` (`id`, `nota_id`, `categoria_id`) VALUES (7, 10, 1);
INSERT INTO `SistemaDeNotas`.`nota_categoria` (`id`, `nota_id`, `categoria_id`) VALUES (8, 3, 1);
INSERT INTO `SistemaDeNotas`.`nota_categoria` (`id`, `nota_id`, `categoria_id`) VALUES (9, 7, 5);
INSERT INTO `SistemaDeNotas`.`nota_categoria` (`id`, `nota_id`, `categoria_id`) VALUES (10, 2, 9);

COMMIT;

