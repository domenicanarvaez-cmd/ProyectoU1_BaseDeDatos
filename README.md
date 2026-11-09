# Megatumbados: Base de Datos

**Diseño e implementación de una base de datos relacional para la gestión de productos, cotizaciones, ventas e instalaciones de la microempresa Megatumbados**

## Datos generales

| | |
|---|---|
| **Asignatura** | Base de Datos |
| **Ciclo** | 3 A |
| **Unidad** | 1 |
| **Resultado de aprendizaje** | Modela bases de datos de problemas reales, bajo los principios de solidaridad, transparencia, responsabilidad y honestidad. |
| **Docente** | Ing. Edwin René Guamán Quinche |
| **Estudiante** | Domenica Brigeeth Narvaez Rivas |
| **Fecha** | 06/11/2026 |

## Contenido

1. [Contexto del problema](#contexto-del-problema)
2. [Objetivos](#objetivos)
3. [Modelo Entidad-Relación](1_Entidad_Relacion/README.md)
4. [Modelo Relacional](2_Relacional/README.md)
5. [Código SQL (DDL)](3_SQL/README.md)
6. [Pruebas con datos simulados (DML)](4_Pruebas_Datos_Simulados/README.md)
7. [Consultas en álgebra relacional y SQL](5_Algebra_Relacional/README.md)
8. [Conclusiones](#conclusiones)
9. [Referencias](#referencias)
10. [Anexos](6_Anexos/README.md)

## Contexto del problema

Megatumbados es una microempresa dedicada a la venta de materiales para interiores, como gypsum, PVC, perfilería, pinturas, iluminación y herramientas, y a la instalación de tumbados y revestimientos. Atiende a personas que construyen o decoran su vivienda, a negocios como consultorios o peluquerías, y a maestros de obra que compran material para sus propios trabajos.

Actualmente las cotizaciones se calculan en hojas de Excel separadas para PVC y para gypsum, el stock de los productos no se actualiza al día, el control de las entregas pendientes se lleva en archivadores físicos y para las instalaciones no hay un registro de fechas, metros, precio ni estado de cada obra. Por ello no se puede consultar con certeza cuánto material hay disponible, qué facturas tienen entregas pendientes ni qué obras están en curso.

El problema afecta al personal del local, que debe buscar la información del material que se dispone para cotizar, vender y entregar; al propietario, que no cuenta con datos confiables para controlar el inventario y las instalaciones; y a los clientes, que pueden recibir cotizaciones con material no disponible o retrasos en sus entregas e instalaciones.

La base de datos debe gestionar productos, proveedores, clientes, cotizaciones, facturas e instalaciones. Es importante representar bien la información porque estos datos están conectados, por ejemplo, una cotización se convierte en factura, la factura registra el precio al que se vendió cada producto y de ella se origina la instalación, de modo que un error o un dato duplicado afecta a todo el proceso.

El funcionamiento del negocio que debe cubrir la base de datos se resume en el siguiente enunciado:

### Enunciado

Megatumbados es una microempresa que vende materiales para interiores (gypsum, PVC, perfilería, pintura, iluminación y herramientas, entre otros) y realiza su instalación. Se desea diseñar una base de datos para gestionar sus productos, cotizaciones, ventas e instalaciones, según las siguientes características:

- De cada producto se guarda un código, su nombre, su marca, el precio unitario, la unidad de medida en que se vende (galón, saco, metro, caja, etc.) y la cantidad en stock.
- De cada proveedor se guarda un código y su nombre. Un proveedor suministra varios productos y un mismo producto puede ser suministrado por varios proveedores.
- De cada cliente se guarda su cédula o RUC, nombre, teléfono, dirección y correo electrónico.
- Un cliente puede solicitar varias cotizaciones y cada cotización pertenece a un solo cliente. De la cotización se guarda un número, la fecha, el tipo de trabajo (gypsum o PVC) y los metros a cubrir. Una cotización incluye varios productos y un producto puede estar en varias cotizaciones; de cada producto cotizado se guarda la cantidad y el precio unitario.
- Un cliente puede realizar varias compras y cada factura corresponde a un solo cliente. De la factura se guarda el número de factura, la fecha, el estado de la entrega (pendiente o completa) y el total, que se calcula a partir de los productos facturados. Una factura contiene varios productos y un producto puede estar en varias facturas; de cada producto facturado se guarda la cantidad y el precio unitario.
- Una cotización puede generar como máximo una factura, y una factura puede venir de una cotización o ser una compra directa.
- Una factura puede originar una instalación, y cada instalación se origina de una sola factura, ya que el material que se instala es el que se vendió. De la instalación se guarda un código, la dirección de la obra, el tipo de trabajo, los metros, el precio por metro acordado, la fecha de inicio, la fecha estimada de fin, la fecha real de fin, el estado de la obra (por iniciar, en curso o terminada) y la fecha de pago. La instalación no se factura y se paga al contado al terminar la obra.

## Objetivos

### Objetivo general

Diseñar una base de datos relacional para la microempresa Megatumbados, mediante el modelo entidad-relación, el modelo relacional y el lenguaje SQL en MySQL, para centralizar y relacionar la información de sus productos, clientes, cotizaciones, ventas e instalaciones.

### Objetivos específicos

1. Elaborar el diagrama entidad-relación del negocio y transformarlo al modelo relacional, identificando sus entidades, atributos, relaciones, cardinalidades y claves.
2. Implementar la base de datos en MySQL mediante sentencias DDL y DML, y construir consultas en álgebra relacional traducidas a SQL que permitan obtener información útil para el negocio.

## Estructura del repositorio

| Carpeta | Contenido |
|---|---|
| [1_Entidad_Relacion](1_Entidad_Relacion/README.md) | Diagrama entidad-relación y descripción de entidades y relaciones |
| [2_Relacional](2_Relacional/README.md) | Diagrama relacional y esquema de tablas con sus claves |
| [3_SQL](3_SQL/README.md) | Script de creación de la base de datos y sus tablas |
| [4_Pruebas_Datos_Simulados](4_Pruebas_Datos_Simulados/README.md) | Inserción de datos simulados y archivos CSV para Relational |
| [5_Algebra_Relacional](5_Algebra_Relacional/README.md) | Cinco consultas en álgebra relacional con su traducción a SQL |
| [6_Anexos](6_Anexos/README.md) | Evidencias de la creación de las tablas y de los datos insertados |

## Conclusiones

El proceso de modelado conceptual permitió comprender que una base de datos debe representar el funcionamiento real del negocio y no solo una lista de datos. Al elaborar el diagrama entidad-relación de Megatumbados, la principal dificultad fue identificar qué elementos eran realmente entidades: en una primera versión se incluyeron los empleados y el despacho, pero se concluyó que los usuarios del sistema no forman parte del modelo y que la factura y la instalación eran las entidades que reflejaban el proceso del negocio. También se aprendió que atributos como la cantidad y el precio unitario pertenecen a las relaciones entre producto, cotización y factura, ya que guardan el precio vigente al momento de cotizar o vender. Al transformar el diagrama al modelo relacional se aplicaron las reglas de paso: las relaciones de muchos a muchos se convirtieron en tablas intermedias con clave primaria compuesta y las de uno a muchos en claves foráneas del lado de muchos.

La escritura del código SQL permitió llevar el modelo a una base de datos real en MySQL y comprobar que el diseño funcionaba. Con las sentencias DDL se entendió la importancia de las restricciones para proteger la integridad de la información: PRIMARY KEY y FOREIGN KEY para relacionar las tablas, NOT NULL para los datos obligatorios, UNIQUE para limitar las relaciones de uno a uno, CHECK para evitar cantidades o stock negativos, ENUM para los estados y AUTO_INCREMENT para los documentos que genera la empresa. Con las sentencias DML se comprobó que el orden de inserción importa, ya que una clave foránea solo acepta valores que ya existen en la tabla referenciada; los errores de integridad que aparecieron al insertar los datos mostraron en la práctica cómo MySQL hace cumplir estas reglas.

El álgebra relacional facilitó la construcción de las consultas SQL, porque obliga a definir primero qué tablas se unen, qué filas se filtran y qué columnas se muestran, y ese razonamiento se traduce casi directamente a JOIN, WHERE y SELECT. Al trabajar con la herramienta Relational se comprobó que la reunión natural une las tablas por los atributos que tienen el mismo nombre, por lo que fue necesario el renombre para conectarlas correctamente. Las consultas más útiles para el negocio fueron las que combinan varias tablas, como la de facturas pendientes de entrega y la de clientes que cotizaron pero no compraron, ya que entregan información para dar seguimiento a las entregas y a los clientes potenciales. Además, los operadores de conjuntos (diferencia, intersección, unión y división) mostraron su equivalente en SQL mediante IN, NOT IN y el conteo con GROUP BY y HAVING.

## Referencias

[1] E. R. Guamán Quinche, "Álgebra relacional", diapositivas de clase, asignatura Base de Datos, Carrera de Computación, Universidad Nacional de Loja, Loja, Ecuador, 2026. [En línea]. Disponible en: https://canva.link/ovv5w0wl4gir7zo

[2] E. R. Guamán Quinche, "Lenguaje SQL", diapositivas de clase, asignatura Base de Datos, Carrera de Computación, Universidad Nacional de Loja, Loja, Ecuador, 2026. [En línea]. Disponible en: https://canva.link/2pps2iyihixvsgt
