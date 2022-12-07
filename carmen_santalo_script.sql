--Creamos el esquema de trabajo

create schema practicacsn authorization gdmwhbdt;

-- Creamos la tabla de grupo

create table practicacsn.grupo(
	id_grupo varchar(20) not null, -- PK, FK
	name varchar(20) not null, 
	description varchar(250) null
	
);
-- Creamos la PK de grupo

alter table practicacsn.grupo
add constraint grupo_PK primary key (id_grupo);

-- Creamos la tabla de marca

create table practicacsn.marca(
	id_marca varchar(20) not null, -- PK, FK
	name varchar(20) not null, 
	description varchar(250) null,
	id_grupo varchar(20) not null --FK -> grupo - id_grupo
	
);
-- Creamos la PK de marca

alter table practicacsn.marca
add constraint marca_PK primary key (id_marca);

--Creamos FK que hace referencia a la tabla grupo

alter table practicacsn.marca
add constraint marca_grupo_FK foreign key(id_grupo)
references practicacsn.grupo(id_grupo);

-- Creamos la tabla de modelo de coche

create table practicacsn.modelo_coche(
	id_modelo varchar(20) not null, -- PK --FK --> coche --> id_modelo
	id_marca varchar(20) not null, --FK
	description varchar(250) null
	
);

--Añado columna con el nombre del modelo, porque faltaba en la creación de la tabla

alter table practicacsn.modelo_coche
add column name varchar(20) not null;

-- Creamos la PK de modelo_coche

alter table practicacsn.modelo_coche
add constraint modelo_coche_PK primary key (id_modelo);


--Creamos FK que hace referencia a la tabla marca

alter table practicacsn.modelo_coche
add constraint modelo_coche_marca_FK foreign key(id_marca)
references practicacsn.marca(id_marca);


-- Creamos tabla de empresa_seguro

create table practicacsn.empresa_seguro(
	id_empresa_seguro varchar(20) not null, -- PK 
	name varchar(20) not null, 
	description varchar(250) null
	
);

-- Creamos la PK de modelo_coche

alter table practicacsn.empresa_seguro
add constraint empresa_seguro_PK primary key (id_empresa_seguro);


-- Creamos tabla de poliza
create table practicacsn.poliza(
	id_poliza varchar(30) not null, --PK
	id_empresa_seguro varchar(20) not null, -- FK --> empresa_seguro - id_empresa_seguro
	num_poliza varchar(30) not null, 
	description varchar(250) null
	
);

-- Creamos la PK de modelo_coche

alter table practicacsn.poliza
add constraint poliza_PK primary key (id_poliza);

-- FK que hace referencia a la tabla empresa_seguro

alter table practicacsn.poliza
add constraint poliza_empresa_seguro_FK foreign key(id_empresa_seguro)
references practicacsn.empresa_seguro(id_empresa_seguro);


--Creamos la tabla COCHE

create table practicacsn.coche(
	id_coche varchar(20) not null, -- PK
	color varchar(20) not null,
	matricula varchar(10) not null,
	id_modelo varchar(30) not null, --FK
	id_poliza varchar(30) not null, --FK
	km integer not null,
	dt_compra date not null,
	description varchar(250) null
	
);

-- Modificamos la tabla añadiendo la PK

alter table practicacsn.coche
add constraint coche_PK Primary key (id_coche);



--Añadimos la FK que hace referencia a la tabla modelo_coche

alter table practicacsn.coche
add constraint coche_modelo_FK foreign key(id_modelo)
references practicacsn.modelo_coche(id_modelo);

--Creamos la tabla de tipo de currency

create table practicacsn.currency(
	id_currency varchar(3) not null, -- PK
	name varchar(20) null
	
);

alter table practicacsn.currency
add constraint currency_PK primary key (id_currency);

-- Creamos la tabla de revisiones

create table practicacsn.revisiones(
	id_revision varchar(20) not null, -- PK
	id_coche varchar(20) not null, -- PK, FK
	precio_revision varchar(30) not null, 
	km_revision integer not null,
	dt_revision date not null,
	id_currency varchar(3), --FK
	description varchar(250) null
	
);

