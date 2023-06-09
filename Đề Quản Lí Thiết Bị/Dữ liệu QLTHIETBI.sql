USE [master]
GO
/****** Object:  Database [QLTHIETBI]    Script Date: 4/26/2023 11:09:02 PM ******/
CREATE DATABASE [QLTHIETBI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTHIETBI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEX\MSSQL\DATA\QLTHIETBI.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLTHIETBI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEX\MSSQL\DATA\QLTHIETBI_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLTHIETBI] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTHIETBI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTHIETBI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTHIETBI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTHIETBI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTHIETBI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTHIETBI] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTHIETBI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTHIETBI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTHIETBI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTHIETBI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTHIETBI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTHIETBI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTHIETBI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTHIETBI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTHIETBI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTHIETBI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLTHIETBI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTHIETBI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTHIETBI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTHIETBI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTHIETBI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTHIETBI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTHIETBI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTHIETBI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLTHIETBI] SET  MULTI_USER 
GO
ALTER DATABASE [QLTHIETBI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTHIETBI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTHIETBI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTHIETBI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLTHIETBI] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLTHIETBI]
GO
/****** Object:  Table [dbo].[LoaiMayTinh]    Script Date: 4/26/2023 11:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMayTinh](
	[MaLoaiMayTinh] [nvarchar](10) NOT NULL,
	[TenLoaiMayTinh] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiMayTinh] PRIMARY KEY CLUSTERED 
(
	[MaLoaiMayTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MayTinh]    Script Date: 4/26/2023 11:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MayTinh](
	[MaMayTinh] [nvarchar](10) NOT NULL,
	[TenMayTinh] [nvarchar](50) NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[MaLoaiMayTinh] [nvarchar](10) NOT NULL,
	[MaNhaCC] [nvarchar](10) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MayTinh_CaoCap]    Script Date: 4/26/2023 11:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MayTinh_CaoCap](
	[MaMayTinh] [nvarchar](10) NOT NULL,
	[TenMayTinh] [nvarchar](50) NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[MaLoaiMayTinh] [nvarchar](10) NOT NULL,
	[MaNhaCC] [nvarchar](10) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 4/26/2023 11:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCC] [nvarchar](10) NOT NULL,
	[TenNhaCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNhaCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[LoaiMayTinh] ([MaLoaiMayTinh], [TenLoaiMayTinh]) VALUES (N'ACER', N'Máy Acer')
INSERT [dbo].[LoaiMayTinh] ([MaLoaiMayTinh], [TenLoaiMayTinh]) VALUES (N'DELL', N'Máy Dell')
INSERT [dbo].[LoaiMayTinh] ([MaLoaiMayTinh], [TenLoaiMayTinh]) VALUES (N'HP', N'Máy Hp')
INSERT [dbo].[LoaiMayTinh] ([MaLoaiMayTinh], [TenLoaiMayTinh]) VALUES (N'VIO', N'Máy Sony Vio')
INSERT [dbo].[MayTinh] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Acer01', N'Acer Core i3 2.6 GHz', 450, 278, CAST(N'2022-07-29' AS Date), N'ACER', N'Hue')
INSERT [dbo].[MayTinh] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Acer02', N'Acer Core i7 3.6 GHz', 744, 790, CAST(N'2023-01-14' AS Date), N'ACER', N'DN')
INSERT [dbo].[MayTinh] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Dell01', N'Dell Core i3 2.6 GHz', 607, 45, CAST(N'2022-12-21' AS Date), N'DELL', N'Hue')
INSERT [dbo].[MayTinh] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Dell02', N'Dell Core i5 3.2 GHz', 791, 620, CAST(N'2022-06-10' AS Date), N'DELL', N'QN')
INSERT [dbo].[MayTinh] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Dell03', N'Dell Core i3 2.8 GHz', 620, 150, CAST(N'2022-10-15' AS Date), N'DELL', N'Hue')
INSERT [dbo].[MayTinh] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'HP01', N'Hp Core i3 3.2 GHz', 354, 547, CAST(N'2023-03-18' AS Date), N'HP', N'DN')
INSERT [dbo].[MayTinh] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'HP02', N'Hp Core i5 3.5 GHz', 450, 900, CAST(N'2023-01-08' AS Date), N'HP', N'QN')
INSERT [dbo].[MayTinh] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'HP03', N'Hp Core i3 2.6 GHz', 352, 89, CAST(N'2022-05-22' AS Date), N'HP', N'QN')
INSERT [dbo].[MayTinh_CaoCap] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Acer02', N'Acer Core i7 3.6 GHz', 744, 790, CAST(N'2023-01-14' AS Date), N'ACER', N'DN')
INSERT [dbo].[MayTinh_CaoCap] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Dell01', N'Dell Core i3 2.6 GHz', 607, 45, CAST(N'2022-12-21' AS Date), N'DELL', N'Hue')
INSERT [dbo].[NhaCungCap] ([MaNhaCC], [TenNhaCC], [DiaChi], [DienThoai]) VALUES (N'DN', N'Nhà cung cấp Đà Nẵng', N'78 Lý Nam Đế - TP Đà Nẵng', N'053689797')
INSERT [dbo].[NhaCungCap] ([MaNhaCC], [TenNhaCC], [DiaChi], [DienThoai]) VALUES (N'Hue', N'Nhà cung cấp Huế', N'12 Lê Lợi - TP Huế', N'054369687')
INSERT [dbo].[NhaCungCap] ([MaNhaCC], [TenNhaCC], [DiaChi], [DienThoai]) VALUES (N'QN', N'Nhà cung cấp Quảng Nam', N'123 Nguyễn Trãi', N'0514789847')
INSERT [dbo].[NhaCungCap] ([MaNhaCC], [TenNhaCC], [DiaChi], [DienThoai]) VALUES (N'QT', N'Nhà cung cấp Quảng Trị', N'La Sơn - Quảng Trị', N'053476666')
ALTER TABLE [dbo].[MayTinh]  WITH CHECK ADD  CONSTRAINT [FK_MayTinh_LoaiMayTinh] FOREIGN KEY([MaLoaiMayTinh])
REFERENCES [dbo].[LoaiMayTinh] ([MaLoaiMayTinh])
GO
ALTER TABLE [dbo].[MayTinh] CHECK CONSTRAINT [FK_MayTinh_LoaiMayTinh]
GO
ALTER TABLE [dbo].[MayTinh]  WITH CHECK ADD  CONSTRAINT [FK_MayTinh_NhaCungCap] FOREIGN KEY([MaNhaCC])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCC])
GO
ALTER TABLE [dbo].[MayTinh] CHECK CONSTRAINT [FK_MayTinh_NhaCungCap]
GO
USE [master]
GO
ALTER DATABASE [QLTHIETBI] SET  READ_WRITE 
GO
