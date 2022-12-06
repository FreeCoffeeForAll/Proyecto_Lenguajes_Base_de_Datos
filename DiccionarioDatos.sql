
/* Módulo de Roles */

DROP TABLE Roles;
CREATE TABLE Roles (
  ID_Rol   NUMBER(4) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  PRIMARY KEY (ID_Rol)
);

INSERT INTO Roles (ID_Rol, Descripcion) VALUES (1, 'Cliente');
INSERT INTO Roles (ID_Rol, Descripcion) VALUES (2, 'Entrenador');
INSERT INTO Roles (ID_Rol, Descripcion) VALUES (3, 'Administrador');



/* Módulo de Usuarios */
DROP TABLE Usuarios;
CREATE TABLE Usuarios (
  Codigo_Usuario NUMBER(4) GENERATED ALWAYS AS IDENTITY,
  Usuario VARCHAR2(30),
  Contrasena NUMBER(30),
  PRIMARY KEY (Codigo_Usuario)
);

INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (1,0253274);
INSERT INTO Usuarios(Codigo_Usuario, Contrasena) VALUES (2,5643434);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (3,7557574);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (4,7893414);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (5,7864532);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (6,7854757);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (7,9685377);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (8,1363757);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (9,79875727);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (10,6785785);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (11,0253274);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (12,5643434);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (13,7557574);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (14,7893414);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (15,7864532);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (16,7854757);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (17,9685377);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (18,1363757);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (19,79875727);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (20,6785785);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (21,0253274);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (22,5643434);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (23,7557574);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (24,7893414);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (25,7864532);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (26,7854757);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (27,9685377);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (28,1363757);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (29,79875727);
INSERT INTO Usuarios (Codigo_Usuario, Contrasena) VALUES (30,6785785);


/* Módulo de Direccion */
DROP TABLE Direcciones;
CREATE TABLE Direcciones (
  Direccion_id NUMBER(20) GENERATED ALWAYS AS IDENTITY,
  Provincia VARCHAR2(20),
  Canton VARCHAR2(20),
  Distrito VARCHAR2(20),
  otros VARCHAR2(20),
  PRIMARY KEY (Direccion_id)
);

INSERT INTO Direccion (Direccion_id, Provincia,Canton, Distrito,otros) VALUES (1, 'Alajuela','Grecia','Grecia','Ninguno');
INSERT INTO Direccion (Direccion_id, Provincia,Canton, Distrito,otros) VALUES (2, 'San Jose','Desamparados','Desamparados','barrio la cruz');
INSERT INTO Direccion (Direccion_id, Provincia,Canton, Distrito,otros) VALUES (3, 'Cartago','Paraíso','Paraíso','Ninguno');
INSERT INTO Direccion (Direccion_id, Provincia,Canton, Distrito,otros) VALUES (4, 'Heredia','Barva','Barva','calle mercurio');
INSERT INTO Direccion (Direccion_id, Provincia,Canton, Distrito,otros) VALUES (5, 'Alajuela','Atenas','Atenas','Ninguno');
INSERT INTO Direccion (Direccion_id, Provincia,Canton, Distrito,otros) VALUES (6, 'San Jose',' Aserrí',' Aserrí','Ninguno');
INSERT INTO Direccion (Direccion_id, Provincia,Canton, Distrito,otros) VALUES (7, 'San Jose','Moravia','San Vicente','barrio la cruz');
INSERT INTO Direccion (Direccion_id, Provincia,Canton, Distrito,otros) VALUES (8, 'Cartago','La Unión','Tres Ríos','Ninguno');
INSERT INTO Direccion (Direccion_id, Provincia,Canton, Distrito,otros) VALUES (9, 'San Jose','Montes de Oca','San Pedro','calle mercurio');
INSERT INTO Direccion (Direccion_id, Provincia,Canton, Distrito,otros) VALUES (10, 'Limon',' Talamanca','Bribri','Ninguno');

/* Módulo de Rutinas */
DROP TABLE Rutinas;
CREATE TABLE Rutinas (
  ID_Rutina NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  Tipo VARCHAR2(40),
  PRIMARY KEY (ID_Rutina)
);

INSERT INTO Rutinas (ID_Rutina, Descripcion,Tipo) VALUES (1, 'Pecho', '4 Series');
INSERT INTO Rutinas (ID_Rutina, Descripcion,Tipo) VALUES (2, 'Pecho', '8 Series');
INSERT INTO Rutinas (ID_Rutina, Descripcion,Tipo) VALUES (3, 'Hombros', '6 Series');
INSERT INTO Rutinas (ID_Rutina, Descripcion,Tipo) VALUES (4, 'Piernas', '4 Series');
INSERT INTO Rutinas (ID_Rutina, Descripcion,Tipo) VALUES (5, 'Brazo', '3 Series');
INSERT INTO Rutinas (ID_Rutina, Descripcion,Tipo) VALUES (6, 'Pecho', '4 Series');
INSERT INTO Rutinas (ID_Rutina, Descripcion,Tipo) VALUES (7, 'piernas', '8 Series');
INSERT INTO Rutinas (ID_Rutina, Descripcion,Tipo) VALUES (8, 'triceps', '10 Series');
INSERT INTO Rutinas (ID_Rutina, Descripcion,Tipo) VALUES (9, 'espalda', '4 Series');
INSERT INTO Rutinas (ID_Rutina, Descripcion,Tipo) VALUES (10, 'Brazo', '3 Series');

/* Módulo de Salarios */
DROP TABLE Salarios;
CREATE TABLE Salarios (
  ID_Salario NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  Monto NUMBER(10),
  PRIMARY KEY (ID_Salario)
);

INSERT INTO Salarios (ID_Salario,Descripcion,Monto) VALUES (1, 'quicena',54634);
INSERT INTO Salarios (ID_Salario,Descripcion,Monto) VALUES (2, 'quicena',3123785);
INSERT INTO Salarios (ID_Salario,Descripcion,Monto) VALUES (3, 'quicena',5465634);
INSERT INTO Salarios (ID_Salario,Descripcion,Monto) VALUES (4, 'quicena',546786);
INSERT INTO Salarios (ID_Salario,Descripcion,Monto) VALUES (5, 'quicena',76786787);
INSERT INTO Salarios (ID_Salario,Descripcion,Monto) VALUES (6, 'quicena',5345345);
INSERT INTO Salarios (ID_Salario,Descripcion,Monto) VALUES (7, 'quicena',4654546);
INSERT INTO Salarios (ID_Salario,Descripcion,Monto) VALUES (8, 'quicena',2343434);
INSERT INTO Salarios (ID_Salario,Descripcion,Monto) VALUES (9, 'quicena',82346);
INSERT INTO Salarios (ID_Salario,Descripcion,Monto) VALUES (10, 'quicena',876867);

