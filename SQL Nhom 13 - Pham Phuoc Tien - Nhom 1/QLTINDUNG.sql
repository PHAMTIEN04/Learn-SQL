USE [QLTINDUNG]
GO
/****** Object:  Table [dbo].[HOSOVAYVON]    Script Date: 26/04/2023 5:28:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOSOVAYVON](
	[MaHoSo] [nvarchar](10) NULL,
	[LaiSuat] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOSOVAYVON_THANHVIEN]    Script Date: 26/04/2023 5:28:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOSOVAYVON_THANHVIEN](
	[MaThanhVien] [nvarchar](10) NOT NULL,
	[MaHoSo] [nvarchar](10) NOT NULL,
	[SoVonVay] [bigint] NULL,
 CONSTRAINT [PK_HOSOVAYVON_THANHVIEN] PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC,
	[MaHoSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THANHVIEN]    Script Date: 26/04/2023 5:28:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANHVIEN](
	[MaThanhVien] [nvarchar](10) NOT NULL,
	[HoDem] [nvarchar](50) NULL,
	[Ten] [nvarchar](15) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[NoiSinh] [nvarchar](250) NULL
) ON [PRIMARY]

GO
