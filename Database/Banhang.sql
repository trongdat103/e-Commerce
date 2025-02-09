USE [master]
GO
/****** Object:  Database [Shops]    Script Date: 1/17/2024 4:35:14 PM ******/
CREATE DATABASE [Shops]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shops', FILENAME = N'D:\SQL-SERVER\MSSQL16.SQLEXPRESS\MSSQL\DATA\Shops.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shops_log', FILENAME = N'D:\SQL-SERVER\MSSQL16.SQLEXPRESS\MSSQL\DATA\Shops_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Shops] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shops].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shops] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shops] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shops] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shops] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shops] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shops] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shops] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shops] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shops] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shops] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shops] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shops] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shops] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shops] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shops] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shops] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shops] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shops] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shops] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shops] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shops] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shops] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shops] SET RECOVERY FULL 
GO
ALTER DATABASE [Shops] SET  MULTI_USER 
GO
ALTER DATABASE [Shops] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shops] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shops] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shops] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shops] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shops] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Shops] SET QUERY_STORE = OFF
GO
USE [Shops]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDDH] [int] NOT NULL,
	[IDSP] [int] NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[Soluong] [real] NOT NULL,
	[DonGia] [real] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC,
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaPN] [int] NOT NULL,
	[IDSP] [int] NOT NULL,
	[DonGiaNhap] [int] NOT NULL,
	[SoLuongNhap] [int] NULL,
 CONSTRAINT [PK_ChiTietPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHangg]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHangg](
	[NgayDat] [datetime] NULL,
	[TinhTrangGiao] [tinyint] NULL,
	[DaThanhToan] [tinyint] NULL,
	[MaTV] [int] NOT NULL,
	[UuDai] [nvarchar](50) NULL,
	[NgayGiao] [datetime] NULL,
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DonDatHangg] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[IDLSP] [int] IDENTITY(1,1) NOT NULL,
	[MaLSP] [nvarchar](50) NULL,
	[TenLSP] [nvarchar](500) NULL,
	[Icon] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[IDLSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiThanhVien]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien](
	[MaLoaiTV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTV] [nvarchar](50) NULL,
	[UuDai] [real] NULL,
 CONSTRAINT [PK_LoaiThanhVien] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiThanhVien_Quyenn]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien_Quyenn](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[MaLoaiTV] [int] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiThanhVien_Quyenn] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC,
	[MaLoaiTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemuDoc]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemuDoc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenMenu] [nvarchar](500) NULL,
 CONSTRAINT [PK_MemuDoc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[IDNCC] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenNCC] [nvarchar](150) NULL,
	[DiaChiNCC] [nvarchar](500) NULL,
	[EmailNCC] [nvarchar](50) NULL,
	[DienThoaiNCC] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap_1] PRIMARY KEY CLUSTERED 