alter table practicacsn.revisiones
add constraint revisiones_PK primary key (id_revision, id_coche);

alter table practicacsn.revisiones
add constraint revisiones_coche_FK foreign key(id_coche)
references practicacsn.coche(id_coche);

alter table practicacsn.revisiones
add constraint revisiones_currency_FK foreign key(id_currency)
references practicacsn.currency(id_currency);

--Insert Grupo
insert into practicacsn.grupo (id_grupo, name, description) values('G01','Renault','');
insert into practicacsn.grupo (id_grupo, name, description) values('G02','VW','');
insert into practicacsn.grupo (id_grupo, name, description) values('G03','PSA','');

--Insert Marca
insert into practicacsn.marca (id_marca, name, description, id_grupo) values('B01','Nissan',' ','G01');
insert into practicacsn.marca (id_marca, name, description, id_grupo) values('B02','Mitsubishi',' ','G01');
insert into practicacsn.marca (id_marca, name, description, id_grupo) values('B03','Audi',' ','G02');
insert into practicacsn.marca (id_marca, name, description, id_grupo) values('B04','Seat',' ','G02');
insert into practicacsn.marca (id_marca, name, description, id_grupo) values('B05','Skoda',' ','G02');
insert into practicacsn.marca (id_marca, name, description, id_grupo) values('B06','Dacia',' ','G01');
insert into practicacsn.marca (id_marca, name, description, id_grupo) values('B07','Citroen',' ','G03');
insert into practicacsn.marca (id_marca, name, description, id_grupo) values('B08','Peugeot',' ','G03');
insert into practicacsn.marca (id_marca, name, description, id_grupo) values('B09','Opel',' ','G03');

-- Insert Modelo de coche
insert into practicacsn.modelo_coche (id_modelo, id_marca,  description, name) values('mo01','B01',' ','Micra');
insert into practicacsn.modelo_coche (id_modelo, id_marca,  description, name) values('mo02','B02',' ','Montero');
insert into practicacsn.modelo_coche (id_modelo, id_marca,  description, name) values('mo03','B03',' ','Q2');
insert into practicacsn.modelo_coche (id_modelo, id_marca,  description, name) values('mo04','B04',' ','Ibiza');
insert into practicacsn.modelo_coche (id_modelo, id_marca,  description, name) values('mo05','B05',' ','Octavia');
insert into practicacsn.modelo_coche (id_modelo, id_marca,  description, name) values('mo06','B06',' ','Sandero');
insert into practicacsn.modelo_coche (id_modelo, id_marca,  description, name) values('mo07','B07',' ','C3');
insert into practicacsn.modelo_coche (id_modelo, id_marca,  description, name) values('mo08','B08',' ','308');
insert into practicacsn.modelo_coche (id_modelo, id_marca,  description, name) values('mo09','B09',' ','Corsa');
insert into practicacsn.modelo_coche (id_modelo, id_marca,  description, name) values('mo10','B01',' ','Qashqai');

--Insert empresa_seguros
insert into practicacsn.empresa_seguro (id_empresa_seguro, name,  description) values('seg01','Mapfre','');
insert into practicacsn.empresa_seguro (id_empresa_seguro, name,  description) values('seg02','Allianz','');
insert into practicacsn.empresa_seguro (id_empresa_seguro, name,  description) values('seg03','Mutua','');


