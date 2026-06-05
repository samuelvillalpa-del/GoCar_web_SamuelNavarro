CREATE TABLE EMPRESA (
    Cod_empresa NUMBER PRIMARY KEY,
    Nombre      VARCHAR2(50),
    NIF         VARCHAR2(15) UNIQUE
);

CREATE TABLE ROL (
    Cod_rol NUMBER PRIMARY KEY,
    Tipo    VARCHAR2(10)
);

CREATE TABLE VEHICULO (
    Cod_vehiculo NUMBER PRIMARY KEY,
    Marca        VARCHAR2(30),
    Modelo       VARCHAR2(30),
    Anio         NUMBER,
    Matricula    VARCHAR2(15),
    Kilometros   NUMBER,
    Cod_empresa  NUMBER,
    CONSTRAINT FK_VEH_EMPRESA
        FOREIGN KEY (Cod_empresa)
        REFERENCES EMPRESA(Cod_empresa)
);

CREATE TABLE USUARIO (
    Cod_usuario  NUMBER PRIMARY KEY,
    Nombre       VARCHAR2(30),
    Apellidos    VARCHAR2(50),
    DNI          VARCHAR2(15) UNIQUE,
    Email        VARCHAR2(60),
    Direccion    VARCHAR2(80),
    Cod_rol      NUMBER,
    Cod_vehiculo NUMBER,
    CONSTRAINT FK_USU_ROL
        FOREIGN KEY (Cod_rol)
        REFERENCES ROL(Cod_rol),
    CONSTRAINT FK_USU_VEH
        FOREIGN KEY (Cod_vehiculo)
        REFERENCES VEHICULO(Cod_vehiculo)
);

CREATE TABLE ALQUILA (
    Cod_usuario  NUMBER,
    Cod_vehiculo NUMBER,
    Kilometros   NUMBER,
    CONSTRAINT PK_ALQUILA
        PRIMARY KEY (Cod_usuario, Cod_vehiculo),
    CONSTRAINT FK_ALQ_USUARIO
        FOREIGN KEY (Cod_usuario)
        REFERENCES USUARIO(Cod_usuario),
    CONSTRAINT FK_ALQ_VEHICULO
        FOREIGN KEY (Cod_vehiculo)
        REFERENCES VEHICULO(Cod_vehiculo)
);

INSERT INTO EMPRESA VALUES (1, 'GoCar Madrid', 'A12345678');
INSERT INTO EMPRESA VALUES (2, 'GoCar Barcelona', 'B87654321');

INSERT INTO ROL VALUES (1, 'Normal');
INSERT INTO ROL VALUES (2, 'VIP');

INSERT INTO VEHICULO VALUES (101, 'Toyota', 'Corolla', 2022, '1234ABC', 15000, 1);
INSERT INTO VEHICULO VALUES (102, 'Seat', 'Ibiza', 2021, '5678DEF', 22000, 1);
INSERT INTO VEHICULO VALUES (103, 'BMW', 'X1', 2023, '9999XYZ', 5000, 2);

INSERT INTO USUARIO VALUES (1, 'Juan', 'Perez', '11111111A', 'juan@email.com', 'Calle Mayor 1', 1, 101);
INSERT INTO USUARIO VALUES (2, 'Ana', 'Lopez', '22222222B', 'ana@email.com', 'Avenida Sol 22', 2, 103);

INSERT INTO ALQUILA VALUES (1, 101, 200);
INSERT INTO ALQUILA VALUES (1, 102, 350);
INSERT INTO ALQUILA VALUES (2, 103, 120);

COMMIT;