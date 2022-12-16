
/* Módulo de Roles */

DROP TABLE Roles CASCADE CONSTRAINTS;
CREATE TABLE Roles (
  ID_Rol   NUMBER(4) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  PRIMARY KEY (ID_Rol)
);

INSERT INTO Roles ( Descripcion) VALUES ('Cliente');
INSERT INTO Roles ( Descripcion) VALUES ('Entrenador');
INSERT INTO Roles (Descripcion) VALUES ('Administrador');



/* Módulo de Usuarios */
DROP TABLE Usuarios CASCADE CONSTRAINTS;
CREATE TABLE Usuarios (
  Codigo_Usuario NUMBER(4) GENERATED ALWAYS AS IDENTITY,
  Usuario VARCHAR2(30),
  Contrasena VARCHAR2(30),
     ID_Rol NUMBER(4),
  FOREIGN KEY (ID_Rol) REFERENCES Roles(ID_Rol),
  PRIMARY KEY (Codigo_Usuario)
);

INSERT INTO Usuarios (Usuario, Contrasena,ID_Rol ) VALUES (123,1,1);
INSERT INTO Usuarios(Usuario, Contrasena,ID_Rol ) VALUES (1234,2,2);
INSERT INTO Usuarios (Usuario, Contrasena,ID_Rol ) VALUES (12345,3,3);




/* Módulo de Rutinas */
DROP TABLE Rutinas CASCADE CONSTRAINTS;
CREATE TABLE Rutinas (
  ID_Rutina NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  Tipo VARCHAR2(40),
  PRIMARY KEY (ID_Rutina)
);

INSERT INTO Rutinas ( Descripcion,Tipo) VALUES ( 'Pecho', '4 Series');
INSERT INTO Rutinas ( Descripcion,Tipo) VALUES ('Pecho', '8 Series');
INSERT INTO Rutinas ( Descripcion,Tipo) VALUES ('Hombros', '6 Series');
INSERT INTO Rutinas ( Descripcion,Tipo) VALUES ( 'Piernas', '4 Series');
INSERT INTO Rutinas ( Descripcion,Tipo) VALUES ('Brazo', '3 Series');
INSERT INTO Rutinas ( Descripcion,Tipo) VALUES ( 'Pecho', '4 Series');
INSERT INTO Rutinas (Descripcion,Tipo) VALUES ('piernas', '8 Series');
INSERT INTO Rutinas ( Descripcion,Tipo) VALUES ('triceps', '10 Series');
INSERT INTO Rutinas ( Descripcion,Tipo) VALUES ('espalda', '4 Series');
INSERT INTO Rutinas (Descripcion,Tipo) VALUES ( 'Brazo', '3 Series');

/* Módulo de Salarios */
DROP TABLE Salarios CASCADE CONSTRAINTS;
CREATE TABLE Salarios (
  ID_Salario NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  Monto NUMBER(10),
  PRIMARY KEY (ID_Salario)
);

INSERT INTO Salarios (Descripcion,Monto) VALUES ( 'quicena',54634);
INSERT INTO Salarios (Descripcion,Monto) VALUES ('quicena',3123785);
INSERT INTO Salarios (Descripcion,Monto) VALUES ('quicena',5465634);
INSERT INTO Salarios (Descripcion,Monto) VALUES ( 'quicena',546786);
INSERT INTO Salarios (Descripcion,Monto) VALUES ( 'quicena',76786787);
INSERT INTO Salarios (Descripcion,Monto) VALUES ('quicena',5345345);
INSERT INTO Salarios (Descripcion,Monto) VALUES ('quicena',4654546);
INSERT INTO Salarios (Descripcion,Monto) VALUES ('quicena',2343434);
INSERT INTO Salarios (Descripcion,Monto) VALUES ('quicena',82346);
INSERT INTO Salarios (Descripcion,Monto) VALUES ('quicena',876867);