(
	[IDNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhanvien]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhanvien](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[HoVaTen] [nvarchar](50) NOT NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](200) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[IDNSX] [int] IDENTITY(1,1) NOT NULL,
	[NhomNhaSX] [int] NULL,
	[MaNSX] [nvarchar](50) NULL,
	[TenNSX] [nvarchar](500) NULL,
	[ThongTinNSX] [nvarchar](950) NULL,
	[LogoNSX] [nvarchar](50) NULL,
	[DiaChiNSX] [nvarchar](500) NULL,
	[DienThoaiNSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[IDNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[IDNCC] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[DaXoa] [tinyint] NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](50) NULL,
	[TenSP] [nvarchar](500) NULL,
	[DonGia] [real] NULL,
	[NgayCapNhat] [datetime] NULL,
	[CauHinh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh1] [nvarchar](50) NULL,
	[HinhAnh2] [nvarchar](50) NULL,
	[HinhAnh3] [nvarchar](50) NULL,
	[HinhAnh4] [nvarchar](50) NULL,
	[SoLuongTon] [int] NULL,
	[LuotXem] [int] NULL,
	[LuotBinhChon] [int] NULL,
	[LuotBinhLuan] [int] NULL,
	[SoLanMua] [int] NULL,
	[Moi] [tinyint] NULL,
	[IDNCC] [int] NULL,
	[IDNSX] [int] NULL,
	[IDLSP] [int] NULL,
	[DaXoa] [tinyint] NULL,
	[IDSP] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPhooom]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhooom](
	[IDSP] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [nvarchar](50) NULL,
	[TenSP] [nvarchar](500) NULL,
	[DonGia] [real] NULL,
	[NgayCapNhat] [datetime] NULL,
	[CauHinh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh1] [nvarchar](50) NULL,
	[HinhAnh2] [nvarchar](50) NULL,
	[HinhAnh3] [nvarchar](50) NULL,
	[HinhAnh4] [nvarchar](50) NULL,
	[SoLuongTon] [int] NULL,
	[LuotXem] [int] NULL,
	[LuotBinhChon] [int] NULL,
	[LuotBinhLuan] [int] NULL,
	[SoLanMua] [int] NULL,
	[Moi] [tinyint] NULL,
	[IDNCC] [int] NULL,
	[IDNSX] [int] NULL,
	[IDLSP] [int] NULL,
	[DaXoa] [tinyint] NULL,
 CONSTRAINT [PK_SanPhams] PRIMARY KEY CLUSTERED 
(
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaTV] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[Hoten] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[MaLoaiTV] [int] NOT NULL,
 CONSTRAINT [PK_ThanhViens] PRIMARY KEY CLUSTERED 
(
	[MaTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 1/17/2024 4:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [int] IDENTITY(1,1) NOT NULL,
	[HinhBia] [nvarchar](150) NULL,
	[TieuDe] [nvarchar](150) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (5, 14, N'Ly uống rựu vang cao cấp', 2, 6000000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (5, 29, N'Nồi cơm điện tử BlueStone 1.8 lít RCB-5938', 3, 1090000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (6, 9, N'Toshiba Inverter 180 lít GR-B22VU UKG', 4, 1839000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (1003, 30, N'Smart Tivi NanoCell LG 4K 75 inch 75NANO76SQA', 1, 7900000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (1004, 14, N'Ly uống rựu vang cao cấp', 2, 6000000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (1006, 2, N'Aqua 90 lít AQR-D99FA(BS)', 2, 3290000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (1007, 29, N'Nồi cơm điện tử BlueStone 1.8 lít RCB-5938', 2, 1090000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (1008, 24, N'LG Inverter 217 lít GV-B212WB', 2, 1844000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (1008, 29, N'Nồi cơm điện tử BlueStone 1.8 lít RCB-5938', 2, 1090000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (1009, 14, N'Ly uống rựu vang cao cấp', 2, 6000000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (1010, 7, N'Samsung Inverter 655 lít RS62R5001B4/SV', 2, 1549000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (1010, 15, N'Samsung Smart TV QLED QA43Q65A', 3, 9900000)
INSERT [dbo].[ChiTietDonHang] ([MaDDH], [IDSP], [TenSP], [Soluong], [DonGia]) VALUES (1011, 1, N'Bình đun siêu tốc Delites 1.8 lít ST18S05', 3, 200000)
GO
SET IDENTITY_INSERT [dbo].[DonDatHangg] ON 

INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2023-12-25T09:01:23.123' AS DateTime), 0, 0, 2, N'0', CAST(N'2026-05-11T18:12:00.000' AS DateTime), 3)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2023-12-25T09:03:14.153' AS DateTime), 1, 1, 1, N'50', NULL, 4)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2023-12-28T23:23:39.307' AS DateTime), 1, 1, 1, N'50', CAST(N'2029-11-24T18:12:00.000' AS DateTime), 5)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2023-12-30T19:42:00.187' AS DateTime), 0, 0, 1, N'50', NULL, 6)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2024-01-08T14:15:46.810' AS DateTime), 1, 1, 1, N'0', NULL, 1003)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2024-01-08T14:21:27.830' AS DateTime), 1, 1, 1, N'0', NULL, 1004)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2024-01-08T00:00:00.000' AS DateTime), 1, 1, 1, N'0', NULL, 1005)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2024-01-08T14:41:36.643' AS DateTime), 0, 0, 1, N'0', NULL, 1006)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2024-01-08T14:49:03.623' AS DateTime), 1, 1, 5, N'50', CAST(N'2024-01-08T00:00:00.000' AS DateTime), 1007)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2024-01-08T16:19:19.317' AS DateTime), 0, 0, 1, N'0', NULL, 1008)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2024-01-09T09:20:04.327' AS DateTime), 0, 0, 1, N'0', NULL, 1009)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2024-01-10T14:35:18.163' AS DateTime), 1, 1, 1, N'0', NULL, 1010)
INSERT [dbo].[DonDatHangg] ([NgayDat], [TinhTrangGiao], [DaThanhToan], [MaTV], [UuDai], [NgayGiao], [MaDDH]) VALUES (CAST(N'2024-01-16T18:25:22.977' AS DateTime), 1, 1, 1, N'0', NULL, 1011)
SET IDENTITY_INSERT [dbo].[DonDatHangg] OFF
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKhachHang], [NgaySinh], [DiaChi], [SDT], [Email]) VALUES (2, N'Bánh Bao', CAST(N'2023-03-03T00:00:00.000' AS DateTime), N'Phú Yên', N'0977530806', N'Topmarvel123@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (1, N'GiaDung', N'Gia dụng', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (2, N'tivi', N'Tivi
', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (3, N'dienlanh', N'Tủ lạnh
', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (4, N'maygiat', N'Máy giặt
', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (5, N'maysay', N'Máy sấy', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (6, N'locnuoc', N'Lọc nước
', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (7, N'tudong', N'Tủ đông
', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (8, N'Maylanh', N'Máy lạnh', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (9, N'
Noicom
', N'
Nồi cơm
', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (10, N'NoiChien', N'Nồi chiên', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (11, N'Bepdien', N'
Bếp điện', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (12, N'HutBui', N'
Robot hút bụi', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (13, N'Loa', N'
Loa
', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (14, N'DienThoai', N'Điện thoại', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (15, N'Maycu', N'
Máy cũ', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (16, N'Cap', N'Cáp', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (17, N'Dieukhien', N'Điều khiển TV', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (18, N'BoxTV', N'Android TV Box', NULL)
INSERT [dbo].[LoaiSanPham] ([IDLSP], [MaLSP], [TenLSP], [Icon]) VALUES (19, N'KhungTV', N'Khung treo TV', NULL)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] ON 

INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoaiTV], [UuDai]) VALUES (1, N'VIP', 50)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoaiTV], [UuDai]) VALUES (2, N'Thường', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoaiTV], [UuDai]) VALUES (3, N'Admin', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoaiTV], [UuDai]) VALUES (4, N'Nhân viên', 0)
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] OFF
GO
INSERT [dbo].[LoaiThanhVien_Quyenn] ([MaQuyen], [MaLoaiTV], [GhiChu]) VALUES (N'QuanLyDonHang', 3, NULL)
INSERT [dbo].[LoaiThanhVien_Quyenn] ([MaQuyen], [MaLoaiTV], [GhiChu]) VALUES (N'QuanLyDonHang', 4, NULL)
INSERT [dbo].[LoaiThanhVien_Quyenn] ([MaQuyen], [MaLoaiTV], [GhiChu]) VALUES (N'QuanLyQuyen', 3, NULL)
INSERT [dbo].[LoaiThanhVien_Quyenn] ([MaQuyen], [MaLoaiTV], [GhiChu]) VALUES (N'QuanLySanPham', 3, NULL)
INSERT [dbo].[LoaiThanhVien_Quyenn] ([MaQuyen], [MaLoaiTV], [GhiChu]) VALUES (N'QuanLySanPham', 4, NULL)
INSERT [dbo].[LoaiThanhVien_Quyenn] ([MaQuyen], [MaLoaiTV], [GhiChu]) VALUES (N'QuanLyTV', 3, NULL)
INSERT [dbo].[LoaiThanhVien_Quyenn] ([MaQuyen], [MaLoaiTV], [GhiChu]) VALUES (N'ThongKe', 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[MemuDoc] ON 

INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (1, N'Tivi Loa, dàn karaoke
label ')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (2, N'Tủ lạnh Tủ đông Tủ mát')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (3, N'Máy giặt Máy sấy Máy lạnh')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (4, N'Máy nước nóng Quạt điều hòa')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (5, N' Điện gia dụng Sinh tố Xay ép')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (6, N'Bếp điện Nồi cơm Đồ bếp')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (7, N'Máy lọc nước Nồi chiên
')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (8, N'Máy hút bụi Máy rửa chén')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (9, N'Sức khoẻ Làm đẹp')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (10, N'Đồ nghề - dụng cụ sửa chữa')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (11, N'Điện thoại Laptop Tablet')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (12, N'Phụ kiện Đồng hồ')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (13, N'Xe đạp Phụ kiện xe đạp')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (14, N'Máy cũ, trưng bày')
INSERT [dbo].[MemuDoc] ([Id], [TenMenu]) VALUES (15, N'Dịch vụ hữu ích')
SET IDENTITY_INSERT [dbo].[MemuDoc] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([IDNCC], [MaNCC], [TenNCC], [DiaChiNCC], [EmailNCC], [DienThoaiNCC]) VALUES (1, N'Sovina', N'Công ty cổ phần Sovina', N'Nhà LK - 08 khu B4 Nam Trung Yên, Phố Nguyễn Chánh, P. Yên Hoà, Q. Cầu Giấy, TP Hà Nội (TPHN)', N'sovina@sovina.vn', N'0913 095 168')
INSERT [dbo].[NhaCungCap] ([IDNCC], [MaNCC], [TenNCC], [DiaChiNCC], [EmailNCC], [DienThoaiNCC]) VALUES (2, N'Vietland', N'công ty tnhh xuất nhập khẩu Vietland', N'Số 9 đường Ngọc Hồi, Phường Hoàng Liệt, Quận Hoàng Mai, TP Hà Nội (TPHN)', N'ketnguyen@vietlandco.com.vn', N'0904 329 500')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[Nhanvien] ON 

INSERT [dbo].[Nhanvien] ([ID], [Username], [Password], [HoVaTen], [SoDienThoai], [HinhAnh]) VALUES (1, N'sa', N'111', N'Bé Ba', NULL, NULL)
INSERT [dbo].[Nhanvien] ([ID], [Username], [Password], [HoVaTen], [SoDienThoai], [HinhAnh]) VALUES (2, N'a', N'1', N'a', N'13', N'ffd')
INSERT [dbo].[Nhanvien] ([ID], [Username], [Password], [HoVaTen], [SoDienThoai], [HinhAnh]) VALUES (3, N'abc', N'123', N'Nguyễn Văn B', N'0977', NULL)
INSERT [dbo].[Nhanvien] ([ID], [Username], [Password], [HoVaTen], [SoDienThoai], [HinhAnh]) VALUES (4, N'sa', N'1', N'vvvv', N'09793111', NULL)
SET IDENTITY_INSERT [dbo].[Nhanvien] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([IDNSX], [NhomNhaSX], [MaNSX], [TenNSX], [ThongTinNSX], [LogoNSX], [DiaChiNSX], [DienThoaiNSX]) VALUES (1, 1, N'Masan', N'Tập Đoàn Kangaroo – CTCP tập Đoàn Điện Lạnh Điện Máy Việt Úc', N'Gia vị', N'logo-kangaroo.png', N'Tầng 12, tòa nhà MPlaza SaigonSố 39 Lê Duẩn, Phường', N'(84.28) 62 555 660')
INSERT [dbo].[NhaSanXuat] ([IDNSX], [NhomNhaSX], [MaNSX], [TenNSX], [ThongTinNSX], [LogoNSX], [DiaChiNSX], [DienThoaiNSX]) VALUES (2, 1, N'CaiLan', N'Gowell', N'Dầu ăn', N'Logo_Gowell-01-1.png', N' Khu Công nghiệp Cái Lân, Thành phố Hạ Long, Tỉnh Quảng Ninh, Việt Nam', N'(84 33) 3846 993')
INSERT [dbo].[NhaSanXuat] ([IDNSX], [NhomNhaSX], [MaNSX], [TenNSX], [ThongTinNSX], [LogoNSX], [DiaChiNSX], [DienThoaiNSX]) VALUES (3, 1, N'Acecook ', N'Công Ty Đồ Gia Dụng Nhôm Inox Kim Cương', N'Mì ăn liền', N'logo_NhomKC.png', N'Lô II-3, Đường số 11, KCN Tân Bình, Phường Tây Thạnh, Quận Tân Phú, Tp. Hồ Chí Minh.', N'(028) 3815 4064')
INSERT [dbo].[NhaSanXuat] ([IDNSX], [NhomNhaSX], [MaNSX], [TenNSX], [ThongTinNSX], [LogoNSX], [DiaChiNSX], [DienThoaiNSX]) VALUES (4, 1, N'VIFON', N'Công Ty TNHH Megahome', N'Thực phẩm', N'megahomevietnam-logo.jpg', N'913 Trường Chinh, phường Tây Thạnh, quận Tân Phú, TPHCM', N'1800-1097')
INSERT [dbo].[NhaSanXuat] ([IDNSX], [NhomNhaSX], [MaNSX], [TenNSX], [ThongTinNSX], [LogoNSX], [DiaChiNSX], [DienThoaiNSX]) VALUES (5, 1, N'Vissan', N'Công Ty TNHH MTV Thông Tin Điện Tử Z755', N'Gia vị', N'logo755.jpg', N'420 Nơ Trang Long, P. 13, Quận Bình Thạnh, TP.HCM', N'(84 28) 3553 3999 - 3553 3888')
INSERT [dbo].[NhaSanXuat] ([IDNSX], [NhomNhaSX], [MaNSX], [TenNSX], [ThongTinNSX], [LogoNSX], [DiaChiNSX], [DienThoaiNSX]) VALUES (6, 1, N'Saota', N'Công Ty Cổ Phần GROUPE SEB Việt Nam', N'Mì ăn liền', N'L39569408900-03.gif', N' Km 2132, Quốc lộ 1A, thành phố Sóc Trăng, tỉnh Sóc Trăng, Việt Nam', N'(84-299) 3822223 - 3822203')
INSERT [dbo].[NhaSanXuat] ([IDNSX], [NhomNhaSX], [MaNSX], [TenNSX], [ThongTinNSX], [LogoNSX], [DiaChiNSX], [DienThoaiNSX]) VALUES (7, 1, N'AChau', N'Công ty cổ phần thực phẩm Á Châu.', N'Thực phẩm', N'L39577384000.gif', N'Số 9/2, đường ĐT 743, khu phố 1B, phường An Phú,thị xã Thuận An, tỉnh Bình Dương', N'(028) 4450 0588')
INSERT [dbo].[NhaSanXuat] ([IDNSX], [NhomNhaSX], [MaNSX], [TenNSX], [ThongTinNSX], [LogoNSX], [DiaChiNSX], [DienThoaiNSX]) VALUES (9, 1, N'Samsung', N'Công Ty Samsung', NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([IDNSX], [NhomNhaSX], [MaNSX], [TenNSX], [ThongTinNSX], [LogoNSX], [DiaChiNSX], [DienThoaiNSX]) VALUES (10, 1, N'LG', N'Công Ty LG', NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([IDNSX], [NhomNhaSX], [MaNSX], [TenNSX], [ThongTinNSX], [LogoNSX], [DiaChiNSX], [DienThoaiNSX]) VALUES (11, 1, N'Sony', N'Công Ty Sony', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
GO
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLyDonHang', N'Quản lý đơn hàng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLyQuyen', N'Quản lý quyền')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLySanPham', N'Quản lý sản phẩm')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLyTV', N'Quản lý thành viên')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'ThongKe', N'Thống kê')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'SieuToc', N'Bình đun siêu tốc Delites 1.8 lít ST18S05', 200000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Bình đun siêu tốc Delites kiểu dáng đơn giản, chất liệu inox với viền', N'Bình đun siêu tốc Delites kiểu dáng đơn giản, chất liệu inox với viền nhựa đen tinh tế, dùng đẹp trong mọi không gian, từ nhà ở đến văn phòng, khách sạn, bệnh viện,…
Dung tích 1.8 lít đủ dùng cho gia đình 3 – 4 người, pha trà, cà phê, nấu mì, pha nước tắm trẻ… nhanh gọn, tiện lợi.', N'Binhdun1.jpg', N'', N'', N'', 10, 1, 55, 1, 1, 1, 1, 1, 1, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TulanhAqua', N'Aqua 90 lít AQR-D99FA(BS)', 3290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'Tulanh1Aqua.jpg', N'7_2.jpg', NULL, NULL, 10, 5, 8, 0, 1, 0, 2, 1, 3, 0, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TuLanhSamsung', N'Samsung Inverter 280 lít RB27N4010BU/SV', 1349000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'samsung1.jpg', N'8_2.jpg', NULL, NULL, 10, 5, 8, 0, 0, 1, 2, 2, 3, 0, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TulanhAqua', N'Aqua Inverter 189 lít AQR-T220FA(FB) Mới 2023', 1149000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'TulanhAqua2023.jpg', N'9.jpg', NULL, NULL, 10, 4, 2, 1, 0, 0, 2, 3, 3, 0, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TulanhToshiba', N'Toshiba Inverter 460 lít GR-RS600WI-PMV(37)-SG', 1449000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'toshiba1.jpg', N'11.jpg', NULL, NULL, 10, 4, 2, 2, 0, 0, 1, 4, 3, 0, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TulanhToshiba', N'Toshiba Inverter 233 lít GR-A28VM(UKG1)', 1859000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'toshiba2.jpg', N'12_1.jpg', NULL, NULL, 10, 3, 2, 3, 1, 0, 1, 1, 3, 0, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TuLanhSamsung', N'Samsung Inverter 655 lít RS62R5001B4/SV', 1549000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'samsung2.jpg', NULL, NULL, NULL, 10, 2, 1, 3, 2, 1, 2, 1, 3, 0, 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TuLanhSamsung', N'Samsung Inverter 236 lít RT22M4032BY/SV', 1249000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'samsung3.jpg', NULL, NULL, NULL, 10, 11, 1, 3, 1, 0, 2, 2, 3, 0, 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TuLanhToshiba', N'Toshiba Inverter 180 lít GR-B22VU UKG', 1839000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'toshiba3.jpg', NULL, NULL, NULL, 10, 1, 2, 3, 2, 1, 1, 2, 3, 0, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'BepTu', N'Bếp từ đôi lắp âm Chef''s EH - DIH203', 1290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'beptu1.jpg', N'', NULL, NULL, 10, 1, 1, 1, 1, 0, 1, 1, 11, 0, 10)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'MayLocNuoc', N'Máy lọc nước RO nóng nguội lạnh Karofi KAD-X39 10 lõi', 6090000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'maylocnuoc1.jpg', N'', NULL, NULL, 10, 1, 1, 1, 1, 1, 1, 1, 6, 0, 11)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'NoiChien', N'Nồi chiên không dầu Sunhouse SHD4026 6 lít', 1290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'noichien2.jpg', N'', NULL, NULL, 10, 1, 1, 1, 1, 0, 1, 1, 10, 0, 12)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'MayLocNuoc', N'Máy ép trái cây Crystal GS-333', 6090000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'mayeptraicay1.jpg', NULL, NULL, NULL, 10, 1, 1, 1, 1, 1, 1, 1, 6, 0, 13)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Ly', N'Ly uống rựu vang cao cấp', 6000000, CAST(N'2022-12-12T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'4_1.jpg', N'4_2.jpg', NULL, NULL, 100, 0, 28, 0, 0, 0, 1, 1, 1, 0, 14)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Tivi', N'Samsung Smart TV QLED QA43Q65A', 9900000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Smart Tivi QLED 4K 43 inch Samsung QA43Q65A', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'tivisamsung11.jpg', NULL, NULL, NULL, 50, 120, 40, 0, 4, 1, 2, 9, 2, 0, 15)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Cap', N'Cáp HDMI 2.0 Tròn 2m eValu DS201-WB', 95000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Cáp HDMI 2.0 Tròn 2m eValu DS201-WB', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'Caphdmi.jpg', NULL, NULL, NULL, 300, 4, 1, 2, 3, 0, 2, 1, 16, 0, 16)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Cap', N'Cáp Audio 2RCA 2m eSaver DS148-WB Đen', 20000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Cáp video 3RCA eSaver DS147-TB ', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'cap2.jpg', NULL, NULL, NULL, 300, 4, 1, 2, 3, 1, 2, 1, 16, 0, 17)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Dieukhien', N'Điều khiển Tivi LCD-LED Sony COSANO RM-SN01 Đen', 80000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Điều khiển Tivi LCD-LED Sony COSANO RM-SN01 Đen ', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'dieukhien1.jpg', NULL, NULL, NULL, 49, 4, 1, 2, 2, 0, 2, 1, 17, 0, 18)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Dieukhien', N'Điều khiển Tivi LCD-LED Samsung COSANO RM-SS05 Đen', 100000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Điều khiển Tivi LCD-LED Samsung COSANO RM-SS05 Đen', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'dieukhien2.jpg', NULL, NULL, NULL, 50, 4, 1, 2, 2, 1, 2, 1, 17, 0, 19)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'AndroidTV', N'Apple TV 4K 64GB MXH02 ', 4790000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Apple TV 4K 64GB MXH02  ', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'androidTV1.jpg', NULL, NULL, NULL, 30, 7, 4, 4, 2, 0, 2, 1, 18, 0, 20)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'AndroidTV', N'Apple TV Siri Remote MJFN3 ', 1350000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Apple TV Siri Remote MJFN3', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'androidTV2.jpg', NULL, NULL, NULL, 30, 7, 4, 4, 2, 1, 2, 1, 18, 0, 21)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'KhungTreoTV', N'Khung treo Tivi 32-60 inch Đa năng Văn Thành X5', 495000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Khung treo Tivi 32-60 inch Đa năng Văn Thành X5', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'KhungTV1.jpg', NULL, NULL, NULL, 30, 7, 4, 4, 2, 0, 2, 1, 19, 0, 22)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'KhungTreoTV', N'Khung treo tivi 39-65 inch nghiêng Cảnh Phong C65N', 370000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Khung treo tivi 39-65 inch nghiêng Cảnh Phong C65N', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'KhungTV2.jpg', NULL, NULL, NULL, 30, 8, 5, 4, 4, 1, 2, 1, 19, 0, 23)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TulanhLG', N'LG Inverter 217 lít GV-B212WB', 1844000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'LG1.jpg', NULL, NULL, NULL, 10, 1, 3, 1, 3, 0, 1, 2, 3, 0, 24)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TulanhLG', N'LG Inverter 266 lít GV-B262WB', 1249000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'LG2.jpg', NULL, NULL, NULL, 10, 1, 0, 1, 3, 1, 1, 3, 3, 0, 25)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TulanhAqua', N'Aqua 90 lít AQR-D99FA(BS)', 3290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'TulanhAqua3.jpg', NULL, NULL, NULL, 0, 1, 1, 1, 1, 0, 1, 1, 3, 0, 26)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'TulanhAqua', N'Aqua 90 lít AQR-D99FA(BS)', 3290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'TulanhAQUA4.jpg', NULL, NULL, NULL, 10, 1, 1, 1, 1, 0, 1, 1, 3, 0, 27)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'NoiChien', N'Nồi chiên không dầu AVA KDF-593D 7.5 lít', 1290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'noichien1.jpg', N'noi-chien-khong-dau-rapido-raf.jpg', N'ava3.jpg', N'ava4.jpg', 10, 1, 1, 1, 1, 0, 1, 1, 10, 0, 28)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'NoiCom', N'Nồi cơm điện tử BlueStone 1.8 lít RCB-5938', 1090000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'noicom1.jpg', N'', NULL, NULL, 10, 1, 1, 1, 1, 1, 1, 1, 9, 0, 29)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Tivi', N'Smart Tivi NanoCell LG 4K 75 inch 75NANO76SQA', 7900000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Smart Tivi NanoCell LG 4K 75 inch 75NANO76SQA', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'tiviLG1.jpg', NULL, NULL, NULL, 30, 200, 70, 3, 3, 0, 2, 10, 2, 0, 30)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Tivi', N'Google Tivi Sony 4K 65 inch KD-65X80L', 9000000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Google Tivi Sony 4K 65 inch KD-65X80L', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'Sony1.jpg', NULL, NULL, NULL, 50, 100, 60, 6, 4, 1, 2, 11, 2, 0, 31)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Banhxeo', N'Bánh Xè', 500000, CAST(N'2023-12-29T00:00:00.000' AS DateTime), N'3000', N'<p>hhhhh</p>', N'sssaaaw.jpg', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, 1, 1, 2, 0, 46)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Tivi', N'Google Tivi Sony 4K 43 inch KD-43X80K', 1239000, CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'GGGGGGGGGGGGGGG', NULL, N'Tivisony1239.jpg', NULL, NULL, NULL, 400, NULL, NULL, NULL, NULL, 1, 1, 11, 2, 0, 1003)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Tivi', N'Smart Tivi LG 4K 75 inch 75UQ8000PSC ', 500000, CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'ffffffffffffffffffffsssssssss', N'<p>-&nbsp;<a title="Smart Tivi LG 4K 75 inch 75UQ8000PSC" href="https://www.dienmayxanh.com/tivi/smart-lg-4k-75-inch-75uq8000psc" target="_blank" rel="noopener">Smart Tivi LG 4K 75 inch 75UQ8000PSC</a>&nbsp;sở hữu m&agrave;n h&igrave;nh phẳng với&nbsp;<strong>c&aacute;c cạnh viền si&ecirc;u mỏng</strong>&nbsp;sang trọng,&nbsp;<strong><a title="Xem th&ecirc;m tivi m&agrave;n h&igrave;nh 75 inch kinh doanh tại Điện m&aacute;y XANH" href="https://www.dienmayxanh.com/tivi?g=75-inch" target="_blank" rel="noopener">k&iacute;ch thước m&agrave;n h&igrave;nh 75 inch</a>&nbsp;</strong>ph&ugrave; hợp bố tr&iacute; cho ph&ograve;ng rộng như ph&ograve;ng kh&aacute;ch, ph&ograve;ng họp lớn, sảnh chờ, ph&ograve;ng hội nghị,...</p>
<p>-&nbsp;Ch&acirc;n đế&nbsp;<a title="Xem th&ecirc;m c&aacute;c sản phẩm tivi đang b&aacute;n tại Điện m&aacute;y XANH" href="https://www.dienmayxanh.com/tivi" target="_blank" rel="noopener">tivi</a>&nbsp;<strong>chất liệu</strong>&nbsp;<strong>nhựa l&otilde;i kim loại</strong>&nbsp;chắc chắn v&agrave; bền tốt, dễ d&agrave;ng lắp tivi để kệ hay th&aacute;o rời ch&acirc;n đế lắp treo tường tiết kiệm kh&ocirc;ng gian. Nhờ thiết kế tinh tế, Smart Tivi LG 4K 75 inch 75UQ8000PSC<strong><em>&nbsp;</em></strong>tạo điểm nhấn cho kh&ocirc;ng gian lắp đặt, th&ecirc;m thẩm mỹ, th&ecirc;m t&iacute;nh hiện đại v&agrave; nghệ thuật.</p>', N'LGVVV.jpg', NULL, NULL, NULL, 400, NULL, NULL, NULL, NULL, 1, 1, 10, 2, 0, 1004)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Tivi', N'Smart Tivi Samsung 4K 65 inch UA65CU8000 ', 500000, CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'ffffffffffffffffffffsssssssss', N'<p>SSSSSSSSSSSSSSSSSSSSSAAAAAAAAAAA</p>', N'smart-tivi-samsung-4k-65-inch-ua65cu8000.png', NULL, NULL, NULL, 400, NULL, NULL, NULL, NULL, 1, 1, 9, 2, 0, 1005)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Tivi', N'Smart Tivi Samsung 4K Crystal UHD', 300000, CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'3000', N'<p>XXXXXXXXAAAAAAAAAAA</p>', N'SAMSUNGCCA.jpg', NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 1, 1, 9, 2, 0, 1006)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Noi', N'Bộ 3 nồi nhôm anod nắp kính Sunhouse', 450000, CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'dddddddddddddsss', N'<p>ssssssssaaaaaaaaaaawwww</p>', N'Noinhom1.jpg', NULL, NULL, NULL, 100, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1007)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Noi', N'Nồi luộc gà inox 3 đáy nắp kính 28 cm Sunhouse', 530000, CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'ffffffffffffffffffffsssssssss', N'<p>saaaaaaaaaaaaaaaaaaaaaaa</p>', N'noiluocga.jpg', NULL, NULL, NULL, 100, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1008)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Dao', N'Bộ dao nhựa Delites LK2311', 100000, CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'GGGGGGGGGGGGGGG', N'<p>dddddddddddddddaaaaaaaa&acirc;xxxxxxxxx</p>', N'dao.jpg', NULL, NULL, NULL, 100, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1009)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Thot', N'Thớt lúa mạch oval 35 x 22 cm Delites ', 84000, CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'GGGGGGGGGGGGGGG', N'<p>xxxxxxxxxxxaaaaaa&acirc;ssssssss</p>', N'Thot1.jpg', NULL, NULL, NULL, 200, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1010)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Maysinhto', N'Máy làm sữa hạt đa năng BlueStone ', 1690000, CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'dddddddddddddsss', N'<p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxaaaaaaaaaaaaaaaaaaaaaa</p>', N'sinhto1.jpg', NULL, NULL, NULL, 200, NULL, 30, NULL, NULL, 0, 1, 1, 1, 0, 1011)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa], [IDSP]) VALUES (N'Maycaphe', N'Máy pha cà phê Delonghi', 6490000, CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'xxxxxxxxxxxxxxxxaaaaa', N'<p><strong><em><a title="Tham khảo c&aacute;c mẫu m&aacute;y pha c&agrave; ph&ecirc; kinh doanh tại Điện m&aacute;y XANH" href="https://www.dienmayxanh.com/may-pha-ca-phe" target="_blank" rel="noopener">M&aacute;y pha c&agrave; ph&ecirc;</a>&nbsp;Delonghi ECOV311.GR thuộc thương hiệu&nbsp;Delonghi nổi tiếng từ &Yacute;, thiết kế sang trọng, đa dạng tiện &iacute;ch, hứa hẹn mang lại trải nghiệm t&iacute;ch cực cho người d&ugrave;ng.</em></strong></p>', N'maycaphe1.jpg', NULL, NULL, NULL, 100, NULL, 40, NULL, NULL, 0, 1, 1, 1, 0, 1012)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPhooom] ON 

INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (47, N'SieuToc', N'Bình đun siêu tốc Delites 1.8 lít ST18S05', 200000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Bình đun siêu tốc Delites kiểu dáng đơn giản, chất liệu inox với viền', N'Bình đun siêu tốc Delites kiểu dáng đơn giản, chất liệu inox với viền nhựa đen tinh tế, dùng đẹp trong mọi không gian, từ nhà ở đến văn phòng, khách sạn, bệnh viện,…
Dung tích 1.8 lít đủ dùng cho gia đình 3 – 4 người, pha trà, cà phê, nấu mì, pha nước tắm trẻ… nhanh gọn, tiện lợi.', N'Binhdun1.jpg', N'', N'', N'', 10, 1, 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (48, N'TulanhAqua', N'Aqua 90 lít AQR-D99FA(BS)', 3290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'Tulanh1Aqua.jpg', N'7_2.jpg', NULL, NULL, 10, 5, 8, 0, 1, 1, 2, 1, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (49, N'TuLanhSamsung', N'Samsung Inverter 280 lít RB27N4010BU/SV', 1349000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'samsung1.jpg', N'8_2.jpg', NULL, NULL, 10, 5, 8, 0, 0, 1, 2, 2, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (50, N'TulanhAqua', N'Aqua Inverter 189 lít AQR-T220FA(FB) Mới 2023', 1149000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'TulanhAqua2023.jpg', N'9.jpg', NULL, NULL, 10, 4, 2, 1, 0, 0, 2, 3, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (51, N'TulanhToshiba', N'Toshiba Inverter 460 lít GR-RS600WI-PMV(37)-SG', 1449000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'toshiba1.jpg', N'11.jpg', NULL, NULL, 10, 4, 2, 2, 0, 0, 1, 4, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (52, N'TulanhToshiba', N'Toshiba Inverter 233 lít GR-A28VM(UKG1)', 1859000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'toshiba2.jpg', N'12_1.jpg', NULL, NULL, 10, 3, 2, 3, 1, 0, 1, 1, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (53, N'TuLanhSamsung', N'Samsung Inverter 655 lít RS62R5001B4/SV', 1549000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'samsung2.jpg', NULL, NULL, NULL, 10, 2, 1, 3, 2, 1, 2, 1, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (54, N'TuLanhSamsung', N'Samsung Inverter 236 lít RT22M4032BY/SV', 1249000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'samsung3.jpg', NULL, NULL, NULL, 10, 11, 1, 3, 1, 1, 2, 2, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (55, N'TuLanhToshiba', N'Toshiba Inverter 180 lít GR-B22VU UKG', 1839000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'toshiba3.jpg', NULL, NULL, NULL, 10, 1, 2, 3, 2, 1, 1, 2, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (56, N'BepTu', N'Bếp từ đôi lắp âm Chef''s EH - DIH203', 1290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'beptu1.jpg', N'', NULL, NULL, 10, 1, 1, 1, 1, 1, 1, 1, 11, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (57, N'MayLocNuoc', N'Máy lọc nước RO nóng nguội lạnh Karofi KAD-X39 10 lõi', 6090000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'maylocnuoc1.jpg', N'', NULL, NULL, 10, 1, 1, 1, 1, 1, 1, 1, 6, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (58, N'NoiChien', N'Nồi chiên không dầu Sunhouse SHD4026 6 lít', 1290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'noichien2.jpg', N'', NULL, NULL, 10, 1, 1, 1, 1, 1, 1, 1, 10, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (59, N'MayLocNuoc', N'Máy ép trái cây Crystal GS-333', 6090000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'mayeptraicay1.jpg', NULL, NULL, NULL, 10, 1, 1, 1, 1, 1, 1, 1, 6, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (60, N'Ly', N'Ly uống rựu vang cao cấp', 6000000, CAST(N'2022-12-12T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'4_1.jpg', N'4_2.jpg', NULL, NULL, 100, 0, 0, 0, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (61, N'Tivi', N'Samsung Smart TV QLED QA43Q65A', 9900000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Smart Tivi QLED 4K 43 inch Samsung QA43Q65A', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'tivisamsung11.jpg', NULL, NULL, NULL, 50, 120, 40, 0, 4, 1, 2, 9, 2, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (62, N'Cap', N'Cáp HDMI 2.0 Tròn 2m eValu DS201-WB', 95000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Cáp HDMI 2.0 Tròn 2m eValu DS201-WB', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'Caphdmi.jpg', NULL, NULL, NULL, 300, 4, 1, 2, 3, 1, 2, 1, 16, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (63, N'Cap', N'Cáp Audio 2RCA 2m eSaver DS148-WB Đen', 20000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Cáp video 3RCA eSaver DS147-TB ', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'cap2.jpg', NULL, NULL, NULL, 300, 4, 1, 2, 3, 1, 2, 1, 16, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (64, N'Dieukhien', N'Điều khiển Tivi LCD-LED Sony COSANO RM-SN01 Đen', 80000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Điều khiển Tivi LCD-LED Sony COSANO RM-SN01 Đen ', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'dieukhien1.jpg', NULL, NULL, NULL, 49, 4, 1, 2, 2, 1, 2, 1, 17, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (65, N'Dieukhien', N'Điều khiển Tivi LCD-LED Samsung COSANO RM-SS05 Đen', 100000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Điều khiển Tivi LCD-LED Samsung COSANO RM-SS05 Đen', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'dieukhien2.jpg', NULL, NULL, NULL, 50, 4, 1, 2, 2, 1, 2, 1, 17, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (66, N'AndroidTV', N'Apple TV 4K 64GB MXH02 ', 4790000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Apple TV 4K 64GB MXH02  ', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'androidTV1.jpg', NULL, NULL, NULL, 30, 7, 4, 4, 2, 1, 2, 1, 18, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (67, N'AndroidTV', N'Apple TV Siri Remote MJFN3 ', 1350000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Apple TV Siri Remote MJFN3', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'androidTV2.jpg', NULL, NULL, NULL, 30, 7, 4, 4, 2, 1, 2, 1, 18, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (68, N'KhungTreoTV', N'Khung treo Tivi 32-60 inch Đa năng Văn Thành X5', 495000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Khung treo Tivi 32-60 inch Đa năng Văn Thành X5', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'KhungTV1.jpg', NULL, NULL, NULL, 30, 7, 4, 4, 2, 1, 2, 1, 19, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (69, N'KhungTreoTV', N'Khung treo tivi 39-65 inch nghiêng Cảnh Phong C65N', 370000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Khung treo tivi 39-65 inch nghiêng Cảnh Phong C65N', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'KhungTV2.jpg', NULL, NULL, NULL, 30, 8, 5, 4, 4, 1, 2, 1, 19, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (70, N'TulanhLG', N'LG Inverter 217 lít GV-B212WB', 1844000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'LG1.jpg', NULL, NULL, NULL, 10, 1, 3, 1, 3, 1, 1, 2, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (71, N'TulanhLG', N'LG Inverter 266 lít GV-B262WB', 1249000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng
Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV được thiết kế theo phong cách châu Âu, tối giản chi tiết mang lại sự thanh nhã, giúp cho không gian bếp của bạn có một dấu ấn riêng. Chất liệu cửa tủ là kim loại phủ sơn bóng giả gương làm nổi bật, tôn lên vẻ sang trọng cho tổng thể.

Tủ lạnh có dung tích 280 lít vừa đủ để đáp ứng nhu cầu sử dụng của các gia đình từ 2 đến 3 người.

Lưu ý: Khi mua tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.', N'LG2.jpg', NULL, NULL, NULL, 10, 1, 0, 1, 3, 1, 1, 3, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (72, N'TulanhAqua', N'Aqua 90 lít AQR-D99FA(BS)', 3290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'TulanhAqua3.jpg', NULL, NULL, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (73, N'TulanhAqua', N'Aqua 90 lít AQR-D99FA(BS)', 3290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'TulanhAQUA4.jpg', NULL, NULL, NULL, 10, 1, 1, 1, 1, 1, 1, 1, 3, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (74, N'NoiChien', N'Nồi chiên không dầu AVA KDF-593D 7.5 lít', 1290000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'noichien1.jpg', N'noi-chien-khong-dau-rapido-raf.jpg', N'ava3.jpg', N'ava4.jpg', 10, 1, 1, 1, 1, 1, 1, 1, 10, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (75, N'NoiCom', N'Nồi cơm điện tử BlueStone 1.8 lít RCB-5938', 1090000, CAST(N'2023-09-22T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Tủ lạnh Samsung Inverter 280 lít RB27N4010BU/SV', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'noicom1.jpg', N'', NULL, NULL, 10, 1, 1, 1, 1, 1, 1, 1, 9, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (76, N'Tivi', N'Smart Tivi NanoCell LG 4K 75 inch 75NANO76SQA', 7900000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Smart Tivi NanoCell LG 4K 75 inch 75NANO76SQA', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'tiviLG1.jpg', NULL, NULL, NULL, 30, 200, 70, 3, 3, 1, 2, 10, 2, 0)
INSERT [dbo].[SanPhooom] ([IDSP], [MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [IDNCC], [IDNSX], [IDLSP], [DaXoa]) VALUES (77, N'Tivi', N'Google Tivi Sony 4K 65 inch KD-65X80L', 9000000, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'Thông số kỹ thuật Google Tivi Sony 4K 65 inch KD-65X80L', N'Thiết kế hiện đại, chất liệu sơn giả gương sang trọng', N'Sony1.jpg', NULL, NULL, NULL, 50, 100, 60, 6, 4, 1, 2, 11, 2, 0)
SET IDENTITY_INSERT [dbo].[SanPhooom] OFF
GO
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [Hoten], [DiaChi], [Email], [DienThoai], [MaLoaiTV]) VALUES (1, N'dddd', N'1234567', N'Nguyễn Trọng Đạt', N'Phú Yên', N'Topmarvel123@gmail.com', N'0977530806', 3)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [Hoten], [DiaChi], [Email], [DienThoai], [MaLoaiTV]) VALUES (2, N'abc123', N'1234567', N'Bé bự', N'Sài Gòn', N'Topmarvel123@gmail.com', N'0977530806', 4)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [Hoten], [DiaChi], [Email], [DienThoai], [MaLoaiTV]) VALUES (3, N'xxxx', N'1111', N'Bé heo', N'Phú YÊN', N'Topmarvel123@gmail.com', N'0977530806', 4)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [Hoten], [DiaChi], [Email], [DienThoai], [MaLoaiTV]) VALUES (4, N'jjjj', N'2222', N'Bé bò', N'Phú YÊN', N'Topmarvel123@gmail.com', N'0977530806', 2)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [Hoten], [DiaChi], [Email], [DienThoai], [MaLoaiTV]) VALUES (5, N'oooo', N'1234', N'Bé vv', N'Phú YÊN', N'Topmarvel123@gmail.com', N'0977530806', 1)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [Hoten], [DiaChi], [Email], [DienThoai], [MaLoaiTV]) VALUES (1003, N'kakarot6601', N'zinhmi113', N'Khicon', N'Phú Yen', N'Topmarvel123@gmail.com', N'0977530806', 2)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [Hoten], [DiaChi], [Email], [DienThoai], [MaLoaiTV]) VALUES (1004, N'thichlamnha', N'thichlamnha', N'bbtran', N'Phú Yen', N'Topmarvel123@gmail.com', N'0977530806', 2)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [Hoten], [DiaChi], [Email], [DienThoai], [MaLoaiTV]) VALUES (1005, N'bblan', N'bblan', N'nggggg', N'Phú Yen', N'Topmarvel123@gmail.com', N'0977530806', 2)
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonDatHangg] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHangg] ([MaDDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonDatHangg]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([IDSP])
REFERENCES [dbo].[SanPham] ([IDSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_SanPham] FOREIGN KEY([IDSP])
REFERENCES [dbo].[SanPham] ([IDSP])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_SanPham]
GO
ALTER TABLE [dbo].[DonDatHangg]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHangg_ThanhVien] FOREIGN KEY([MaTV])
REFERENCES [dbo].[ThanhVien] ([MaTV])
GO
ALTER TABLE [dbo].[DonDatHangg] CHECK CONSTRAINT [FK_DonDatHangg_ThanhVien]
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyenn]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThanhVien_Quyenn_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyenn] CHECK CONSTRAINT [FK_LoaiThanhVien_Quyenn_LoaiThanhVien]
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyenn]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThanhVien_Quyenn_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyenn] CHECK CONSTRAINT [FK_LoaiThanhVien_Quyenn_Quyen]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([IDNCC])
REFERENCES [dbo].[NhaCungCap] ([IDNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([IDNSX])
REFERENCES [dbo].[NhaSanXuat] ([IDNSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPhammm_LoaiSanPham] FOREIGN KEY([IDLSP])
REFERENCES [dbo].[LoaiSanPham] ([IDLSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPhammm_LoaiSanPham]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [FK_ThanhVien_LoaiThanhVien]
GO
USE [master]
GO
ALTER DATABASE [Shops] SET  READ_WRITE 
GO
