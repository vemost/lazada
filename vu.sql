USE [master]
GO
/****** Object:  Database [DuAn]    Script Date: 18/06/2020 7:29:02 SA ******/
CREATE DATABASE [DuAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DuAn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DuAn.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DuAn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DuAn_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DuAn] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DuAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DuAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DuAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DuAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DuAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DuAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [DuAn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DuAn] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DuAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DuAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DuAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DuAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DuAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DuAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DuAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DuAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DuAn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DuAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DuAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DuAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DuAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DuAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DuAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DuAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DuAn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DuAn] SET  MULTI_USER 
GO
ALTER DATABASE [DuAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DuAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DuAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DuAn] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DuAn]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 18/06/2020 7:29:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaCTDH] [int] IDENTITY(1,1) NOT NULL,
	[MaDonHang] [int] NULL,
	[MaDienThoai] [int] NULL,
	[SoLuong] [float] NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaCTDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 18/06/2020 7:29:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaCTPN] [int] IDENTITY(1,1) NOT NULL,
	[MaPhieuNhap] [int] NULL,
	[MaDienThoai] [int] NULL,
	[SoLuong] [int] NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK_ChiTietPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaCTPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DienThoai]    Script Date: 18/06/2020 7:29:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienThoai](
	[MaDienThoai] [int] IDENTITY(1,1) NOT NULL,
	[MaLoaiDT] [int] NULL,
	[TenDienThoai] [nvarchar](50) NULL,
	[MauSac] [nvarchar](50) NULL,
	[KieuDang] [nvarchar](50) NULL,
	[GiaNhap] [money] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_DienThoai] PRIMARY KEY CLUSTERED 
(
	[MaDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 18/06/2020 7:29:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaNhanVien] [int] NULL,
	[MaKhachHang] [int] NULL,
	[NgayTao] [date] NULL CONSTRAINT [DF_DonHang_NgayTao]  DEFAULT (getdate()),
	[TongTien] [money] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[SoDonHang] [varchar](15) NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 18/06/2020 7:29:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDienThoai]    Script Date: 18/06/2020 7:29:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDienThoai](
	[MaLoaiDT] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiDT] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiDienThoai] PRIMARY KEY CLUSTERED 