/* Módulo de Membresias */
DROP TABLE Membresias CASCADE CONSTRAINTS;
CREATE TABLE Membresias (
  Num_membresia NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  Costo NUMBER(10),
  PRIMARY KEY (Num_membresia)
);

INSERT INTO Membresias (Descripcion, Costo) VALUES ('oro',300000);
INSERT INTO Membresias (Descripcion, Costo) VALUES ('bronce', 400000);
INSERT INTO Membresias (Descripcion, Costo) VALUES ('Platino', 500000);
/* Módulo de Clientes */


DROP TABLE Clientes CASCADE CONSTRAINTS;
CREATE TABLE Clientes (
  Cedula   NUMBER(30) PRIMARY KEY NOT NULL,
  Nombre VARCHAR2(30),
  Primer_apellido VARCHAR2(30),
  Segundo_apellido VARCHAR2(30),
  Num_membresia NUMBER(10),
  Direccion_exacta VARCHAR2(100),
  Correo_Electronico VARCHAR2(30),

  FOREIGN KEY (Num_membresia) REFERENCES Membresias(Num_membresia)
);



INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (118260550, 'Steven','Vargas','Valverde',1,'Heredia 50 sur parque','Vargas548@gmail.com');
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (167867867, 'Carlos','Rodriguez','Castro',2,'San Jose 50 sur parque','marcus.daugherty64@hotmail.com');
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (135434344, 'Ramon','Sanchez','Gutierrez',3,'Alajuela 50 sur parque','margarete4@hotmail.com');
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (133983988, 'Maria','Villalobos','Hernandez',1,'Cartago 50 sur parque','sarai.gleichner@yahoo.com');
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (178377550, 'Julio','Muñoz','Cascante',2,'Limon 50 sur parque','piper38@gmail.com');
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (117838750, 'Regina ','Moya','Valverde',3,'Guanacaste 50 sur parque','daija_klein88@hotmail.com');
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (112310550, 'Águeda ','Morcillo ','Fortuny',1,'San Jose 50 sur parque','oma.white65@yahoo.com');
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (118267887, 'Javiera ','Miranda','Fortuny',2,'Heredia 50 sur parque','sydnee.bogan@hotmail.com');
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (196685747, 'Ignacia ','Hidalgo','Cepeda ',3,'San Jose 50 sur parque','breanne13@hotmail.com');
INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (177872722, 'Caridad ','Sánchez ','Casal',3,'San Jose 50 sur parque','miracle25@yahoo.com');



/* Módulo de Entrenadores */

DROP TABLE Entrenadores CASCADE CONSTRAINTS;
CREATE TABLE Entrenadores (
  Cedula   NUMBER(30) PRIMARY KEY NOT NULL,
  Nombre VARCHAR2(30),
  Primer_apellido VARCHAR2(30),
  Segundo_apellido VARCHAR2(30),
  ID_Salario NUMBER(10),
  Direccion_exacta VARCHAR2(100),
  Correo_Electronico VARCHAR2(30),

  FOREIGN KEY (ID_Salario) REFERENCES Salarios(ID_Salario)
);

INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (187966783, 'Julio ','Enríquez ','Calleja',1,'San Jose 50 sur parque','kiara63@yahoo.com');
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (134647865, 'Jose ','Canet ','Fortuny ',2,'San Jose 50 sur parque','justyn_shanahan32@hotmail.com');
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (189052246, 'Julio ','Ignacio ','Castro',3,'San Jose 50 sur parque','brock_schaden46@yahoo.com');
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (164578940, 'Moisés ','Pintor ','Paz',4,'San Jose 50 sur parque','hans.kuhic57@gmail.com');
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (146345650, 'Luis ','Taboada','Valverde',5,'San Jose 50 sur parque','harmony30@gmail.com');
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (119780870, 'Julio ','Morell ','Valverde',6,'San Jose 50 sur parque','donnell.beier@gmail.com');
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (118657550, 'Belén ','Vergara ','Garcés',7,'San Jose 50 sur parque','aditya.ward3@hotmail.com');
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (114564050, 'Ana ','Romero ','Valverde',8,'San Jose 50 sur parque','jan20@yahoo.com');
INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (117270550, 'Julio ','Perales ','Romero ',9,'San Jose 50 sur parque','cecilia.feil2@gmail.com');       

