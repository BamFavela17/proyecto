use master
go
if exists(select * from sysdatabases where name = 'SGNDB')
	drop database SGNDB
go
---CREACION DE LA BASE DE DATOS---
create database SGNDB
on primary
(
name= SGNDB_dat, filename = 'C:\DB\SGNDB.mdf',
size = 100MB,
maxsize = 700MB,
filegrowth = 10%
)
log on
(
name= SGNDB_log, filename = 'C:\DB\SGNDB.ldf',
size = 100MB,
maxsize = 700MB,
filegrowth = 10%
)
go
use SGNDB
go
-- Creacion de tablas--
create table Cargo(
idC int identity(1,1) primary key,
Cargo Varchar(50),
Funciones text,
Sueldo money
)
go
			-- procedimiento insertar --
			create proc PA_insertarCargo
			@Cargo varchar(50),
			@funcion text,
			@sueldo money
			as
			insert into Cargo(Cargo, Funciones, sueldo) values(@Cargo, @funcion, @sueldo)
			print 'Cargo insertado con exito.'
			go
			-- procedimiento modificar --
			Create proc PA_ModCargo
			@id int,
			@Cargo varchar(50),
			@funcion text,
			@sueldo money
			as
			update Cargo set Cargo=@Cargo, Funciones=@funcion, sueldo=@sueldo where idC = @id
			go
			-- procedimiento borrar --
			Create proc PA_BorrarCArgo
			@id int
			as
			delete from Cargo where idC = @id
			go
			-- procedimiento seleccionar --
			Create proc Ver_Cargos
			as
			select * from Cargo
			go
-- tabla empleados--
create table Empleados(
idE int identity(1,1) primary key,
Nombre varchar(60),
Apellido varchar(60),
Lada char(3) check(Lada like '%+%[0-9]%[0-9]%'),
Telefono char(10),
Correo varchar(90) check (Correo like '%_%@%_%.%_') unique,
Sexo char(1)check (Sexo in('M','F')),
ciudad varchar(80),
idCargo int references Cargo(idC),
Fecha_contratado date,
FechaNacimiento date,
)
go
           -- procedimiento insertar Como admin--
			Create proc PA_insertarEmpleados
			@Nombre varchar(60),
			@Apellido varchar(60),
			@Lada char(3),
			@Telefono char(10),
			@Correo varchar(90),
			@Sexo char(1),
			@idCargo int,
			@ciudad varchar(80),
			@Fecha_contratado date,
			@FechaNacimiento date
			as
			insert into Empleados(Nombre,Apellido,Lada,Telefono,Correo,Sexo,idCargo,ciudad,Fecha_contratado,FechaNacimiento)
			values (@Nombre,@Apellido,@Lada,@Telefono,@Correo,@Sexo,@idCargo,@ciudad,@Fecha_contratado,@FechaNacimiento)
			go
			-- procedimiento modificar --
			Create proc PA_modificarEmpleadosA
			@id int,
			@Nombre varchar(60),
			@Apellido varchar(60),
			@Lada char(3),
			@Telefono char(10),
			@Correo varchar(90),
			@Sexo char(1),
			@idCargo int,
			@ciudad varchar(80),
			@Fecha_contratado date,
			@FechaNacimiento date
			as
			update Empleados set Nombre=@Nombre,Apellido=@Apellido,Lada=@Lada,Telefono=@Telefono,Correo=@Correo,Sexo=@Sexo,
			idCargo=@idCargo,ciudad=@ciudad,Fecha_contratado=@Fecha_contratado,FechaNacimiento=@FechaNacimiento where idE=@id
			go
			-- procedimiento modificar --
			Create proc PA_modificarEmpleados
			@id int,
			@Nombre varchar(60),
			@Apellido varchar(60),
			@Lada char(3),
			@Telefono char(10),
			@Correo varchar(90),
			@Sexo char(1),
			@ciudad varchar(80),
			@Fecha_contratado date,
			@FechaNacimiento date
			as
			update Empleados set Nombre=@Nombre,Apellido=@Apellido,Lada=@Lada,Telefono=@Telefono,Correo=@Correo,Sexo=@Sexo,
			ciudad=@ciudad,Fecha_contratado=@Fecha_contratado,FechaNacimiento=@FechaNacimiento where idE=@id
			go
			-- procedimiento borrar --
			Create proc PA_borrarEmpleados
			@id int
			as
			delete from Empleados where idE = @id
			go
			-- procedimiento seleccionar --
            Create proc ListadoEmpleados
			as
			select * from Empleados
			go
