USE [master]
GO
/****** Object:  Database [Assignment1_HuynhTuanVu]    Script Date: 3/15/2021 6:31:44 PM ******/
CREATE DATABASE [Assignment1_HuynhTuanVu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment1_HuynhTuanVu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_HuynhTuanVu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment1_HuynhTuanVu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_HuynhTuanVu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1_HuynhTuanVu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET QUERY_STORE = OFF
GO
USE [Assignment1_HuynhTuanVu]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/15/2021 6:31:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/15/2021 6:31:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NOT NULL,
	[totalPrice] [float] NOT NULL,
	[userID] [varchar](20) NULL,
	[payId] [int] NULL,
	[phone] [varchar](10) NULL,
	[address] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/15/2021 6:31:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 3/15/2021 6:31:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[payId] [int] IDENTITY(1,1) NOT NULL,
	[payName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[payId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/15/2021 6:31:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[image] [varchar](100) NOT NULL,
	[description] [varchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[createDate] [date] NOT NULL,
	[status] [bit] NOT NULL,
	[categoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRecoedUpdate]    Script Date: 3/15/2021 6:31:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRecoedUpdate](
	[recordID] [int] IDENTITY(1,1) NOT NULL,
	[dateRecord] [date] NOT NULL,
	[note] [varchar](500) NOT NULL,
	[userID] [varchar](20) NULL,
	[productID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[recordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 3/15/2021 6:31:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 3/15/2021 6:31:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [varchar](20) NOT NULL,
	[password] [varchar](30) NULL,
	[fullName] [nvarchar](50) NULL,
	[phone] [varchar](10) NULL,
	[email] [varchar](100) NULL,
	[address] [varchar](1000) NULL,
	[roleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (1, N'Coffee')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (2, N'Candies')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (3, N'Cakes')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (1, CAST(N'2021-01-17' AS Date), 103900, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (2, CAST(N'2021-01-17' AS Date), 215000, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (3, CAST(N'2021-01-18' AS Date), 160000, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (4, CAST(N'2021-01-18' AS Date), 104700, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (5, CAST(N'2021-01-18' AS Date), 34900, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (6, CAST(N'2021-01-18' AS Date), 1600000, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (7, CAST(N'2021-01-20' AS Date), 146000, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (8, CAST(N'2021-01-20' AS Date), 140000, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (9, CAST(N'2021-01-20' AS Date), 269000, N'vuhtse', 2, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (10, CAST(N'2021-01-20' AS Date), 152000, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (11, CAST(N'2021-01-20' AS Date), 480000, N'test', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (12, CAST(N'2021-01-20' AS Date), 122000, N'test', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (13, CAST(N'2021-01-20' AS Date), 600000, N'test', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (14, CAST(N'2021-01-20' AS Date), 66000, N'vuhtse', 2, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (15, CAST(N'2021-01-20' AS Date), 336000, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (16, CAST(N'2021-01-20' AS Date), 18000, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (17, CAST(N'2021-01-28' AS Date), 28800000, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (18, CAST(N'2021-01-28' AS Date), 60000, N'vuhtse', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (19, CAST(N'2021-03-15' AS Date), 426000, N'1092394843348315642', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (20, CAST(N'2021-03-15' AS Date), 1745000, N'1092394843348315642', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (21, CAST(N'2021-03-15' AS Date), 6000, N'1092394843348315642', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (22, CAST(N'2021-03-15' AS Date), 400000, N'1092394843348315642', 1, NULL, NULL)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [payId], [phone], [address]) VALUES (23, CAST(N'2021-03-15' AS Date), 140000, N'1092114614312494981', 1, N'1234567890', N'hcm')
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1, 1, 2, 1, 34900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (2, 1, 3, 1, 69000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (3, 2, 4, 5, 170000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (4, 2, 5, 1, 45000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (5, 3, 8, 10, 160000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (6, 4, 2, 3, 104700)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (7, 5, 2, 1, 34900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (8, 6, 9, 100, 1600000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (9, 7, 19, 1, 140000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (10, 7, 20, 1, 6000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (11, 8, 19, 1, 140000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (12, 9, 3, 1, 69000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (13, 9, 14, 2, 200000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (14, 10, 19, 1, 140000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (15, 10, 20, 2, 12000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (16, 11, 13, 1, 160000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (17, 11, 9, 20, 320000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (18, 12, 8, 2, 32000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (19, 12, 20, 15, 90000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (20, 13, 20, 100, 600000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (21, 14, 20, 1, 60000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (22, 14, 21, 1, 6000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (23, 15, 8, 21, 336000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (24, 16, 21, 3, 18000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (25, 17, 20, 480, 28800000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (26, 18, 20, 1, 60000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (27, 19, 19, 3, 420000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (28, 19, 21, 1, 6000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (29, 20, 2, 50, 1745000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (30, 21, 21, 1, 6000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (31, 22, 8, 25, 400000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (32, 23, 19, 1, 140000)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
SET IDENTITY_INSERT [dbo].[tblPayment] ON 

INSERT [dbo].[tblPayment] ([payId], [payName]) VALUES (1, N'COD')
INSERT [dbo].[tblPayment] ([payId], [payName]) VALUES (2, N'via PayPal')
SET IDENTITY_INSERT [dbo].[tblPayment] OFF
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (1, N'Butter Cake', 120, N'picture/cake_1.jpg', N'Any recipe for cake that begins "cream butter and sugar" is a butter cake. After the creaming, you add eggs to aerate the batter a bit, flour (and sometimes another liquid, like milk) to give it structure and texture, and baking powder or baking soda to ensure that it rises in the oven.', 39000, CAST(N'2021-01-10' AS Date), 1, 3)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (2, N'Pound Cake ', 82, N'picture/cake_2.jpg', N'Pound cake is a relative of butter cake. It''s so called because it can be measured as a matter of proportion: a pound of butter, a pound of sugar, a pound of eggs, and a pound of flour.', 34900, CAST(N'2021-01-15' AS Date), 1, 3)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (3, N'Sponge Cake', 149, N'picture/cake_3.jpg', N'Any recipe that contains no baking soda or baking powder but lots of whipped eggs or egg whites? That''s a sponge cake and there are several different types of sponge cake. which will be called different things wherever you are.', 69000, CAST(N'2021-01-14' AS Date), 1, 3)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (4, N'AMERICANO', 160, N'picture/coffee_1.jpg', N'Espresso with added hot water (100–150 ml). Often served in a cappuccino cup. (The espresso is added into the hot water rather than all the water being flowed through the coffee that would lead to over extraction).', 30000, CAST(N'2021-01-14' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (5, N'CAFFÈ LATTE', 185, N'picture/coffee_2.jpg', N'A tall, mild ''milk coffee'' (about 150-300 ml). An espresso with steamed milk and only a little milk foam poured over it. Serve in a latte glass or a coffee cup. Flavoured syrup can be added. ', 45000, CAST(N'2021-01-14' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (6, N'CAFFÈ MOCHA', 165, N'picture/coffee_3.jpg', N'A caffè latte with chocolate and whipped cream, made by pouring about 2 cl of chocolate sauce into the glass, followed by an espresso shot and steamed milk.', 40000, CAST(N'2021-01-10' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (7, N'Nik-L-Nips Wax Bottles Candy', 1600, N'picture/h1.jpg', N'Nik-L-Nips have been around since the early 1900s and are still a favourite of today. Like the slogan says, ', 16000, CAST(N'2021-01-03' AS Date), 1, 2)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (8, N'Necco Wafers Candy <3', 1452, N'picture/candies_2.jpg', N'Necco Wafers did try at one point in time to change the ingredients and flavours but this sparked outrage among all the Necco Wafer fans and they very quickly reverted back to the original flavours. Necco Wafers come in an assortment of flavours including Orange, Lime, Clove, Chocolate, Cinnamon, Licorice and Wintergreen. ', 16000, CAST(N'2021-01-03' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (9, N'Nerds Candy', 145, N'picture/candies_3.jpg', N'A box of Nerds Candy comes with two separate compartments and two different flavours all in one small and colourful box. Nerds Candy is inspired by Willy Wonka and The Chocolate Factory.', 16000, CAST(N'2021-01-01' AS Date), 1, 2)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (10, N'eeteerree1', 6666, N'picture/candies_4.jpg', N'sdasd', 43, CAST(N'2021-01-13' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (11, N't', 100, N'picture/h1.jpg', N'coffee', 10000, CAST(N'2021-01-18' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (12, N'banh cola', 120, N'picture/cake_3.jpg', N'ô  ê', 60000, CAST(N'2021-01-18' AS Date), 1, 3)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (13, N'banhkem', 49, N'picture/15.jpg', N'banh ngon lam', 160000, CAST(N'2021-01-19' AS Date), 1, 3)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (14, N'banh mi', 21, N'picture/3.jpg', N'banh ngon lam', 100000, CAST(N'2021-01-19' AS Date), 1, 3)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (15, N'keo deo', 1000, N'picture/candies3.png', N'keo ngot', 5000, CAST(N'2021-01-19' AS Date), 1, 2)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (16, N'keodau', 600, N'picture/keodau.png', N' chua lam', 30000, CAST(N'2021-01-19' AS Date), 1, 2)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (17, N'keo cung', 2000, N'picture/keocung.png', N'cung ngat', 200000, CAST(N'2021-01-19' AS Date), 1, 2)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (18, N'y', 5, N'picture/h2.jpg', N'y', 5, CAST(N'2021-01-19' AS Date), 1, 3)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (19, N'keo bong gon', 493, N'picture/keocung.png', N'bong', 140000, CAST(N'2021-01-20' AS Date), 1, 2)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (20, N'banh tao', 0, N'picture/h2.jpg', N'banhd', 60000, CAST(N'2021-01-20' AS Date), 1, 3)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (21, N'keo keo', 54, N'picture/keocung.png', N'dai lam', 6000, CAST(N'2021-01-20' AS Date), 1, 2)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [image], [description], [price], [createDate], [status], [categoryID]) VALUES (22, N'keo deo', 500, N'picture/keodau.png', N'nhai mat rang', 6000, CAST(N'2021-01-20' AS Date), 1, 3)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
SET IDENTITY_INSERT [dbo].[tblRecoedUpdate] ON 

INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (1, CAST(N'2021-01-18' AS Date), N'Update', N'admin', 2)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (2, CAST(N'2021-01-18' AS Date), N'Update', N'admin', 4)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (3, CAST(N'2021-01-18' AS Date), N'Update', N'admin', 2)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (4, CAST(N'2021-01-18' AS Date), N'Update', N'admin', 2)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (5, CAST(N'2021-01-18' AS Date), N'Update', N'admin', 10)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (6, CAST(N'2021-01-18' AS Date), N'Update', N'admin', 11)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (7, CAST(N'2021-01-18' AS Date), N'Update', N'admin', 11)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (8, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 11)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (9, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 11)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (10, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 11)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (11, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 7)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (12, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 13)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (13, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 13)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (14, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 13)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (15, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 13)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (16, CAST(N'2021-01-19' AS Date), N'Delete', N'admin', 13)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (17, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 13)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (18, CAST(N'2021-01-19' AS Date), N'Delete', N'admin', 18)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (19, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 18)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (20, CAST(N'2021-01-19' AS Date), N'Delete', N'admin', 18)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (21, CAST(N'2021-01-19' AS Date), N'Delete', N'admin', 18)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (22, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 18)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (23, CAST(N'2021-01-19' AS Date), N'Delete', N'admin', 13)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (24, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 13)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (25, CAST(N'2021-01-19' AS Date), N'Delete', N'admin', 13)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (26, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 13)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (27, CAST(N'2021-01-19' AS Date), N'Delete', N'admin', 9)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (28, CAST(N'2021-01-19' AS Date), N'Update', N'admin', 9)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (29, CAST(N'2021-01-20' AS Date), N'Update', N'admin', 19)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (30, CAST(N'2021-01-20' AS Date), N'Update', N'admin', 19)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (31, CAST(N'2021-01-20' AS Date), N'Update', N'admin', 19)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (32, CAST(N'2021-01-20' AS Date), N'Update', N'admin', 19)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (33, CAST(N'2021-01-20' AS Date), N'Update', N'admin', 9)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (34, CAST(N'2021-01-20' AS Date), N'Delete', N'admin', 21)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (35, CAST(N'2021-01-20' AS Date), N'Update', N'admin', 21)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (36, CAST(N'2021-01-20' AS Date), N'Update', N'admin', 20)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (37, CAST(N'2021-01-20' AS Date), N'Delete', N'admin', 19)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (38, CAST(N'2021-01-20' AS Date), N'Update', N'admin', 20)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (39, CAST(N'2021-01-20' AS Date), N'Delete', N'admin', 20)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (40, CAST(N'2021-01-20' AS Date), N'Update', N'admin', 19)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (41, CAST(N'2021-01-20' AS Date), N'Update', N'admin', 20)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (42, CAST(N'2021-01-27' AS Date), N'Update', N'admin', 19)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (43, CAST(N'2021-01-27' AS Date), N'Update', N'admin', 19)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (44, CAST(N'2021-01-27' AS Date), N'Update', N'admin', 19)
INSERT [dbo].[tblRecoedUpdate] ([recordID], [dateRecord], [note], [userID], [productID]) VALUES (45, CAST(N'2021-01-28' AS Date), N'Update', N'admin', 20)
SET IDENTITY_INSERT [dbo].[tblRecoedUpdate] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (1, N'USER')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (2, N'ADMIN')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [phone], [email], [address], [roleID]) VALUES (N'1', N'1', N'1', N'1', N'1', N'1', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [phone], [email], [address], [roleID]) VALUES (N'1092114614312494981', N'', N'Huynh Tuan Vu', N'', N'vuhtse140902@fpt.edu.vn', N'', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [phone], [email], [address], [roleID]) VALUES (N'1092394843348315642', N'', N'Tuan Vu Huynh', N'', N'tuanvuchoilol@gmail.com', N'', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [phone], [email], [address], [roleID]) VALUES (N'admin', N'123456', N'seAdmin', N'1234567895', N'admin@gmail.com', N'HCM', 2)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [phone], [email], [address], [roleID]) VALUES (N'test', N'123456', N'Test', N'1234567891', N'test@gmail.com', N'HCM', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [phone], [email], [address], [roleID]) VALUES (N'vuhtse', N'1', N'Huynh Tuan Vu', N'0967767612', N'vu@gmail.com', N'HCM', 1)
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([payId])
REFERENCES [dbo].[tblPayment] ([payId])
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblRecoedUpdate]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblRecoedUpdate]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [Assignment1_HuynhTuanVu] SET  READ_WRITE 
GO
