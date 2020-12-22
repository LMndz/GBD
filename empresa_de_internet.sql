--Universidad Laica Eloy Alfaro de Manabí
--Méndez Lucas Luis Alberto
--Materia: Gestión de base de datos
--Docente y colaborador: Ing. Robert Wilfrido Moreira Centeno, Mg


/* Table cliente */
create table Cliente(
	ID_Cliente Numeric(8) not null,
	Nombre char(256) not null,
	Telefono Numeric(256) not null,
	Direccion char(256) not null,
	constraint PK_Cliente primary key (ID_Cliente)
);


/* Table Contrato */
create table Contrato(
	Num_contrato Numeric(8),
	ID_Cliente Numeric(8) not null,
	ID_Proveedor Numeric(8) not null,
	ID_Plan Numeric(8),
	Fecha date not null,
	constraint PK_Contrato primary key (Num_contrato)
);

/* Table Detalle Contrato */
create table Detalle_Contrato(
	ID_DetalleContrato Numeric(8) not null,
	Num_contrato Numeric(8) not null,
	Descripcion char(256) not null,
	ID_Pago Numeric(8) not null,
	constraint PK_Detalle_Contrato primary key (ID_DetalleContrato)
);

/* Table Pago */
create table Pago(
	ID_Pago Numeric(8) not null,
	Tipo_de_pago char(256) not null,
	constraint PK_Pago primary key (ID_Pago)
);

/* Table Plan */
create table Plan(
	ID_Plan Numeric(8) not null,
	Tipo_de_plan char(256) not null,
	Costo_plan Numeric(8) not null,
	constraint PK_Plan primary key (ID_Plan)
);

/* Table Proveedor */
create table Proveedor(
	ID_Proveedor Numeric(8) not null,
	Nombre char(256) not null,
	ID_Sector Numeric(8) not null,
	constraint PK_Proveedor primary key (ID_Proveedor)
);

/* Table Sector */
create table Sector(
	ID_Sector Numeric(8) not null,
	Nombre char(256) not null,
	ID_Departamento Numeric(8) not null,
	constraint PK_Sector primary key (ID_Sector)
);

/* Table Departamento */
create table Departamento(
	ID_Departamento Numeric(8) not null,
	Nombre char(256) not null,
	ID_Tecnico Numeric(8) not null,
	constraint PK_Departamento primary key (ID_Departamento)
);

/* Table Tecnico */
create table Tecnico(
	ID_Tecnico Numeric(8) not null,
	Nombre char(256) not null,
	ID_Solicitud Numeric(8),
	constraint PK_Tecnico primary key (ID_Tecnico)
);

/* Table Servicio Tecnico */
create table Servicio_Tecnico(
	ID_Solicitud Numeric(8) not null,
	ID_Cliente Numeric(8) not null,
	Descripcion char(256) not null,
	Fecha date not null,
	constraint PK_Solicitud primary key (ID_Solicitud)
);
-- Relaciones con la tabla contrato
alter table Contrato
	add constraint FK_Contrato_Adquiere_Cliente foreign key (ID_Cliente)
	references Cliente (ID_Cliente)
	on delete restrict on update restrict;

alter table Contrato
	add constraint FK_Contrato_Adquiere_Proveedor foreign key (ID_Proveedor)
	references Proveedor (ID_Proveedor)
	on delete restrict on update restrict;

alter table Contrato
	add constraint FK_Contrato_Adquiere_Plan foreign key (ID_Plan)
	references Plan (ID_Plan)
	on delete restrict on update restrict;

-- Relaciones con la tabla detalle contrato
alter table Detalle_Contrato
	add constraint FK_DetalleContrato_Num_contrato foreign key (Num_contrato)
	references Contrato (Num_contrato)
	on delete restrict on update restrict;

alter table Detalle_Contrato
	add constraint FK_DetalleContrato_ID_Pago foreign key (ID_Pago)
	references Pago (ID_Pago)
	on delete restrict on update restrict;

-- Relaciones con la tabla proveedor
alter table Proveedor
	add constraint FK_Proveedor_Sector foreign key (ID_Sector)
	references Sector (ID_Sector)
	on delete restrict on update restrict;

-- Relaciones con la tabla sector
alter table Sector
	add constraint FK_Sector_Departamento foreign key (ID_Departamento)
	references Departamento (ID_Departamento)
	on delete restrict on update restrict;

-- Relaciones con la tabla departamento
alter table Departamento
	add constraint FK_Departamento foreign key (ID_Tecnico)
	references Tecnico (ID_Tecnico)
	on delete restrict on update restrict;

