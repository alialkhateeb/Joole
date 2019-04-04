USE [master]
GO
/****** Object:  Database [Joole]    Script Date: 4/2/2019 4:15:43 PM ******/
CREATE DATABASE [Joole]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Joole', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Joole.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Joole_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Joole_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Joole] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Joole].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Joole] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Joole] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Joole] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Joole] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Joole] SET ARITHABORT OFF 
GO
ALTER DATABASE [Joole] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Joole] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Joole] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Joole] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Joole] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Joole] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Joole] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Joole] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Joole] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Joole] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Joole] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Joole] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Joole] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Joole] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Joole] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Joole] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Joole] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Joole] SET RECOVERY FULL 
GO
ALTER DATABASE [Joole] SET  MULTI_USER 
GO
ALTER DATABASE [Joole] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Joole] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Joole] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Joole] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Joole] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Joole', N'ON'
GO
ALTER DATABASE [Joole] SET QUERY_STORE = OFF
GO
USE [Joole]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 4/2/2019 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCredential]    Script Date: 4/2/2019 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCredential](
	[Credential_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Type] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblCredential] PRIMARY KEY CLUSTERED 
(
	[Credential_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblManufacturer]    Script Date: 4/2/2019 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManufacturer](
	[Manufacturer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer_Name] [nchar](30) NOT NULL,
	[Manufacturer_Department] [nchar](30) NULL,
	[Manufacturer_Web] [nchar](40) NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_tblManufacturer] PRIMARY KEY CLUSTERED 
(
	[Manufacturer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 4/2/2019 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer_ID] [int] NOT NULL,
	[SubCategory_ID] [int] NOT NULL,
	[Product_Name] [nchar](10) NOT NULL,
	[Product_Image] [image] NULL,
	[Series] [nchar](10) NOT NULL,
	[Model] [nchar](25) NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[Characteristics] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubCategory]    Script Date: 4/2/2019 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubCategory](
	[SubCategory_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[SubCategory_Name] [nchar](10) NULL,
	[SubCategoryFilter] [nchar](50) NOT NULL,
 CONSTRAINT [PK_tblSubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblType]    Script Date: 4/2/2019 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UseType] [nchar](10) NULL,
	[Application] [nchar](10) NULL,
	[MountingLocation] [nchar](10) NULL,
	[Accessories] [nchar](10) NULL,
	[ModelYear] [nchar](10) NULL,
 CONSTRAINT [PK_tblType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 4/2/2019 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nchar](30) NOT NULL,
	[User_Email] [nchar](30) NOT NULL,
	[User_Image] [image] NULL,
	[User_Password] [nchar](30) NOT NULL,
	[Credential_ID] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([Category_ID], [Category_Name]) VALUES (1, N'Mechanical')
INSERT [dbo].[tblCategory] ([Category_ID], [Category_Name]) VALUES (2, N'Electrical')
INSERT [dbo].[tblCategory] ([Category_ID], [Category_Name]) VALUES (3, N'Stationary')
INSERT [dbo].[tblCategory] ([Category_ID], [Category_Name]) VALUES (4, N'Furniture ')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblCredential] ON 

INSERT [dbo].[tblCredential] ([Credential_ID], [User_Type]) VALUES (1, N'Consumers ')
INSERT [dbo].[tblCredential] ([Credential_ID], [User_Type]) VALUES (2, N'Customers ')
INSERT [dbo].[tblCredential] ([Credential_ID], [User_Type]) VALUES (3, N'Admin     ')
SET IDENTITY_INSERT [dbo].[tblCredential] OFF
SET IDENTITY_INSERT [dbo].[tblManufacturer] ON 

