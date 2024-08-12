// Definición de la tabla Persona
Table Persona {
  Identificacion int [pk, unique, not null] // Clave primaria
  Nombres varchar(255)
  Apellidos varchar(255)
  Direccion varchar(255)
  Telefono varchar(50)
  Email varchar(255) [not null, unique]
}

// Definición de la tabla Rol
Table Rol {
  Codigo int [pk, unique, not null] // Clave primaria
  Nombre varchar(255) [not null, unique] // Puede ser "Empleado", "Cliente", etc.
}

// Definición de la tabla Empleado
Table Empleado {
  EmpleadoID int [pk, unique, not null] // Clave primaria
  PersonaID int [ref: > Persona.Identificacion] // Clave foránea
  Cargo varchar(255)
  FechaContratacion datetime
  Salario decimal(10, 2)
  Turno varchar(50)
  RolID int [ref: > Rol.Codigo] // Clave foránea
}

// Definición de la tabla Cliente
Table Cliente {
  ClienteID int [pk, unique, not null] // Clave primaria
  PersonaID int [ref: > Persona.Identificacion] // Clave foránea
  FechaRegistro datetime
  Preferencias varchar(255)
  RolID int [ref: > Rol.Codigo] // Clave foránea
}

// Definición de la tabla Credencial
Table Credencial {
  CredencialID int [pk, unique, not null] // Clave primaria
  PersonaID int [ref: > Persona.Identificacion] // Clave foránea
  Correo varchar(255) [not null, unique]
  Contrasena varchar(255) [not null]
}

// Definición de la tabla Proveedor
Table Proveedor {
  ProveedorID int [pk, unique, not null] // Clave primaria
  Nombre varchar(255)
  Direccion varchar(255)
  Telefono varchar(50)
  Email varchar(255) [not null, unique]
  CalidadProducto varchar(255)
  CantidadSuministrada int
}

// Definición de la tabla Compra
Table Compra {
  CompraID int [pk, unique, not null] // Clave primaria
  ProveedorID int [ref: > Proveedor.ProveedorID] // Clave foránea
  Fecha datetime [not null]
  Total decimal(10, 2) [not null]
  OrdenCompra varchar(255)
}

// Definición de la tabla Producto
Table Producto {
  ProductoID int [pk, unique, not null] // Clave primaria
  Nombre varchar(255)
  Precio decimal(10, 2) [not null]
  Talla varchar(50)
  Color varchar(50)
  Stock int
  ProveedorID int [ref: > Proveedor.ProveedorID] // Clave foránea
}

// Definición de la tabla Categoría
Table Categoria {
  CategoriaID int [pk, unique, not null] // Clave primaria
  Nombre varchar(255)
}

// Definición de la tabla Pedido
Table Pedido {
  PedidoID int [pk, unique, not null] // Clave primaria
  ClienteID int [ref: > Cliente.ClienteID] // Clave foránea
  Fecha datetime [not null]
  IVA decimal(10, 2)
  Total decimal(10, 2) [not null]
}

// Definición de la tabla Mensaje
Table Mensaje {
  MensajeID int [pk, unique, not null] // Clave primaria
  Contenido text
  Fecha datetime [not null]
  PersonaID int [ref: > Persona.Identificacion] // Clave foránea
}

// Relaciones adicionales entre tablas
Ref: Empleado.PersonaID > Persona.Identificacion // Un Empleado es una Persona
Ref: Cliente.PersonaID > Persona.Identificacion // Un Cliente es una Persona
Ref: Persona.Identificacion > Credencial.PersonaID // Una Persona tiene una Credencial
Ref: Pedido.ClienteID > Cliente.ClienteID // Un Pedido es realizado por un Cliente
Ref: Producto.ProveedorID > Proveedor.ProveedorID // Un Producto es suministrado por un Proveedor
Ref: Compra.ProveedorID > Proveedor.ProveedorID // Una Compra es realizada a un Proveedor
