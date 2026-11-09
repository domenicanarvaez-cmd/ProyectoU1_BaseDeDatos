CREATE DATABASE megatumbados;
USE megatumbados;

CREATE TABLE Producto (
    codigo           VARCHAR(10)    PRIMARY KEY,
    nombre           VARCHAR(80)    NOT NULL,
    marca            VARCHAR(70)    NOT NULL,
    precio_unitario  DECIMAL(10,2)  NOT NULL CHECK (precio_unitario >= 0),
    unidad_medida    VARCHAR(20)    NOT NULL,
    stock            INT            NOT NULL CHECK (stock >= 0)
);

CREATE TABLE Proveedor (
    codigo  VARCHAR(10)  PRIMARY KEY,
    nombre  VARCHAR(80)  NOT NULL
);

CREATE TABLE Producto_proveedor (
    codigo_proveedor  VARCHAR(10),
    codigo_producto   VARCHAR(10),
    PRIMARY KEY (codigo_proveedor, codigo_producto),
    FOREIGN KEY (codigo_proveedor) REFERENCES Proveedor(codigo),
    FOREIGN KEY (codigo_producto)  REFERENCES Producto(codigo)
);

CREATE TABLE Cliente (
    cedula_ruc  VARCHAR(13)  PRIMARY KEY,
    nombre      VARCHAR(80)  NOT NULL,
    telefono    VARCHAR(15)  NOT NULL,
    direccion   VARCHAR(90)  NOT NULL,
    correo      VARCHAR(50)  NOT NULL
);

CREATE TABLE Cotizacion (
    numero          INT            PRIMARY KEY AUTO_INCREMENT,
    fecha           DATE           NOT NULL,
    tipo_trabajo    ENUM('GYPSUM','PVC') NOT NULL,
    metros          DECIMAL(8,2)   NOT NULL,
    cedula_cliente  VARCHAR(13)    NOT NULL,
    FOREIGN KEY (cedula_cliente) REFERENCES Cliente(cedula_ruc)
);

CREATE TABLE Producto_cotizacion (
    numero_cotizacion  INT,
    codigo_producto    VARCHAR(10),
    cantidad           INT            NOT NULL CHECK (cantidad > 0),
    precio_unitario    DECIMAL(10,2)  NOT NULL,
    PRIMARY KEY (numero_cotizacion, codigo_producto),
    FOREIGN KEY (numero_cotizacion) REFERENCES Cotizacion(numero),
    FOREIGN KEY (codigo_producto)   REFERENCES Producto(codigo)
);

CREATE TABLE Factura (
    numero_factura     INT            PRIMARY KEY AUTO_INCREMENT,
    fecha              DATE           NOT NULL,
    total              DECIMAL(10,2)  NOT NULL,
    estado_entrega     ENUM('PENDIENTE','COMPLETA') NOT NULL,
    cedula_cliente     VARCHAR(13)    NOT NULL,
    numero_cotizacion  INT            UNIQUE,
    FOREIGN KEY (cedula_cliente)    REFERENCES Cliente(cedula_ruc),
    FOREIGN KEY (numero_cotizacion) REFERENCES Cotizacion(numero)
);

CREATE TABLE Producto_factura (
    numero_factura   INT,
    codigo_producto  VARCHAR(10),
    cantidad         INT            NOT NULL CHECK (cantidad > 0),
    precio_unitario  DECIMAL(10,2)  NOT NULL,
    PRIMARY KEY (numero_factura, codigo_producto),
    FOREIGN KEY (numero_factura)  REFERENCES Factura(numero_factura),
    FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo)
);

CREATE TABLE Instalacion (
    codigo              INT            PRIMARY KEY AUTO_INCREMENT,
    direccion           VARCHAR(90)    NOT NULL,
    tipo_trabajo        ENUM('GYPSUM','PVC') NOT NULL,
    metros              DECIMAL(8,2)   NOT NULL,
    precio_metro        DECIMAL(8,2)   NOT NULL,
    fecha_inicio        DATE           NOT NULL,
    fecha_fin_estimada  DATE           NOT NULL,
    fecha_fin_real      DATE,
    estado              ENUM('POR_INICIAR','EN_CURSO','TERMINADA') NOT NULL,
    fecha_pago          DATE,
    numero_factura      INT            NOT NULL UNIQUE,
    FOREIGN KEY (numero_factura) REFERENCES Factura(numero_factura)
);