-- tabla proveedores--
create table Proveedores(
idPr int identity(1,1) primary key,
Nombre varchar(60),
Apellido varchar(60),
Lada char(3) check(Lada like '%+%[0-9]%[0-9]%'),
Telefono char(10),
Correo varchar(90) check (Correo like '%_%@%_%.%_') unique,
Sexo char(1),
Empresa varchar(50),
Ciudad varchar(60)
)
go
			-- procedimiento insertarProveedores --
			Create proc PA_insertarProveedores
		    @Nombre varchar(60),
			@Apellido varchar(60),
			@Lada char(3),
			@Telefono char(10),
			@Correo varchar(90),
			@Sexo char(1),
			@Empresa varchar(50),
			@ciudad varchar(80)
			as
			insert into Proveedores(Nombre,Apellido,Lada,Telefono,Correo,Sexo,Empresa,ciudad)
			values (@Nombre,@Apellido,@Lada,@Telefono,@Correo,@Sexo,@Empresa,@ciudad)
			go
			-- procedimiento modificarProveedores --
			Create proc PA_modificarProveedores
			@id int,
		    @Nombre varchar(60),
			@Apellido varchar(60),
			@Lada char(3),
			@Telefono char(10),
			@Correo varchar(90),
			@Sexo char(1),
			@Empresa varchar(50),
			@ciudad varchar(80)
			as
			update Proveedores set Nombre=@Nombre,Apellido=@Apellido,Lada=@Lada,Telefono=@Telefono,Correo=@Correo,Sexo=@Sexo,
			Empresa=@Empresa ,ciudad=@ciudad where idPr=@id
			go
			-- procedimiento borrarProveedores --
			Create proc PA_borrarProveedores
			@id int
			as
			delete from Proveedores where idPr=@id
			go
			-- procedimiento ListadoProveedores --
			Create proc ListadoProveedores
			as
			select * from Proveedores
			go
-- tabla Categoria --
create table Categoria(
idCate int identity(1,1) primary key,
Categoria varchar(60),
Descripcion text
)
go
			-- procedimiento insertarCategoria --
			Create proc PA_
			@Categoria varchar(60),
			@Descripcion text
			as
			insert into Categoria(Categoria,Descripcion) values(@Categoria,@Descripcion)
			go
			-- procedimiento modificarCategoria --
			Create proc PA_modificarCategoria
			@id int,
			@Categoria varchar(60),
			@Descripcion text
			as
			update Categoria set Categoria=@Categoria,Descripcion=@Descripcion where idCate=@id
			go
			-- procedimiento borrarCategoria --
			Create proc PA_borrarCategoria
			@id int
			as
			delete from Categoria where idCate = @id
			go
			-- procedimiento ListadoCategoria --
			Create proc ListadoCategoria
			as
			select * from Categoria
			go
-- tabla producto --
create table Productos(
idP int identity(1,1) primary key,
Nombre varchar(80),
idCate int references Categoria(idCate),
Costo money,
PrecioUnidad money,
Stock int,
Descripcion text
)
go
			-- procedimiento insertarProductos --
			Create proc PA_insertarProductos
			@Nombre varchar(80),
			@idCate int,
			@Costo money,
			@PrecioUnidad money,
			@Stock int,
			@Descripcion text
			as
			insert into Productos(Nombre,idCate,Costo,PrecioUnidad,Stock,Descripcion)
			values(@Nombre,@idCate,@Costo,@PrecioUnidad,@Stock,@Descripcion)
			go
			-- procedimiento modificarProductos --
			Create proc PA_modificarProductos
			@id int,
			@Nombre varchar(80),
			@idCate int,
			@Costo money,
			@PrecioUnidad money,
			@Stock int,
			@Descripcion text
			as
			update Productos set Nombre=@Nombre,idCate=@idCate,Costo=@Costo,PrecioUnidad=@PrecioUnidad,Stock=@Stock,Descripcion=@Descripcion
			where idP = @id
			go
			-- procedimiento borrarProductos --
			Create proc PA_borrarProductos
			@id int
			as
			delete from Productos where idP = @id
			go
			-- procedimiento listadoProductos --
			Create proc listadoProductos
			as
			select * from Productos
			go
