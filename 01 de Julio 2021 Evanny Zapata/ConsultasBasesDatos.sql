USE tiendavirtualvideojuegos;

INSERT INTO tipodeusuario (TipoDeUsuario)
VALUES('Usuario Registrado'),
('Usuario Registrado'),('Usuario Invitado'),('Usuario Registrado'),('Usuario Invitado'),('Usuario Registrado');

SELECT*FROM tipodeusuario;

INSERT INTO usuario (Nombre, ApellidoP, ApellidoM, Edad, Clave, NombreDeUsuario, idTipoDeUsuario)
VALUES( 'Christian','Sevilla', 'Cepedes', 30, 'CH090213', 'CHRIS', 1),
( 'Samuel','Vera', 'Barria', 20, 'CH018320', 'SAMI', 2),( 'Guillermo','Casas', 'Arena', 22, 'CH022521', 'GULIEL', 3),
( 'Romina','Luna', 'Diaz', 25, 'CH020782', 'ROMI', 4),( 'Edith','Muller', 'Schneider', 19, 'CH040957', 'EDITHX', 5);

INSERT INTO despacho(EstadoDespacho, Bodega, idUsuario)
VALUES ('Enviado','De Bodega1, Santiago - Domicilio Usuario', 1),
('Por Despachar','En Bodega 2, Valparaiso', 2),('Enviado','De Bodega 3, Ñuble - Domicilio Usuario', 3),
('Enviado','De Bodega 4, Bío-Bío - Domicilio Usuario', 4),('Por Despachar','En Bodega7, Aysen', 5);

INSERT INTO tipoproducto(TipoProducto)
VALUES('Videojuego'),
('Consola'),('Accesorio'),('Cómic'),('Libros');

INSERT INTO producto (Nombre, Descripción, SKU, StockProducto, idTipoProducto)
VALUES ('The legend of zelda a link to the past', 'Videojuego de acción-aventura con toques de RPG','ZM0204', 40 , 1),
('Play Station 4', 'Consola de sobremesa desarrollada por Sony','ZM0306', 20 , 2),('Headset Razer x', 'Auriculares Razer Ultra ligeros y ergonómicos','ZM0204', 40 , 3),
('The amazing Spider-Man', 'The Amazing Spider-Man cómic estadounidenses publicada por Marvel','ZM0407', 10 , 4),('Código Nueva York (ESP) Libro', 'El exagente secreto Alberto Prat vuelve a ponerse a las órdenes del Vaticano para resolver el enigma detrás de una reliquia protegida hace años por los jesuitas','ZM6408', 20 , 5);

INSERT INTO proveedor (Nombre, ApellidoP, ApellidoM, NúmeroGuiaDespacho)
VALUES ('Camila','Cabello','Meyer','GD2730'),
('Francisca','Escobar','Pueyes','GD4040'),('Sergio','Wagner','Lagos','GD7010'),
('Paulina','Rubilar','Becker','GD3761'),('Raul','Puebla','Paddington','GD7070');

INSERT INTO abastecimiento(OrdenAbestecimiento, idProducto, idProveedor, DireccionBodegaAbastecimiento, ProductoAbastecer, CantidadAbastecer, precioSinIva, precioConIva)
VALUES ('OA272732', 1,1,'Bodega 6, Calle Baquedano 49, Santiago','Videojuego Tloz a link to the past',300, 1500000, 1785000),
('OA282840', 2,2,'Bodega 10, Calle Manuel Montt, Araucania','PS4 consola',100, 5000000, 5950000),('OA404029', 3,3,'Bodega 8, Calle Serrano 27, Atacama','Auricular Razer X',200, 2800000, 3332000),
('OA151546', 4,4,'Bodega 7, Calle Zapallar 56, Coquimbo','Comic TA-SP-M',200, 800000, 952000),('OA656578', 5,5,'Bodega 9, Calle Papudo 1350, Los Ríos','Codigo NY',100, 1000000, 1190000);

SELECT*FROM abastecimiento;

INSERT INTO detalledeventa (NumeroDeVenta, HoraDeVenta, FechaDeVenta, CantidadProducto, TipoPago, idDespacho, idUsuario, idProducto)
VALUES('VT07080910','09:10:00', '2021-01-02',5,'Debito',1,1,1),
('VT06050403','19:35:00', '2021-02-15',4,'Credito',2,2,2),('VT10111213','17:20:00', '2021-03-11',3,'Transferencia',3,3,3),
('VT76891012','20:40:00', '2021-04-07',10,'Credito',4,4,4),('VT15161718','15:50:00', '2021-05-13',8,'Debito',5,5,5);


SELECT det.HoraDeVenta, det.FechaDeVenta, det.CantidadProducto, pro.Nombre as NombreProducto, pro.Descripción as DetalleProducto, tip.TipoProducto, us.NombreDeUsuario, us.Nombre
FROM detalledeventa AS det
INNER JOIN producto AS pro
ON det.idProducto = pro.idProducto
INNER JOIN tipoproducto AS tip
ON pro.idTipoProducto = tip.idTipoProducto
INNER JOIN usuario AS us
ON det.idUsuario= us.idUsuario;


SELECT ab.DireccionBodegaAbastecimiento ,ab.CantidadAbastecer ,ab.ProductoAbastecer ,pro.Nombre as NombreProductoTienda, pro.StockProducto as CantidadTienda 
FROM abastecimiento AS ab
INNER JOIN producto AS pro
ON ab.idProducto = pro.idProducto
INNER JOIN proveedor AS prov
ON ab.idProveedor = prov.idProveedor;

