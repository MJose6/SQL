-- Tabla: carritos
CREATE TABLE carritos (
    id int  NOT NULL,
    fecha date  NOT NULL,
    clientes_id int  NOT NULL,
    CONSTRAINT carritos_pk PRIMARY KEY (id)
);

-- Tabla: categorias
CREATE TABLE categorias (
    id int  NOT NULL,
    tipo varchar(20)  NOT NULL,
    CONSTRAINT categorias_pk PRIMARY KEY (id)
);

-- Tabla: clientes
CREATE TABLE clientes (
    id int  NOT NULL,
    nombre varchar(20)  NOT NULL,
    direccion varchar(20)  NOT NULL,
    telefono varchar(20)  NOT NULL,
    ciudad varchar(20)  NOT NULL,
    CONSTRAINT clientes_pk PRIMARY KEY (id)
);

-- Tabla: comentarios
CREATE TABLE comentarios (
    id int  NOT NULL,
    titulo varchar(20)  NOT NULL,
    valoracion int  NOT NULL,
    publicacion_id int  NOT NULL,
    CONSTRAINT comentarios_pk PRIMARY KEY (id)
);

-- Tabla: productos
CREATE TABLE productos (
    id int  NOT NULL,
    nombre varchar(20)  NOT NULL,
    precio decimal(9,1)  NOT NULL,
    categorias_id int  NOT NULL,
    CONSTRAINT productos_pk PRIMARY KEY (id)
);

-- Tabla: publicacion
CREATE TABLE publicacion (
    id int  NOT NULL,
    descripcion varchar(100)  NOT NULL,
    productos_id int  NOT NULL,
    vendedor_id int  NOT NULL,
    CONSTRAINT publicacion_pk PRIMARY KEY (id)
);

-- Tabla: vendedor
CREATE TABLE vendedor (
    id int  NOT NULL,
    nombre varchar(20)  NOT NULL,
    direccion varchar(20)  NOT NULL,
    telefono varchar(20)  NOT NULL,
    CONSTRAINT vendedor_pk PRIMARY KEY (id)
);

-- Tabla: ventas
CREATE TABLE ventas (
    id int  NOT NULL,
    productos_id int  NOT NULL,
    fecha date  NOT NULL,
    precio decimal(9,1)  NOT NULL,
    carritos_id int  NOT NULL,
    CONSTRAINT ventas_pk PRIMARY KEY (id)
);

-- foreign keys
-- Referencia: carritos_clientes (tabla: carritos)
ALTER TABLE carritos ADD CONSTRAINT carritos_clientes
    FOREIGN KEY (clientes_id)
    REFERENCES clientes (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Referencia: comentarios_publicacion (tabla: comentarios)
ALTER TABLE comentarios ADD CONSTRAINT comentarios_publicacion
    FOREIGN KEY (publicacion_id)
    REFERENCES publicacion (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Referencia: productos_categorias (tabla: productos)
ALTER TABLE productos ADD CONSTRAINT productos_categorias
    FOREIGN KEY (categorias_id)
    REFERENCES categorias (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Referencia: publicacion_productos (tabla: publicacion)
ALTER TABLE publicacion ADD CONSTRAINT publicacion_productos
    FOREIGN KEY (productos_id)
    REFERENCES productos (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Referencia: publicacion_vendedor (tabla: publicacion)
ALTER TABLE publicacion ADD CONSTRAINT publicacion_vendedor
    FOREIGN KEY (vendedor_id)
    REFERENCES vendedor (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Referencia: venta_productos (tabla: ventas)
ALTER TABLE ventas ADD CONSTRAINT venta_productos
    FOREIGN KEY (productos_id)
    REFERENCES productos (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Referencia: ventas_carritos (tabla: ventas)
ALTER TABLE ventas ADD CONSTRAINT ventas_carritos
    FOREIGN KEY (carritos_id)
    REFERENCES carritos (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