-- tabla clientes--
create table Clientes(
idC int identity(1,1) primary key,
Nombre varchar(60),
Apellido varchar(60),
Lada char(3) check(Lada like '%+%[0-9]%[0-9]%'),
Telefono char(10),
Correo varchar(90) check (Correo like '%_%@%_%.%_') unique,
Sexo char(1),
Fecha_membrecia date,
ciudad varchar(80)
)
go
			-- procedimiento insertarClientes --
			Create proc PA_insertarClientes
			@Nombre varchar(60),
            @Apellido varchar(60),
			@Lada char(3),
			@Telefono char(10),
			@Correo varchar(90),
			@Sexo char(1),
			@Fecha date,
			@ciudad varchar(80)
			as
			insert into Clientes(Nombre,Apellido,Lada,Telefono,Correo,Sexo,Fecha_membrecia,ciudad) 
			values(@Nombre,@Apellido,@Lada,@Telefono,@Correo,@Sexo,@Fecha,@ciudad)
			go
			-- procedimiento modificarClientes --
			Create proc PA_modificarClientes
			@Nombre varchar(60),
            @Apellido varchar(60),
			@Lada char(3),
			@Telefono char(10),
			@Correo varchar(90),
			@Sexo char(1),
			@Fecha date,
			@ciudad varchar(80),
			@id int
			as
			update Clientes set Nombre=@Nombre ,Apellido=@Apellido ,Lada=@Lada ,Telefono=@Telefono ,Correo=@Correo ,Sexo=@Sexo ,Fecha_membrecia=@Fecha ,ciudad=@ciudad 
			where idC = @id
			go
			-- procedimiento borrarClientes --
			Create proc PA_borrarClientes
			@id int
			as
			delete from Clientes where idC=@id
			go
			-- procedimiento ListadoClientes --
			Create proc ListadoClientes
			as
			select * from Productos
			go
-- tabla interes --
create table Interes(
PorcentajeInteres int primary key
)
go
			-- procedimiento insertarInteres --
			Create proc PA_insertarInteres
			@interes int
			as
			insert into Interes(PorcentajeInteres) values(@interes)
			go
			-- procedimiento modificarInteres --
			Create proc PA_modificarInteres
			@id int,
			@interes int
			as
			update Interes set PorcentajeInteres=@interes where PorcentajeInteres=@id
			go
			-- procedimiento borrarInteres --
			Create proc PA_borrarInteres
			@interes int
			as
			delete from Interes where PorcentajeInteres = @interes
			go
			-- procedimiento seleccionarInteres --
			Create proc listadoInteres
			as
			select * from Interes
			go
-- tabla Prestamo--
create table Prestamo(
idPs int identity(1,1) primary key,
idC int references Clientes(idC),
Interes int references Interes(PorcentajeInteres),
PrestamoImporte numeric(10,2),
ImporteTotal numeric(10,2),-- monto ya con interes-- 
FechaInicio date,
CantCuotas int,
Estado char(1),
Descripcion Varchar(500),
FechaReguistro date
)
go
			-- procedimiento insertar --
			Create proc PA_InsertarPrestamo
			@idC int,
			@Interes int,
			@PrestamoImporte numeric(10,2),
			@ImporteTotal numeric(10,2),
			@FechaInicio date,
			@CantCuotas int,
			@Estado char(1),
			@Descripcion Varchar(500),
			@FechaReguistro date
			as
			insert into Prestamo (idC ,Interes ,PrestamoImporte ,ImporteTotal ,FechaInicio,CantCuotas ,Estado ,Descripcion,FechaReguistro)
			values (@idC,@Interes,@PrestamoImporte,@ImporteTotal,@FechaInicio,@CantCuotas,@Estado,@Descripcion,@FechaReguistro)
			go
			-- procedimiento modificar --
			Create proc PA_ModificarPrestamo
			@idp int,
			@idC int,
			@Interes int,
			@PrestamoImporte numeric(10,2),
			@ImporteTotal numeric(10,2),
			@FechaInicio date,
			@CantCuotas int,
			@Estado char(1),
			@Descripcion Varchar(500),
			@FechaReguistro date
			as
			update Prestamo set idC=@idC, Interes=@Interes ,PrestamoImporte=@PrestamoImporte ,ImporteTotal=@ImporteTotal ,FechaInicio=@FechaInicio ,CantCuotas=@CantCuotas ,Estado=@Estado ,Descripcion=@Descripcion ,FechaReguistro=@FechaReguistro 
			where idPs=@idp
			go
			-- procedimiento borrar --
			Create proc PA_BorrrarPrestamo
			@id int
			as
			delete from Prestamo where idPs=@id
			go
			-- procedimiento seleccionar --
			Create proc listadoPrestamo
			as
			select * from Prestamo
			go