CREATE VIEW DatosUsuario AS
SELECT us.Nombre, us.ApellidoP, us.ApellidoM, us.Clave, us.Edad
FROM usuario AS us;

CREATE VIEW DatosProveedor AS
SELECT prov.Nombre, prov.ApellidoP, prov.ApellidoM, prov.NúmeroGuiaDespacho
FROM proveedor AS prov;


USE registrounidadacademica;

INSERT INTO unidadeducativa (Nombre)
VALUES('Universidad Viña Del Mar');

INSERT INTO profesor(Nombre, ApellidoPaterno, TituloProfesional, idUnidadEducativa)
VALUES('Raul','Vernales','Pedagogia en Matematicas', 1),
('Francisca','Moreno','Pedagogia en Física', 1),('Vanesa','Schmidt','Pedagogia en Idiomas', 1),
('Melissa','Olivares','Pedagogia en Filosofía', 1),('Juan','Villegas','Pedagogia en Ciencias ', 1);


INSERT INTO carrera (NombreCarrera, DescripciónCarrera ,idUnidadEducativa)
VALUES ('Ingeniería en Electricidad','Carrera enfocada en el área de electricidad domiciliaria e industrial',1),
('Ingeniería Industrial','Carrera enfocada en implementación de soluciones tecnológicas para la Industria',1),
('Ingeniería en Sistemas y Software','Carrera enfocada en el diseño de softwares que brindan distintas soluciones',1),
('Ingeniería en Telecomunicaciones','Carrera enfocada en el área de las transmisiones de información', 1),
('Ingeniería en Alimentos','Carrera enfocada en transformar los alimentos por medio de procesos químicos',1);

INSERT INTO semestre(NumeroSemestre, idCarrera)
VALUES ('Primer Semestre',1),
('Segundo Semestre',2),('Tercer Semestre',3),
('Cuarto Semestre',4),('Quinto Semestre',5);

INSERT INTO asginatura (NombreAsignatura, NúmeroAsignatura, idSemestre)
VALUES ('Matemáticas 1','CAL-01-301',1),
('Física General 1','FIS-02-502',2),('Inglés 3','IDI-03-703',3),
('Desarrollo Personal','DES-04-904',4),('Bioquímica General','BIO-05-605',5);

INSERT INTO profesorrelataasignatura (idAsignatura,idProfesor)
VALUES (1,1),
(2,2),(3,3),
(4,4),(5,5);

INSERT INTO alumno (Nombre, ApellidoPaterno, ApellidoMaterno, CorreoElectronico, NúmeroDeTelefono, Edad, RUT, TipoAlumno, idCarrera, idUnidadEducativa)
VALUES ('Jaime','Carmona', 'Tapia','J.carmona@gmail.com','+56991234567',18,'19998000-k','Alumno Nuevo', 1,1),
('Javiera','Legrand', 'Jara','Javiera.legrand@hotmail.com','+56989657432',19,'21100000-3','Alumno Registrado', 2,1),
('Lidia','Muñoz', 'Werner','Lidia.m.w@gmail.com','+56963846543',20,'21992947-k','Alumno Registrado', 3,1),
('Claudia','Flores', 'Fabres','C.Flores.Fabres@hmail.com','+56998573621',21,'19998000-k','Alumno Registrado', 4,1),
('Raul','Rivas', 'Galan','Raul.Rivas@gmail.com','+56992346789',22,'21998000-k','Alumno Registrado', 5,1);

INSERT INTO alumnoinscribeasignaturas(IdAlumno, idAsignatura)
VALUES (1,1),
(2,2),(3,3),
(4,4),(5,5);


SELECT asi.NombreAsignatura as AsignaturaImpartida, asi.NúmeroAsignatura, pro.Nombre as NombreProfesor, pro.TituloProfesional, rel.idAsignatura, rel.idProfesor, rel.idProfesorRelataAsignatura
FROM profesorrelataasignatura AS rel
INNER JOIN profesor AS pro
ON rel.idProfesor= pro.idProfesor
INNER JOIN asginatura  AS asi
ON rel.idAsignatura = asi.idAsginatura;



SELECT asi.NombreAsignatura as AsignaturaSeleccionada, asi.NúmeroAsignatura as IdenticadorAsignatura, al.Nombre as NombreAlumno, al.Edad as EdadAlumno, al.CorreoElectronico as CorreoAlumno, ali.IdAlumno, ali.idAsignatura
FROM alumnoinscribeasignaturas AS ali
INNER JOIN  alumno AS al
ON ali.IdAlumno= al.idAlumno
INNER JOIN asginatura AS asi
ON ali.idAsignatura = asi.idAsginatura;

CREATE VIEW DatosAlumno AS
SELECT al.Nombre as NombreAlumno, al.ApellidoPaterno, al.ApellidoMaterno, al.CorreoElectronico, al.Edad as EdadAlumno, al.NúmeroDeTelefono, al.TipoAlumno
FROM alumno AS al;

CREATE VIEW DatosProfesor AS
SELECT pro.idProfesor, pro.Nombre as NombreProfesor, pro.ApellidoPaterno, pro.TituloProfesional
FROM profesor AS pro;