/* Módulo de Administradores */

DROP TABLE Administradores CASCADE CONSTRAINTS;
CREATE TABLE Administradores (
  Cedula NUMBER(30) PRIMARY KEY NOT NULL,
  Nombre VARCHAR2(30),
  Primer_apellido VARCHAR2(30),
  Segundo_apellido VARCHAR2(30),
  ID_Salario NUMBER(30),
  Direccion_exacta VARCHAR2(100),
  Correo_Electronico VARCHAR2(30),

  FOREIGN KEY (ID_Salario) REFERENCES Salarios(ID_Salario)
 
);
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (355456463, 'Juana ','Múñiz ','Coronado',1,'San Jose 50 sur parque','newton71@hotmail.com');
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (983835433, 'Yolanda ','Sevillano ','Fernández',2,'San Jose 50 sur parque','helene_spencer24@yahoo.com');
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (748435434, 'Steven','Alvarado ','Acedo',3,'San Jose 50 sur parque','dawson26@gmail.com');
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (737837834, 'Juana ','Pinto ','Balaguer',4,'San Jose 50 sur parque','sonia_krajcik5@gmail.com');
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (398787211, 'María ','Paz ','Guerrero',5,'San Jose 50 sur parque','abby30@yahoo.com');
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (127865777, 'Antonio ','Carreras ','Coronado',6,'San Jose 50 sur parque','general_lindgren4@yahoo.com');
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (374853448, 'Jordán ','Serra ','Barroso',7,'San Jose 50 sur parque','tracy_effertz82@gmail.com');
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (434348944, 'Pepe ','Herrera ','Pereira',8,'San Jose 50 sur parque','hershel10@hotmail.com');
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (187633778, 'Yolanda ','Ribera ','Giménez ',1,'San Jose 50 sur parque','johan.casper38@yahoo.com');
INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (187673789, 'Fernando ','Peral ','Núñez ',2,'San Jose 50 sur parque','nico36@hotmail.com');


/* Módulo de Facturación */
DROP TABLE Facturacion CASCADE CONSTRAINTS;
CREATE TABLE Facturacion (
  Num_factura NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Fecha_factura DATE,
  Total_antes_IVA NUMBER(10),
  Costo_IV NUMBER(10),
  Total_factura NUMBER(10),
  PRIMARY KEY (Num_factura)
);

INSERT INTO Facturacion ( Fecha_factura,Total_antes_IVA,Costo_IV,Total_factura) VALUES (SYSDATE,10000,13,11200);
INSERT INTO Facturacion ( Fecha_factura,Total_antes_IVA,Costo_IV,Total_factura) VALUES (SYSDATE,12000,13,11250);
INSERT INTO Facturacion ( Fecha_factura,Total_antes_IVA,Costo_IV,Total_factura) VALUES (SYSDATE,30000,13,32000);
INSERT INTO Facturacion ( Fecha_factura,Total_antes_IVA,Costo_IV,Total_factura) VALUES (SYSDATE,40000,13,41000);
INSERT INTO Facturacion ( Fecha_factura,Total_antes_IVA,Costo_IV,Total_factura) VALUES (SYSDATE,50000,13,51000);



/* Módulo de Maquinas */
DROP TABLE Maquinas CASCADE CONSTRAINTS;
CREATE TABLE Maquinas (
  ID_Maquina NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  Tipo_maquina VARCHAR2(40),
  PRIMARY KEY (ID_Maquina)
);



