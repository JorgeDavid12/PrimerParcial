USE [master]
GO
/****** Object:  Database [db_planilla]    Script Date: 2/03/2025 12:44:31 ******/
CREATE DATABASE [db_planilla]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_planilla', FILENAME = N'C:\SQL Data\db_planilla.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_planilla_log', FILENAME = N'C:\SQL Data\db_planilla_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_planilla] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_planilla].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_planilla] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_planilla] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_planilla] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_planilla] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_planilla] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_planilla] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_planilla] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_planilla] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_planilla] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_planilla] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_planilla] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_planilla] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_planilla] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_planilla] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_planilla] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_planilla] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_planilla] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_planilla] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_planilla] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_planilla] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_planilla] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_planilla] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_planilla] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_planilla] SET  MULTI_USER 
GO
ALTER DATABASE [db_planilla] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_planilla] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_planilla] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_planilla] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_planilla] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_planilla] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_planilla] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_planilla] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_planilla]
GO
/****** Object:  Table [dbo].[tblDepartamentos]    Script Date: 2/03/2025 12:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartamentos](
	[DepartamentoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpleados]    Script Date: 2/03/2025 12:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpleados](
	[EmpleadoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellido] [nvarchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[FechaContratacion] [date] NOT NULL,
	[DepartamentoID] [int] NULL,
	[PuestoTrabajo] [nvarchar](100) NOT NULL,
	[Salario] [decimal](18, 2) NOT NULL,
	[Estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewEmpleados]    Script Date: 2/03/2025 12:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[viewEmpleados] as (
select e.Nombre,
	e.Apellido,
	d.Nombre as NombreDepartamento
from tblEmpleados e 
inner join tblDepartamentos d on e.DepartamentoID = d.DepartamentoID
where e.Estado = 'Activo'
);
GO
/****** Object:  Table [dbo].[tblPagos]    Script Date: 2/03/2025 12:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPagos](
	[PagoID] [int] IDENTITY(1,1) NOT NULL,
	[EmpleadoID] [int] NULL,
	[FechaPago] [date] NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
	[CantidadHorasExtras] [int] NOT NULL,
	[MontoHorasExtras] [decimal](18, 2) NOT NULL,
	[DescuentoImpuesto] [decimal](18, 2) NOT NULL,
	[DescuentoIGSS] [decimal](18, 2) NOT NULL,
	[SalarioNeto] [decimal](18, 2) NOT NULL,
	[Estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewEmpleado2]    Script Date: 2/03/2025 12:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[viewEmpleado2] as (
select e.Nombre,
	e.Apellido,
	p.SalarioNeto
from tblEmpleados e 
inner join tblPagos p on p.EmpleadoID = e.EmpleadoID
where e.Estado = 'Activo' and p.CantidadHorasExtras > 0
);
GO
/****** Object:  View [dbo].[viewEmpleado3]    Script Date: 2/03/2025 12:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[viewEmpleado3] as (
select d.Nombre,
sum(p.CantidadHorasExtras) as CantidadHorasExtrasPagadas
from tblEmpleados e 
inner join tblPagos p on p.EmpleadoID = e.EmpleadoID
inner join tblDepartamentos d on d.DepartamentoID = e.DepartamentoID
where e.Estado = 'Activo'
group by d.Nombre
);
GO
/****** Object:  View [dbo].[viewEmpleado4]    Script Date: 2/03/2025 12:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[viewEmpleado4] as (
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
/****** Object:  View [dbo].[viewEmpleado5]    Script Date: 2/03/2025 12:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[viewEmpleado5] as (
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
SET IDENTITY_INSERT [dbo].[tblDepartamentos] ON 

INSERT [dbo].[tblDepartamentos] ([DepartamentoID], [Nombre], [Estado]) VALUES (1, N'Recursos Humanos', N'Activo')
INSERT [dbo].[tblDepartamentos] ([DepartamentoID], [Nombre], [Estado]) VALUES (2, N'Contabilidad', N'Activo')
INSERT [dbo].[tblDepartamentos] ([DepartamentoID], [Nombre], [Estado]) VALUES (3, N'Tecnología', N'Activo')
INSERT [dbo].[tblDepartamentos] ([DepartamentoID], [Nombre], [Estado]) VALUES (4, N'Marketing', N'Activo')
INSERT [dbo].[tblDepartamentos] ([DepartamentoID], [Nombre], [Estado]) VALUES (5, N'Ventas', N'Activo')
INSERT [dbo].[tblDepartamentos] ([DepartamentoID], [Nombre], [Estado]) VALUES (6, N'Operaciones', N'Activo')
INSERT [dbo].[tblDepartamentos] ([DepartamentoID], [Nombre], [Estado]) VALUES (7, N'Atención al Cliente', N'Activo')
INSERT [dbo].[tblDepartamentos] ([DepartamentoID], [Nombre], [Estado]) VALUES (8, N'Desarrollo', N'Inactivo')
INSERT [dbo].[tblDepartamentos] ([DepartamentoID], [Nombre], [Estado]) VALUES (9, N'Logística', N'Activo')
INSERT [dbo].[tblDepartamentos] ([DepartamentoID], [Nombre], [Estado]) VALUES (10, N'Investigación y Desarrollo', N'Inactivo')
SET IDENTITY_INSERT [dbo].[tblDepartamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpleados] ON 

INSERT [dbo].[tblEmpleados] ([EmpleadoID], [Nombre], [Apellido], [FechaNacimiento], [FechaContratacion], [DepartamentoID], [PuestoTrabajo], [Salario], [Estado]) VALUES (1, N'Juan', N'Pérez', CAST(N'1985-05-10' AS Date), CAST(N'2020-01-15' AS Date), 1, N'Gerente', CAST(3000.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblEmpleados] ([EmpleadoID], [Nombre], [Apellido], [FechaNacimiento], [FechaContratacion], [DepartamentoID], [PuestoTrabajo], [Salario], [Estado]) VALUES (2, N'María', N'González', CAST(N'1990-02-20' AS Date), CAST(N'2019-03-10' AS Date), 2, N'Contadora', CAST(2500.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblEmpleados] ([EmpleadoID], [Nombre], [Apellido], [FechaNacimiento], [FechaContratacion], [DepartamentoID], [PuestoTrabajo], [Salario], [Estado]) VALUES (3, N'Luis', N'Fernández', CAST(N'1982-08-15' AS Date), CAST(N'2021-06-01' AS Date), 3, N'Desarrollador', CAST(4000.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblEmpleados] ([EmpleadoID], [Nombre], [Apellido], [FechaNacimiento], [FechaContratacion], [DepartamentoID], [PuestoTrabajo], [Salario], [Estado]) VALUES (4, N'Ana', N'Martínez', CAST(N'1995-12-30' AS Date), CAST(N'2022-01-20' AS Date), 4, N'Especialista en Marketing', CAST(2800.00 AS Decimal(18, 2)), N'Inactivo')
INSERT [dbo].[tblEmpleados] ([EmpleadoID], [Nombre], [Apellido], [FechaNacimiento], [FechaContratacion], [DepartamentoID], [PuestoTrabajo], [Salario], [Estado]) VALUES (5, N'Carlos', N'López', CAST(N'1988-09-12' AS Date), CAST(N'2020-05-15' AS Date), 5, N'Vendedor', CAST(2200.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblEmpleados] ([EmpleadoID], [Nombre], [Apellido], [FechaNacimiento], [FechaContratacion], [DepartamentoID], [PuestoTrabajo], [Salario], [Estado]) VALUES (6, N'Laura', N'Torres', CAST(N'1993-07-25' AS Date), CAST(N'2021-04-10' AS Date), 6, N'Coordinadora', CAST(3500.00 AS Decimal(18, 2)), N'Inactivo')
INSERT [dbo].[tblEmpleados] ([EmpleadoID], [Nombre], [Apellido], [FechaNacimiento], [FechaContratacion], [DepartamentoID], [PuestoTrabajo], [Salario], [Estado]) VALUES (7, N'Pedro', N'Ramírez', CAST(N'1980-11-05' AS Date), CAST(N'2018-09-30' AS Date), 7, N'Atención al Cliente', CAST(2000.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblEmpleados] ([EmpleadoID], [Nombre], [Apellido], [FechaNacimiento], [FechaContratacion], [DepartamentoID], [PuestoTrabajo], [Salario], [Estado]) VALUES (8, N'Sofía', N'Hernández', CAST(N'1991-03-18' AS Date), CAST(N'2022-08-01' AS Date), 8, N'Ingeniera', CAST(4500.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblEmpleados] ([EmpleadoID], [Nombre], [Apellido], [FechaNacimiento], [FechaContratacion], [DepartamentoID], [PuestoTrabajo], [Salario], [Estado]) VALUES (9, N'Diego', N'Mendoza', CAST(N'1984-10-22' AS Date), CAST(N'2019-07-25' AS Date), 9, N'Logística', CAST(2300.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblEmpleados] ([EmpleadoID], [Nombre], [Apellido], [FechaNacimiento], [FechaContratacion], [DepartamentoID], [PuestoTrabajo], [Salario], [Estado]) VALUES (10, N'Valeria', N'Sánchez', CAST(N'1992-01-01' AS Date), CAST(N'2023-02-15' AS Date), 10, N'Investigadora', CAST(3800.00 AS Decimal(18, 2)), N'Inactivo')
SET IDENTITY_INSERT [dbo].[tblEmpleados] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPagos] ON 

INSERT [dbo].[tblPagos] ([PagoID], [EmpleadoID], [FechaPago], [Monto], [CantidadHorasExtras], [MontoHorasExtras], [DescuentoImpuesto], [DescuentoIGSS], [SalarioNeto], [Estado]) VALUES (1, 1, CAST(N'2023-01-31' AS Date), CAST(3000.00 AS Decimal(18, 2)), 5, CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), CAST(2750.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblPagos] ([PagoID], [EmpleadoID], [FechaPago], [Monto], [CantidadHorasExtras], [MontoHorasExtras], [DescuentoImpuesto], [DescuentoIGSS], [SalarioNeto], [Estado]) VALUES (2, 2, CAST(N'2023-01-31' AS Date), CAST(2500.00 AS Decimal(18, 2)), 2, CAST(80.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(2210.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblPagos] ([PagoID], [EmpleadoID], [FechaPago], [Monto], [CantidadHorasExtras], [MontoHorasExtras], [DescuentoImpuesto], [DescuentoIGSS], [SalarioNeto], [Estado]) VALUES (3, 3, CAST(N'2023-01-31' AS Date), CAST(4000.00 AS Decimal(18, 2)), 4, CAST(160.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(3560.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblPagos] ([PagoID], [EmpleadoID], [FechaPago], [Monto], [CantidadHorasExtras], [MontoHorasExtras], [DescuentoImpuesto], [DescuentoIGSS], [SalarioNeto], [Estado]) VALUES (4, 4, CAST(N'2023-01-31' AS Date), CAST(2800.00 AS Decimal(18, 2)), 3, CAST(120.00 AS Decimal(18, 2)), CAST(280.00 AS Decimal(18, 2)), CAST(140.00 AS Decimal(18, 2)), CAST(2500.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblPagos] ([PagoID], [EmpleadoID], [FechaPago], [Monto], [CantidadHorasExtras], [MontoHorasExtras], [DescuentoImpuesto], [DescuentoIGSS], [SalarioNeto], [Estado]) VALUES (5, 5, CAST(N'2023-01-31' AS Date), CAST(2200.00 AS Decimal(18, 2)), 1, CAST(40.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), CAST(110.00 AS Decimal(18, 2)), CAST(1910.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblPagos] ([PagoID], [EmpleadoID], [FechaPago], [Monto], [CantidadHorasExtras], [MontoHorasExtras], [DescuentoImpuesto], [DescuentoIGSS], [SalarioNeto], [Estado]) VALUES (6, 6, CAST(N'2023-01-31' AS Date), CAST(3500.00 AS Decimal(18, 2)), 6, CAST(240.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(175.00 AS Decimal(18, 2)), CAST(3175.00 AS Decimal(18, 2)), N'Inactivo')
INSERT [dbo].[tblPagos] ([PagoID], [EmpleadoID], [FechaPago], [Monto], [CantidadHorasExtras], [MontoHorasExtras], [DescuentoImpuesto], [DescuentoIGSS], [SalarioNeto], [Estado]) VALUES (7, 7, CAST(N'2023-01-31' AS Date), CAST(2000.00 AS Decimal(18, 2)), 2, CAST(80.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(1820.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblPagos] ([PagoID], [EmpleadoID], [FechaPago], [Monto], [CantidadHorasExtras], [MontoHorasExtras], [DescuentoImpuesto], [DescuentoIGSS], [SalarioNeto], [Estado]) VALUES (8, 8, CAST(N'2023-01-31' AS Date), CAST(4500.00 AS Decimal(18, 2)), 5, CAST(200.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(225.00 AS Decimal(18, 2)), CAST(4025.00 AS Decimal(18, 2)), N'Inactivo')
INSERT [dbo].[tblPagos] ([PagoID], [EmpleadoID], [FechaPago], [Monto], [CantidadHorasExtras], [MontoHorasExtras], [DescuentoImpuesto], [DescuentoIGSS], [SalarioNeto], [Estado]) VALUES (9, 9, CAST(N'2023-01-31' AS Date), CAST(2300.00 AS Decimal(18, 2)), 3, CAST(120.00 AS Decimal(18, 2)), CAST(230.00 AS Decimal(18, 2)), CAST(115.00 AS Decimal(18, 2)), CAST(2075.00 AS Decimal(18, 2)), N'Activo')
INSERT [dbo].[tblPagos] ([PagoID], [EmpleadoID], [FechaPago], [Monto], [CantidadHorasExtras], [MontoHorasExtras], [DescuentoImpuesto], [DescuentoIGSS], [SalarioNeto], [Estado]) VALUES (10, 10, CAST(N'2023-01-31' AS Date), CAST(3800.00 AS Decimal(18, 2)), 4, CAST(160.00 AS Decimal(18, 2)), CAST(380.00 AS Decimal(18, 2)), CAST(190.00 AS Decimal(18, 2)), CAST(3430.00 AS Decimal(18, 2)), N'Activo')
SET IDENTITY_INSERT [dbo].[tblPagos] OFF
GO
ALTER TABLE [dbo].[tblPagos] ADD  DEFAULT ((0)) FOR [CantidadHorasExtras]
GO
ALTER TABLE [dbo].[tblPagos] ADD  DEFAULT ((0.00)) FOR [MontoHorasExtras]
GO
ALTER TABLE [dbo].[tblPagos] ADD  DEFAULT ((0.00)) FOR [DescuentoImpuesto]
GO
ALTER TABLE [dbo].[tblPagos] ADD  DEFAULT ((0.00)) FOR [DescuentoIGSS]
GO
ALTER TABLE [dbo].[tblEmpleados]  WITH CHECK ADD FOREIGN KEY([DepartamentoID])
REFERENCES [dbo].[tblDepartamentos] ([DepartamentoID])
GO
ALTER TABLE [dbo].[tblPagos]  WITH CHECK ADD FOREIGN KEY([EmpleadoID])
REFERENCES [dbo].[tblEmpleados] ([EmpleadoID])
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteEmpleados]    Script Date: 2/03/2025 12:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David
-- Create date: 02/03/2025
-- Description:	Delete
-- =============================================
CREATE PROCEDURE [dbo].[uspDeleteEmpleados] 
	@EmpleadoID int
AS
BEGIN

	SET NOCOUNT ON;

    delete tblEmpleados 
	where EmpleadoID = @EmpleadoID;
END
GO
/****** Object:  StoredProcedure [dbo].[uspInsertEmpleados]    Script Date: 2/03/2025 12:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David
-- Create date: 02/03/2025
-- Description:	Insert
-- =============================================
CREATE PROCEDURE [dbo].[uspInsertEmpleados]
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @FechaNacimiento DATE,
    @FechaContratacion DATE ,
    @DepartamentoID INT,
    @PuestoTrabajo VARCHAR(100) ,
    @Salario DECIMAL(18, 2) ,
    @Estado VARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;

    insert into tblEmpleados(Nombre, Apellido, FechaNacimiento, FechaContratacion, DepartamentoID, PuestoTrabajo, Salario, Estado)
	values(@Nombre,
    @Apellido,
    @FechaNacimiento ,
    @FechaContratacion  ,
    @DepartamentoID ,
    @PuestoTrabajo  ,
    @Salario  ,
    @Estado)
END
GO
/****** Object:  StoredProcedure [dbo].[uspMostrarEmpleados]    Script Date: 2/03/2025 12:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David
-- Create date: 02/03/2025
-- Description:	Mostrar
-- =============================================
CREATE PROCEDURE [dbo].[uspMostrarEmpleados]

AS
BEGIN

	SET NOCOUNT ON;

    select  EmpleadoID,
	Nombre,
    Apellido ,
    FechaNacimiento ,
    FechaContratacion ,
    DepartamentoID,
    PuestoTrabajo ,
    Salario,
    Estado
	from tblEmpleados;
END
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateEmpleados]    Script Date: 2/03/2025 12:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David
-- Create date: 02/03/2025
-- Description:	Update
-- =============================================
CREATE PROCEDURE [dbo].[uspUpdateEmpleados]
	@EmpleadoID int,
	@Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @FechaNacimiento DATE,
    @FechaContratacion DATE ,
    @DepartamentoID INT,
    @PuestoTrabajo VARCHAR(100) ,
    @Salario DECIMAL(18, 2) ,
    @Estado VARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;

    update tblEmpleados
	set
	Nombre = @Nombre, 
	Apellido = @Apellido, 
	FechaNacimiento = @FechaNacimiento, 
	FechaContratacion = @FechaContratacion,
	DepartamentoID = @DepartamentoID, 
	PuestoTrabajo = @PuestoTrabajo,
	Salario = @Salario,
	Estado = @Estado
	where EmpleadoID = @EmpleadoID;
END
GO
USE [master]
GO
ALTER DATABASE [db_planilla] SET  READ_WRITE 
GO