INSERT [dbo].[tblManufacturer] ([Manufacturer_ID], [Manufacturer_Name], [Manufacturer_Department], [Manufacturer_Web], [User_ID]) VALUES (1, N'Feedmix                       ', N'Marketing                     ', NULL, 1)
INSERT [dbo].[tblManufacturer] ([Manufacturer_ID], [Manufacturer_Name], [Manufacturer_Department], [Manufacturer_Web], [User_ID]) VALUES (2, N'Topicblab                     ', N'Legal                         ', NULL, 2)
INSERT [dbo].[tblManufacturer] ([Manufacturer_ID], [Manufacturer_Name], [Manufacturer_Department], [Manufacturer_Web], [User_ID]) VALUES (3, N'Yambee                        ', N'Training                      ', NULL, 3)
INSERT [dbo].[tblManufacturer] ([Manufacturer_ID], [Manufacturer_Name], [Manufacturer_Department], [Manufacturer_Web], [User_ID]) VALUES (4, N'Skajo                         ', N'Product Management            ', NULL, 3)
INSERT [dbo].[tblManufacturer] ([Manufacturer_ID], [Manufacturer_Name], [Manufacturer_Department], [Manufacturer_Web], [User_ID]) VALUES (5, N'Zoomcast                      ', N'Business Development          ', NULL, 4)
SET IDENTITY_INSERT [dbo].[tblManufacturer] OFF
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([Product_ID], [Manufacturer_ID], [SubCategory_ID], [Product_Name], [Product_Image], [Series], [Model], [ProductTypeID], [Characteristics]) VALUES (1, 1, 1, N'Nafgniliec', NULL, N'A1B2C3    ', N'1A2B3C                   ', 1, N'Three blade ceiling fan')
INSERT [dbo].[tblProduct] ([Product_ID], [Manufacturer_ID], [SubCategory_ID], [Product_Name], [Product_Image], [Series], [Model], [ProductTypeID], [Characteristics]) VALUES (2, 3, 2, N'Noisivelet', NULL, N'B2C3D4    ', N'2B3C4D                   ', 2, N'50 inch HD television')
INSERT [dbo].[tblProduct] ([Product_ID], [Manufacturer_ID], [SubCategory_ID], [Product_Name], [Product_Image], [Series], [Model], [ProductTypeID], [Characteristics]) VALUES (3, 5, 3, N'Muucav    ', NULL, N'C3D4E5    ', N'3C4D5E                   ', 3, N'Vacuum cleaner with detachable bag')
INSERT [dbo].[tblProduct] ([Product_ID], [Manufacturer_ID], [SubCategory_ID], [Product_Name], [Product_Image], [Series], [Model], [ProductTypeID], [Characteristics]) VALUES (4, 2, 4, N'Retsaot   ', NULL, N'D4E5F6    ', N'4D5E6F                   ', 4, N'Two slot toaster')
INSERT [dbo].[tblProduct] ([Product_ID], [Manufacturer_ID], [SubCategory_ID], [Product_Name], [Product_Image], [Series], [Model], [ProductTypeID], [Characteristics]) VALUES (5, 4, 5, N'Riahcafos ', NULL, N'E5F6G7    ', N'5E6F7G                   ', 5, N'Three section sofa')
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
SET IDENTITY_INSERT [dbo].[tblSubCategory] ON 

INSERT [dbo].[tblSubCategory] ([SubCategory_ID], [Category_ID], [SubCategory_Name], [SubCategoryFilter]) VALUES (1, 1, N'Fan       ', N'2019, 50, 25, 30                                  ')
INSERT [dbo].[tblSubCategory] ([SubCategory_ID], [Category_ID], [SubCategory_Name], [SubCategoryFilter]) VALUES (2, 2, N'Television', N'2019, 50                                          ')
INSERT [dbo].[tblSubCategory] ([SubCategory_ID], [Category_ID], [SubCategory_Name], [SubCategoryFilter]) VALUES (3, 2, N'Vacuum    ', N'2019, 50                                          ')
INSERT [dbo].[tblSubCategory] ([SubCategory_ID], [Category_ID], [SubCategory_Name], [SubCategoryFilter]) VALUES (4, 2, N'Toaster   ', N'2019, 1000                                        ')
INSERT [dbo].[tblSubCategory] ([SubCategory_ID], [Category_ID], [SubCategory_Name], [SubCategoryFilter]) VALUES (5, 4, N'Sofa      ', N'2019, 50                                          ')
SET IDENTITY_INSERT [dbo].[tblSubCategory] OFF
SET IDENTITY_INSERT [dbo].[tblType] ON 