(
	[MaLoaiDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 18/06/2020 7:29:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCungCap] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaCungCap] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 18/06/2020 7:29:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[Email] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 18/06/2020 7:29:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[MaNhanVien] [int] NULL,
	[MaNhaCungCap] [int] NULL,
	[NgayTao] [date] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[SoPhieuNhap] [varchar](15) NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (88, 78, 60, 3, 3000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (89, 78, 62, 3, 30000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (90, 78, 61, 3, 30000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (91, 79, 60, 3, 3000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (92, 80, 57, 4, 40000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (93, 81, 59, 1, 1000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (94, 81, 58, 1, 10000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (95, 81, 57, 3, 30000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (96, 81, 61, 3, 30000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (97, 82, 60, 3, 3000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (98, 82, 63, 3, 30000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (99, 82, 66, 3, 360000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (100, 83, 57, 3, 30000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (101, 83, 61, 3, 30000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (102, 84, 61, 4, 40000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (103, 84, 61, 4, 40000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (104, 84, 61, 4, 40000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (105, 87, 56, 2, 20000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (106, 87, 56, 2, 20000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (107, 87, 56, 6, 60000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (108, 87, 60, 120, 120000.0000)
INSERT [dbo].[ChiTietDonHang] ([MaCTDH], [MaDonHang], [MaDienThoai], [SoLuong], [TongTien]) VALUES (109, 89, 56, 5, 50000.0000)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhap] ON 

INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (36, 33, 59, 1, 1000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (37, 33, 59, 1, 1000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (38, 33, 59, 1, 1000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (39, 33, 60, 1000, 1000000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (40, 33, 59, 1, 1000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (41, 33, 60, 1000, 1000000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (43, 33, 59, 1, 1000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (44, 33, 60, 1000, 1000000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (46, 33, 62, 100, 1000000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (47, 33, 59, 1, 1000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (48, 33, 60, 1000, 1000000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (50, 33, 62, 100, 1000000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (51, 39, 64, 12, 1200000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (52, 39, 65, 12, 1200240.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (53, 39, 66, 13, 1560000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (54, 39, 67, 100, 50.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (56, 42, 71, 10, 10000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (57, 42, 72, 10, 1000000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (58, 42, 73, 12, 1200000.0000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaCTPN], [MaPhieuNhap], [MaDienThoai], [SoLuong], [TongTien]) VALUES (59, 42, 74, 12, 2400000.0000)
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[DienThoai] ON 

INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (56, 1, N'sam sung', N'mx2', N'đen', 1000.0000, 3)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (57, 1, N'galxaxy', N'mx2', N'trắng', 1000.0000, 1046)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (58, 1, N'galxaxy', N'mx2', N'trắng', 1000.0000, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (59, 1, N'ss', N'ss', N'ss', 100.0000, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (60, 1, N'ss', N'ss', N'ss', 100.0000, 877)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (61, 1, N'sam sung', N'mã5', N'trắng', 1000.0000, 987)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (62, 1, N'sam sung', N'mã5', N'trắng', 1000.0000, 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (63, 1, N'iphone', N'xs', N'đen', 1000.0000, 10)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (64, 1, N'iphone', N'xs', N'đen', 10000.0000, 12)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (65, 1, N'iphone', N'xs', N'đen', 10002.0000, 12)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (66, 1, N'samsung', N'mx2', N'trắng', 12000.0000, 10)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (67, 1, N'sammax', N'cs3', N'đen', 500000.0000, 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (68, 1, N'sammax', N'cs3', N'đen', 50000.0000, 100)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (69, 1, N'samsung', N'mk2', N'đen', 10000.0000, 10)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (70, 1, N'samsung', N'mk2', N'đen', 2000000.0000, 10)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (71, 1, N'samsung', N'mk2', N'đen', 100.0000, 10)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (72, 1, N'samsung', N'mk2', N'đen', 10000.0000, 10)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (73, 1, N'iphone', N'xs', N'đen', 10000.0000, 12)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaLoaiDT], [TenDienThoai], [MauSac], [KieuDang], [GiaNhap], [SoLuong]) VALUES (74, 1, N'sam sung', N'xs', N'xám', 20000.0000, 12)
SET IDENTITY_INSERT [dbo].[DienThoai] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (78, 1, 1, CAST(N'2019-12-20' AS Date), 63000.0000, N'2@gmail.com', N'191220001')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (79, 1, 1, CAST(N'2019-12-10' AS Date), 3000.0000, N'2@gmail.com', N'191220002')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (80, 1, 1, CAST(N'2000-12-20' AS Date), 40000.0000, N'2@gmail.com', N'191220003')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (81, 1, 1, CAST(N'2019-12-20' AS Date), 71000.0000, N'2@gmail.com', N'191220004')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (82, 1, 1, CAST(N'2019-12-21' AS Date), 393000.0000, N'2@gmail.com', N'191221001')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (83, 1, 1, CAST(N'2019-12-19' AS Date), 60000.0000, N'2@gmail.com', N'191221002')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (84, 1, 1, CAST(N'2019-12-22' AS Date), 40000.0000, N'2@gmail.com', N'191222001')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (85, 1, 1, CAST(N'2019-12-22' AS Date), 40000.0000, N'2@gmail.com', N'191222001')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (86, 1, 1, CAST(N'2019-12-22' AS Date), 40000.0000, N'2@gmail.com', N'191222001')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (87, 1, 1, CAST(N'2019-12-23' AS Date), 20000.0000, N'2@gmail.com', N'191223001')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (88, 1, 1, CAST(N'2019-12-23' AS Date), 200000.0000, N'2@gmail.com', N'191223001')
INSERT [dbo].[DonHang] ([MaDonHang], [MaNhanVien], [MaKhachHang], [NgayTao], [TongTien], [GhiChu], [SoDonHang]) VALUES (89, 1, 1, CAST(N'2019-12-23' AS Date), 50000.0000, N'2@gmail.com', N'191223003')
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [NgaySinh], [GioiTinh], [Email]) VALUES (1, N'hoàng', CAST(N'1000-09-10' AS Date), 1, N'2@gmail.com')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [NgaySinh], [GioiTinh], [Email]) VALUES (2, N'pro', CAST(N'2000-02-02' AS Date), 1, N'vl@gmail.com')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [NgaySinh], [GioiTinh], [Email]) VALUES (11, N'a', CAST(N'2000-01-02' AS Date), 0, N'nam@gmail.com')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [NgaySinh], [GioiTinh], [Email]) VALUES (12, N'thanh hai', CAST(N'1000-02-02' AS Date), 0, N'1@gmail.com')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiDienThoai] ON 

INSERT [dbo].[LoaiDienThoai] ([MaLoaiDT], [TenLoaiDT], [GhiChu]) VALUES (1, N'kk', N'')
INSERT [dbo].[LoaiDienThoai] ([MaLoaiDT], [TenLoaiDT], [GhiChu]) VALUES (2, N'bàn phím', N'102')
INSERT [dbo].[LoaiDienThoai] ([MaLoaiDT], [TenLoaiDT], [GhiChu]) VALUES (4, N'kk', N'')
SET IDENTITY_INSERT [dbo].[LoaiDienThoai] OFF
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [GhiChu]) VALUES (1, N'hihi', NULL)
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [GhiChu]) VALUES (2, N'vl', N'')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [GhiChu]) VALUES (3, N'iu', N'lol')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [GhiChu]) VALUES (4, N'bang', N'uc')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [GhiChu]) VALUES (5, N'j', N'j')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [GhiChu]) VALUES (6, N'a', N'a')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNhanVien], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [Email], [ChucVu]) VALUES (1, N'admin', N'1234', N'admin', CAST(N'2000-10-25' AS Date), 0, N'hai2k@gmail.com', N'Quản lý')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [Email], [ChucVu]) VALUES (9, N'derid', N'anhnam', N'thanhnhair', CAST(N'1900-01-01' AS Date), 1, N'nam@gmail.com', N'Quản lý')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [Email], [ChucVu]) VALUES (17, N'admin', N'12', N'thanh hải', CAST(N'2000-02-02' AS Date), 0, N'hai@gmail.com', N'Quản lý')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [Email], [ChucVu]) VALUES (18, N'admin', N'12', N'thanh hải', CAST(N'2000-02-02' AS Date), 0, N'hai@gmail.com', N'Quản lý')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhanVien], [MaNhaCungCap], [NgayTao], [GhiChu], [SoPhieuNhap], [TongTien]) VALUES (33, 1, 1, CAST(N'2019-12-20' AS Date), N'null', N'191220001', 1000.0000)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhanVien], [MaNhaCungCap], [NgayTao], [GhiChu], [SoPhieuNhap], [TongTien]) VALUES (34, 1, 1, CAST(N'2019-12-20' AS Date), N'null', N'191220001', 1000.0000)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhanVien], [MaNhaCungCap], [NgayTao], [GhiChu], [SoPhieuNhap], [TongTien]) VALUES (35, 1, 1, CAST(N'2019-12-20' AS Date), N'null', N'191220001', 1001000.0000)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhanVien], [MaNhaCungCap], [NgayTao], [GhiChu], [SoPhieuNhap], [TongTien]) VALUES (39, 1, 1, CAST(N'2019-12-21' AS Date), N'null', N'191221001', 1200000.0000)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhanVien], [MaNhaCungCap], [NgayTao], [GhiChu], [SoPhieuNhap], [TongTien]) VALUES (40, 1, 1, CAST(N'2019-12-21' AS Date), N'null', N'191221001', 1200240.0000)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhanVien], [MaNhaCungCap], [NgayTao], [GhiChu], [SoPhieuNhap], [TongTien]) VALUES (42, 1, 1, CAST(N'2019-12-23' AS Date), N'null', N'191223001', 10000.0000)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhanVien], [MaNhaCungCap], [NgayTao], [GhiChu], [SoPhieuNhap], [TongTien]) VALUES (43, 1, 1, CAST(N'2019-12-23' AS Date), N'null', N'191223001', 1000000.0000)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhanVien], [MaNhaCungCap], [NgayTao], [GhiChu], [SoPhieuNhap], [TongTien]) VALUES (44, 1, 1, CAST(N'2019-12-23' AS Date), N'null', N'191223001', 3600000.0000)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DienThoai] FOREIGN KEY([MaDienThoai])
REFERENCES [dbo].[DienThoai] ([MaDienThoai])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DienThoai]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap] FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NhanVien]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
USE [master]
GO
ALTER DATABASE [DuAn] SET  READ_WRITE 
GO
