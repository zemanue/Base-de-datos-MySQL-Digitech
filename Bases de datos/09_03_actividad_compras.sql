/* -- CREACION DE DATABASE--*/
drop database compras;
create database if not exists compras;

use compras;

/*--CREACION DE TABLAS--*/

create table if not exists monedas ( 
	pais varchar(10) primary key,
	nombre varchar(15),	
	pcompra decimal(9,6),
	pventa decimal(9,6)
);

create table if not exists proveedores (
	codp varchar(8) primary key,
	dni varchar(10) unique,
	nombre varchar(20),
	direccion varchar(15),
	tlf varchar(6),
	ciudad varchar(15),
	pais varchar(10) not null,
	foreign key (pais) references monedas (pais)
);

create table if not exists articulos ( 
	coda varchar(8) primary key,
	nombre varchar(20),
	pvp decimal(7,2),
	color varchar(10),
	ctd decimal(7,2),
	iva decimal(7,2)
);

create table if not exists clientes ( 
	codc varchar(8) primary key,
	dni varchar(10) unique,
	nombre varchar(20) unique,
	direccion varchar(15),
	tlf varchar(6)
);

create table if not exists facturas ( 
	nf varchar(4) primary key,
	ctd decimal(7,2),
	fecha date,
	precio decimal(7,2),
	coda varchar(8) ,
	codc varchar(8),
	foreign key (coda) references articulos (coda),
	foreign key (codc) references clientes (codc)
);

create table if not exists suministros  (
	codp varchar(8) not null ,
	coda varchar(8) not null ,
	puc decimal(7,2) not null,
	primary key (codp,coda),
	foreign key (coda) references articulos(coda),
	foreign key (codp) references proveedores (codp)
);



/*--INSERTAR REGISTROS-- */

/* --MONEDAS-- */

insert into monedas values('Alemania','Euro',1,1);
insert into monedas values('Argentina','Peso Argent',0.27844,0.27879);
insert into monedas values('Australia','Dolar austral',0.62331,0.62398);
insert into monedas values('Dinamarca','corona danesa',0.13396,0.82802);
insert into monedas values('EE.UU.','Dolar',0.82768,0.82802);
insert into monedas values('Espana','Euro',1,1);
insert into monedas values('Francia','Euro',1,1);
insert into monedas values('G. Bretana','Libra',1.46351,1.46505);
insert into monedas values('Hungria','Forint',0.003947,0.003964);
insert into monedas values('Japon','Yen',0.007248,0.007251);

/*--PROVEEDORES--*/

insert into proveedores values('p1','1234567801','proveedor uno','C/ uno, 1','111110','Albacete','Espana');
insert into proveedores values('p2','1234567802','proveedor dos','C/ dos, 2','222220','Aalborg','Dinamarca');
insert into proveedores values('p3','1234567803','proveedor tres','C/ tres, 3','333330','Perth','Australia');
insert into proveedores values('p4','1234567804','proveedor cuatro','C/ cuatro, 4','444440','Budapest','Hungria');
insert into proveedores values('p5','1234567805','proveedor cinco','C/ cinco, 5','555550','Hirosima','Japon');
insert into proveedores values('p6','1234567806','proveedor seis','C/ seis, 6','666660','La Plata','Argentina');
insert into proveedores values('p7','1234567807','proveedor siete','C/ siete, 7','777770','Liverpool','G. Bretana');
insert into proveedores values('p8','1234567808','proveedor ocho','C/ ocho, 8','888880','Adelaida','Australia');
insert into proveedores values('p9','1234567809','proveedor nueve','C/ nueve, 9','999990','Alicante','Espana');
insert into proveedores values('p10','1234567810','proveedor diez','C/ diez, 10','000000','Paris','Francia');
insert into proveedores values('p11','1234567811','proveedor once','C/ once, 11','111111','Odense','Dinamarca');
insert into proveedores values('p12','1234567812','proveedor doce','C/ doce, 12','222220','Madrid','Espana');
insert into proveedores values('p13','1234567813','proveedor trece','C/ trece, 13','333330','Paris','Francia');
insert into proveedores values('p14','1234567814','proveedor catorce','C/ catorce, 14','444441','Bonn','Alemania');
insert into proveedores values('p15','1234567815','proveedor quince','C/ quince, 15','555551','Albacete','Espana');


/*--ARTICULOS--*/

insert into articulos values('A1','Articulo uno',10.1,'verde',150,12);
insert into articulos values('A2','Articulo dos',20.2,'azul',350,6);
insert into articulos values('A3','Articulo tres',30.3,'azul',550,6);
insert into articulos values('A4','Articulo cuadro',40.4,'vlanco',1000,12);
insert into articulos values('A5','Articulo cinco',50.5,'negro',500,12);
insert into articulos values('A6','Articulo seis',60.6,'negro',550,12);
insert into articulos values('A7','Articulo siete',70.7,'amarillo',350,6);
insert into articulos values('A8','Articulo ocho',80.8,'rojo',3050,12);
insert into articulos values('A9','Articulo nueve',90.9,'rojo',50,12);
insert into articulos values('A10','Articulo diez',1,'azul',50,6);
insert into articulos values('A11','Articulo once',2,'verde',150,12);
insert into articulos values('A12','Articulo doce',3,'rojo',700,12);
insert into articulos values('A13','Articulo trece',4,'metalico',1350,12);
insert into articulos values('A14','Articulo catorce',5,'blanco',1100,6);
insert into articulos values('A15','Articulo quince',6,'negro',500,12);
insert into articulos values('A16','Articulo dieciseis',7,'ambar',50,12);
insert into articulos values('A17','Articulo diecisiete',8,'ocre',2350,6);
insert into articulos values('A18','Articulo dieciocho',9,'gris',3250,12);
insert into articulos values('A19','Articulo diecinueve',10,'rojo',5000,6);
insert into articulos values('A20','Articulo veinte',11,'azul',300,12);


