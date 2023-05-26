USE sicoes;

-- Tabla: Usuarios
CREATE TABLE Usuarios (
  ID INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  CorreoElectronico VARCHAR(100),
  Contrasena VARCHAR(100),
  Rol VARCHAR(50),
  FechaCreacion DATE
);

-- Tabla: Consumidores
CREATE TABLE Consumidores (
  ID INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Direccion VARCHAR(100),
  Ciudad VARCHAR(50),
  Telefono VARCHAR(20),
  CorreoElectronico VARCHAR(100),
  FechaRegistro DATE
);

-- Tabla: Operadores
CREATE TABLE Operadores (
  ID INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Direccion VARCHAR(100),
  Ciudad VARCHAR(50),
  Telefono VARCHAR(20),
  CorreoElectronico VARCHAR(100),
  FechaRegistro DATE
);

-- Tabla: Servicios
CREATE TABLE Servicios (
  ID INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Descripcion TEXT,
  Precio DECIMAL(10, 2),
  FechaCreacion DATE
);

-- Tabla: Contratos
CREATE TABLE Contratos (
  ID INT PRIMARY KEY,
  Consumidor_ID INT,
  Operador_ID INT,
  Servicio_ID INT,
  FechaInicio DATE,
  FechaFin DATE,
  MontoTotal DECIMAL(10, 2),
  FOREIGN KEY (Consumidor_ID) REFERENCES Consumidores(ID),
  FOREIGN KEY (Operador_ID) REFERENCES Operadores(ID),
  FOREIGN KEY (Servicio_ID) REFERENCES Servicios(ID)
);

-- Tabla: Medidores
CREATE TABLE Medidores (
  ID INT PRIMARY KEY,
  Operador_ID INT,
  Consumidor_ID INT,
  TipoMedidor VARCHAR(50),
  Estado ENUM('activo', 'inactivo'),
  FechaInstalacion DATE,
  FOREIGN KEY (Operador_ID) REFERENCES Operadores(ID),
  FOREIGN KEY (Consumidor_ID) REFERENCES Consumidores(ID)
);

-- Tabla: Facturas
CREATE TABLE Facturas (
  ID INT PRIMARY KEY,
  Contrato_ID INT,
  FechaEmision DATE,
  FechaVencimiento DATE,
  Monto DECIMAL(10, 2),
  Estado ENUM('pagada', 'pendiente'),
  FOREIGN KEY (Contrato_ID) REFERENCES Contratos(ID)
);

-- Tabla: Lecturas
CREATE TABLE Lecturas (
  ID INT PRIMARY KEY,
  Medidor_ID INT,
  Consumo DECIMAL(10, 2),
  FechaLectura DATE,
  FOREIGN KEY (Medidor_ID) REFERENCES Medidores(ID)
);

CREATE USER "usuario_replicacion"@"%" IDENTIFIED BY "12345";
GRANT REPLICATION SLAVE ON *.* TO "usuario_replicacion"@"%";
FLUSH PRIVILEGES;