INSERT INTO Maquinas (Descripcion,Tipo_maquina) VALUES ('Maquina para Pecho', 'Pecho');
INSERT INTO Maquinas (Descripcion,Tipo_maquina) VALUES ('Maquina para brazo', 'Brazo');
INSERT INTO Maquinas (Descripcion,Tipo_maquina) VALUES ('Maquina para Hombros', 'Hombros');
INSERT INTO Maquinas (Descripcion,Tipo_maquina) VALUES ('Maquina para Piernas', 'Piernas');
INSERT INTO Maquinas (Descripcion,Tipo_maquina) VALUES ('Maquina para espalda', 'Espalda');



/* Módulo de  pagos */
DROP TABLE pagos CASCADE CONSTRAINTS;
CREATE TABLE  pagos (
  ID_Pago NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  Descripcion VARCHAR2(40),
  Tipo_Transacion VARCHAR2(40),
  PRIMARY KEY (ID_Pago)
);

INSERT INTO pagos (Descripcion,Tipo_Transacion) VALUES ('Tarjeta', 'targeta');
INSERT INTO pagos (Descripcion,Tipo_Transacion) VALUES ('Efectivo', 'efectivo');
INSERT INTO pagos (Descripcion,Tipo_Transacion) VALUES ('Simpe', 'simpe');



--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--      Procedimientos
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


------Procedimientos roles------------

CREATE OR REPLACE PROCEDURE INSERTA_ROLES (P_Descripcion IN Roles.Descripcion%TYPE)
IS
    BEGIN
     INSERT INTO Roles (Descripcion) VALUES (P_Descripcion);
END;


CREATE OR REPLACE PROCEDURE BORRA_ROLES (P_ID IN Roles.ID_ROL%TYPE)
    AS
    BEGIN
        DELETE FROM Roles WHERE ID_ROL= P_ID;
    END;




-----Procedimiento  rutinas---------------


CREATE OR REPLACE PROCEDURE INSERTA_RUTINAS (P_Descripcion IN Rutinas.Descripcion%TYPE,
				            P_Tipo IN Rutinas.Tipo%TYPE)
IS
    BEGIN
     INSERT INTO Rutinas (Descripcion,Tipo) VALUES (P_Descripcion,P_Tipo );
END;


CREATE OR REPLACE PROCEDURE BORRA_RUTINAS (P_ID_Rutina IN Rutinas.ID_Rutina%TYPE)
    AS
    BEGIN
        DELETE FROM Rutinas WHERE ID_Rutina= P_ID_Rutina;
    END;


-----Procedimientos Salarios---------------


CREATE OR REPLACE PROCEDURE INSERTA_SALARIOS (P_Descripcion IN Salarios.Descripcion%TYPE,
				            P_Monto IN Salarios.Monto%TYPE)
IS
    BEGIN
     INSERT INTO Salarios(Descripcion,Monto) VALUES (P_Descripcion,P_Monto);
END;


CREATE OR REPLACE PROCEDURE BORRA_SALARIOS (P_ID_Salario IN Salarios.ID_Salario%TYPE)
    AS
    BEGIN
        DELETE FROM Salarios WHERE ID_Salario= P_ID_Salario;
    END;






-----Procedimiento membresias---------------



CREATE OR REPLACE PROCEDURE INSERTA_MEMBRESIAS (P_Descripcion IN Membresias.Descripcion%TYPE,
                                               P_Costo IN Membresias.Costo%TYPE)
IS
    BEGIN
     INSERT INTO Membresias(Descripcion,Costo) VALUES (P_Descripcion,P_Costo);
END;


CREATE OR REPLACE PROCEDURE BORRA_MEMBRESIAS (P_Num_membresia IN Membresias.Num_membresia%TYPE)
    AS
    BEGIN
        DELETE FROM Membresias WHERE Num_membresia= P_Num_membresia;
    END;





------Procedimientos máquinas------------

CREATE OR REPLACE PROCEDURE INSERTA_MAQUINAS (P_Descripcion IN Maquinas.Descripcion%TYPE,
					      P_Tipo IN Maquinas.Tipo_Maquina%TYPE)
