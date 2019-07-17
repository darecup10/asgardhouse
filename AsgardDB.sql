USE [master]
GO
/****** Object:  Database [Asgard]    Script Date: 7/17/2019 3:18:51 AM ******/
CREATE DATABASE [Asgard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'asgard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\asgard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'asgard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\asgard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Asgard] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Asgard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Asgard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Asgard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Asgard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Asgard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Asgard] SET ARITHABORT OFF 
GO
ALTER DATABASE [Asgard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Asgard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Asgard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Asgard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Asgard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Asgard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Asgard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Asgard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Asgard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Asgard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Asgard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Asgard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Asgard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Asgard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Asgard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Asgard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Asgard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Asgard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Asgard] SET  MULTI_USER 
GO
ALTER DATABASE [Asgard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Asgard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Asgard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Asgard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Asgard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Asgard] SET QUERY_STORE = OFF
GO
USE [Asgard]
GO
/****** Object:  Table [dbo].[Beer]    Script Date: 7/17/2019 3:18:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beer](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Brand] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[ABV] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Cerveza] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/17/2019 3:18:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Date] [nchar](10) NOT NULL,
	[Adress] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/17/2019 3:18:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[BeerID] [int] NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/17/2019 3:18:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[DNI] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Country] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (1, N'Barley Wine', N'Antares', N'Bronce', N'Argentina', 10, 100)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (2, N'Crem Stout', N'Antares', N'Negra', N'Argentina', 7, 100)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (3, N'Kolsch', N'Antares', N'Dorada', N'Argentina', 5, 100)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (4, N'Scotch', N'Antares', N'Dorada', N'Argentina', 6, 100)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (5, N'Pilsen', N'Polar', N'Negra', N'Venezuela', 5, 300)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (6, N'Solera', N'Polar', N'Dorada', N'Venezuela', 6, 300)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (7, N'Ice', N'Polar', N'Dorada', N'Venezuela', 4, 300)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (8, N'Zulia', N'Regional', N'Dorada', N'Venezuela', 5, 300)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (9, N'Estrella de Galicia 1906', N'Hijos de la Rivera', N'Ambar', N'España', 7, 350)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (10, N'Epidor', N'Moritz', N'Ambar', N'España', 7, 350)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (11, N'Voll-Damm', N'Damm', N'Bronce', N'España', 7, 350)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (12, N'Stout', N'Cuello Negro', N'Negra', N'Chile', 8, 200)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (13, N'Bohemia Reserva', N'Bohemia', N'Rubia', N'Brasil', 10, 200)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (14, N'Torobayo', N'Kustumann', N'Amber', N'Alemania', 5, 400)
INSERT [dbo].[Beer] ([ID], [Name], [Brand], [Type], [Country], [ABV], [Price]) VALUES (15, N'Bock', N'Kustumann', N'Negra', N'Alemania', 6, 400)
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [UserID], [Date], [Adress]) VALUES (1, 95675394, N'17/07/2019', N'Deheza 1668                                                                                         ')
INSERT [dbo].[Order] ([ID], [UserID], [Date], [Adress]) VALUES (2, 95803791, N'19/07/2019', N'Santa Fe 2000                                                                                       ')
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetails] ([OrderID], [BeerID], [Quantity]) VALUES (1, 2, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [BeerID], [Quantity]) VALUES (1, 3, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [BeerID], [Quantity]) VALUES (1, 5, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [BeerID], [Quantity]) VALUES (2, 4, 5)
INSERT [dbo].[OrderDetails] ([OrderID], [BeerID], [Quantity]) VALUES (2, 6, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [BeerID], [Quantity]) VALUES (2, 3, 1)
INSERT [dbo].[User] ([DNI], [Name], [LastName], [Email], [Country]) VALUES (95675394, N'Darelis ', N'Picon', N'darecup10@gmail.com', N'Argentina')
INSERT [dbo].[User] ([DNI], [Name], [LastName], [Email], [Country]) VALUES (95803791, N'Billy', N'Snow', N'billytagzz@gmail.com', N'Argentina')
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Client] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([DNI])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Pedido_Client]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Beer] FOREIGN KEY([BeerID])
REFERENCES [dbo].[Beer] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Beer]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
USE [master]
GO
ALTER DATABASE [Asgard] SET  READ_WRITE 
GO