-- tabla detallePrestamo--
create table DetallePrestamo(
idDetalle int identity(1,1) primary key,
idPrestamo int references Prestamo(idPs),
Cuota int,
FechaVEncimiento date,
Importe money,
EstadoPago char(2),--pt = pago tario, pa = pago a tiempo -- 
FechaPago date
)
go
			-- procedimiento insertar --
			Create proc PA_InsertDetallePrestamo
			@idDetalle int,
			@idPrestamo int,
			@Cuota int,
			@FechaVEncimiento date,
			@Importe money,
			@EstadoPago char(2), 
			@FechaPago date
			as
			insert into DetallePrestamo(idPrestamo,Cuota,FechaVEncimiento ,Importe,EstadoPago ,FechaPago)
			values(@idPrestamo,@Cuota,@FechaVEncimiento ,@Importe,@EstadoPago ,@FechaPago)
			go
			-- procedimiento modificar --
			Create proc PA_ModificarDetallePrestamo
			@idDetalle int,
			@idPrestamo int,
			@Cuota int,
			@FechaVEncimiento date,
			@Importe money,
			@EstadoPago char(2), 
			@FechaPago date
			as
			update DetallePrestamo set idPrestamo=@idPrestamo ,Cuota=@Cuota ,FechaVEncimiento=@FechaVEncimiento ,Importe=@Importe ,EstadoPago=@EstadoPago ,FechaPago=@FechaPago
			where idDetalle = @idDetalle
			go
			-- procedimiento borrar --
			Create proc PA_BorrarDetallePrestamo
			@idDetalle int
			as
			delete from DetallePrestamo where idDetalle=@idDetalle
			go
			-- procedimiento seleccionar --
			Create proc v_verDetallePrestamo
			as
			select * from DetallePrestamo
			go
-- tabla venta--
create table venta(
idV int identity(1,1) primary key,
FechaVenta date,
HoraVenta time,
idEmpleado int references Empleados(idE),
IdCliente int references Clientes(idC),
Importe money
)
go
			-- procedimiento insertar --
			Create proc PA_Insertventa
			@idV int,
			@FechaVenta date,
			@HoraVenta time,
			@idEmpleado int,
			@IdCliente int ,
			@Importe money
			as
			insert into venta(FechaVenta,HoraVenta,idEmpleado,IdCliente,Importe) values(@FechaVenta,@HoraVenta,@idEmpleado,@IdCliente,@Importe)
			go
			-- procedimiento modificar --
			Create proc PA_Modificarventa
			@idV int,
			@FechaVenta date,
			@HoraVenta time,
			@idEmpleado int,
			@IdCliente int ,
			@Importe money
			as
			update venta set FechaVenta=@FechaVenta ,HoraVenta=@HoraVenta ,idEmpleado=@idEmpleado ,IdCliente=@IdCliente ,Importe=@Importe
			where idV=@idV
			go
			-- procedimiento borrar --
			Create proc PA_Borrarventa
			@idV int
			as
			delete from venta where idV=@idV
			go
			-- procedimiento seleccionar --
			Create proc v_venta

			as
			select * from venta
			go