IS
    BEGIN
     INSERT INTO Maquinas (Descripcion,Tipo_Maquina) VALUES (P_Descripcion,P_Tipo );
END;


CREATE OR REPLACE PROCEDURE BORRA_MAQUINAS (P_ID IN Maquinas.ID_Maquina%TYPE)
    AS
    BEGIN
        DELETE FROM Maquinas WHERE ID_Maquina= P_ID;
    END;






------Procedimientos pagos------------

CREATE OR REPLACE PROCEDURE INSERTA_PAGOS (P_Descripcion IN Pagos.Descripcion%TYPE,
					   P_Tipo_Trans IN Pagos.Tipo_Transacion%TYPE)
IS
    BEGIN
     INSERT INTO Pagos (Descripcion,Tipo_Transacion) VALUES (P_Descripcion,P_Tipo_Trans);
END;


CREATE OR REPLACE PROCEDURE BORRA_PAGOS (P_ID IN pagos.ID_Pago%TYPE)
    AS
    BEGIN
        DELETE FROM Pagos WHERE ID_Pago= P_ID;
    END;




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


-----------------Borrar usuarios---------------


CREATE OR REPLACE PROCEDURE BORRA_USUARIO (B_ID_USUARIO IN Usuario.Codigo_Usuario%TYPE)
IS 
BEGIN
    DELETE FROM Usuario WHERE Codigo_Usuario = B_ID_USUARIO;
END;

EXECUTE BORRA_USUARIO (2);



-----------------Borrar facturacion--------------- 


CREATE OR REPLACE PROCEDURE BORRA_FACTURA (B_ID_FACTURA IN Facturacion.Num_factura%TYPE)
IS 
BEGIN
    DELETE FROM Facturacion WHERE Num_factura = B_ID_FACTURA;
END;

EXECUTE BORRA_FACTURA (1);





------Triggers---------------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE TRIGGER TRG_USUARIOXCLIENTE
    AFTER INSERT ON Clientes
    FOR EACH ROW
DECLARE

BEGIN
    
    INSERT INTO Usuarios(Usuario, Contrasena,ID_Rol) VALUES(:new.Correo_Electronico,DBMS_RANDOM.string('x',10),1);

END;    






CREATE OR REPLACE TRIGGER TRG_USUARIOXENTRENADOR
    AFTER INSERT ON Entrenadores
    FOR EACH ROW
DECLARE

BEGIN
    
    INSERT INTO Usuarios(Usuario, Contrasena,ID_Rol) VALUES(:new.Correo_Electronico,DBMS_RANDOM.string('x',10),2);

END;  







CREATE OR REPLACE TRIGGER TRG_USUARIOXADMINISTRADOR
    AFTER INSERT ON Administradores
    FOR EACH ROW
DECLARE

BEGIN
    
    INSERT INTO Usuarios(Usuario, Contrasena,ID_Rol) VALUES(:new.Correo_Electronico,DBMS_RANDOM.string('x',10),3);

END;   



---------------------------Paquetes------------------


