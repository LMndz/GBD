--Universidad Laica Eloy Alfaro de Manabí
--Méndez Lucas Luis Alberto
--Materia: Gestión de base de datos
--Docente y colaborador: Ing. Robert Wilfrido Moreira Centeno, Mg

/* Table Departamento */
create table Departamento(
	ID_departamento numeric(8) not null,
	Nombre_Departamento char(256) not null,
	Direccion_Departamento char(256) not null,
	constraint PK_Departamentos primary key (ID_departamento)
);

/* Table Distribuidor */
create table Distribuidor(
	ID_Distribuidor	Numeric(8) not null,
	Nombre_Distribuidor char(256) not null,
	Departamento_Distribuidor Numeric(8) not null,
	constraint PK_Distribuidor primary key (ID_Distribuidor)
);

/* Table Pago */
create table Pago(
	Tipo_de_pago char(256) not null,
	constraint PK_Pago primary key (Tipo_de_pago)
);

/* Table cliente */
create table Cliente(
	ID_Cliente Numeric(8) not null,
	Nombre_Cliente char(256) not null,
	Edad_Cliente Numeric(256) not null,
	Direccion char(256) not null,
	constraint PK_Cliente primary key (ID_Cliente)
);

/* Table Plan */
create table Plan(
	Tipo_de_plan char(256) not null,
	Costo_plan Numeric(8) not null,
	constraint PK_Plan primary key (Tipo_de_plan)
);

/* Table Contrato */
create table Contrato(
	Num_contrato numeric(8),
	ID_Cliente Numeric(8) not null,
	ID_Distribuidor Numeric(8) not null,
	Plan char(256) not null,
	Pago char(256) not null,
	Fecha date not null,
	constraint PK_Contrato primary key (Num_contrato)
);



alter table Distribuidor
	add constraint FK_Distribuidor_Departamentos foreign key (Departamento_Distribuidor)
	references Departamento (ID_departamento)
	on delete restrict on update restrict;

alter table Contrato
	add constraint FK_Contrato_Adquiere_Cliente foreign key (ID_Cliente)
	references Cliente (ID_Cliente)
	on delete restrict on update restrict;
	
alter table Contrato
	add constraint FK_Contrato_Distribuidor foreign key (ID_Distribuidor)
	references Distribuidor (ID_Distribuidor)
	on delete restrict on update restrict;
	
alter table Contrato
	add constraint FK_Contrato_Plan foreign key (Plan)
	references Plan (Tipo_de_plan)
	on delete restrict on update restrict;
	
alter table Contrato
	add constraint FK_Contrato_Pago foreign key (Pago)
	references Pago (Tipo_de_pago)
	on delete restrict on update restrict;
	
insert into Departamento values (00000001, 'Los Esteros', 'Av.20 calle pepito3');
insert into Departamento values (00000002, 'Los Electricos', 'Av.24 calle 13');
	
insert into  Distribuidor  values (12345678, 'Gabriela Marcillo', 00000001);
insert into  Distribuidor  values (12345679, 'Belen Catagua', 00000002);
insert into  Distribuidor  values (12345670, 'Jose Mendoza', 00000002);
insert into  Distribuidor  values (12345672, 'Carlos Canseco', 00000001);
insert into  Distribuidor  values (12345671, 'Maria Gomez', 00000001);

insert into  Pago  values ('Efectivo');
insert into  Pago  values ('Credito');

insert into  Cliente  values (13125769, 'William Flores', 21, 'Urbirrios');
insert into  Cliente  values (13125734, 'Luis Méndez', 24, 'Jaramisol');

insert into Plan values ('Satelital', 60 );
insert into Plan values ('Fibra', 50 );

insert into Contrato values (00000001, 13125769, 12345678, 'Satelital', 'Efectivo', '9/10/20');
insert into Contrato values (00000002, 13125734, 12345679, 'Fibra', 'Credito', '10/10/20');
insert into Contrato values (00000003, 13125734, 12345670, 'Satelital', 'Efectivo', '10/10/20');
insert into Contrato values (00000004, 13125734, 12345679, 'Satelital', 'Credito', '10/10/20');
insert into Contrato values (00000005, 13125769, 12345679, 'Satelital', 'Efectivo', '9/10/20');
insert into Contrato values (00000006, 13125769, 12345671, 'Fibra', 'Efectivo', '9/10/20');