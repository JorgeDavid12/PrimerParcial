--1

create view  viewEmpleados as (
select e.Nombre,
	e.Apellido,
	d.Nombre as NombreDepartamento
from tblEmpleados e 
inner join tblDepartamentos d on e.DepartamentoID = d.DepartamentoID
where e.Estado = 'Activo'
);
GO

create view  viewEmpleado2 as (
select e.Nombre,
	e.Apellido,
	p.SalarioNeto
from tblEmpleados e 
inner join tblPagos p on p.EmpleadoID = e.EmpleadoID
where e.Estado = 'Activo' and p.CantidadHorasExtras > 0
);
GO

--revisar
--mostrar la cantidad total de horas extras pagadas a empleados activos agrupados por departamento 
create view  viewEmpleado3 as (
select d.Nombre,
sum(p.CantidadHorasExtras) as CantidadHorasExtrasPagadas
from tblEmpleados e 
inner join tblPagos p on p.EmpleadoID = e.EmpleadoID
inner join tblDepartamentos d on d.DepartamentoID = e.DepartamentoID
where e.Estado = 'Activo'
group by d.Nombre
);
GO

--revisar
--listar a los empleados que trabajan en el departamento de tecnologia y tiene un salario mayor a 3000
create view  viewEmpleado4 as (
select e.Nombre,
e.Apellido,
e.Estado,
e.FechaContratacion,
e.PuestoTrabajo,
e.Salario
from tblEmpleados e 
--inner join tblPagos p on p.EmpleadoID = e.EmpleadoID
inner join tblDepartamentos d on d.DepartamentoID = e.DepartamentoID
where d.Nombre = 'Tecnología' and e.Salario > 3000
);
GO
select * from tblDepartamentos;
--revisar
--lista los pagos realizados a empleados con estado activo
create view  viewEmpleado5 as (
select e.Nombre,
e.Apellido,
e.Estado,
e.Salario,
p.SalarioNeto,
p.FechaPago
from tblEmpleados e 
inner join tblPagos p on p.EmpleadoID = e.EmpleadoID
--inner join tblDepartamentos d on d.DepartamentoID = e.DepartamentoID
where e.Estado = 'Activo'
);
GO


--create view  viewEmpleado6 as (
--select d.Nombre as NombreDepartamento, 
--e.Nombre as NombreEmpleado,

--from tblEmpleados e 
--inner join tblPagos p on p.EmpleadoID = e.EmpleadoID
--inner join tblDepartamentos d on d.DepartamentoID = e.DepartamentoID
--where e.Estado = 'Activo'
--);
--GO