create or replace package PK_Global
IS
    PROCEDURE INSERTA_CLIENTES (P_Cedula IN CLIENTES.Cedula%TYPE, 
                                                  P_Nombre IN CLIENTES.Nombre%TYPE, 
                                                  P_Primer_apellido IN CLIENTES.Primer_apellido%TYPE, 
                                                  P_Segundo_apellido IN CLIENTES.Segundo_apellido%TYPE,
                                                  P_Num_Membresia IN CLIENTES.Num_Membresia%TYPE,
                                                  P_Direccion_exacta IN CLIENTES.Direccion_exacta%TYPE, 
                                                  P_Correo_Electronico IN CLIENTES.Correo_Electronico%TYPE);
                                                  
                                                  
                                                  
                                                  
                                                  
    PROCEDURE BORRA_CLIENTE (B_ID_CLIENTE IN Clientes.Cedula%TYPE);
    
    PROCEDURE ACTUALIZA_CLIENTES (P_Cedula IN CLIENTES.Cedula%TYPE, 
                                              P_Nombre IN CLIENTES.Nombre%TYPE, 
                                              P_Primer_apellido IN CLIENTES.Primer_apellido%TYPE, 
                                              P_Segundo_apellido IN CLIENTES.Segundo_apellido%TYPE,
                                              P_Num_Membresia IN CLIENTES.Num_Membresia%TYPE,
                                              P_Direccion_exacta IN CLIENTES.Direccion_exacta%TYPE, 
                                              P_Correo_Electronico IN CLIENTES.Correo_Electronico%TYPE);
                                              

    PROCEDURE INSERTA_ENTRENADORES (P_Cedula IN ENTRENADORES.Cedula%TYPE, 
                                                  P_Nombre IN ENTRENADORES.Nombre%TYPE, 
                                                  P_Primer_apellido IN ENTRENADORES.Primer_apellido%TYPE, 
                                                  P_Segundo_apellido IN ENTRENADORES.Segundo_apellido%TYPE,
                                                  P_ID_Salario IN ENTRENADORES.ID_Salario%TYPE,
                                                  P_Direccion_exacta IN ENTRENADORES.Direccion_exacta%TYPE, 
                                                  P_Correo_Electronico IN ENTRENADORES.Correo_Electronico%TYPE);
                                                  
                                                  
                                                  
                                                  
                                                  
    PROCEDURE BORRA_ENTRENADORES (B_ID_ENTRENADOR IN Entrenadores.Cedula%TYPE);
    
    PROCEDURE ACTUALIZA_ENTRENADORES (P_Cedula IN ENTRENADORES.Cedula%TYPE, 
                                              P_Nombre IN ENTRENADORES.Nombre%TYPE, 
                                              P_Primer_apellido IN ENTRENADORES.Primer_apellido%TYPE, 
                                              P_Segundo_apellido IN ENTRENADORES.Segundo_apellido%TYPE,
                                              P_ID_Salario IN ENTRENADORES.ID_Salario%TYPE,
                                              P_Direccion_exacta IN ENTRENADORES.Direccion_exacta%TYPE, 
                                              P_Correo_Electronico IN ENTRENADORES.Correo_Electronico%TYPE);         
                                              
                                              
                                              
                                              
    PROCEDURE INSERTA_ADMINISTRADORES (P_Cedula IN ADMINISTRADORES.Cedula%TYPE, 
                                                  P_Nombre IN ADMINISTRADORES.Nombre%TYPE, 
                                                  P_Primer_apellido IN ADMINISTRADORES.Primer_apellido%TYPE, 
                                                  P_Segundo_apellido IN ADMINISTRADORES.Segundo_apellido%TYPE,
                                                  P_ID_Salario IN ADMINISTRADORES.ID_Salario%TYPE,
                                                  P_Direccion_exacta IN ADMINISTRADORES.Direccion_exacta%TYPE, 
                                                  P_Correo_Electronico IN ADMINISTRADORES.Correo_Electronico%TYPE);
                                                  
                                                  
                                                  
                                                  
                                                  
    PROCEDURE BORRA_ADMINISTRADORES (B_ID_ADMINISTRADOR IN Administradores.Cedula%TYPE);
    
    PROCEDURE ACTUALIZA_ADMINISTRADORES (P_Cedula IN ADMINISTRADORES.Cedula%TYPE, 
                                              P_Nombre IN ADMINISTRADORES.Nombre%TYPE, 
                                              P_Primer_apellido IN ADMINISTRADORES.Primer_apellido%TYPE, 
                                              P_Segundo_apellido IN ADMINISTRADORES.Segundo_apellido%TYPE,
                                              P_ID_Salario IN ADMINISTRADORES.ID_Salario%TYPE,
                                              P_Direccion_exacta IN ADMINISTRADORES.Direccion_exacta%TYPE, 
                                              P_Correo_Electronico IN ADMINISTRADORES.Correo_Electronico%TYPE);                                                 
                                                  
