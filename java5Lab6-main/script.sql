USE [master]
GO
/****** Object:  Database [lab5]    Script Date: 5/27/2024 9:36:17 PM ******/
CREATE DATABASE [lab5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lab5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\lab5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'lab5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\lab5_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [lab5] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lab5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lab5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lab5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lab5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lab5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lab5] SET ARITHABORT OFF 
GO
ALTER DATABASE [lab5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lab5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lab5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lab5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lab5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lab5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lab5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lab5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lab5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lab5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [lab5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lab5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lab5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lab5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lab5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lab5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lab5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lab5] SET RECOVERY FULL 
GO
ALTER DATABASE [lab5] SET  MULTI_USER 
GO
ALTER DATABASE [lab5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lab5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lab5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lab5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [lab5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [lab5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'lab5', N'ON'
GO
ALTER DATABASE [lab5] SET QUERY_STORE = OFF
GO
USE [lab5]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/27/2024 9:36:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Usernames] [varchar](50) NOT NULL,
	[Passwords] [varchar](50) NULL,
	[Emails] [varchar](50) NULL,
	[Images] [varchar](50) NULL,
	[Activated] [bit] NULL,
	[Admins] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Usernames] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 5/27/2024 9:36:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[Id] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/27/2024 9:36:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Prices] [float] NULL,
	[Quantitys] [int] NULL,
	[OrderIds] [int] NULL,
	[ProductIds] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/27/2024 9:36:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [date] NULL,
	[Adress] [nvarchar](50) NULL,
	[Usernames] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/27/2024 9:36:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Idsp] [int] IDENTITY(1,1) NOT NULL,
	[Names] [nvarchar](50) NULL,
	[Images] [varchar](50) NULL,
	[Prices] [float] NULL,
	[Create_date] [date] NULL,
	[Avaliable] [bit] NULL,
	[Id] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Idsp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Usernames], [Passwords], [Emails], [Images], [Activated], [Admins]) VALUES (N'user1', N'password1', N'user1@example.com', N'user1.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Usernames], [Passwords], [Emails], [Images], [Activated], [Admins]) VALUES (N'user10', N'password10', N'user10@example.com', N'user10.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Usernames], [Passwords], [Emails], [Images], [Activated], [Admins]) VALUES (N'user2', N'password2', N'user2@example.com', N'user2.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Usernames], [Passwords], [Emails], [Images], [Activated], [Admins]) VALUES (N'user3', N'password3', N'user3@example.com', N'user3.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Usernames], [Passwords], [Emails], [Images], [Activated], [Admins]) VALUES (N'user4', N'password4', N'user4@example.com', N'user4.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Usernames], [Passwords], [Emails], [Images], [Activated], [Admins]) VALUES (N'user5', N'password5', N'user5@example.com', N'user5.jpg', 0, 0)
INSERT [dbo].[Accounts] ([Usernames], [Passwords], [Emails], [Images], [Activated], [Admins]) VALUES (N'user6', N'password6', N'user6@example.com', N'user6.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Usernames], [Passwords], [Emails], [Images], [Activated], [Admins]) VALUES (N'user7', N'password7', N'user7@example.com', N'user7.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Usernames], [Passwords], [Emails], [Images], [Activated], [Admins]) VALUES (N'user8', N'password8', N'user8@example.com', N'user8.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Usernames], [Passwords], [Emails], [Images], [Activated], [Admins]) VALUES (N'user9', N'password9', N'user9@example.com', N'user9.jpg', 1, 0)
GO
INSERT [dbo].[Categorys] ([Id], [Name]) VALUES (N'', N'')
INSERT [dbo].[Categorys] ([Id], [Name]) VALUES (N'Cat1', N'Category 1')
INSERT [dbo].[Categorys] ([Id], [Name]) VALUES (N'Cat2', N'Category 2')
INSERT [dbo].[Categorys] ([Id], [Name]) VALUES (N'Cat3', N'Category 3')
INSERT [dbo].[Categorys] ([Id], [Name]) VALUES (N'Cat6', N'Category 69')
INSERT [dbo].[Categorys] ([Id], [Name]) VALUES (N'Cat7', N'Category 7')
INSERT [dbo].[Categorys] ([Id], [Name]) VALUES (N'Cat8', N'Category 8')
INSERT [dbo].[Categorys] ([Id], [Name]) VALUES (N'Cat9', N'Ði?n tho?i')
INSERT [dbo].[Categorys] ([Id], [Name]) VALUES (N'dâsfdssdfs', N'Category 3')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Idsp], [Names], [Images], [Prices], [Create_date], [Avaliable], [Id]) VALUES (1, N'Product 1', N'product1.jpg', 19.99, CAST(N'2023-01-01' AS Date), 1, N'Cat1')
INSERT [dbo].[Products] ([Idsp], [Names], [Images], [Prices], [Create_date], [Avaliable], [Id]) VALUES (2, N'Product 2', N'product2.jpg', 24.99, CAST(N'2023-02-15' AS Date), 1, N'Cat2')
INSERT [dbo].[Products] ([Idsp], [Names], [Images], [Prices], [Create_date], [Avaliable], [Id]) VALUES (3, N'Product 3', N'product3.jpg', 12.5, CAST(N'2023-03-30' AS Date), 1, N'Cat1')
INSERT [dbo].[Products] ([Idsp], [Names], [Images], [Prices], [Create_date], [Avaliable], [Id]) VALUES (4, N'Product 4', N'product4.jpg', 35.75, CAST(N'2023-05-10' AS Date), 1, N'Cat3')
INSERT [dbo].[Products] ([Idsp], [Names], [Images], [Prices], [Create_date], [Avaliable], [Id]) VALUES (5, N'Product 5', N'product5.jpg', 9.99, CAST(N'2023-06-20' AS Date), 0, N'Cat2')
INSERT [dbo].[Products] ([Idsp], [Names], [Images], [Prices], [Create_date], [Avaliable], [Id]) VALUES (6, N'Product 6', N'product6.jpg', 29.99, CAST(N'2023-08-01' AS Date), 1, N'Cat1')
INSERT [dbo].[Products] ([Idsp], [Names], [Images], [Prices], [Create_date], [Avaliable], [Id]) VALUES (7, N'Product 7', N'product7.jpg', 15.25, CAST(N'2023-09-15' AS Date), 1, N'Cat3')
INSERT [dbo].[Products] ([Idsp], [Names], [Images], [Prices], [Create_date], [Avaliable], [Id]) VALUES (8, N'Product 8', N'product8.jpg', 22.5, CAST(N'2023-11-01' AS Date), 1, N'Cat2')
INSERT [dbo].[Products] ([Idsp], [Names], [Images], [Prices], [Create_date], [Avaliable], [Id]) VALUES (9, N'Product 9', N'product9.jpg', 17.75, CAST(N'2023-12-10' AS Date), 1, N'Cat1')
INSERT [dbo].[Products] ([Idsp], [Names], [Images], [Prices], [Create_date], [Avaliable], [Id]) VALUES (10, N'Product 10', N'product10.jpg', 14.99, CAST(N'2024-01-01' AS Date), 1, N'Cat3')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderIds])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductIds])
REFERENCES [dbo].[Products] ([Idsp])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Usernames])
REFERENCES [dbo].[Accounts] ([Usernames])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Id])
REFERENCES [dbo].[Categorys] ([Id])
GO
USE [master]
GO
ALTER DATABASE [lab5] SET  READ_WRITE 
GO