/*--CLIENTES--*/

insert into clientes values('C1','0123456701','cliente uno','c/ cuno, 1','234546');
insert into clientes values('C2','0123456702','cliente dos','c/ cdos, 2','343434');
insert into clientes values('C3','0123456703','cliente tres','c/ ctres, 3','123455');
insert into clientes values('C4','0123456704','cliente cuatro','c/ ccuatro, 4','445566');
insert into clientes values('C5','0123456705','cliente cinco','c/ cquince, 5','553434');
insert into clientes values('C6','0123456706','cliente seis','c/ cseis, 6','664567');
insert into clientes values('C7','0123456707','cliente siete','c/ csiete, 7','773457');
insert into clientes values('C8','0123456708','cliente ocho','c/ cocho, 8','887865');
insert into clientes values('C9','0123456709','cliente nueve','c/ cnueve, 9','998776');
insert into clientes values('C10','0123456710','cliente diez','c/ cdiez, 10','101010');
insert into clientes values('C11','0123456711','cliente once','c/ conce, 11','111122');
insert into clientes values('C12','0123456712','cliente doce','c/ cdoce, 12','123432');
insert into clientes values('C13','0123456713','cliente trece','c/ ctrece, 13','131323');
insert into clientes values('C14','0123456714','cliente catorce','c/ ccatorce, 14','143442');
insert into clientes values('C15','0123456715','cliente quince','c/ cquince, 15','152345');


/*--FACTURAS--*/

insert into facturas values('1',10,'20121302','350','A1','C1');
insert into facturas values('2',21,'20120412','550','A2','C7');
insert into facturas values('3',80,'20120412','1000','A1','C1');
insert into facturas values('4',23,'20120412','550','A3','C2');
insert into facturas values('5',100,'20120412','446','A1','C3');
insert into facturas values('6',21,'20120521','1150','A4','C4');
insert into facturas values('7',80,'20120531','1040','A4','C5');
insert into facturas values('8',623,'20120721','460','A5','C8');
insert into facturas values('9',5000,'20120810','1350','A8','C9');
insert into facturas values('10',2100,'20120912','1550','A8','C9');
insert into facturas values('11',800,'20120922','1000','A3','C10');
insert into facturas values('12',230,'20121007','234','A10','C2');
insert into facturas values('13',100,'20121112','129','A11','C11');
insert into facturas values('14',1221,'20121121','1350','A12','C3');
insert into facturas values('15',79,'20121210','40','A12','C10');
insert into facturas values('16',523,'201212111','3478','A9','C8');
insert into facturas values('17',5330,'20130110','350','A13','C15');
insert into facturas values('18',1450,'20130122','323','A4','C13');
insert into facturas values('19',121,'20130202','1123','A4','C13');
insert into facturas values('20',446,'20130202','234','A13','C2');
insert into facturas values('21',1100,'20130214','1129','A1','C8');
insert into facturas values('22',251,'20130221','150','A7','C12');
insert into facturas values('23',179,'20130228','400','A10','C12');
insert into facturas values('24',223,'20130210','2178','A2','C3');


/*--SUMINISTROS--*/

insert into suministros values('p13','A1',1234);
insert into suministros values('p13','A4',234);
insert into suministros values('p13','A15',934);
insert into suministros values('p14','A2',724);
insert into suministros values('p14','A3',134);
insert into suministros values('p14','A16',764);
insert into suministros values('p15','A5',334);
insert into suministros values('p15','A6',224);
insert into suministros values('p15','A14',1123);
insert into suministros values('p9','A7',534);
insert into suministros values('p9','A8',134);
insert into suministros values('p9','A13',54);
insert into suministros values('p10','A12',434);
insert into suministros values('p10','A16',674);
insert into suministros values('p10','A4',1134);
insert into suministros values('p11','A18',324);
insert into suministros values('p11','A17',35);
insert into suministros values('p11','A1',456);
insert into suministros values('p11','A3',754);
insert into suministros values('p2','A2',95);
insert into suministros values('p2','A14',134);
insert into suministros values('p3','A5',174);
insert into suministros values('p3','A12',1000);
insert into suministros values('p3','A3',356);
insert into suministros values('p12','A2',77);
insert into suministros values('p12','A7',336);
insert into suministros values('p5','A12',454);
insert into suministros values('p5','A16',1195);
insert into suministros values('p5','A4',634);
insert into suministros values('p6','A1',374);
insert into suministros values('p13','A12',1000);
insert into suministros values('p3','A6',500);