-- tabla detalleVenta--
create table detalleVenta(
idDv int references Venta(idV)on delete cascade,
idProducto int references Productos(idP),
PrecioUnidad money,
Cantidad int,
Monto as PrecioUnidad * Cantidad
)
go
			-- procedimiento insertar --
			Create proc PA_InsertdetalleVenta
			@idDv int,
			@idp int,
			@precioU money,
			@Cantidad int
			as
			insert into detalleVenta(idDv,idProducto,PrecioUnidad,Cantidad) values(@idDv,@idp,@precioU,@Cantidad)
			go
			-- procedimiento modificar --
			Create proc PA_ModificardetalleVenta
			@id int,
			@idp int,
			@precioU money,
			@Cantidad int,
			@Monto money
			as
			update detalleVenta set idProducto=@idp,PrecioUnidad=@precioU,Cantidad=@Cantidad
			where  idDv =@id
			go
			-- procedimiento borrar --
			Create proc PA_BorrardetalleVenta
			@id int
			as
			delete from detalleVenta where idDv=@id
			go
			-- procedimiento seleccionar --
			Create proc v_listadoDetalleVenta
			as
			select * from detalleVenta
			go
-- tabla compra--
create table compra(
idCom int identity(1,1) primary key,
FechaCompra date,
IDEmpleado int references Empleados(idE),
IDProveedor int references Proveedores(idPr),
Importe money
)
go
			-- procedimiento insertar --
			Create proc PA_Incertcompra
			@idCom int,
			@FechaCompra date,
			@IDEmp int,
			@IDPro int,
			@Importe money
			as
			insert into compra(FechaCompra,IDEmpleado,IDProveedor,Importe)
			values (@FechaCompra,@IDEmp,@IDPro,@Importe)
			go
			-- procedimiento modificar --
			Create proc PA_Modificarcompra
			@idCom int,
			@FechaCompra date,
			@IDEmp int,
			@IDPro int,
			@Importe money
			as
			update compra set FechaCompra=@FechaCompra ,IDEmpleado=@IDEmp ,IDProveedor=@IDPro ,Importe=@Importe
			where idCom = @idCom
			go
			-- procedimiento borrar --
			Create proc PA_Borrarcompra
			@idCom int
			as
			delete from compra where idCom = @idCom
			go
			-- procedimiento seleccionar --
			Create proc v_compra

			as
			select * from compra
			go
--tablas detalleCompra--
create table detalleCompra(
idDc int references Compra(idCom)on delete cascade,
idProducto int references Productos(idP),
PrecioUnidad money,
Cantidad int,
Monto as PrecioUnidad * Cantidad
)
go
			-- procedimiento insertar --
			Create proc PA_InsertdetalleCompra
			@id int,
			@idProducto int,
			@PrecioUnidad money,
			@Cantidad int
			as
			insert into detalleCompra(idProducto, PrecioUnidad, Cantidad) values(@idProducto, @PrecioUnidad, @Cantidad)
			go
			-- procedimiento modificar --
			Create proc PA_ModificardetalleCompra
			@id int,
			@idProducto int,
			@PrecioUnidad money,
			@Cantidad int
			as
			update detalleCompra set idProducto=@idProducto, PrecioUnidad=@PrecioUnidad, Cantidad=@Cantidad where idDc=@id
			go
			-- procedimiento borrar --
			Create proc PA_BorrardetalleCompra
			@id int
			as
			delete from detalleCompra where idDc=@id
			go
			-- procedimiento seleccionar --
			Create proc v_detalleCompra
			as
			select * from detalleCompra
			go
-- tabla Actividad--
create table Actividad(
idA int identity(1,1) primary key,
idEmpleado int references Empleados(idE),
Fecha date,
HoraInicio time,
HoraFin time,
TiempoOnline time
)
go
			-- procedimiento insertar --
			Create proc PA_InsertActividad
			@idA int,
			@idEmpleado int,
			@Fecha date,
			@HoraInicio time,
			@HoraFin time,
			@TiempoOnline time
			as
			insert into Actividad(idEmpleado,Fecha,HoraInicio,HoraFin,TiempoOnline) values(@idEmpleado,@Fecha,@HoraInicio,@HoraFin,@TiempoOnline)
			go
			-- procedimiento modificar --
			Create proc PA_ModificarActividad
			@idA int,
			@idEmpleado int,
			@Fecha date,
			@HoraInicio time,
			@HoraFin time,
			@TiempoOnline time
			as
			update Actividad set idEmpleado=@idEmpleado,Fecha=@Fecha,HoraInicio=@HoraInicio,HoraFin=@HoraFin,TiempoOnline=@TiempoOnline
			where idA = @idA
			go
			-- procedimiento borrar --
			Create proc PA_BorrarActividad
			@idA int
			as
			delete from Actividad where idA=@idA
			go
			-- procedimiento seleccionar --
			Create proc v_Actividad

			as
			select * from Actividad
			go
