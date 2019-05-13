set serveroutput on;

declare
cursor c_emp is
select count(1),avg(salario)
from Empleado
group by(depto);

cant int;
prom number;

begin 
open c_emp;
fetch c_emp into cant, prom;
while c_emp%found
	LOOP
		dbms_output.put_line(cant || ' ' || prom);
		fetch c_emp into cant, prom;
	end loop;

close c_emp;
end;


declare

cursor c_emp is 
select salario
from Empleado;

sal Empleado.salario%TYPE;
q1 int;
q2 int;
q3 int;
q4 int;

begin
	q1=0;
	q2=0;
	q3=0;
	q4=0;
	open c_emp;
	fetch c_emp into sal;
	while c_emp%found
		loop
			if sal<=100 then
				q1=q1+1;
			elsif sal<=300 then
				q2=q2+1;
			elsif sal<=600 then
				q3=q3+1;
			else
				q4=q4+1;
			end if;
			fetch c_emp into sal;	
		end loop;
	dbms_output.put_line('Cuartil 1 : ' || q1);
	dbms_output.put_line('Cuartil 2 : ' || q2);
	dbms_output.put_line('Cuartil 3 : ' || q3);
	dbms_output.put_line('Cuartil 4 : ' || q4);

close c_emp;
end;


declare

cursor c_emp is
select salario
from Empleado
where (salario<300)
for update;

sal Empleado.salario%TYPE;

begin
	open c_emp;
	fetch c_emp into sal;
	while c_emp%found
		loop
			update Empleado
			set salario=sal*1.30;
			where current of c_emp;
			fetch c_emp into sal;
		end loop;
close c_emp;
commit;
end;