INSERT [dbo].[tblType] ([ProductTypeID], [UseType], [Application], [MountingLocation], [Accessories], [ModelYear]) VALUES (1, N'Rotation  ', N'Cooling   ', N'Ceiling   ', N'Lights    ', N'2019      ')
INSERT [dbo].[tblType] ([ProductTypeID], [UseType], [Application], [MountingLocation], [Accessories], [ModelYear]) VALUES (2, N'Display   ', N'Info      ', N'Plug      ', N'Speaker   ', N'2019      ')
INSERT [dbo].[tblType] ([ProductTypeID], [UseType], [Application], [MountingLocation], [Accessories], [ModelYear]) VALUES (3, N'Suction   ', N'Cleaning  ', N'Plug      ', N'None      ', N'2019      ')
INSERT [dbo].[tblType] ([ProductTypeID], [UseType], [Application], [MountingLocation], [Accessories], [ModelYear]) VALUES (4, N'Heating   ', N'Cooking   ', N'Plug      ', N'None      ', N'2019      ')
INSERT [dbo].[tblType] ([ProductTypeID], [UseType], [Application], [MountingLocation], [Accessories], [ModelYear]) VALUES (5, N'Cushion   ', N'Relaxation', N'Floor     ', N'None      ', N'2019      ')
SET IDENTITY_INSERT [dbo].[tblType] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([User_ID], [User_Name], [User_Email], [User_Image], [User_Password], [Credential_ID]) VALUES (1, N'Sam Smith                     ', N'SamSmith@gmail.com            ', 0x687474703A2F2F64756D6D79696D6167652E636F6D2F313337783231332E706E672F6363303030302F666666666666, N'4567asd89                     ', 1)
INSERT [dbo].[tblUser] ([User_ID], [User_Name], [User_Email], [User_Image], [User_Password], [Credential_ID]) VALUES (2, N'Wil River                     ', N'wilriver@gmail.com            ', NULL, N'asd123wer                     ', 1)
INSERT [dbo].[tblUser] ([User_ID], [User_Name], [User_Email], [User_Image], [User_Password], [Credential_ID]) VALUES (3, N'Leigha McKevin                ', N'lmckevin0@businessweek.com    ', NULL, N'RoMOGS1ED                     ', 1)
INSERT [dbo].[tblUser] ([User_ID], [User_Name], [User_Email], [User_Image], [User_Password], [Credential_ID]) VALUES (4, N'Adena Eberst                  ', N'aeberst1@weebly.com           ', NULL, N'TVSYbxzzD1                    ', 1)
INSERT [dbo].[tblUser] ([User_ID], [User_Name], [User_Email], [User_Image], [User_Password], [Credential_ID]) VALUES (5, N'Jenn Leathart                 ', N'jleathart2@bigcartel.com      ', NULL, N'izHMhps4lRhq                  ', 1)
INSERT [dbo].[tblUser] ([User_ID], [User_Name], [User_Email], [User_Image], [User_Password], [Credential_ID]) VALUES (6, N'Anatola Chamberlin            ', N'achamberlin3@linkedin.com     ', NULL, N'dDFfjgJvA7B                   ', 1)
INSERT [dbo].[tblUser] ([User_ID], [User_Name], [User_Email], [User_Image], [User_Password], [Credential_ID]) VALUES (7, N'Helen Austwick                ', N'haustwick4@smugmug.com        ', NULL, N'JJHAmsE3pR                    ', 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblManufacturer]  WITH CHECK ADD  CONSTRAINT [FK_tblManufacturer_tblUser] FOREIGN KEY([User_ID])
REFERENCES [dbo].[tblUser] ([User_ID])
GO
ALTER TABLE [dbo].[tblManufacturer] CHECK CONSTRAINT [FK_tblManufacturer_tblUser]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblManufacturer] FOREIGN KEY([Manufacturer_ID])
REFERENCES [dbo].[tblManufacturer] ([Manufacturer_ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblManufacturer]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblSubCategory] FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[tblSubCategory] ([SubCategory_ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblSubCategory]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[tblType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblType]
GO
ALTER TABLE [dbo].[tblSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblSubCategory_tblCategory] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[tblCategory] ([Category_ID])
GO
ALTER TABLE [dbo].[tblSubCategory] CHECK CONSTRAINT [FK_tblSubCategory_tblCategory]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblCredential] FOREIGN KEY([Credential_ID])
REFERENCES [dbo].[tblCredential] ([Credential_ID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblCredential]
GO
USE [master]
GO
ALTER DATABASE [Joole] SET  READ_WRITE 
GO
