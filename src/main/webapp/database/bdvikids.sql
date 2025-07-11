USE [master]
GO
/****** Object:  Database [BDVIKIDS]    Script Date: 12/07/2025 02:59:35 ******/
CREATE DATABASE [BDVIKIDS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDVIKIDS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BDVIKIDS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDVIKIDS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BDVIKIDS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BDVIKIDS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDVIKIDS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDVIKIDS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDVIKIDS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDVIKIDS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDVIKIDS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDVIKIDS] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDVIKIDS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDVIKIDS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDVIKIDS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDVIKIDS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDVIKIDS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDVIKIDS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDVIKIDS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDVIKIDS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDVIKIDS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDVIKIDS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDVIKIDS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDVIKIDS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDVIKIDS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDVIKIDS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDVIKIDS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDVIKIDS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDVIKIDS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDVIKIDS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDVIKIDS] SET  MULTI_USER 
GO
ALTER DATABASE [BDVIKIDS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDVIKIDS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDVIKIDS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDVIKIDS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDVIKIDS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDVIKIDS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BDVIKIDS] SET QUERY_STORE = ON
GO
ALTER DATABASE [BDVIKIDS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BDVIKIDS]
GO
/****** Object:  User [cesar]    Script Date: 12/07/2025 02:59:35 ******/
CREATE USER [cesar] FOR LOGIN [cesar] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [cesar]
GO
/****** Object:  Table [dbo].[administrador]    Script Date: 12/07/2025 02:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrador](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[apellido] [nvarchar](100) NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[contraseña] [nvarchar](255) NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 12/07/2025 02:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[apellido] [nvarchar](100) NOT NULL,
	[dni] [char](8) NOT NULL,
	[telefono] [nvarchar](20) NULL,
	[direccion] [nvarchar](255) NULL,
	[fecha_registro] [datetime] NULL,
	[estado] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 12/07/2025 02:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[nombre_producto] [varchar](100) NULL,
	[cantidad] [int] NOT NULL,
	[precio_unitario] [decimal](10, 2) NOT NULL,
	[subtotal] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 12/07/2025 02:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
	[stock] [int] NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[categoria] [nvarchar](100) NULL,
	[marca] [nvarchar](100) NULL,
	[unidad] [nvarchar](50) NULL,
	[imagen] [nvarchar](255) NULL,
	[activo] [bit] NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[publicado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 12/07/2025 02:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_admin] [int] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
	[descuento] [decimal](10, 2) NULL,
	[igv] [decimal](10, 2) NULL,
	[tipo_pago] [nvarchar](50) NOT NULL,
	[estado] [nvarchar](50) NULL,
	[numero_comprobante] [varchar](20) NULL,
	[tipo_comprobante] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[administrador] ON 

INSERT [dbo].[administrador] ([id], [nombre], [apellido], [usuario], [contraseña], [fecha_creacion], [telefono]) VALUES (1, N'Cesar', N'Suclupe', N'admin', N'$2a$12$v.AIxCALqSEtf2vmDuqR6uwdLgPzQ5B6Xb.QncdCTGjCErva2kclC', CAST(N'2025-06-29T17:06:50.497' AS DateTime), NULL)
INSERT [dbo].[administrador] ([id], [nombre], [apellido], [usuario], [contraseña], [fecha_creacion], [telefono]) VALUES (2, N'Cesar', N'suclupe', N'admin2', N'$2a$12$2ZVwurOPV54W/VPkaUcTrO10cslXMYcDkrUI6And8DRFlc0TXgIkS', CAST(N'2025-07-06T17:47:37.767' AS DateTime), N'937743279')
INSERT [dbo].[administrador] ([id], [nombre], [apellido], [usuario], [contraseña], [fecha_creacion], [telefono]) VALUES (5, N'cesar', N'suclupe', N'cesar', N'$2a$12$lVPF.zfq8zWOmBoXmFMOOOkv.j8wtk.DrkOfGKF7UyuAtrSmUKMr.', CAST(N'2025-07-06T18:00:56.830' AS DateTime), N'937743279')
SET IDENTITY_INSERT [dbo].[administrador] OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id], [nombre], [apellido], [dni], [telefono], [direccion], [fecha_registro], [estado]) VALUES (1, N'Varios', N'Clientes', N'00000000', N'', N'iewruewiriewr', CAST(N'2025-07-09T23:18:19.827' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON 

INSERT [dbo].[producto] ([id], [codigo], [nombre], [descripcion], [stock], [precio], [categoria], [marca], [unidad], [imagen], [activo], [fecha_creacion], [publicado]) VALUES (1, N'uhgvjh', N'jknbjhg', N'jgjkbkjnklhhjk', 50, CAST(20.00 AS Decimal(10, 2)), N'Ropa', N'FantasyKids', N'Par', N'5_Mesa de trabajo 1.jpg', 1, CAST(N'2025-06-29T18:32:05.510' AS DateTime), NULL)
INSERT [dbo].[producto] ([id], [codigo], [nombre], [descripcion], [stock], [precio], [categoria], [marca], [unidad], [imagen], [activo], [fecha_creacion], [publicado]) VALUES (3, N'VJAR32508', N'PANTALON JEANS FLEER ANGIE', N'MODELO FLEER TALLA 08 - 18', 20, CAST(40.00 AS Decimal(10, 2)), N'PANTALON', N'VIKIDS', N'Docena', N'alb1.jpg', 1, CAST(N'2025-06-29T18:40:36.473' AS DateTime), 1)
INSERT [dbo].[producto] ([id], [codigo], [nombre], [descripcion], [stock], [precio], [categoria], [marca], [unidad], [imagen], [activo], [fecha_creacion], [publicado]) VALUES (5, N'EST35208', N'PANTALON ESTER', N'JEANS PALAZZO CON STRASS TALLA 18', 20, CAST(60.00 AS Decimal(10, 2)), N'Ropa', N'FantasyKids', N'Unidad', N'IMG-20250526-WA0009.jpg', 1, CAST(N'2025-07-06T22:42:54.837' AS DateTime), NULL)
INSERT [dbo].[producto] ([id], [codigo], [nombre], [descripcion], [stock], [precio], [categoria], [marca], [unidad], [imagen], [activo], [fecha_creacion], [publicado]) VALUES (6, N'LIZ12308', N'PANTALON LISBET', N'PANTALON JEANS CLASICO COLOR CELESTE', 5, CAST(50.00 AS Decimal(10, 2)), N'PANTALON', N'FantasyKids', N'Unidad', N'alb5.jpg', 1, CAST(N'2025-07-12T01:43:51.200' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__administ__9AFF8FC68E6DEF3D]    Script Date: 12/07/2025 02:59:36 ******/
ALTER TABLE [dbo].[administrador] ADD UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__cliente__D87608A7CC440309]    Script Date: 12/07/2025 02:59:36 ******/
ALTER TABLE [dbo].[cliente] ADD UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__producto__40F9A206D32DE8B1]    Script Date: 12/07/2025 02:59:36 ******/
ALTER TABLE [dbo].[producto] ADD UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[administrador] ADD  CONSTRAINT [DF_fecha_creacion]  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT ('Activo') FOR [estado]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[producto] ADD  CONSTRAINT [DF_producto_fecha]  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT ((0)) FOR [publicado]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT ((0)) FOR [descuento]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT ((0)) FOR [igv]
GO
ALTER TABLE [dbo].[venta] ADD  DEFAULT ('Emitido') FOR [estado]
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD FOREIGN KEY([id_venta])
REFERENCES [dbo].[venta] ([id])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_admin] FOREIGN KEY([id_admin])
REFERENCES [dbo].[administrador] ([id])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_admin]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_cliente]
GO
USE [master]
GO
ALTER DATABASE [BDVIKIDS] SET  READ_WRITE 
GO
