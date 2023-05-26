# BASES-DE-DATOS-AVANZADAS
Para ejeutar se debe levantar el contenedor desde el archivo yml
todas las carpetas estan asociadas.
## Entidad base de proyecto
  “Control y seguimiento a las bases de datos de facturación”
  
APOYO NACIONAL A LA PRODUCCIÓN Y EMPLEO
ANPE 

## Diagrama correspondiente
    +------------------+      +----------------+       +-------------------+
    |     Usuarios     |      |  Consumidores  |       |     Operadores    |
    +------------------+      +----------------+       +-------------------+
    |      ID (PK)     |      |       ID (PK)  |       |      ID (PK)      |
    |     Nombre       |      |      Nombre    |       |     Nombre        |
    |    Apellido      |      |     Apellido   |       |    Direccion      |
    | CorreoElectronico|      |    Direccion   |       |     Ciudad        |
    |    Contrasena    |      |     Ciudad     |       |     Telefono      |
    |       Rol        |      |    Telefono    |       | CorreoElectronico |
    | FechaCreacion    |      | CorreoElectronico |   ->  |  FechaRegistro   |
    +------------------+      | FechaRegistro |       +-------------------+
                             +----------------+

          |
          | 1
          |
          V
+------------------+
|     Servicios    |
+------------------+
|      ID (PK)     |
|     Nombre       |
|   Descripcion    |
|     Precio       |
| FechaCreacion    |
+------------------+
          |
          | N
          |
          V
+------------------+           +----------------+
|    Contratos     |           |   Medidores     |
+------------------+           +----------------+
|      ID (PK)     |           |     ID (PK)     |
|   Consumidor_ID  | ------->  |  Operador_ID    |
|   Operador_ID    | ------->  | Consumidor_ID   |
|   Servicio_ID    | ------->  | TipoMedidor     |
|  FechaInicio     |           |    Estado       |
|   FechaFin       |           | FechaInstalacion|
|   MontoTotal     |           +----------------+
+------------------+
          |
          | N
          |
          V
+------------------+
|     Facturas     |
+------------------+
|      ID (PK)     |
|   Contrato_ID    |
|  FechaEmision    |
| FechaVencimiento |
|     Monto        |
|     Estado       |
+------------------+
          |
          | 1
          |
          V
+------------------+
|     Lecturas     |
+------------------+
|      ID (PK)     |
|   Medidor_ID     |
|     Consumo      |
|  FechaLectura    |
+------------------+