-- Relaciones con la tabla tecnico
alter table Tecnico
	add constraint FK_Tecnico foreign key (ID_Solicitud)
	references Servicio_Tecnico (ID_Solicitud)
	on delete restrict on update restrict;

-- Relaciones con la tabla servicio tecnico
alter table Servicio_Tecnico
	add constraint FK_Servicio_tecnico foreign key (ID_Cliente)
	references Cliente (ID_Cliente)
	on delete restrict on update restrict;


--1
insert into  Pago  values (00000001, 'Efectivo');
insert into  Pago  values (00000002, 'Credito');
--2
insert into  Cliente  values (13125769, 'William Flores', 0123456789, 'Urbirrios');
insert into  Cliente  values (13125734, 'Luis Méndez', 0987654321, 'Jaramisol');
insert into  Cliente  values (13125323, 'Sara Tauriz', 0982448504, 'Costa Azúl');
--3
insert into Plan values (00000001, 'Satelital', 60 );
insert into Plan values (00000002, 'Fibra', 50 );
--4
insert into  Servicio_Tecnico  values (11111, 13125769, 'Sin servicio', '12/12/2020');
insert into  Servicio_Tecnico  values (22222, 13125734, 'Inestabilidad en la conexión', '14/10/2020');
insert into  Servicio_Tecnico  values (33333, 13125323, 'Actualización de equipos', '10/05/2021');
--5
insert into  Tecnico  values (1324, 'Belen Catagua', 22222);
insert into  Tecnico  values (1224, 'Jose Mendoza', 11111);
insert into  Tecnico  values (1244, 'Gabriela Marcillo', 33333 );
--6
insert into Departamento values (00000001, 'Los Esteros', 1324 );
insert into Departamento values (00000002, 'Los Electricos', 1224);
insert into Departamento values (00000003, 'Cuba', 1244);
--7	
insert into  Sector values (1222, 'El paraiso', 00000001);
insert into  Sector values (1333, 'Tarquí', 00000001);
--8
insert into  Proveedor values (12345679, 'Belen Catagua', 1222);
insert into  Proveedor values (12345672, 'Carlos Canseco', 1333);
insert into  Proveedor values (12345671, 'Maria Gomez', 1222);
--9
insert into Contrato values (00000001, 13125769, 12345671, 1, '9/10/20');
insert into Contrato values (00000002, 13125734, 12345679, 1, '10/10/20');
insert into Contrato values (00000003, 13125323, 12345672, 2, '10/10/20');
insert into Contrato values (00000004, 13125734, 12345679, 1, '10/10/20');
insert into Contrato values (00000005, 13125323, 12345672, 2, '9/10/20');
insert into Contrato values (00000006, 13125769, 12345671, 2, '9/10/20');
--10
insert into Detalle_Contrato values (0000011, 00000001, 'para empresa', 1);
insert into Detalle_Contrato values (0000022, 00000002, 'para empresa', 1);
insert into Detalle_Contrato values (0000033, 00000003, 'para familia', 2);
insert into Detalle_Contrato values (0000044, 00000004, 'para empresa', 1);
insert into Detalle_Contrato values (0000055, 00000005, 'para familia', 2);
insert into Detalle_Contrato values (0000066, 00000006, 'para familia', 2);


--Consulta 1
--Cantidad de clientes de la empresa

SELECT count(*)

FROM 
  public.cliente

--Consulta 2
--Cuantos contratos ha firmado cada cliente

SELECT distinct
  cliente.id_cliente, 
  cliente.nombre,
  count(contrato)
FROM 
  public.contrato
  INNER JOIN public.cliente ON cliente.id_cliente = contrato.id_cliente
  GROUP BY cliente.id_cliente;
   
--Consulta 3
--Valor total que paga cada cliente mensualmente 

SELECT 
  cliente.id_cliente AS CI. Cliente, 
  cliente.nombre AS Nombre_cliente, 
  sum(plan.costo_plan) AS Valor_Total_mensual
FROM 
  public.contrato
  INNER JOIN public.cliente ON cliente.id_cliente = contrato.id_cliente 
  INNER JOIN public.plan ON plan.id_plan = contrato.id_plan
   GROUP BY cliente.id_cliente;
   
--Consulta 4
--Clientes que han solicitado servicio tecnico y los respectivos tecnicos que asistieron 

SELECT 
  cliente.nombre AS Nombre_Cliente, 
  tecnico.nombre AS Tecnico_que_atendio
FROM 
  public.servicio_tecnico
  INNER JOIN public.cliente ON cliente.id_cliente = servicio_tecnico.id_cliente 
  INNER JOIN public.tecnico ON servicio_tecnico.id_solicitud = tecnico.id_solicitud