create table Deuda(
idD int identity(1,1) primary key,
idProvee int references Proveedores(idPr),
ImporteDeuda money,
Interes numeric(10,2),
estadoDeuda char(1),
MontoTotal numeric(10,2),
NumPagos int,
Fh_registro date,
descripcion text
)
go
              -- procedimiento insertar --
			Create proc PA_InsertDeuda
			@idD int,
			@idProvee int,
			@ImporteDeuda money,
			@Interes numeric(10,2),
			@estadoDeuda char(1),
			@MontoTotal numeric(10,2),
			@NumPagos int,
			@Fh_registro date,
			@descripcion text
			as
			insert into Deuda(idProvee,ImporteDeuda,Interes,estadoDeuda,MontoTotal,NumPagos,Fh_registro,descripcion) 
			values(@idProvee ,@ImporteDeuda,@Interes,@estadoDeuda,@MontoTotal,@NumPagos,@Fh_registro,@descripcion)
			go
			-- procedimiento modificar --
			Create proc PA_ModificarDeuda
			@idD int,
			@idProvee int,
			@ImporteDeuda money,
			@Interes numeric(10,2),
			@estadoDeuda char(1),
			@MontoTotal numeric(10,2),
			@NumPagos int,
			@Fh_registro date,
			@descripcion text
			as
			update Deuda set idProvee=@idProvee,ImporteDeuda=@ImporteDeuda,Interes=@Interes,estadoDeuda=@estadoDeuda,MontoTotal=@MontoTotal,NumPagos=@NumPagos,Fh_registro=@Fh_registro,descripcion=@descripcion
			where idD=@idD
			go
			-- procedimiento borrar --
			Create proc PA_BorrarDeuda
			@idD int
			as
			delete from Deuda where idD=@idD
			go
			-- procedimiento seleccionar --
			Create proc v_Deuda
			as
			select * from Deuda
			go
create table DetalleDeuda(
idDD int identity(1,1) primary key,
idDeudea int references Deuda(idD),
Fh_pago date,
importe numeric(10,2),
Fh_limite date
)
go
-- procedimiento insertar --
			Create proc PA_InsertDetalleDeuda
			@idD int,
			@Fh_p date,
			@imp numeric(10,2),
			@Fh_lim date
			as
			insert into DetalleDeuda(idDeudea,Fh_pago,importe,Fh_limite) values(@idD,@Fh_p,@imp,@Fh_lim)
			go
			-- procedimiento modificar --
			Create proc PA_ModificarDetalleDeuda
			@id int,
			@idD int,
			@Fh_p date,
			@imp numeric(10,2),
			@Fh_lim date
			as
			update DetalleDeuda set idDeudea=@idD,Fh_pago=@Fh_p,importe=@imp,Fh_limite=@Fh_lim
			go
			-- procedimiento borrar --
			Create proc PA_BorrarDetalleDeuda
			@id int
			as
			delete from DetalleDeuda where idDD = @id
			go
			-- procedimiento seleccionar --
			Create proc v_DetalleDeuda

			as
			select * from DetalleDeuda
			go
exec ListadoEmpleados
exec Ver_Cargos
exec ListadoProveedores
exec ListadoCategoria
exec ListadoClientes
exec listadoInteres
exec listadoPrestamo
exec v_verDetallePrestamo
exec listadoProductos
exec v_Actividad
exec v_compra
exec v_detalleCompra
exec v_Deuda
exec v_DetalleDeuda
exec v_venta
exec v_listadoDetalleVenta
exec Ver_Cargos 