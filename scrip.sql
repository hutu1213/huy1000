USE [master]
GO
/****** Object:  Database [Library]    Script Date: 7/14/2020 8:52:51 AM ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Library.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Library_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Library', N'ON'
GO
USE [Library]
GO
/****** Object:  Table [dbo].[tblBook]    Script Date: 7/14/2020 8:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBook](
	[bookID] [varchar](50) NOT NULL,
	[bookName] [varchar](50) NULL,
	[authorName] [varchar](50) NULL,
	[caID] [varchar](50) NULL,
	[publishingYear] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[publishingHouse] [varchar](50) NULL,
 CONSTRAINT [PK_tblBook] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/14/2020 8:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[caID] [varchar](50) NOT NULL,
	[caName] [varchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[caID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 7/14/2020 8:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [varchar](50) NOT NULL,
	[userID] [varchar](50) NULL,
	[receiverName] [varchar](50) NULL,
	[receiverPhone] [varchar](50) NULL,
	[address] [varchar](50) NULL,
 CONSTRAINT [PK_tblBrrow] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 7/14/2020 8:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderID] [varchar](50) NOT NULL,
	[bookID] [varchar](50) NOT NULL,
	[quantity] [int] NULL,
	[orderDate] [date] NULL,
	[payDate] [date] NULL,
	[price] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 7/14/2020 8:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [varchar](50) NOT NULL,
	[roleName] [varchar](50) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/14/2020 8:52:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [varchar](50) NOT NULL,
	[fullName] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[roleID] [varchar](50) NOT NULL,
	[sex] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblBook] ([bookID], [bookName], [authorName], [caID], [publishingYear], [quantity], [price], [publishingHouse]) VALUES (N'B1', N'Romeo & Juliet', N' William Shakespeare', N'ca6', 1700, 49, 20000, N'State Music')
INSERT [dbo].[tblBook] ([bookID], [bookName], [authorName], [caID], [publishingYear], [quantity], [price], [publishingHouse]) VALUES (N'B2', N'Open textbook', N'thomas', N'ca3', 1600, 28, 10000, N'Tomcat')
INSERT [dbo].[tblBook] ([bookID], [bookName], [authorName], [caID], [publishingYear], [quantity], [price], [publishingHouse]) VALUES (N'B3', N'Conan      ', N'hisirama', N'ca4', 1777, 600, 15000, N'British')
INSERT [dbo].[tblBook] ([bookID], [bookName], [authorName], [caID], [publishingYear], [quantity], [price], [publishingHouse]) VALUES (N'B4', N'Doremon', N'Fujiko F. Fujio', N'ca2', 1945, 20, 20000, N' 21st Century')
INSERT [dbo].[tblBook] ([bookID], [bookName], [authorName], [caID], [publishingYear], [quantity], [price], [publishingHouse]) VALUES (N'B5', N'Conann', N'to huu', N'ca1', 1888, 601, 1000, N'nbx')
INSERT [dbo].[tblBook] ([bookID], [bookName], [authorName], [caID], [publishingYear], [quantity], [price], [publishingHouse]) VALUES (N'B55', N'Conann', N'to huu', N'ca1', 1888, 592, 1000, N'nbx')
INSERT [dbo].[tblBook] ([bookID], [bookName], [authorName], [caID], [publishingYear], [quantity], [price], [publishingHouse]) VALUES (N'B567', N'Conann', N'to huu', N'ca1', 1888, 602, 1000, N'nbx')
INSERT [dbo].[tblBook] ([bookID], [bookName], [authorName], [caID], [publishingYear], [quantity], [price], [publishingHouse]) VALUES (N'B77', N'Conann', N'Xuan Dieu', N'ca1', 1888, 10, 1000, N'nbx')
INSERT [dbo].[tblBook] ([bookID], [bookName], [authorName], [caID], [publishingYear], [quantity], [price], [publishingHouse]) VALUES (N'B772', N'Conann', N'Xuan Dieu', N'ca4', 1888, 602, 1000, N'nbx')
INSERT [dbo].[tblBook] ([bookID], [bookName], [authorName], [caID], [publishingYear], [quantity], [price], [publishingHouse]) VALUES (N'B888888888', N'green', N'Xuan Dieu', N'ca1', 1222, 11, 12222, NULL)
INSERT [dbo].[tblCategory] ([caID], [caName]) VALUES (N'ca1', N'
Poem')
INSERT [dbo].[tblCategory] ([caID], [caName]) VALUES (N'ca2', N'Comic')
INSERT [dbo].[tblCategory] ([caID], [caName]) VALUES (N'ca3', N'Textbook')
INSERT [dbo].[tblCategory] ([caID], [caName]) VALUES (N'ca4', N'Detective')
INSERT [dbo].[tblCategory] ([caID], [caName]) VALUES (N'ca5', N'Novel')
INSERT [dbo].[tblCategory] ([caID], [caName]) VALUES (N'ca6', N'
Love story')
INSERT [dbo].[tblCategory] ([caID], [caName]) VALUES (N'ca7', N'
Mentality')
INSERT [dbo].[tblOrder] ([orderID], [userID], [receiverName], [receiverPhone], [address]) VALUES (N'05a5ba0c-99d0-4386-9c74-2bae882300e5', N'nam', N'Nam', N'2222', N'quan12')
INSERT [dbo].[tblOrder] ([orderID], [userID], [receiverName], [receiverPhone], [address]) VALUES (N'5e9cbf06-74d3-4f47-b466-b4eaca8dfa4f', N'nam', N'Nam', N'2222', N'quan12')
INSERT [dbo].[tblOrder] ([orderID], [userID], [receiverName], [receiverPhone], [address]) VALUES (N'63f145dc-1594-4017-aef0-327d656d6c0a', N'nam', N'Nam', N'2222', N'quan12')
INSERT [dbo].[tblOrder] ([orderID], [userID], [receiverName], [receiverPhone], [address]) VALUES (N'872e17c3-ed93-4df8-91aa-6b8adbba0736', N'nam', N'Nam', N'2222', N'quan12')
INSERT [dbo].[tblOrder] ([orderID], [userID], [receiverName], [receiverPhone], [address]) VALUES (N'f29dd975-ac03-4166-b4c3-be465e56aafc', N'nam', N'Nam', N'2222', N'quan12')
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity], [orderDate], [payDate], [price]) VALUES (N'5e9cbf06-74d3-4f47-b466-b4eaca8dfa4f', N'B3', 1, CAST(N'2020-07-13' AS Date), CAST(N'2020-08-13' AS Date), 15000)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity], [orderDate], [payDate], [price]) VALUES (N'872e17c3-ed93-4df8-91aa-6b8adbba0736', N'B3', 1, CAST(N'2020-07-13' AS Date), CAST(N'2020-08-13' AS Date), 15000)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity], [orderDate], [payDate], [price]) VALUES (N'872e17c3-ed93-4df8-91aa-6b8adbba0736', N'B5', 1, CAST(N'2020-07-13' AS Date), CAST(N'2020-08-13' AS Date), 1000)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity], [orderDate], [payDate], [price]) VALUES (N'05a5ba0c-99d0-4386-9c74-2bae882300e5', N'B77', 2, CAST(N'2020-07-13' AS Date), CAST(N'2020-08-13' AS Date), 1000)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity], [orderDate], [payDate], [price]) VALUES (N'f29dd975-ac03-4166-b4c3-be465e56aafc', N'B2', 2, CAST(N'2020-07-13' AS Date), CAST(N'2020-08-13' AS Date), 20000)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity], [orderDate], [payDate], [price]) VALUES (N'f29dd975-ac03-4166-b4c3-be465e56aafc', N'B1', 1, CAST(N'2020-07-13' AS Date), CAST(N'2020-08-13' AS Date), 20000)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity], [orderDate], [payDate], [price]) VALUES (N'63f145dc-1594-4017-aef0-327d656d6c0a', N'B55', 10, CAST(N'2020-07-13' AS Date), CAST(N'2020-08-13' AS Date), 10000)
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'R1', N'admin')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'R2', N'user')
INSERT [dbo].[tblUser] ([userID], [fullName], [address], [email], [phone], [roleID], [sex], [password]) VALUES (N'huy', N'Tu Quang Huy', N'quan 9', N'huy@gmail.com', N'98888', N'R1', N'Male', N'123')
INSERT [dbo].[tblUser] ([userID], [fullName], [address], [email], [phone], [roleID], [sex], [password]) VALUES (N'nam', N'Nam', N'quan12', N'nam@gmail.com', N'2222', N'R2', N'Male', N'12345')
ALTER TABLE [dbo].[tblBook]  WITH CHECK ADD  CONSTRAINT [FK__tblBook__caID__1DE57479] FOREIGN KEY([caID])
REFERENCES [dbo].[tblCategory] ([caID])
GO
ALTER TABLE [dbo].[tblBook] CHECK CONSTRAINT [FK__tblBook__caID__1DE57479]
GO
ALTER TABLE [dbo].[tblBook]  WITH CHECK ADD  CONSTRAINT [FK__tblBook__caID__300424B4] FOREIGN KEY([caID])
REFERENCES [dbo].[tblCategory] ([caID])
GO
ALTER TABLE [dbo].[tblBook] CHECK CONSTRAINT [FK__tblBook__caID__300424B4]
GO
ALTER TABLE [dbo].[tblBook]  WITH CHECK ADD  CONSTRAINT [FK__tblBook__caID__36B12243] FOREIGN KEY([caID])
REFERENCES [dbo].[tblCategory] ([caID])
GO
ALTER TABLE [dbo].[tblBook] CHECK CONSTRAINT [FK__tblBook__caID__36B12243]
GO
ALTER TABLE [dbo].[tblBook]  WITH CHECK ADD  CONSTRAINT [FK__tblBook__caID__4222D4EF] FOREIGN KEY([caID])
REFERENCES [dbo].[tblCategory] ([caID])
GO
ALTER TABLE [dbo].[tblBook] CHECK CONSTRAINT [FK__tblBook__caID__4222D4EF]
GO
ALTER TABLE [dbo].[tblBook]  WITH CHECK ADD  CONSTRAINT [FK__tblBook__caID__48CFD27E] FOREIGN KEY([caID])
REFERENCES [dbo].[tblCategory] ([caID])
GO
ALTER TABLE [dbo].[tblBook] CHECK CONSTRAINT [FK__tblBook__caID__48CFD27E]
GO
ALTER TABLE [dbo].[tblBook]  WITH CHECK ADD  CONSTRAINT [FK__tblBook__caID__7F2BE32F] FOREIGN KEY([caID])
REFERENCES [dbo].[tblCategory] ([caID])
GO
ALTER TABLE [dbo].[tblBook] CHECK CONSTRAINT [FK__tblBook__caID__7F2BE32F]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblBrrow__userID__03F0984C] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblBrrow__userID__03F0984C]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblBrrow__userID__239E4DCF] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblBrrow__userID__239E4DCF]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblBrrow__userID__34C8D9D1] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblBrrow__userID__34C8D9D1]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblBrrow__userID__3B75D760] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblBrrow__userID__3B75D760]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblBrrow__userID__46E78A0C] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblBrrow__userID__46E78A0C]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblBrrow__userID__4D94879B] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblBrrow__userID__4D94879B]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblBrrowDetails_tblBook1] FOREIGN KEY([bookID])
REFERENCES [dbo].[tblBook] ([bookID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblBrrowDetails_tblBook1]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblBrrowDetails_tblBrrow] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblBrrowDetails_tblBrrow]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__roleID__02FC7413] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__roleID__02FC7413]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__roleID__22AA2996] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__roleID__22AA2996]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__roleID__33D4B598] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__roleID__33D4B598]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__roleID__45F365D3] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__roleID__45F365D3]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__roleID__4CA06362] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__roleID__4CA06362]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