/* Módulo de Membresías */
DROP TABLE Membresias;
CREATE TABLE Membresías (
  Num_membresia NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  Costo NUMBER(10),
  PRIMARY KEY (Num_membresia)
);

INSERT INTO Membresías (Num_membresia,Descripcion, Costo) VALUES (1, 'oro',300000);
INSERT INTO Membresías (Num_membresia,Descripcion, Costo) VALUES (2, 'bronce', 400000);
INSERT INTO Membresías (Num_membresia,Descripcion, Costo) VALUES (3, 'Platino', 500000);
/* Módulo de Clientes */

CREATE TABLE Clientes (
  Cedula   NUMBER(30) PRIMARY KEY NOT NULL,
  Nombre VARCHAR2(30),
  Primer_apellido VARCHAR2(30),
  Segundo_apellido VARCHAR2(30),
  Codigo_Usuario NUMBER(4),
  Num_membresia NUMBER(10),
  ID_Rutina NUMBER(10),
  Direccion_id NUMBER(10),
  Correo_Electronico VARCHAR2(30),
  ID_Rol NUMBER(4),
  FOREIGN KEY (ID_Rol) REFERENCES Rol(ID_Rol),
  FOREIGN KEY (Codigo_Usuario) REFERENCES Usuario(Codigo_Usuario),
  FOREIGN KEY (Num_membresia) REFERENCES Membresías(Num_membresia),
  FOREIGN KEY (ID_Rutina) REFERENCES Rutinas(ID_Rutina),
  FOREIGN KEY (Direccion_id) REFERENCES Direccion(Direccion_id)
);

INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,Num_membresia,ID_Rutina,Direccion_id,Correo_Electronico,ID_Rol) VALUES (118260550, 'Steven','Vargas','Valverde',1,1,1,1,'Vargas548@gmail.com',1);
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,Num_membresia,ID_Rutina,Direccion_id,Correo_Electronico,ID_Rol) VALUES (167867867, 'Carlos','Rodriguez','Castro',2,2,2,2,'marcus.daugherty64@hotmail.com',1);
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,Num_membresia,ID_Rutina,Direccion_id,Correo_Electronico,ID_Rol) VALUES (135434344, 'Ramon','Sanchez','Gutierrez',3,3,3,3,'margarete4@hotmail.com',1);
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,Num_membresia,ID_Rutina,Direccion_id,Correo_Electronico,ID_Rol) VALUES (133983988, 'Maria','Villalobos','Hernandez',4,1,4,4,'sarai.gleichner@yahoo.com',1);
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,Num_membresia,ID_Rutina,Direccion_id,Correo_Electronico,ID_Rol) VALUES (178377550, 'Julio','Muñoz','Cascante',5,2,5,5,'piper38@gmail.com',1);
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,Num_membresia,ID_Rutina,Direccion_id,Correo_Electronico,ID_Rol) VALUES (117838750, 'Regina ','Moya','Valverde',6,3,6,6,'daija_klein88@hotmail.com',1);
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,Num_membresia,ID_Rutina,Direccion_id,Correo_Electronico,ID_Rol) VALUES (112310550, 'Águeda ','Morcillo ','Fortuny',7,1,7,7,'oma.white65@yahoo.com',1);
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,Num_membresia,ID_Rutina,Direccion_id,Correo_Electronico,ID_Rol) VALUES (118267887, 'Javiera ','Miranda','Fortuny',8,2,8,8,'sydnee.bogan@hotmail.com',1);
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,Num_membresia,ID_Rutina,Direccion_id,Correo_Electronico,ID_Rol) VALUES (196685747, 'Ignacia ','Hidalgo','Cepeda ',9,3,9,9,'breanne13@hotmail.com',1);
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,Num_membresia,ID_Rutina,Direccion_id,Correo_Electronico,ID_Rol) VALUES (177872722, 'Caridad ','Sánchez ','Casal',10,3,10,10,'miracle25@yahoo.com',1);
/* Módulo de Entrenadores */

CREATE TABLE Entrenadores (
  Cedula   NUMBER(30) PRIMARY KEY NOT NULL,
  Nombre VARCHAR2(30),
  Primer_apellido VARCHAR2(30),
  Segundo_apellido VARCHAR2(30),
  Codigo_Usuario NUMBER(4),
  ID_Salario NUMBER(10),
  Direccion_id NUMBER(30),
  Correo_Electronico VARCHAR2(30),
  ID_Rol NUMBER(4),
  FOREIGN KEY (ID_Rol) REFERENCES Rol(ID_Rol),
  FOREIGN KEY (Codigo_Usuario) REFERENCES Usuario(Codigo_Usuario),
  FOREIGN KEY (ID_Salario) REFERENCES Salarios(ID_Salario),
  FOREIGN KEY (Direccion_id) REFERENCES Direccion(Direccion_id)
);

INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (187966783, 'Julio ','Enríquez ','Calleja',11,1,1,'kiara63@yahoo.com',2);
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (134647865, 'Jose ','Canet ','Fortuny ',12,2,2,'justyn_shanahan32@hotmail.com',2);
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (189052246, 'Julio ','Ignacio ','Castro',13,3,3,'brock_schaden46@yahoo.com',2);
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (164578940, 'Moisés ','Pintor ','Paz',14,4,4,'hans.kuhic57@gmail.com',2);
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (146345650, 'Luis ','Taboada','Valverde',15,5,7,'harmony30@gmail.com',2);
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (119780870, 'Julio ','Morell ','Valverde',16,6,8,'donnell.beier@gmail.com',2);
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (118657550, 'Belén ','Vergara ','Garcés',17,7,9,'aditya.ward3@hotmail.com',2);
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (114564050, 'Ana ','Romero ','Valverde',18,8,10,'jan20@yahoo.com',2);
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (117270550, 'Julio ','Perales ','Romero ',19,9,2,'cecilia.feil2@gmail.com',2);
/* Módulo de Administradores */

