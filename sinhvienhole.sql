
CREATE TABLE [dbo].[SINHVIENHL](
	[MaSinhVien] [nvarchar](10) NOT NULL,
	[MaLop] [nvarchar](15) NULL,
	[HoDem] [nvarchar](45) NULL,
	[Ten] [nvarchar](15) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[NoiSinh] [nvarchar](250) NULL,
 CONSTRAINT [PK_SINHVIENHL] PRIMARY KEY CLUSTERED 
(
	[MaSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SINHVIEN_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SINHVIEN_LOP]
GO
