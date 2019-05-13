insert into Factura values (1,'25-08-2017');
insert into Factura values (2,'25-07-2017');

insert into Cliente values (1,'Jorge Perez',666);
insert into Cliente values (2,'La botellita de perez',123456);

insert into Telefono values (12345678,'Vomistar');
insert into Telefono values (87654321,'Ent');

insert into Proveedor values ('19008719-0','Pedro','serrano');
insert into Proveedor values ('18253495-1','Juan','chibolo');

insert into Tiene values (12345678,'19008719-0');
insert into Tiene values (87654321,'19008719-0');

insert into Producto values (3256,'Gato',5000,'18253495-1');
insert into Producto values (123, 'Santa helena',3000,'18253495-1');

insert into Compra values (1,1,3256,10);
insert into Compra values (2,1,123,5);