--Insert Poliza
insert into practicacsn.poliza (id_poliza, id_empresa_seguro, num_poliza, description) values('po1','seg01','567234956247','');
insert into practicacsn.poliza (id_poliza, id_empresa_seguro, num_poliza, description) values('po2','seg01','567354680012','');
insert into practicacsn.poliza (id_poliza, id_empresa_seguro, num_poliza, description) values('po3','seg01','567203654810','');
insert into practicacsn.poliza (id_poliza, id_empresa_seguro, num_poliza, description) values('po4','seg01','34611402874','');
insert into practicacsn.poliza (id_poliza, id_empresa_seguro, num_poliza, description) values('po5','seg02','34685521976','');
insert into practicacsn.poliza (id_poliza, id_empresa_seguro, num_poliza, description) values('po6','seg02','34632100549','');
insert into practicacsn.poliza (id_poliza, id_empresa_seguro, num_poliza, description) values('po7','seg02','34695782400','');
insert into practicacsn.poliza (id_poliza, id_empresa_seguro, num_poliza, description) values('po8','seg03','agz896250369404','');
insert into practicacsn.poliza (id_poliza, id_empresa_seguro, num_poliza, description) values('po9','seg03','agz896745321084','');
insert into practicacsn.poliza (id_poliza, id_empresa_seguro, num_poliza, description) values('po10','seg03','agz896554410339','');

--Insert Coche
insert into practicacsn.coche (id_coche, color, matricula, id_modelo, id_poliza, km, dt_compra, description) values('C01','blanco','4254 WZV','mo01','po1',5234,'2020-05-22','');
insert into practicacsn.coche (id_coche, color, matricula, id_modelo, id_poliza, km, dt_compra, description) values('C02','rojo','3462 JSQ','mo02','po2',1000,'2020-06-15','');
insert into practicacsn.coche (id_coche, color, matricula, id_modelo, id_poliza, km, dt_compra, description) values('C03','amarillo','9477 JWE','mo03','po3',2530,'2020-07-01','');
insert into practicacsn.coche (id_coche, color, matricula, id_modelo, id_poliza, km, dt_compra, description) values('C04','azul','3602 QAI','mo04','po4',3000,'2021-01-08','');
insert into practicacsn.coche (id_coche, color, matricula, id_modelo, id_poliza, km, dt_compra, description) values('C05','blanco','8693 CHV','mo05','po5',10500,'2021-03-11','');
insert into practicacsn.coche (id_coche, color, matricula, id_modelo, id_poliza, km, dt_compra, description) values('C06','negro','8632 HRS','mo06','po6',2130,'2021-11-23','');
insert into practicacsn.coche (id_coche, color, matricula, id_modelo, id_poliza, km, dt_compra, description) values('C07','rojo','7692 ORU','mo07','po7',11000,'2022-02-28','');
insert into practicacsn.coche (id_coche, color, matricula, id_modelo, id_poliza, km, dt_compra, description) values('C08','verde','4137 RWC','mo08','po8',1500,'2022-07-06','');
insert into practicacsn.coche (id_coche, color, matricula, id_modelo, id_poliza, km, dt_compra, description) values('C09','azul','3789 VQC','mo09','po9',2000,'2022-09-16','');
insert into practicacsn.coche (id_coche, color, matricula, id_modelo, id_poliza, km, dt_compra, description) values('C10','blanco','0831 OFC','mo10','po10',1000,'2022-10-01','');

-- Insert currency
insert into practicacsn.currency (id_currency, name) values('EUR','EURO');
insert into practicacsn.currency (id_currency, name) values('USD','Dólar Americano');
insert into practicacsn.currency (id_currency, name) values('GBP','Libra Esterlina');
insert into practicacsn.currency (id_currency, name) values('JPY','Yen');

-- Insert Revisiones
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R01','C01','120',1000,'2020-11-22','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R02','C01','300',5000,'2021-05-30','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R01','C02','130',1000,'2020-12-28','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R01','C03','175',1000,'2021-01-16','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R01','C04','54',1000,'2021-07-10','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R01','C05','52',1000,'2021-09-01','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R02','C05','350',5000,'2022-01-13','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R03','C05','210',10000,'2022-09-20','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R01','C06','95',1000,'2022-03-15','USD','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R01','C07','80',1000,'2022-04-30','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R02','C07','62',5000,'2022-07-05','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R03','C07','200',10000,'2022-10-12','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R01','C08','78',1000,'2022-10-30','EUR','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R01','C09','89',1000,'2022-10-15','GBP','');
insert into practicacsn.revisiones (id_revision, id_coche, precio_revision,km_revision, dt_revision, id_currency,  description) values('R01','C10','130',1000,'2022-11-15','GBP','');
