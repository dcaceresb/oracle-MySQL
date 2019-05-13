Create table Factura(
  cod_fac int primary key,
  fecha date not null
);

Create table Telefono(
	numero int primary key,
	compañia varchar(20) not null
);

Create table Proveedor(
	rut varchar(12) primary key,
	nombre varchar(32) not null,
	representante varchar(32) not null
);

Create table Tiene(
	numero int not null,
	rut varchar(12) not null,
	foreign key (rut) references Proveedor(rut),
	foreign key (numero) references Telefono(numero)
);

Create table Producto(
	cod_prod int primary key,
	nombre varchar(32) not null,
	precio int not null,
	rut varchar(12) not null,
	foreign key (rut) references Proveedor(rut)
)

Create table Cliente(
	cod_beca int primary key,
	nombre varchar(32) not null,
	monto int not null
);

Create table Compra(
	cod_beca int not null,
	cod_prod int not null,
	cod_fac int not null,
 	cantidad int not null,
	foreign key(cod_fac) references Factura(cod_fac),
	foreign key (cod_beca) references Cliente(cod_beca),
	foreign key (cod_prod) references Producto (cod_prod)
);


alter table Producto add tipo_producto varchar(32);

alter table Producto add with check constraint
tipo_producto check ( 
						tipo_producto='alimento'
						or tipo_producto='deporte'
						or tipo_producto='herramientas'
						or tipo_producto='otro'
					);



