set SERVEROUTPUT ON;

CREATE table Departamento(
  cod_dep int primary key,
  nombre varchar2(10)
);

create table Empleado(
  cod_emp int primary key,
  nombre varchar2(10),
  salario int not null,
  ano_ing int not null,
  sexo char,
  cod_dep int not null,
  foreign key (cod_dep) references Departamento(cod_dep)
);

create or replace PROCEDURE ingresar(cod int, nombre varchar2 ) is
begin 
  insert into Departamento values(cod,nombre);
end ingresar;

create or replace procedure estadist is
    
    cursor c_sexM is
    select count(1),cod_dep
    from Empleado
    where (sexo='M') group by cod_dep;
    
    cursor c_sexF is
    select count(1),cod_dep
    from Empleado
    where (sexo='F')
    group by cod_dep;
    
    n int;
    dep int;
    
begin

    fetch c_sexM into nM,dep;
    while c_sexM%found
      loop
        DBMS_OUTPUT.PUT_LINE('Depto: ' || dep || ' Hombres: ' || n);
        fetch c_sexM into nM,dep;
      end loop;
      
    fetch c_sexF into n,dep;
    while c_sexF%found
      loop
        DBMS_OUTPUT.PUT_LINE('Depto: ' || dep || ' Hombres: ' || n);
        fetch c_sexF into n,dep;
      end loop;
      
end estadist;

create or replace procedure salaryman(total out int) is
  cursor c_sal is
    select sum(salario), cod_dep
    from Empleado
    group by cod_dep;

  dep int;
  suma int;

begin
  fetch c_sal into suma,dep;
  while c_sal%found
    loop
      DBMS_OUTPUT.PUT_LINE('Depto: ' || dep || ' $' || suma);
      fetch c_sal into suma,dep;
    end loop;
    
    select sum(salario) into total
    from Empleado;
    DBMS_OUTPUT.PUT_LINE('Total : $' || total);
end salaryman;

create or replace procedure impuesto is
  total int;
begin
  salaryman(total);
  total := total*0.1;
  DBMS_OUTPUT.PUT_LINE('Impuestos a pagar : $' || total);
end impuesto;