CREATE TABLE Administradores (
  Cedula NUMBER(30) PRIMARY KEY NOT NULL,
  Nombre VARCHAR2(30),
  Primer_apellido VARCHAR2(30),
  Segundo_apellido VARCHAR2(30),
  Codigo_Usuario NUMBER(4),
  ID_Salario NUMBER(30),
  Direccion_id NUMBER(10),
  Correo_Electronico VARCHAR2(30),
  ID_Rol NUMBER(4),
  FOREIGN KEY (ID_Rol) REFERENCES Rol(ID_Rol),
  FOREIGN KEY (Codigo_Usuario) REFERENCES Usuario(Codigo_Usuario),
  FOREIGN KEY (ID_Salario) REFERENCES Salarios(ID_Salario),
  FOREIGN KEY (Direccion_id) REFERENCES Direccion(Direccion_id)
);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (355456463, 'Juana ','Múñiz ','Coronado',20,1,1,'newton71@hotmail.com',3);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (983835433, 'Yolanda ','Sevillano ','Fernández',21,2,2,'helene_spencer24@yahoo.com',3);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (748435434, 'Steven','Alvarado ','Acedo',22,3,3,'dawson26@gmail.com',3);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (737837834, 'Juana ','Pinto ','Balaguer',23,4,4,'sonia_krajcik5@gmail.com',3);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (398787211, 'María ','Paz ','Guerrero',24,5,5,'abby30@yahoo.com',3);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (127865777, 'Antonio ','Carreras ','Coronado',25,6,6,'general_lindgren4@yahoo.com',3);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (374853448, 'Jordán ','Serra ','Barroso',26,7,7,'tracy_effertz82@gmail.com',3);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (434348944, 'Pepe ','Herrera ','Pereira',27,8,8,'hershel10@hotmail.com',3);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (187633778, 'Yolanda ','Ribera ','Giménez ',9,1,9,'johan.casper38@yahoo.com',3);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,Codigo_Usuario,ID_Salario,Direccion_id,Correo_Electronico,ID_Rol) VALUES (187673789, 'Fernando ','Peral ','Núñez ',29,10,10,'nico36@hotmail.com',3);

/* Módulo de Facturación */
DROP TABLE Facturacion;
CREATE TABLE Facturación (
  Num_factura NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Fecha_factura NUMBER(10),
  Total_antes_IVA NUMBER(10),
  Costo_IV NUMBER(10),
  Total_factura NUMBER(10),
  PRIMARY KEY (Num_factura)
);

INSERT INTO Facturación (Num_factura, Fecha_factura,Total_antes_IVA,Costo_IV,Total_factura) VALUES (1,1,10000,13,11200);
INSERT INTO Facturación (Num_factura, Fecha_factura,Total_antes_IVA,Costo_IV,Total_factura) VALUES (2,1,12000,13,11250);
INSERT INTO Facturación (Num_factura, Fecha_factura,Total_antes_IVA,Costo_IV,Total_factura) VALUES (3,1,30000,13,32000);
INSERT INTO Facturación (Num_factura, Fecha_factura,Total_antes_IVA,Costo_IV,Total_factura) VALUES (4,1,40000,13,41000);
INSERT INTO Facturación (Num_factura, Fecha_factura,Total_antes_IVA,Costo_IV,Total_factura) VALUES (5,1,50000,13,51000);

/* Módulo de Maquinas */
DROP TABLE Maquinas;
CREATE TABLE Maquinas (
  ID_Maquina NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  Tipo_maquina VARCHAR2(40),
  PRIMARY KEY (ID_Maquina)
);

INSERT INTO Maquinas (ID_Maquina, Descripcion,Tipo_maquina) VALUES (1, 'Maquina para Pecho', 'Pecho');
INSERT INTO Maquinas (ID_Maquina, Descripcion,Tipo_maquina) VALUES (2, 'Maquina para brazo', 'brazo');
INSERT INTO Maquinas (ID_Maquina, Descripcion,Tipo_maquina) VALUES (3, 'Maquina para Hombros', 'Hombros');
INSERT INTO Maquinas (ID_Maquina, Descripcion,Tipo_maquina) VALUES (4, 'Maquina para Piernas', 'Piernas');
INSERT INTO Maquinas (ID_Maquina, Descripcion,Tipo_maquina) VALUES (5, 'Maquina para espalda', 'espalda');

/* Módulo de  pagos */
DROP TABLE pagos;
CREATE TABLE  pagos (
  ID_Pago NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  Tipo_Transacion VARCHAR2(40),
  PRIMARY KEY (ID_Pago)
);

INSERT INTO pagos (ID_Pago, Descripcion,Tipo_Transacion) VALUES (1, 'targeta', 'targeta');
INSERT INTO pagos (ID_Pago, Descripcion,Tipo_Transacion) VALUES (2, 'efectivo', 'efectivo');
INSERT INTO pagos (ID_Pago, Descripcion,Tipo_Transacion) VALUES (3, 'simpe', 'simpe');


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--      Diccionario Daniel
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

alter session set "_ORACLE_SCRIPT"=TRUE;
--CREACION DE USUARIOS
CREATE USER Steven IDENTIFIED BY Steven;
CREATE USER Deiner IDENTIFIED BY Deiner;
CREATE USER Victor IDENTIFIED BY Victor;
CREATE USER Daniel IDENTIFIED BY Daniel;

--CREACION DE TABLESPACE -- PENDIENTE DEFINIR LA RUTA 
CREATE  TABLESPACE BaseDatosGym
    DATAFILE 'C:\USERS\ASUS\DOWNLOADS\ORADATA\ORCL\PendienteValidarRuta.DBF'
    SIZE 10M
    AUTOEXTEND ON NEXT 5M MAXSIZE 20M;

--ASIGNACION DE USUARIOS AL TABLESPACE    
ALTER USER  Steven DEFAULT TABLESPACE BaseDatosGym;
ALTER USER  Steven DEFAULT TABLESPACE BaseDatosGym;
ALTER USER  Victor DEFAULT TABLESPACE BaseDatosGym;
ALTER USER  Daniel DEFAULT TABLESPACE BaseDatosGym;

--ASIGNACION DE ROLES
CREATE ROLE Cliente;
CREATE ROLE Entrenador;
CREATE ROLE Administrador;