end;

--------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY PK_Global
IS
    
    PROCEDURE INSERTA_CLIENTES (P_Cedula IN CLIENTES.Cedula%TYPE, 
                                                  P_Nombre IN CLIENTES.Nombre%TYPE, 
                                                  P_Primer_apellido IN CLIENTES.Primer_apellido%TYPE, 
                                                  P_Segundo_apellido IN CLIENTES.Segundo_apellido%TYPE,
                                                  P_Num_Membresia IN CLIENTES.Num_Membresia%TYPE,
                                                  P_Direccion_exacta IN CLIENTES.Direccion_exacta%TYPE, 
                                                  P_Correo_Electronico IN CLIENTES.Correo_Electronico%TYPE)
    AS                                              
    BEGIN
         INSERT INTO Clientes (Cedula, Nombre,Primer_apellido,Segundo_apellido,Num_membresia,Direccion_exacta,Correo_Electronico) VALUES (P_Cedula,P_Nombre, P_Primer_apellido,P_Segundo_apellido,P_Num_Membresia,P_Direccion_exacta,P_Correo_Electronico);
    END;
    
    PROCEDURE BORRA_CLIENTE (B_ID_CLIENTE IN Clientes.Cedula%TYPE)
    AS
    BEGIN
        DELETE FROM Clientes WHERE Cedula = B_ID_CLIENTE;
    END;
    
    PROCEDURE ACTUALIZA_CLIENTES (P_Cedula IN CLIENTES.Cedula%TYPE, 
                                                  P_Nombre IN CLIENTES.Nombre%TYPE, 
                                                  P_Primer_apellido IN CLIENTES.Primer_apellido%TYPE, 
                                                  P_Segundo_apellido IN CLIENTES.Segundo_apellido%TYPE,
                                                  P_Num_Membresia IN CLIENTES.Num_Membresia%TYPE,
                                                  P_Direccion_exacta IN CLIENTES.Direccion_exacta%TYPE, 
                                                  P_Correo_Electronico IN CLIENTES.Correo_Electronico%TYPE)
    AS
    BEGIN
        UPDATE Clientes
        SET
        Nombre  =P_Nombre   ,
        Primer_apellido=P_Primer_apellido,
        Segundo_apellido=P_Segundo_apellido,
        Num_membresia =P_Num_Membresia,
        Direccion_exacta=P_Direccion_exacta,
        Correo_Electronico =P_Correo_Electronico
        WHERE
        Cedula  =P_Cedula;
    END;
  
  
  
  
  
  
  
  
    PROCEDURE INSERTA_ENTRENADORES (P_Cedula IN ENTRENADORES.Cedula%TYPE, 
                                                  P_Nombre IN ENTRENADORES.Nombre%TYPE, 
                                                  P_Primer_apellido IN ENTRENADORES.Primer_apellido%TYPE, 
                                                  P_Segundo_apellido IN ENTRENADORES.Segundo_apellido%TYPE,
                                                  P_ID_Salario IN ENTRENADORES.ID_Salario%TYPE,
                                                  P_Direccion_exacta IN ENTRENADORES.Direccion_exacta%TYPE, 
                                                  P_Correo_Electronico IN ENTRENADORES.Correo_Electronico%TYPE)
    AS                                              
    BEGIN
         INSERT INTO Entrenadores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (P_Cedula,P_Nombre, P_Primer_apellido,P_Segundo_apellido,P_ID_Salario,P_Direccion_exacta,P_Correo_Electronico);
    END;
    
    PROCEDURE BORRA_ENTRENADORES (B_ID_ENTRENADOR IN Entrenadores.Cedula%TYPE)
    AS
    BEGIN
        DELETE FROM Entrenadores WHERE Cedula = B_ID_ENTRENADOR;
    END;
    
    PROCEDURE ACTUALIZA_ENTRENADORES (P_Cedula IN ENTRENADORES.Cedula%TYPE, 
                                                  P_Nombre IN ENTRENADORES.Nombre%TYPE, 
                                                  P_Primer_apellido IN ENTRENADORES.Primer_apellido%TYPE, 
                                                  P_Segundo_apellido IN ENTRENADORES.Segundo_apellido%TYPE,
                                                  P_ID_Salario IN ENTRENADORES.ID_Salario%TYPE,
                                                  P_Direccion_exacta IN ENTRENADORES.Direccion_exacta%TYPE, 
                                                  P_Correo_Electronico IN ENTRENADORES.Correo_Electronico%TYPE)
    AS
    BEGIN
        UPDATE Entrenadores
        SET
        Nombre  =P_Nombre   ,
        Primer_apellido=P_Primer_apellido,
        Segundo_apellido=P_Segundo_apellido,
        ID_Salario =P_ID_Salario,
        Direccion_exacta=P_Direccion_exacta,
        Correo_Electronico =P_Correo_Electronico
        WHERE
        Cedula  =P_Cedula;
    END;  
  
  
  
  
    PROCEDURE INSERTA_ADMINISTRADORES (P_Cedula IN ADMINISTRADORES.Cedula%TYPE, 
                                                  P_Nombre IN ADMINISTRADORES.Nombre%TYPE, 
                                                  P_Primer_apellido IN ADMINISTRADORES.Primer_apellido%TYPE, 
                                                  P_Segundo_apellido IN ADMINISTRADORES.Segundo_apellido%TYPE,
                                                  P_ID_Salario IN ADMINISTRADORES.ID_Salario%TYPE,
                                                  P_Direccion_exacta IN ADMINISTRADORES.Direccion_exacta%TYPE, 
                                                  P_Correo_Electronico IN ADMINISTRADORES.Correo_Electronico%TYPE)
    AS                                              
    BEGIN
         INSERT INTO Administradores (Cedula, Nombre,Primer_apellido,Segundo_apellido,ID_Salario,Direccion_exacta,Correo_Electronico) VALUES (P_Cedula,P_Nombre, P_Primer_apellido,P_Segundo_apellido,P_ID_Salario,P_Direccion_exacta,P_Correo_Electronico);
    END;
    
    PROCEDURE BORRA_ADMINISTRADORES (B_ID_ADMINISTRADOR IN Administradores.Cedula%TYPE)
    AS
    BEGIN
        DELETE FROM Administradores WHERE Cedula = B_ID_ADMINISTRADOR;
    END;
    
    PROCEDURE ACTUALIZA_ADMINISTRADORES (P_Cedula IN ADMINISTRADORES.Cedula%TYPE, 
                                                  P_Nombre IN ADMINISTRADORES.Nombre%TYPE, 
                                                  P_Primer_apellido IN ADMINISTRADORES.Primer_apellido%TYPE, 
                                                  P_Segundo_apellido IN ADMINISTRADORES.Segundo_apellido%TYPE,
                                                  P_ID_Salario IN ADMINISTRADORES.ID_Salario%TYPE,
                                                  P_Direccion_exacta IN ADMINISTRADORES.Direccion_exacta%TYPE, 
                                                  P_Correo_Electronico IN ADMINISTRADORES.Correo_Electronico%TYPE)
    AS
    BEGIN
        UPDATE Administradores
        SET
        Nombre  =P_Nombre   ,
        Primer_apellido=P_Primer_apellido,
        Segundo_apellido=P_Segundo_apellido,
        ID_Salario =P_ID_Salario,
        Direccion_exacta=P_Direccion_exacta,
        Correo_Electronico =P_Correo_Electronico
        WHERE
        Cedula  =P_Cedula;
    END;    
  
  
  
  
  
  
    
    
    
END;