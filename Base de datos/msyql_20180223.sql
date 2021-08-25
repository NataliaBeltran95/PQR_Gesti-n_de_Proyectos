/*
SQLyog Enterprise - MySQL GUI v8.1 
MySQL - 6.0.11-alpha-community : Database - solicitudes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`solicitudes` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `solicitudes`;

/*Table structure for table `dependencia` */

DROP TABLE IF EXISTS `dependencia`;

CREATE TABLE `dependencia` (
  `Id_Dependencia` int(3) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Direccion` varchar(20) NOT NULL,
  `Telefono` int(7) NOT NULL,
  PRIMARY KEY (`Id_Dependencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dependencia` */

insert  into `dependencia`(Id_Dependencia,Nombre,Direccion,Telefono) values (1,'Juridica','dsafsdf',343434),(2,'def','dsfdd',45),(3,'Contabilidad','calle falsa ',123456789);

/*Table structure for table `estado` */

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `Id_Estado` int(3) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `estado` */

insert  into `estado`(Id_Estado,Nombre) values (1,'Pendiente'),(2,'Aceptado'),(3,'Rechazado');

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `Id_Rol` int(3) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rol` */

insert  into `rol`(Id_Rol,Nombre) values (1,'Administrador'),(2,'Seguimiento'),(3,'Operario');

/*Table structure for table `seguimiento` */

DROP TABLE IF EXISTS `seguimiento`;

CREATE TABLE `seguimiento` (
  `Id_Seguimiento` int(5) NOT NULL,
  `Id_Dependencia` int(3) DEFAULT NULL,
  `Flujo` int(2) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Observacion` varchar(500) DEFAULT NULL,
  `Archivo` varchar(200) DEFAULT NULL,
  `Imagen` varchar(200) DEFAULT NULL,
  `Id_Usuario` int(5) NOT NULL,
  `Id_Estado` int(3) NOT NULL,
  `Id_Solicitud` int(10) NOT NULL,
  PRIMARY KEY (`Id_Seguimiento`),
  KEY `FK_seg_estado` (`Id_Estado`),
  KEY `FK_seg_dep` (`Id_Dependencia`),
  KEY `FK_seg_usuario` (`Id_Usuario`),
  KEY `FK_seg_solicitud` (`Id_Solicitud`),
  CONSTRAINT `FK_seg_dep` FOREIGN KEY (`Id_Dependencia`) REFERENCES `dependencia` (`Id_Dependencia`),
  CONSTRAINT `FK_seg_estado` FOREIGN KEY (`Id_Estado`) REFERENCES `estado` (`Id_Estado`),
  CONSTRAINT `FK_seg_solicitud` FOREIGN KEY (`Id_Solicitud`) REFERENCES `solicitudes` (`Id_Solicitud`),
  CONSTRAINT `FK_seg_usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seguimiento` */

insert  into `seguimiento`(Id_Seguimiento,Id_Dependencia,Flujo,Fecha,Observacion,Archivo,Imagen,Id_Usuario,Id_Estado,Id_Solicitud) values (1,2,1,'2010-01-17 00:00:00','s',NULL,NULL,1,1,8),(2,2,1,'2010-01-17 00:00:00','ccc',NULL,NULL,1,1,9),(3,2,1,'2010-01-17 00:00:00','rr',NULL,NULL,1,1,10),(4,2,1,'2010-01-17 00:00:00','tr',NULL,NULL,1,1,11),(5,2,1,'2010-01-17 00:00:00','cvcv',NULL,NULL,1,1,12),(6,2,1,'2010-01-17 00:00:00','dfdf',NULL,NULL,1,1,13),(7,2,1,'2010-01-17 00:00:00','Esta es un mensaje de prueba apra mirar el ingreso de actividades mas largas','~\\FileUpload\\Penguins.jpg','~\\FileUpload\\Lighthouse.jpg',1,1,14),(8,2,2,'2010-01-17 00:00:00','Esta es una prueba y se descide aceptar la solictud','~\\FileUpload\\Tulips.jpg',NULL,1,2,14),(9,2,2,'2010-01-17 00:00:00','No se aprueba',NULL,NULL,1,3,10),(10,2,2,'2010-01-17 00:00:00','prueba realizada',NULL,NULL,1,2,4),(11,1,2,'2010-01-17 00:00:00','Se aprueba para verificar la fecha de respuesta  de la solicitud',NULL,NULL,1,2,0);

/*Table structure for table `solicitudes` */

DROP TABLE IF EXISTS `solicitudes`;

CREATE TABLE `solicitudes` (
  `Id_Solicitud` int(10) NOT NULL,
  `Tipo` int(1) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellidos` varbinary(20) DEFAULT NULL,
  `Fecha_Ingreso` datetime NOT NULL,
  `Mensaje` varchar(1000) NOT NULL,
  `Id_Dependencia` int(3) DEFAULT NULL,
  `Archivo` varchar(50) DEFAULT NULL,
  `Imagen` varchar(50) DEFAULT NULL,
  `Correo` varchar(20) DEFAULT NULL,
  `Id_Estado` int(3) NOT NULL,
  PRIMARY KEY (`Id_Solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `solicitudes` */

insert  into `solicitudes`(Id_Solicitud,Tipo,Nombre,Apellidos,Fecha_Ingreso,Mensaje,Id_Dependencia,Archivo,Imagen,Correo,Id_Estado) values (0,1,'dd','dd','2009-02-02 00:00:00','ddd',1,'eee','eee','eeee',2),(4,1,'dasdasdsad','asdasdasd','2010-01-17 08:37:22','as',2,NULL,NULL,'asdasdasd',2),(5,1,'s','s','2010-01-17 00:00:00','s',2,NULL,NULL,'s',1),(6,1,'s','s','2010-01-17 00:00:00','s',2,NULL,NULL,'s',1),(7,1,'b','b','2010-01-17 09:36:38','b',2,NULL,NULL,'b',1),(8,1,'s','s','2010-01-17 09:53:58','s',2,NULL,NULL,'s',1),(9,1,'ccc','cc','2010-01-17 10:06:32','ccc',2,NULL,NULL,'ccc',1),(10,1,'rr','rr','2010-01-17 10:12:31','rr',2,NULL,NULL,'rr',3),(11,1,'tr','tr','2010-01-17 10:13:23','tr',2,NULL,NULL,'tr',1),(12,1,'cv','cv','2010-01-17 10:14:10','cvcv',2,NULL,NULL,'cv',1),(13,1,'sdfd','dfsdf','2010-01-17 10:14:55','dfdf',2,NULL,NULL,'dfdf',1),(14,3,'Ivan Dario','Monje Fajardo','2010-01-17 10:16:05','Esta es un mensaje de prueba apra mirar el ingreso de actividades mas largas',2,'~\\FileUpload\\Penguins.jpg','~\\FileUpload\\Lighthouse.jpg','mongee.1@hotmail.com',2);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `Id_Usuario` int(10) NOT NULL,
  `Cedula` int(10) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Fecha_Nac` datetime NOT NULL,
  `Edad` int(2) NOT NULL,
  `Contraseña` varchar(12) NOT NULL,
  `Correo` varchar(20) DEFAULT NULL,
  `Id_Rol` int(3) NOT NULL,
  `Id_Dependencia` int(3) DEFAULT NULL,
  `Loggin` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Usuario`),
  KEY `FK_usurol` (`Id_Rol`),
  KEY `FK_usudep` (`Id_Dependencia`),
  CONSTRAINT `FK_usudep` FOREIGN KEY (`Id_Dependencia`) REFERENCES `dependencia` (`Id_Dependencia`),
  CONSTRAINT `FK_usurol` FOREIGN KEY (`Id_Rol`) REFERENCES `rol` (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

insert  into `usuario`(Id_Usuario,Cedula,Apellidos,Nombres,Fecha_Nac,Edad,Contraseña,Correo,Id_Rol,Id_Dependencia,Loggin) values (1,123456,'mnbvc','Ivan Dario','0000-00-00 00:00:00',15,'12345','mongee.1@hotmail.com',1,1,'mongee'),(2,2134124,'sdfas','asdfsdf','2009-09-05 00:00:00',32,'qqq','sdfsdfg',2,1,'qwer'),(3,343,'dfg','dsfdsf','2009-09-07 00:00:00',23,'sdfds','dsfsd',1,1,'dfgdfg'),(4,5678899,'ertyuinjhg','dfghfghjyiuoierfsdf','2009-09-05 00:00:00',54,'12345','weroyt@fgh.com',1,1,'dfgdfgghjyuityr'),(5,343,'sadsads','asdsad','2009-09-05 00:00:00',34,'asdsad','sadsad',1,1,'adsad');

/* Function  structure for function  `F_CREAR_SOLICITUD` */

/*!50003 DROP FUNCTION IF EXISTS `F_CREAR_SOLICITUD` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `F_CREAR_SOLICITUD`() RETURNS int(11)
BEGIN
    DECLARE IdSol INT;
    SET IdSol= (SELECT MAX(Id_Solicitud) FROM solicitudes);
    return IdSol;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_CARGAR_ARCHIVO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_CARGAR_ARCHIVO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_ARCHIVO`(IN IdSol INTEGER (5))
BEGIN
	 SELECT Archivo nombre,Archivo ruta FROM solicitudes WHERE Id_Solicitud=IdSol;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_CARGAR_ARCHIVO_RESPUESTA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_CARGAR_ARCHIVO_RESPUESTA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_ARCHIVO_RESPUESTA`(IN IdSol INTEGER (5),IN IdEst INTEGER (3))
BEGIN
	SELECT Archivo nombre,Archivo ruta FROM seguimiento WHERE Id_Solicitud=IdSol and Id_Estado=IdEst;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_CARGAR_IMAGENES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_CARGAR_IMAGENES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_IMAGENES`(IN IdSol INTEGER (5))
BEGIN
     SELECT Imagen ruta FROM solicitudes WHERE Id_Solicitud=IdSol;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_CARGAR_IMAGENES_RESPUESTA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_CARGAR_IMAGENES_RESPUESTA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_IMAGENES_RESPUESTA`(IN IdSol INTEGER (5),IN IdEst INTEGER (3))
BEGIN
	SELECT Imagen ruta FROM seguimiento WHERE Id_Solicitud=IdSol and Id_Estado=IdEst;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_CARGAR_RESPUESTA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_CARGAR_RESPUESTA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_RESPUESTA`(IN IdSol INTEGER (5),IN IdEst INTEGER (3))
BEGIN
	Select A.Fecha,A.Observacion,B.Nombres
	from seguimiento A, usuario B
	where A.Id_Usuario= B.Id_Usuario and Id_Solicitud= IdSol and Id_Estado=IdEst;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_CARGAR_SEGUIMIENTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_CARGAR_SEGUIMIENTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SEGUIMIENTO`(IN IdSol INTEGER (5))
BEGIN
	declare  Flj int;
	set Flj = (select MAX(Flujo) from seguimiento where Id_Solicitud=IdSol);
	SELECT A.Fecha,A.Observacion,B.Nombre Dep,C.Nombre Estado,A.Archivo,A.Imagen FROM seguimiento A, dependencia B, estado C 
	WHERE A.Id_Dependencia=B.Id_Dependencia and A.Id_Estado=C.Id_Estado and a.Id_Solicitud=IdSol and A.Flujo=Flj;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_CARGAR_SOLICITUD` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_CARGAR_SOLICITUD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SOLICITUD`(IN IdSol integer (5))
BEGIN
    select Tipo,Nombre,Apellidos,Fecha_Ingreso,Mensaje,Id_Estado from solicitudes WHERE Id_Solicitud=IdSol;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_CREAR_DEPENDENCIA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_CREAR_DEPENDENCIA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_DEPENDENCIA`(IN Nom varchar(20),IN Dire varchar(20),IN Tele int(7))
BEGIN
	declare IdDep INT;
	SET IdDep= (select max(Id_Dependencia) from dependencia)+1;
	INSERT INTO dependencia(Id_Dependencia,Nombre,Direccion,Telefono)	
	VALUES (IdDep,Nom,Dire,Tele);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_CREAR_SOLICITUD` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_CREAR_SOLICITUD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_SOLICITUD`(IN Nomb varchar (20),IN Tip integer ,IN Ape varchar (20),IN Fe_In datetime,IN Men varchar (300),IN Id_Dep integer,        
						    IN Arch varchar (50),IN Imag varchar (50),IN Corr varchar (30))
BEGIN
	DECLARE  IdSol INT;
	SET IdSol= (SELECT MAX(Id_Solicitud) FROM solicitudes)+1;     
	INSERT INTO solicitudes(Id_Solicitud,Tipo,Nombre,Apellidos,Fecha_Ingreso,Mensaje,Id_Dependencia,Archivo,Imagen,Correo,Id_Estado)   
	VALUES (IdSol,Tip,Nomb,Ape,Fe_In,Men,Id_Dep,Arch,Imag,Corr,1);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_CREAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_CREAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_USUARIO`(IN Ced int(10),IN Ape varchar(30),IN Nom varchar(30),In Fecha datetime, IN Eda int(2),IN Con varchar(12),IN Corr varchar(20),In IdRol int(3),In IdDep inT(3),IN Logg varchar(20))
BEGIN
 declare IdUsu INT;
 SET IdUsu= (select max(Id_Usuario) from usuario)+1;
 INSERT INTO usuario(Id_Usuario,Cedula,Apellidos,Nombres,Fecha_Nac,Edad,Contraseña,Correo,Id_Rol,Id_Dependencia,Loggin)	
 VALUES (IdUsu,Ced,Ape,Nom,Fecha,Eda,Con,Corr,IdRol,IdDep,Logg);
 END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTADO_SOLICITUDES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTADO_SOLICITUDES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTADO_SOLICITUDES`()
BEGIN
	SELECT Id_Dependencia,Tipo from solicitudes;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTADO_SOLICITUDES_DEPENDENCIA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTADO_SOLICITUDES_DEPENDENCIA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTADO_SOLICITUDES_DEPENDENCIA`(IN IdDepen INTEGER (3))
BEGIN
	SELECT A.Id_solicitud,A.Tipo,A.Fecha_Ingreso Fecha,B.Nombre
	FROM  solicitudes A, estado B
	WHERE A.Id_Estado= B.Id_Estado and A.Id_Dependencia=IdDepen;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_DEPENDENCIAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_DEPENDENCIAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DEPENDENCIAS`()
BEGIN
 SELECT Id_Dependencia,Nombre FROM DEPENDENCIA order by Nombre;	
 END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ROL`()
BEGIN
 SELECT * FROM ROL;
 END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LOGIN` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LOGIN` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGIN`(IN Nom VARCHAR(20),IN Pass varchar(12))
BEGIN
	Select Id_Usuario,Id_Rol,Id_Dependencia from usuario where Loggin = Nom and Contraseña = Pass; 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_NUMERO_SOLICITUD` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_NUMERO_SOLICITUD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NUMERO_SOLICITUD`()
BEGIN
	select max(Id_Solicitud)from solicitudes;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_SEGUIMIENTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_SEGUIMIENTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEGUIMIENTO`(IN IdDep Integer(2),IN Flj Integer(2),IN Fec Datetime,IN Obs varchar(500),IN Arch varchar (50), IN Imag varchar(50),
					     In Id_Usu Integer(5),IN Id_Est Integer(2),IN Id_Sol integer(10))
BEGIN
    DECLARE IdSeg INT;
	SET IdSeg= (SELECT MAX(Id_Seguimiento) FROM seguimiento)+1;
    INSERT INTO seguimiento(Id_Seguimiento,Id_Dependencia,Flujo,Fecha,Observacion,Archivo,Imagen,Id_Usuario,Id_Estado,Id_Solicitud)	
	VALUES (IdSeg,IdDep,Flj,Fec,Obs,Arch,Imag,Id_Usu,Id_Est,Id_Sol);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_SOLICTUDES_FUNCIONARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_SOLICTUDES_FUNCIONARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SOLICTUDES_FUNCIONARIO`(IN IdDep integer(2))
BEGIN
	SELECT A.Id_Solicitud,A.Tipo,A.Fecha_Ingreso Fecha,A.Mensaje Observacion 
	FROM solicitudes A 
	WHERE A.Id_Dependencia=IdDep and A.Id_Estado=1
	Order BY A.Fecha_Ingreso,A.Id_Solicitud;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_TOTAL_SEGUIMIENTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_TOTAL_SEGUIMIENTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TOTAL_SEGUIMIENTO`()
BEGIN
    sELECT A.Id_Solicitud,B.Nombre Dep,D.Tipo,A.Fecha,C.Nombre,A.Observacion,A.Archivo,A.Imagen 
    from seguimiento A,dependencia B,estado C,solicitudes D 
    where A.Id_Dependencia=B.Id_Dependencia and A.Id_Dependencia=B.Id_Dependencia and A.Id_Estado=C.Id_Estado 
    and A.Id_Solicitud = D.Id_Solicitud
    order by A.Id_Solicitud;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_UPDATE_ESTADO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_UPDATE_ESTADO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ESTADO`(IN Id_Sol INTEGER(10),In Fluj INTEGER(3))
BEGIN
	UPDATE solicitudes SET Id_Estado=Fluj WHERE Id_Solicitud=Id_Sol;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