--ASIGNACION DE PRIVILEGIOS AL ROLE Cliente
GRANT PUBLIC TO Cliente;

--ASIGNACION DE PRIVILEGIOS AL ROLE Entrenador
GRANT CREATE SESSION,
UPDATE ANY TABLE,
INSERT ANY TABLE,
SELECT ANY TABLE TO Entrenador;

--ASIGNACION DE PRIVILEGIOS AL ROLE Administrador
GRANT ADMIN TO Administrador;

--ASIGNACION DE ROLES A USUARIOS
GRANT Administrador TO Steven, Deiner, Victor, Daniel;

--CREACION DE VISTAS
CREATE OR REPLACE VIEW ADMINViEW AS
SELECT *
FROM Administradores;

CREATE OR REPLACE COACHVIEW AS
SELECT *
FROM Entrenadores;

CREATE OR REPLACE VIEW CLIENTVIEW AS
SELECT *
FROM Clientes;


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--      Procedimientos Insert Deiner
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

------Procedimiento para insertar usuarios------------

CREATE OR REPLACE PROCEDURE INSERTA_USUARIOS (P_Codigo IN USUARIOS.Codigo_usuario%TYPE, 
                                              P_Contrasena IN USUARIOS.Contrasena%TYPE, 
                                              P_ID_Rol IN USUARIOS.ID_Rol%TYPE )
IS
    BEGIN
     INSERT INTO USUARIOS VALUES (P_Codigo, P_Contrasena, P_ID_Rol);
     dbms_output.put_line('Registro ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_USUARIOS (1,'Contrasena', 23);




-----Procedimiento para insertar clientes---------------

CREATE OR REPLACE PROCEDURE INSERTA_CLIENTES (P_Cedula IN CLIENTES.Cedula%TYPE, 
                                              P_Nombre IN CLIENTES.Nombre_Completo%TYPE, 
                                              P_Direccion IN CLIENTES.Direccion_Exacta%TYPE, 
                                              P_Correo IN CLIENTES.Correo_Electronico%TYPE,
                                              P_Num_Membresia IN CLIENTES.Num_Membresia%TYPE)
IS
    BEGIN
     INSERT INTO CLIENTES VALUES (P_Cedula, P_Nombre, P_Direccion, P_Correo, P_Num_Membresia);
     dbms_output.put_line('Registro ingresado con exito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_CLIENTES (21,'Juan','Heredia','jhn@gmail.com',2);


------Procedimiento para insertar roles------------

CREATE OR REPLACE PROCEDURE INSERTA_ROLES (P_ID_Rol IN Rol.ID_Rol%TYPE, 
                                           P_Descripcion IN Rol.Descripcion%TYPE)
IS
    BEGIN
     INSERT INTO Rol VALUES (P_ID_Rol, P_Descripcion);
     dbms_output.put_line('Rol ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_ROLES (1,'Administrador');




------Procedimiento para insertar usuarios------------

CREATE OR REPLACE PROCEDURE INSERTA_USUARIO (P_Codigo IN Usuario.Codigo_Usuario%TYPE, 
                                             P_Usuario IN Usuario.Usuario%TYPE, 
                                             P_Contrasena IN Usuario.Contrasena%TYPE)
IS
    BEGIN
     INSERT INTO Usuario VALUES (P_Codigo, P_Usuario, P_Contrasena);
     dbms_output.put_line('Usuario ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_USUARIO (1,'Andres', 23);




-----Procedimiento para insertar direcciones---------------


CREATE OR REPLACE PROCEDURE INSERTA_DIRECCIONES (P_Direccion_ID IN Direccion.Direccion_id%TYPE, 
                                                 P_Provincia IN Direccion.Provincia%TYPE,
						 P_Canton IN Direccion.Canton%TYPE,
						 P_Distrito IN Direccion.Distrito%TYPE,
						 P_Otros IN Direccion.otros%TYPE)
IS
    BEGIN
     INSERT INTO Direccion VALUES (P_Direccion_ID, P_Provincia, P_Canton, P_Distrito, P_Otros);
     dbms_output.put_line('Dirección ingresada con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_USUARIOS (1,'San Jose', 'Desamparados', 'San Miguel', 'Casa a mano derecha');




-----Procedimiento para insertar rutinas---------------


CREATE OR REPLACE PROCEDURE INSERTA_RUTINA (P_ID_Rutina IN Rutinas.ID_Rutina%TYPE, 
                                            P_Descripcion IN Rutinas.Descripcion%TYPE,
				            P_Tipo IN Rutinas.Tipo%TYPE)
IS
    BEGIN
     INSERT INTO Rutinas VALUES (P_ID_Rutina, P_Descripcion, P_Tipo);
     dbms_output.put_line('Rutina ingresada con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_RUTINA (1,'Funcional', 'Brazos');




-----Procedimiento para insertar salarios---------------


CREATE OR REPLACE PROCEDURE INSERTA_SALARIO (P_ID_Salario IN Salarios.ID_Salario%TYPE, 
                                            P_Descripcion IN Salarios.Descripcion%TYPE,
				            P_Monto IN Salarios.Monto%TYPE)
IS
    BEGIN
     INSERT INTO Salarios VALUES (P_ID_Salario, P_Descripcion, P_Monto);
     dbms_output.put_line('Salario ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_SALARIO (1,'Técnico',20);




-----Procedimiento para insertar membresias---------------


CREATE OR REPLACE PROCEDURE INSERTA_MEMBRESIA (P_Num_membresia IN Membresias.Num_membresia%TYPE,
					       P_Descripcion IN Membresias.Descripcion%TYPE,
                                               P_Costo IN Membresias.Costo%TYPE)
IS
    BEGIN
     INSERT INTO Membresias VALUES (P_Num_membresia, P_Descripcion, P_Costo);
     dbms_output.put_line('Membresia ingresada con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_MEMBRESIA (11,'Premium',17);




-----Procedimiento para insertar clientes---------------

CREATE OR REPLACE PROCEDURE INSERTA_CLIENTES (P_Cedula IN Clientes.Cedula%TYPE, 
                                              P_Nombre IN Clientes.Nombre%TYPE,
					      P_Apellido1 IN Clientes.Primer_apellido%TYPE, 
					      p_Apellido2 IN Clientes.Segundo_apellido%TYPE,  
					      P_Codigo IN Clientes.Codigo_Usuario%TYPE,
					      P_Num_Membresia IN Clientes.Num_Membresia%TYPE,
					      P_ID_Rutina IN Clientes.ID_Rutina%TYPE,
                                              P_Direccion IN Clientes.Direccion_ID%TYPE, 
                                              P_Correo IN Clientes.Correo_Electronico%TYPE,
                                              P_ID_Rol IN Clientes.ID_Rol%TYPE)
IS
    BEGIN
     INSERT INTO Clientes VALUES (P_Cedula, P_Nombre, P_Apellido1, P_Apellido2, P_Codigo, P_Num_Membresia, 
				  P_ID_Rutina, P_Direccion, P_Correo, P_Num_Rol);
     dbms_output.put_line('Cliente ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_CLIENTES (2134,'Juan','Perez','Diaz', 51 , 60, 45, 'Heredia','jhn@gmail.com', 2);





-----Procedimiento para insertar entrenadores---------------


CREATE OR REPLACE PROCEDURE INSERTA_ENTRENADORES (P_Cedula IN Entrenadores.Cedula%TYPE,
						  P_Nombre IN Entrenadores.Nombre%TYPE,
						  P_Apellido1 IN Entrenadores.Primer_apellido%TYPE,
						  P_Apellido2 IN Entrenadores.Segundo_apellido%TYPE,
						  P_Codigo_Usuario IN Entrenadores.Codigo_Usuario%TYPE,
						  P_ID_Salario IN Entrenadores.ID_Salario%TYPE,
						  P_Direccion IN Entrenadores.Direccion_id%TYPE,
						  P_Correo IN Entrenadores.Correo_Electronico%TYPE,
						  P_ID_Rol IN Entrenadores.ID_Rol%TYPE)
IS
    BEGIN
     INSERT INTO Entrenadores VALUES (P_Cedula, P_Nombre, P_Apellido1, P_Apellido2, P_Codigo_Usuario, 
				      P_ID_Salario, P_Direccion, P_Correo, P_ID_Rol);
     dbms_output.put_line('Entrenador ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_ENTRENADORES (54258,'Carlos','Salas', 'Brenes', 24, 68, 'Santa Ana', 'Csju@gmail.com', 30);





-----Procedimiento para insertar Administradores---------------


CREATE OR REPLACE PROCEDURE INSERTA_ADMINISTRADORES (P_Cedula IN Administradores.Cedula%TYPE,
  						     P_Nombre IN Administradores.Nombre%TYPE,
  						     P_Apellido1 IN Administradores.Primer_apellido%TYPE,
  						     P_Apellido2 IN Administradores.Segundo_apellido%TYPE,
  						     P_Codigo_Usuario IN Administradores.Codigo_Usuario%TYPE,
  						     P_ID_Salario IN Administradores.ID_Salario%TYPE,
  						     P_Direccion IN Administradores.Direccion_id%TYPE,
  						     P_Correo IN Administradores.Correo_Electronico%TYPE,
  						     P_ID_Rol IN Administradores.ID_Rol%TYPE)
IS
    BEGIN
     INSERT INTO Administradores VALUES (P_Cedula, P_Nombre, P_Apellido1, P_Apellido2, P_Codigo_Usuario, 
				      P_ID_Salario, P_Direccion, P_Correo, P_ID_Rol);
     dbms_output.put_line('Administrador ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_ADMINISTRADORES (8457,'Ana','Camacho', 'Arguedas', 62, 08, 'San Rafael', 'ACa@gmail.com', 55);




------Procedimiento para insertar facturacion ------------

CREATE OR REPLACE PROCEDURE INSERTA_FACTURACION (P_Num IN Facturación.Num_factura%TYPE, 
                                                 P_Fecha IN  Facturación.Fecha_factura%TYPE, 
                                                 P_Antes_IVA IN Facturación.Total_antes_IVA%TYPE,
						 P_Costo_IV IN Facturación.Costo_IV%TYPE,
					         P_Total IN Facturación.Total_factura%TYPE)
IS
    BEGIN
     INSERT INTO Facturacion VALUES (P_Num , P_Fecha, P_Antes_IVA, P_Costo_IV, P_Total);
     dbms_output.put_line('Factura ingresada con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_FACTURACION (42, 25, 100, 32, 1500);




------Procedimiento para insertar máquinas------------

CREATE OR REPLACE PROCEDURE INSERTA_MAQUINAS (P_ID IN Maquinas.ID_Maquina%TYPE,
					      P_Descripcion IN Maquinas.ID_Descripcion%TYPE,
					      P_Tipo IN Maquinas.Tipo_Maquina%TYPE)
IS
    BEGIN
     INSERT INTO Maquinas VALUES (P_ID, P_Descripcion, P_Tipo);
     dbms_output.put_line('Maquina ingresada con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_MAQUINAS (12,'Banco Scott', 'Biceps');




------Procedimiento para insertar pagos------------

CREATE OR REPLACE PROCEDURE INSERTA_PAGOS (P_ID IN pagos.ID_Pago%TYPE,
					   P_Descripcion IN pagos.Descripcion%TYPE,
					   P_Tipo_Trans IN pagos.tipo_Transaccion%TYPE)
IS
    BEGIN
     INSERT INTO Pagos VALUES (P_ID, P_Descripcion, P_Tipo_Trans);
     dbms_output.put_line('Pago realizado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_PAGOS (10,'Mensualidad', 'Tarjeta');


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--      Actualizar Steven
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

create procedure actualizar_rol
@xID_Rol NUMBER(4) ,
@xDescripcion VARCHAR2(40)
AS
BEGIN
UPDATE Rol
SET
Descripcion=@xDescripcion
WHERE
 ID_Rol =@xID_Rol
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure actualizar_Usuario
@xCodigo_Usuario NUMBER(4) ,
@xUsuario VARCHAR2(30),
 @xContrasena NUMBER(30)
AS
BEGIN
UPDATE Usuario
SET
 Usuario=@xUsuario,
Contrasena=@xContrasena,
WHERE
Codigo_Usuario =@xCodigo_Usuario 
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure actualizar_ Rutinas
@xID_Rutina NUMBER(10)  ,
@xDescripcion VARCHAR2(40),
 @xTipo VARCHAR2(40)
AS
BEGIN
UPDATE  Rutinas
SET
Descripcion =@xDescripcion ,
Tipo=@xTipo,
WHERE
ID_Rutina  =@xID_Rutina 
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure actualizar_ Salarios 
@xID_Salario NUMBER(10)   ,
@xDescripcion VARCHAR2(40),
@x Monto NUMBER(10)
AS
BEGIN
UPDATE  Salarios 
SET
Descripcion =@xDescripcion ,
Monto  =@xMonto  ,
WHERE
ID_Salario  =@xID_Salario 
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure actualizar_Membresías
@xNum_membresia NUMBER(10) ,
@xDescripcion VARCHAR2(40),
@xCosto NUMBER(10)
AS
BEGIN
UPDATE Membresías
SET
Descripcion =@xDescripcion ,
Costo   =@x Costo ,
WHERE
Num_membresia  =@xNum_membresia
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure actualizar_Administradores 
@xCedula   NUMBER(30),
@x Nombre VARCHAR2(30),
@xPrimer_apellido VARCHAR2(30),
@xSegundo_apellido VARCHAR2(30),
@x  Codigo_Usuario NUMBER(4),
@xID_Salario NUMBER(10),
@xCorreo_Electronico VARCHAR2(30),
@xID_Rol NUMBER(4)
AS
BEGIN
UPDATE Administradores 
SET
Cedula =@xCedula  ,
Nombre  =@xNombre   ,
Primer_apellido=@xPrimer_apellido,
Segundo_apellido=@xSegundo_apellido,
 Codigo_Usuario= @x Codigo_Usuario,
  ID_Salario= @x  ID_Salario,
Correo_Electronico=@x Correo_Electronico,
 ID_Rol =@x ID_Rol
WHERE
Cedula  =@xCedula
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure actualizar_Clientes 
@xCedula   NUMBER(30),
@x Nombre VARCHAR2(30),
@xPrimer_apellido VARCHAR2(30),
@xSegundo_apellido VARCHAR2(30),
@x  Codigo_Usuario NUMBER(4),
@x  Num_membresia NUMBER(10),
@x  ID_Rutina NUMBER(10),
@x  Correo_Electronico VARCHAR2(30),
@x  ID_Rol NUMBER(4)
AS
BEGIN
UPDATE Clientes
SET
Cedula =@xCedula  ,
Nombre  =@xNombre   ,
Primer_apellido=@xPrimer_apellido,
Segundo_apellido=@xSegundo_apellido,
Codigo_Usuario= @x Codigo_Usuario,
Num_membresia =@xNum_membresia,
 D_Rutina=@x ID_Rutina,
 Correo_Electronico=@x Correo_Electronico,
 ID_Rol =@x ID_Rol
WHERE
Cedula  =@xCedula
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure actualizar_Entrenadores 
@x  Cedula   NUMBER(30),
@x Nombre VARCHAR2(30),
@xPrimer_apellido VARCHAR2(30),
@xSegundo_apellido VARCHAR2(30),
@xCodigo_Usuario NUMBER(4),
@xID_Salario NUMBER(10),
@xCorreo_Electronico VARCHAR2(30),
@xID_Rol NUMBER(4)
AS
BEGIN
UPDATE Entrenadores 
SET
Cedula =@xCedula  ,
Nombre  =@xNombre   ,
Primer_apellido=@xPrimer_apellido,
Segundo_apellido=@xSegundo_apellido,
 Codigo_Usuario= @x Codigo_Usuario,
  ID_Salario= @x  ID_Salario,
Correo_Electronico=@x Correo_Electronico,
 ID_Rol =@x ID_Rol
WHERE
Cedula  =@xCedula
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure actualizar_Facturación 
@xNum_factura NUMBER(10) ,
@x Fecha_factura NUMBER(10),
@xTotal_antes_IVA NUMBER(10),
@xCosto_IV NUMBER(10),
@xTotal_factura NUMBER(10)
AS
BEGIN
UPDATE Facturación 
SET
Fecha_factura =@xFecha_factura ,
Total_antes_IVA   =@x Total_antes_IVA  ,
Costo_IV    =@xCosto_IV   ,
Total_factura  =@xTotal_factura
WHERE
Num_factura  =@xNum_factura
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure actualizar_Maquinas 
@xID_Maquina NUMBER(10)  ,
@xDescripcion VARCHAR2(40),
@xTipo_maquina VARCHAR2(40)
AS
BEGIN
UPDATE Maquinas 
SET
Descripcion =@xDescripcion ,
Tipo_maquina  =@xTipo_maquina  
WHERE
ID_Maquina  =@xID_Maquina
END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure actualizar_ pagos
@xID_Pago NUMBER(10),
@x Descripcion VARCHAR2(40),
@xTipo_Transacion VARCHAR2(40)
AS
BEGIN
UPDATE  pagos
SET
Descripcion =@xDescripcion ,
Tipo_Transacion  =@xTipo_Transacion 
WHERE
ID_Pago   =@xID_Pago 
END






------------------------------------------------------------------------------------------------------------------------
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DELETE PROCEDURES --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
------------------------------------------------------------------------------------------------------------------------



-----------------Borrar roles---------------


CREATE OR REPLACE PROCEDURE BORRA_ROLES (B_ID_ROL IN Rol.ID_Rol%TYPE)
IS 
BEGIN
    DELETE FROM ROL WHERE ID_Rol = B_ID_ROL;
END;


EXECUTE BORRA_ROLES (1);


-----------------Borrar usuarios---------------


CREATE OR REPLACE PROCEDURE BORRA_USUARIO (B_ID_USUARIO IN Usuario.Codigo_Usuario%TYPE)
IS 
BEGIN
    DELETE FROM Usuario WHERE Codigo_Usuario = B_ID_USUARIO;
END;

EXECUTE BORRA_USUARIO (2);



-----------------Borrar direcciones---------------


CREATE OR REPLACE PROCEDURE BORRA_DIRECCION (B_ID_DIRECCION IN Direccion.Direccion_id%TYPE)
IS 
BEGIN
    DELETE FROM Direccion WHERE Direccion_id = B_ID_DIRECCION;
END;

EXECUTE BORRA_DIRECCION (3);



-----------------Borrar rutinas---------------


CREATE OR REPLACE PROCEDURE BORRA_RUTINAS (B_ID_RUTINA IN Rutinas.ID_Rutina%TYPE)
IS 
BEGIN
    DELETE FROM Rutinas WHERE ID_Rutina = B_ID_RUTINA;
END;

EXECUTE BORRA_RUTINAS (4);



-----------------Borrar salarios---------------


CREATE OR REPLACE PROCEDURE BORRA_SALARIOS (B_ID_SALARIO IN Salarios.ID_Salario%TYPE)
IS 
BEGIN
    DELETE FROM Salarios WHERE ID_Salario = B_ID_SALARIO;
END;

EXECUTE BORRA_SALARIOS (2);



-----------------Borrar membresia---------------


CREATE OR REPLACE PROCEDURE BORRA_MEMBRESIA (B_ID_MEMBRESIA IN Membresias.Num_membresia%TYPE)
IS 
BEGIN
    DELETE FROM Membresias WHERE Num_membresia = B_ID_MEMBRESIA;
END;

EXECUTE BORRA_MEMBRESIA (2);



-----------------Borrar cliente---------------


CREATE OR REPLACE PROCEDURE BORRA_CLIENTE (B_ID_CLIENTE IN Clientes.Cedula%TYPE)
IS 
BEGIN
    DELETE FROM Clientes WHERE Cedula = B_ID_CLIENTE;
END;

EXECUTE BORRA_CLIENTE(2);


-----------------Borrar entrenadores---------------


CREATE OR REPLACE PROCEDURE BORRA_ENTRENADORES (B_ID_ENTRENADOR IN Entrenadores.Cedula%TYPE)
IS 
BEGIN
    DELETE FROM Entrenadores WHERE Cedula = B_ID_ENTRENADOR;
END;

EXECUTE BORRA_ENTRENADORES (2);



-----------------Borrar administradores---------------


CREATE OR REPLACE PROCEDURE BORRA_ADMINISTRADORES (B_ID_ADMINISTRADOR IN Administradores.Cedula%TYPE)
IS 
BEGIN
    DELETE FROM Administradores WHERE Cedula = B_ID_ADMINISTRADOR;
END;

EXECUTE BORRA_ADMINISTRADORES (1);



-----------------Borrar facturacion--------------- 


CREATE OR REPLACE PROCEDURE BORRA_FACTURA (B_ID_FACTURA IN Facturacion.Num_factura%TYPE)
IS 
BEGIN
    DELETE FROM Facturacion WHERE Num_factura = B_ID_FACTURA;
END;

EXECUTE BORRA_FACTURA (1);



-----------------Borrar máquinas---------------


CREATE OR REPLACE PROCEDURE BORRA_MAQUINA (B_ID_MAQUINA IN Maquinas.ID_Maquina%TYPE)
IS 
BEGIN
    DELETE FROM Maquinas WHERE ID_Maquina = B_ID_MAQUINA;
END;

EXECUTE BORRA_MAQUINA (1);


-----------------Borrar pagos---------------


CREATE OR REPLACE PROCEDURE BORRA_PAGOS (B_ID_PAGOS IN pagos.ID_Pago%TYPE)
IS 
BEGIN
    DELETE FROM pagos WHERE ID_Pago = B_ID_PAGOS;
END;

EXECUTE BORRA_PAGOS (1);



------------------------------------------------------------------------------------------------------------------------

---------------------------------------- INSERT PROCEDURES ----------------------------------------

------------------------------------------------------------------------------------------------------------------------


------Procedimiento para insertar roles------------

CREATE OR REPLACE PROCEDURE INSERTA_ROLES (P_ID_Rol IN Rol.ID_Rol%TYPE, 
                                           P_Descripcion IN Rol.Descripcion%TYPE)
IS
    BEGIN
     INSERT INTO Rol VALUES (P_ID_Rol, P_Descripcion);
     dbms_output.put_line('Rol ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_ROLES (1,'Administrador');




------Procedimiento para insertar usuarios------------

CREATE OR REPLACE PROCEDURE INSERTA_USUARIO (P_Codigo IN Usuario.Codigo_Usuario%TYPE, 
                                             P_Usuario IN Usuario.Usuario%TYPE, 
                                             P_Contrasena IN Usuario.Contrasena%TYPE)
IS
    BEGIN
     INSERT INTO Usuario VALUES (P_Codigo, P_Usuario, P_Contrasena);
     dbms_output.put_line('Usuario ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_USUARIO (1,'Andres', 23);




-----Procedimiento para insertar direcciones---------------


CREATE OR REPLACE PROCEDURE INSERTA_DIRECCIONES (P_Direccion_ID IN Direccion.Direccion_id%TYPE, 
                                                 P_Provincia IN Direccion.Provincia%TYPE,
						 P_Canton IN Direccion.Canton%TYPE,
						 P_Distrito IN Direccion.Distrito%TYPE,
						 P_Otros IN Direccion.otros%TYPE)
IS
    BEGIN
     INSERT INTO Direccion VALUES (P_Direccion_ID, P_Provincia, P_Canton, P_Distrito, P_Otros);
     dbms_output.put_line('Dirección ingresada con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_DIRECCIONES (1,'San Jose', 'Desamparados', 'San Miguel', 'Casa a mano derecha');




-----Procedimiento para insertar rutinas---------------


CREATE OR REPLACE PROCEDURE INSERTA_RUTINA (P_ID_Rutina IN Rutinas.ID_Rutina%TYPE, 
                                            P_Descripcion IN Rutinas.Descripcion%TYPE,
				            P_Tipo IN Rutinas.Tipo%TYPE)
IS
    BEGIN
     INSERT INTO Rutinas VALUES (P_ID_Rutina, P_Descripcion, P_Tipo);
     dbms_output.put_line('Rutina ingresada con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_RUTINA (1,'Funcional', 'Brazos');




-----Procedimiento para insertar salarios---------------


CREATE OR REPLACE PROCEDURE INSERTA_SALARIO (P_ID_Salario IN Salarios.ID_Salario%TYPE, 
                                            P_Descripcion IN Salarios.Descripcion%TYPE,
				            P_Monto IN Salarios.Monto%TYPE)
IS
    BEGIN
     INSERT INTO Salarios VALUES (P_ID_Salario, P_Descripcion, P_Monto);
     dbms_output.put_line('Salario ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_SALARIO (1,'Técnico',20);




-----Procedimiento para insertar membresias---------------


CREATE OR REPLACE PROCEDURE INSERTA_MEMBRESIA (P_Num_membresia IN Membresias.Num_membresia%TYPE,
					       P_Descripcion IN Membresias.Descripcion%TYPE,
                                               P_Costo IN Membresias.Costo%TYPE)
IS
    BEGIN
     INSERT INTO Membresias VALUES (P_Num_membresia, P_Descripcion, P_Costo);
     dbms_output.put_line('Membresia ingresada con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_MEMBRESIA (11,'Premium',17);




-----Procedimiento para insertar clientes---------------

CREATE OR REPLACE PROCEDURE INSERTA_CLIENTES (P_Cedula IN Clientes.Cedula%TYPE, 
                                              P_Nombre IN Clientes.Nombre%TYPE,
					      P_Apellido1 IN Clientes.Primer_apellido%TYPE, 
					      p_Apellido2 IN Clientes.Segundo_apellido%TYPE,  
					      P_Codigo IN Clientes.Codigo_Usuario%TYPE,
					      P_Num_Membresia IN Clientes.Num_Membresia%TYPE,
					      P_ID_Rutina IN Clientes.ID_Rutina%TYPE,
                                              P_Direccion IN Clientes.Direccion_ID%TYPE, 
                                              P_Correo IN Clientes.Correo_Electronico%TYPE,
                                              P_ID_Rol IN Clientes.ID_Rol%TYPE)
IS
    BEGIN
     INSERT INTO Clientes VALUES (P_Cedula, P_Nombre, P_Apellido1, P_Apellido2, P_Codigo, P_Num_Membresia, 
				  P_ID_Rutina, P_Direccion, P_Correo, P_Num_Rol);
     dbms_output.put_line('Cliente ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_CLIENTES (2134,'Juan','Perez','Diaz', 51 , 60, 45, 'Heredia','jhn@gmail.com', 2);





-----Procedimiento para insertar entrenadores---------------


CREATE OR REPLACE PROCEDURE INSERTA_ENTRENADORES (P_Cedula IN Entrenadores.Cedula%TYPE,
						  P_Nombre IN Entrenadores.Nombre%TYPE,
						  P_Apellido1 IN Entrenadores.Primer_apellido%TYPE,
						  P_Apellido2 IN Entrenadores.Segundo_apellido%TYPE,
						  P_Codigo_Usuario IN Entrenadores.Codigo_Usuario%TYPE,
						  P_ID_Salario IN Entrenadores.ID_Salario%TYPE,
						  P_Direccion IN Entrenadores.Direccion_id%TYPE,
						  P_Correo IN Entrenadores.Correo_Electronico%TYPE,
						  P_ID_Rol IN Entrenadores.ID_Rol%TYPE)
IS
    BEGIN
     INSERT INTO Entrenadores VALUES (P_Cedula, P_Nombre, P_Apellido1, P_Apellido2, P_Codigo_Usuario, 
				      P_ID_Salario, P_Direccion, P_Correo, P_ID_Rol);
     dbms_output.put_line('Entrenador ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_ENTRENADORES (54258,'Carlos','Salas', 'Brenes', 24, 68, 'Santa Ana', 'Csju@gmail.com', 30);





-----Procedimiento para insertar Administradores---------------


CREATE OR REPLACE PROCEDURE INSERTA_ADMINISTRADORES (P_Cedula IN Administradores.Cedula%TYPE,
  						     P_Nombre IN Administradores.Nombre%TYPE,
  						     P_Apellido1 IN Administradores.Primer_apellido%TYPE,
  						     P_Apellido2 IN Administradores.Segundo_apellido%TYPE,
  						     P_Codigo_Usuario IN Administradores.Codigo_Usuario%TYPE,
  						     P_ID_Salario IN Administradores.ID_Salario%TYPE,
  						     P_Direccion IN Administradores.Direccion_id%TYPE,
  						     P_Correo IN Administradores.Correo_Electronico%TYPE,
  						     P_ID_Rol IN Administradores.ID_Rol%TYPE)
IS
    BEGIN
     INSERT INTO Administradores VALUES (P_Cedula, P_Nombre, P_Apellido1, P_Apellido2, P_Codigo_Usuario, 
				      P_ID_Salario, P_Direccion, P_Correo, P_ID_Rol);
     dbms_output.put_line('Administrador ingresado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_ADMINISTRADORES (8457,'Ana','Camacho', 'Arguedas', 62, 08, 'San Rafael', 'ACa@gmail.com', 55);




------Procedimiento para insertar facturacion ------------

CREATE OR REPLACE PROCEDURE INSERTA_FACTURACION (P_Num IN Facturación.Num_factura%TYPE, 
                                                 P_Fecha IN  Facturación.Fecha_factura%TYPE, 
                                                 P_Antes_IVA IN Facturación.Total_antes_IVA%TYPE,
						 P_Costo_IV IN Facturación.Costo_IV%TYPE,
					         P_Total IN Facturación.Total_factura%TYPE)
IS
    BEGIN
     INSERT INTO Facturacion VALUES (P_Num , P_Fecha, P_Antes_IVA, P_Costo_IV, P_Total);
     dbms_output.put_line('Factura ingresada con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_FACTURACION (42, 25, 100, 32, 1500);




------Procedimiento para insertar máquinas------------

CREATE OR REPLACE PROCEDURE INSERTA_MAQUINAS (P_ID IN Maquinas.ID_Maquina%TYPE,
					      P_Descripcion IN Maquinas.ID_Descripcion%TYPE,
					      P_Tipo IN Maquinas.Tipo_Maquina%TYPE)
IS
    BEGIN
     INSERT INTO Maquinas VALUES (P_ID, P_Descripcion, P_Tipo);
     dbms_output.put_line('Maquina ingresada con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_MAQUINAS (12,'Banco Scott', 'Biceps');




------Procedimiento para insertar pagos------------

CREATE OR REPLACE PROCEDURE INSERTA_PAGOS (P_ID IN pagos.ID_Pago%TYPE,
					   P_Descripcion IN pagos.Descripcion%TYPE,
					   P_Tipo_Trans IN pagos.tipo_Transaccion%TYPE)
IS
    BEGIN
     INSERT INTO Pagos VALUES (P_ID, P_Descripcion, P_Tipo_Trans);
     dbms_output.put_line('Pago realizado con éxito');
    EXCEPTION
        WHEN OTHERS THEN
    dbms_output.put_line('Se presentó un error');
END;

EXECUTE INSERTA_PAGOS (10,'Mensualidad', 'Tarjeta');

