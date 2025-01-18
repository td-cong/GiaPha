USE [master]
GO
/****** Object:  Database [GiaPha.KimToc]    Script Date: 4/17/2024 9:29:08 AM ******/
CREATE DATABASE [GiaPha.KimToc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GiaPha', FILENAME = N'D:\DATA\GiaPha.KimToc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GiaPha_log', FILENAME = N'D:\DATA\GiaPha.KimToc_log.ldf' , SIZE = 20032KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GiaPha.KimToc] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GiaPha.KimToc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GiaPha.KimToc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET ARITHABORT OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GiaPha.KimToc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GiaPha.KimToc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GiaPha.KimToc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GiaPha.KimToc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET RECOVERY FULL 
GO
ALTER DATABASE [GiaPha.KimToc] SET  MULTI_USER 
GO
ALTER DATABASE [GiaPha.KimToc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GiaPha.KimToc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GiaPha.KimToc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GiaPha.KimToc] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GiaPha.KimToc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GiaPha.KimToc] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GiaPha.KimToc] SET QUERY_STORE = OFF
GO
USE [GiaPha.KimToc]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/17/2024 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[idChucNang] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anh]    Script Date: 4/17/2024 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anh](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](50) NULL,
	[DuongDan] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_HinhAnh] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucNang]    Script Date: 4/17/2024 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucNang](
	[idChucNang] [int] IDENTITY(1,1) NOT NULL,
	[TenChucNang] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucNang] PRIMARY KEY CLUSTERED 
(
	[idChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTinTuc]    Script Date: 4/17/2024 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTinTuc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTinTuc] [nvarchar](50) NULL,
	[GhiChu] [nchar](10) NULL,
 CONSTRAINT [PK_LoaiTinTuc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhaKy]    Script Date: 4/17/2024 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhaKy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PhaKy] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhaKy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 4/17/2024 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[NamSinh] [int] NULL,
	[NamMat] [int] NULL,
	[GioiTinh] [bit] NULL,
	[VoChong] [int] NULL,
	[DiaPhuong] [nvarchar](500) NULL,
	[LyLich] [nvarchar](max) NULL,
	[Avt] [nvarchar](500) NULL,
	[IsTruongHo] [bit] NULL,
	[IsTruongChi] [bit] NULL,
 CONSTRAINT [PK_ThanhVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 4/17/2024 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdLoaiTinTuc] [int] NULL,
	[TieuDe] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[TacGia] [nvarchar](50) NULL,
	[AnhDaiDien] [nvarchar](max) NULL,
	[TinNoiBat] [bit] NULL,
	[TrangThai] [nvarchar](10) NULL,
	[TomTat] [nvarchar](max) NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TocUoc]    Script Date: 4/17/2024 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TocUoc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TocUoc] [nvarchar](max) NULL,
 CONSTRAINT [PK_TocUoc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 4/17/2024 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](50) NULL,
	[DuongDan] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoChong]    Script Date: 4/17/2024 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoChong](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
 CONSTRAINT [PK_VoChong] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([ID], [UserName], [Password], [Name], [Role], [idChucNang]) VALUES (1, N'admin1', N'12345', N'Kim', N'Quản lý thành viên', 1)
INSERT [dbo].[Account] ([ID], [UserName], [Password], [Name], [Role], [idChucNang]) VALUES (2, N'admin2', N'12345', N'Quân', N'Quản lý tin tức', 2)
INSERT [dbo].[Account] ([ID], [UserName], [Password], [Name], [Role], [idChucNang]) VALUES (3, N'admin3', N'12345', N'ABC', N'Quản lý media', 3)
INSERT [dbo].[Account] ([ID], [UserName], [Password], [Name], [Role], [idChucNang]) VALUES (4, N'manager', N'1', N'Mag', N'Manager', 4)
INSERT [dbo].[Account] ([ID], [UserName], [Password], [Name], [Role], [idChucNang]) VALUES (5, N'admin4', N'12345', N'SSS', N'Quản lý tin tức', 2)
GO
SET IDENTITY_INSERT [dbo].[Anh] ON 

INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (8, NULL, N'/Files/Anh/8/z4843835948230_39c44ee584a20366b2963d3dbc40e98e.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (9, NULL, N'/Files/Anh/9/z4843835958596_fc2ac6080cff96c4aaa96d44d74b6bd0.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (10, NULL, N'/Files/Anh/10/z4843835963134_da489989de459134d0c3b32f697875af.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (11, NULL, N'/Files/Anh/11/z4843876625242_5e493b2b1f911504b9bd614c1184cf29.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (12, NULL, N'/Files/Anh/12/z4843882444543_fa29fc251c0c7df1da56ea2def35f32c.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (13, NULL, N'/Files/Anh/13/z4843919242186_fc2e272f10c6c6dc5cb58b87955aed71.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (14, NULL, N'/Files/Anh/14/z4843919245405_d9deb633981cfbcf98671c2e7016542e.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (15, NULL, N'/Files/Anh/15/z4843919373900_3666c6def35cfe75dcd0696251ebd143.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (16, NULL, N'/Files/Anh/16/z4843920217399_5a38771d8c55e6bc21d45a6402dfe0a8.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (17, NULL, N'/Files/Anh/17/z4843920219652_fadd231931a68e1fef2f17626855b358.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (18, NULL, N'/Files/Anh/18/z4844125366716_73bdb52fad01025b542aaebbb08d9cc7.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (19, NULL, N'/Files/Anh/19/z4844125366836_e7dc7ad2f0c4f045484d961c6ca195bf.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (20, NULL, N'/Files/Anh/20/z4844125366964_98fbcca879fe78f88293dad5406478cf.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (21, NULL, N'/Files/Anh/21/z4844125369381_d2c8e85eaa07fc4318681abde450b590.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (22, NULL, N'/Files/Anh/22/z4856039218841_14b82b36d30fbb618bfc16e6f577442d.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (23, NULL, N'/Files/Anh/23/z4856039355240_2b32ab9593b6234c5964a20b0f46391b.jpg', NULL, N'AC')
INSERT [dbo].[Anh] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (24, NULL, N'/Files/Anh/24/z4856083312862_ee611be0d1108c679a230fccf8d15652.jpg', NULL, N'AC')
SET IDENTITY_INSERT [dbo].[Anh] OFF
GO
SET IDENTITY_INSERT [dbo].[ChucNang] ON 

INSERT [dbo].[ChucNang] ([idChucNang], [TenChucNang]) VALUES (1, N'adminThanhVien')
INSERT [dbo].[ChucNang] ([idChucNang], [TenChucNang]) VALUES (2, N'adminTinTuc')
INSERT [dbo].[ChucNang] ([idChucNang], [TenChucNang]) VALUES (3, N'adminMedia')
INSERT [dbo].[ChucNang] ([idChucNang], [TenChucNang]) VALUES (4, N'adminPhaDo')
INSERT [dbo].[ChucNang] ([idChucNang], [TenChucNang]) VALUES (5, N'manager')
SET IDENTITY_INSERT [dbo].[ChucNang] OFF
GO
SET IDENTITY_INSERT [dbo].[PhaKy] ON 

INSERT [dbo].[PhaKy] ([ID], [PhaKy]) VALUES (5, N'Sách Trần Nhân Tông viết: Trần Thủ Huy vốn một trang nam nhi tuấn tú và dũng mãnh. Gặp người bị nạn, Thủ Huy đã ra tay cứu giúp. Không ngờ người đó lại là vị Thái tử nhà Lý tên là Lý Long Xưởng, con vua Lý Anh Tông. Thái tử mang ơn kết tình huynh đệ với Thủ Huy. Thủ Huy giúp Lý Long Xưởng dẹp loạn trừ gian trong hoàng tộc nhà Lý nên được vua Lý gả công chúa Đoan Nghi, trở thành phò mã có quyền, có chức trong triều đình. Về sau, vì nghe lời dèm pha, vua Lý đã đày Trần Thủ Huy và công chúa Đoan Nghi đi sứ phương xa tận nước Kim, nước Liêu (thuộc Mông Cổ ngày nay). Công chúa Đoan Nghi sinh ra Trần Thủ Độ ở bên đó. Khi đã trưởng thành, Trần Thủ Độ trở về Đại Việt, sống với bác là Trần Lý, góp phần khởi nghiệp nhà Trần. Lý Long Xưởng vì có tội với vua cha, bị truất xuống làm thứ dân. Em là Lý Long Trát được nối ngôi vua hiệu là Lý Cao Tông. Lý Cao Tông chơi bời vô độ, không quan tâm chính sự, đất nước đói kém, cướp bóc như ong, các bè đảng nổi lên chiếm cứ các vùng tìm cách cướp ngôi vua. Vua phải chạy lên vùng Quy Hóa (vùng núi thuộc tỉnh Phú Thọ ngày nay), Thái tử Sảm chạy về Hải Ấp (nay là Lưu Xá, huyện Hưng Hà, tỉnh Thái Bình). Thái tử Sảm thấy Trần Thị Dung, con gái Trần Lý có nhan sắc bèn lấy làm vợ, phong cho Trần Lý tước Minh Tự, phong cho Tô Trung Từ, em vợ Trần Lý làm Điện Tiền chỉ huy sứ. Cha con Trần Lý, Trần Thừa, Trần Tự Khánh đều hết lòng thờ vua nhà Lý. Thái tử Sảm nối ngôi cha, hiệu là Lý Huệ Tông. Lý Huệ tông không có con trai, lại bị bệnh tâm thần nên truyền ngôi cho con gái là Lý Phật Kim, thường gọi là Lý Chiêu Thánh hiệu là Lý Chiêu Hoàng. Lý Chiêu Hoàng nhường ngôi vua cho chồng là Trần Cảnh hiệu là Trần Thái Tông. Triều đại nhà Trần bắt đầu từ đấy.')
SET IDENTITY_INSERT [dbo].[PhaKy] OFF
GO
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (52, NULL, N'Cụ Tổ Họ Giàng', 1925, 1988, 1, NULL, N'Bắc Yên-Sơn La', NULL, N'/Files/ThanhVien/52/R.png', 1, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1021, 52, N'Giàng A Seng', 1950, 1990, 1, NULL, N'Bắc Yên-Sơn La', NULL, NULL, NULL, 1)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1023, 52, N'Giàng Nủ Sông', 1955, 2000, 1, NULL, N'Bắc Yên, Sơn La', N'Ông Giàng A Chống đã sinh ra ông Giàng Nủ Sông và ông Giàng Chờ Làu, ông Giàng Nủ Sông sinh ra một người con trai là ông Giàng Nủ Hlau và 2 con gái là bà Giàng Thị Mái và Giàng Thị Chư (Chồng Bà Mái là ông Sùng Xái Của, chồng Bà Chư là ông Vàng Pó Dâu, 2 bà đều cư trú tại thôn Pang Cáng, xã Suối Giàng)... Ông Giàng Nủ Sông đã qua đời tại Bắc Yên Sơn La, còn lại bà Sông, ông Giàng Chờ Làu và ông Giàng Nủ Hlau. Từ thế kỷ thứ 19 ông Giàng Nủ Hlau đã đưa mẹ và ông Giàng Chờ Làu di chuyển về Suối Giàng (Thôn Giàng Cao hiện nay). ', NULL, NULL, 1)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1024, 1021, N'Giàng Thị Chư', 1960, NULL, 0, NULL, N'thôn Pang Cáng, xã Suối Giàng', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1025, 1021, N'Giàng Thị Mái', 1966, NULL, 0, NULL, N'thôn Pang Cáng, xã Suối Giàng', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1026, 1023, N'Giàng Nú Hlau', 1967, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', N'Ông Giàng Nủ Hlau sinh ra 2 người con trai, người anh là Giàng Trừ Tủa, người em là Giàng A Lử (Lử đã chết hồi nhỏ) và 2 đứa con gái, đứa chị là bà Giàng Thị Pàng (chồng Bà Pàng là ông Vàng Hờ Pó (Nủ Dinh) cư trú tại thôn Pang Cáng xã Suối Giàng), đứa em là Giàng Thị Mỉ (Mỉ chết từ nhỏ). Ông Giàng Nủ Hlau mất hồi ông Giàng Trừ Tủa còn nhỏ.', NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1028, 1023, N'Giàng Trừ Tủa ', 1961, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', N'Ông Giàng Trừ Tủa mất cha mẹ từ khi còn nhỏ, ông ở với ông chú họ tên cũng là Giàng Trừ Tủa. Ông lớn lên xây dựng gia đình và có 2 người con trai, người anh là Giàng A Phử (Phử đã chết từ nhỏ), người em là Giàng A Tếnh và có 4 đứa con gái, đứa cả là Giàng Thị Xông, lấy chồng tại thôn Bu Cao xã Suối Bu huyện Văn Chấn, chồng tên là Vàng Nhà Tủa; đứa thứ hai là Giàng Thị Mỉ (Mỉ chết hồi nhỏ), đứa thứ ba là Giàng Thị Ly (1966), lấy chồng tại thôn Pang Cáng xã Suối Giàng huyện Văn Chấn, chồng tên là Vàng A Chu; đứa út là Giàng Thị Mái (1969), lấy chồng tại thôn Bản Mới xã Suối Giàng huyện Văn Chấn, chồng tên là Lờ A Vang. 
Từ những năm 1965 - 1984 ông Trừ Tủa đã tham gia công tác tại xã (Năm 1965 - 1967 Chủ nhiệm HTX; năm 1967 -1969 Phó Chủ tịch xã; năm 1970-1973 Chủ tịch xã; năm 1971 - 1984 Bí thư chi bộ xã). Ông đã nghỉ hưu và mất năm 1987. 
', NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1029, 1024, N'Vàng Thị Chư', 1964, 2020, 0, 1028, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1030, 1025, N'Giàng A Tếnh', 1964, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', N'Giàng A Tếnh sinh ngày 10/8/1964. Ông Tếnh lớn lên đi học từ năm 1974 đến năm 1979, vì hoàn cảnh gia đình, ông về nhà xây dựng gia đình. Năm 1980 ông lấy người vợ thứ nhất là bà Sổng Thị Pàng (1965 - 2000), ông Tếnh và bà Pàng sinh ra một người con trai là Giàng Nủ Sơn (1989) và có bốn đứa con gái, đứa gái cả là Giàng Thị Nhà (1986), lấy chồng tại thôn Bản Mới xã Suối Giàng huyện Văn Chấn, chồng tên là Vàng Giống Của; đứa gái thứ hai là Giàng Thị Mai (1987), lấy chồng tại thôn Tà Tàu xã Pá Hu huyện trạm Tấu, chồng tên là Thào Xông Vàng; đứa gái thứ ba là Giàng Thị Ca (1991), lấy chồng tại thôn Pang Cáng xã Suối Giàng huyện Văn Chấn, chồng tên là Vàng Dũng Chảng; đứa gái thứ tư là Giàng Thị Nu (1992), lấy chồng tại Xóm Lũng Lừa, xã Đa Thông, huyện Hà Quảng, tỉnh Cao Bằng. Ngươi vợ (Sổng Thị Pàng) mất ngày 22/3/2000 (17/02 Âm lịch). 
Ngày 21/8/2000 (22/7 Âm lịch), ông Tếnh lấy người vợ kế tên là Vàng Thị Ly (30/9/1982), ông Tếnh và bà Ly có một đứa con gái là Giàng Thị Thùy Dung (23/8/2002) và một đứa con trai là Giàng Long Hải (12/8/2003). 
Từ năm 1980 đến năm 2019 ông Giàng A Tếnh đã tham gia công tác tại xã và tại huyện Văn Chấn (Năm 1980-1984 Trưởng Ban Thống kê - kế hoạch xã; năm 1984-1986 Ủy viên Thư ký UBND xã; năm 1986 - 1987 Phó Chủ tịch quyền Chủ tịch UBND xã; năm 1987 - 1989 Chủ tịch UBND xã;  năm 1989 - 2010 Bí thư Đảng ủy xã; ngày 01/8/2010 - ngày 01/9/2019 Phó TRưởng Ban Dân vận Huyện ủy Văn Chấn tỉnh Yên Bái). Ông đã nghỉ hưu từ ngày 01/9/2019.                                       
', NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1032, 1026, N'Giàng Thị Xông', 1995, NULL, 0, NULL, N'Xã Suối Bu, huyện Văn Chấn, Tp Yên Bái, tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1035, 1028, N'Giàng Nủ Sơn', 1989, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1038, 1035, N'Giàng Long Hải', 2013, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1039, 1029, N'Giàng Thị Nhà', 1986, NULL, 0, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1040, 1029, N'Giàng Thị Mai', 1987, NULL, 0, NULL, N'Xã Pá Hu, huyện Trạm Tấu, Tp Yên Bái, tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1041, 1030, N'Giàng Thị Ca ', 1991, NULL, 0, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1042, 1030, N'Giàng Thị Nu', 1992, NULL, 0, NULL, N'Xã Đa Thông, huyện Hà Quảng, tỉnh Cao Bằng', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1043, 1032, N'Giàng Thị Thùy Dung', 2000, NULL, 0, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1044, 1032, N'Giàng thị Ngọc Ánh', 1999, NULL, 0, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1048, 1035, N'Giàng Thanh Long', 2004, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1050, 1042, N'Giàng A A', 2019, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1051, 1035, N'Giàng Thanh Long 2', 2004, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1052, 1035, N'Giàng Thanh Long 3', 2004, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (1053, 1035, N'Giàng Thanh Long 4', 2004, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2051, 1050, N'Giàng B B', 2020, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2053, 2051, N'Giàng C C', 2020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2054, 2053, N'Giàng D D', 2020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2055, 2054, N'Giàng E E', 2020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2066, 2055, N'F F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2067, 2066, N'G G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2068, 2067, N'H H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2069, 2068, N'J J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2070, 2069, N'K K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2071, 2070, N'L L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2072, 1035, N'Giàng Thanh Long 2', 2004, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2073, 1035, N'Giàng Thanh Long 3', 2004, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
INSERT [dbo].[ThanhVien] ([ID], [PID], [HoTen], [NamSinh], [NamMat], [GioiTinh], [VoChong], [DiaPhuong], [LyLich], [Avt], [IsTruongHo], [IsTruongChi]) VALUES (2074, 1035, N'Giàng Thanh Long 4', 2004, NULL, 1, NULL, N'Xã Suối Giàng, huyện Văn Chấn, Tp Yên Bái, Tỉnh Yên Bái', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([ID], [IdLoaiTinTuc], [TieuDe], [NoiDung], [TacGia], [AnhDaiDien], [TinNoiBat], [TrangThai], [TomTat]) VALUES (2, NULL, N'NHỮNG QUY ƯỚC CHUNG', N'Điểu 1. Dòng họ Giàng là đại gia đình của những người có chung Thuỷ tổ và chung nguồn cội, hiện có boa nhiêu 3 chi, đã trải qua bao nhiêu 5 đời. Điều 2. Ngày Hội họ là ngày tháng 12 Âm lịch hàng năm, định kỳ tổ chức lễ hội do con cháu thống nhất và quyết định, mỗi chi họ tuỳ theo điều kiện có thể chọn ngày họp riêng và xây dựng nơi thờ phụng (nếu có điều kiện). Điều 3. Tất cả con cháu trai, gái, dâu đều được ghi tên vào gia phả và danh sách của dòng họ theo chi họ và thứ hệ. Điều 4. Phần mộ của các bậc tiền bối và con cháu trong gia tộc được quản lý theo dòng họ và các chi họ. Mọi thành viên trong dòng họ đều có trách nhiệm giữ gìn, bảo vệ và trùng tu, nếu có di dời vào khu tập trung phải lập sơ đồ quản lý và lưu giữ theo quy định chung. Điều 5. Ban liên lạc dòng họ là những người được con cháu trong dòng họ bầu ra, đại diện cho dòng họ có trách nhiệm tổ chức thực hiện các nhiệm vụ và hoạt động của dòng họ theo nhiệm kỳ 3 năm 1 lần. Ban Liên lạc dòng họ, gồm có Trưởng Ban, Phó trưởng Ban và các uỷ viên phụ trách thư ký, thủ quỹ … Điều 6. Dòng họ được xây dựng nguồn quỹ chung của dòng họ từ các nguồn hổ trợ và vận động, đóng góp của các gia đình và con cháu thành đạt ủng hộ. Mọi hoạt động và thu chi phí quỹ chung của dòng họ phải được tập thể con cháu trong dòng họ thống nhất ghi thành nghị quyết, quy chế chi chi tiêu, sau đó giao cho Ban liên lạc và Ban quản lý quỹ quyết định chi tiêu vào những việc phục vụ chung cho dòng họ. Những trường hợp đột xuất không thể lấy ý kiến thống nhất của tất cả con cháu thì Ban Liên lạc quyết định sau đó thông báo lại cho dòng họ biết. Quỹ chung và quỹ Khuyến học sẽ có quy định riêng, thay đổi hàng năm về việc thu và chi sao cho phù hợp thực tế hoạt động của dòng họ.', NULL, N'/Files/TinTuc/2/z4841126830961_3d229de8deb1b238f6c1b2d0978908ed.jpg', 1, NULL, N'Điểu 1. Dòng họ Giàng là đại gia đình của những người có chung Thuỷ tổ và chung nguồn cội, hiện có boa nhiêu 3 chi, đã trải qua bao nhiêu 5 đời.')
INSERT [dbo].[TinTuc] ([ID], [IdLoaiTinTuc], [TieuDe], [NoiDung], [TacGia], [AnhDaiDien], [TinNoiBat], [TrangThai], [TomTat]) VALUES (4, NULL, N'    B. QUYỀN VÀ NGHĨA VỤ CỦA CON CHÁU ĐỐI VỚI DÒNG HỌ', N'    Điều 10. Tất cả con cháu nội ngoại trong dòng họ đều có trách nhiệm trong việc phụng sự tổ tiên, đến ngày lễ hội, ngày tết cổ truyền, giỗ chạp.... đều có quyền về từ đường hoặc nơi thờ phụng chung để dâng hương tưởng niệm và có trách nhiệm đóng góp tiền của, công sức để xây dựng dòng họ.     Điều 11. Con cháu phải có trách nhiệm giữ gìn, bảo tồn phần mộ của các bậc tiền bối trong gia tộc. Khi cần trùng tu hoặc di dời, cải táng do giải tỏa phải được sự thống nhất của trưởng dòng họ và Ban liên lạc và đóng góp của con cháu trong gia tộc.     Điểu 12. Con cháu họ nội (Trai) ngay sau khi lập gia đình phải có trách nhiệm tham gia các hoạt động và chịu sự phân công của Ban Liên lạc đối với các hoạt động của dòng họ.     Điều 13. Khi lập gia đình tuyệt đối không kết hôn với những người có cùng huyết thống trong dòng tộc theo quy định của Luật hôn nhân và gia đình.     Điểu 14. Khi có thành viên mới trong gia tộc ra đời, gia đình phải thông tin với Ban Liên lạc để ghi tên vào danh sách của dòng họ, việc ghi tên vào danh sách được thực hiện hằng năm và đi khai sinh đúng quy định.     Điều 15. Các Chi trong dòng họ khi có người qua đời ở chi nào thì chi đó phải kịp thời thông tin với Ban Liên lạc để tổ chức thăm hỏi và phúng viếng. Chi có người qua đời phải cử con cháu thực hiện các nhiệm vụ trong suốt quá trình diễn ra tang lễ.     Điều 16. Con cháu thi đỗ vào các trường Đại học và đạt loại giỏi ở các bậc học phổ thông, cao đẳng, Đại học thì được tuyên dương khen thưởng hằng năm đúng vào dịp lễ tết.      Điều 17. Con cháu có học hàm, học vị giáo sư, phó giáo sư; tiến sĩ, phó tiến sĩ, Thạc sĩ và các chức vụ cao ở huyện, tỉnh, được ghi danh vào sổ vàng truyền thống của dòng họ.     Điểu 18. Con cháu trong dòng họ bị thất lạc trước đây nếu xác định được nguồn gốc của chi họ, thứ hệ thì được công nhận là con cháu của dòng họ.     Tất cả con cháu trong dòng họ phải đoàn kết, đùm bọc lẫn nhau trên tinh thần tương thân tương ái và giúp đỡ hổ trợ khi gặp khó khăn, thăm hỏi lúc ốm đau, hoạn nạn.      Điều 19. Nếu gia đình nào nhận con nuôi phải có trách nhiệm như con đẻ, không được phân biệt đối xử, nếu làm sai sẽ chịu trách nhiệm trước dòng họ và pháp luật.', NULL, N'https://image.nhandan.vn/w2000/Uploaded/2023/cdhncuxjw/2022_10_17/mongmc3.jpg.webp', NULL, NULL, N'Điều 10. Tất cả con cháu nội ngoại trong dòng họ đều có trách nhiệm trong việc phụng sự tổ tiên, đến ngày lễ hội, ngày tết cổ truyền, giỗ chạp.... đều có quyền về từ đường hoặc nơi thờ phụng chung để dâng hương tưởng niệm và có trách nhiệm đóng góp tiền của, công sức để xây dựng dòng họ.')
INSERT [dbo].[TinTuc] ([ID], [IdLoaiTinTuc], [TieuDe], [NoiDung], [TacGia], [AnhDaiDien], [TinNoiBat], [TrangThai], [TomTat]) VALUES (5, NULL, N'     B. TRÁCH NHIỆM VÀ NGHĨA VỤ CỦA CON CHÁU ĐỐI VỚI XÃ HỘI', N'      Điều 20. Mỗi con cháu đều có trách nhiệm thực hiện tốt mọi chủ trương, chính sách pháp luật của Nhà nước trong mọi lĩnh vực của đời sống xã hội.       Điều 21. Tuân thủ và gương mẫu chấp hành tốt các khoản thuế, nghĩa vụ của công dân đối với Nhà nước, không làm ăn, hoạt động phi pháp, vi phạm pháp luật, phạm vào các tệ nạn xã hội.       Điểu 22. Thực hiện tốt chính sách dân số - Kế hoạch hóa gia đình theo pháp lệnh dân số, không được “trọng nam khinh nữ”.       Điểu 23. Mỗi gia đình và con cháu phải tích cực xây dựng gia đình văn hóa, gia đình học tập, góp phần xây dựng dòng họ văn hóa, dòng họ học tập, thôn xóm học tập và xã đạt “Cộng đồng học tập”.       Phát huy tình làng nghĩa xóm, thực hiện tốt đạo lý “Thương người như thể thương thân”, “Lá lành đùm lá rách, lá rách ít đùm lá rách nhiều”, tích cực hưởng ứng các cuộc vận động do cộng đồng và địa phương phát động.             Điểu 24. Xây dựng và phát huy hiệu quả hoạt động của Ban khuyến học, chi hội khuyến học của dòng họ nhằm động viên con cháu trong khuyến học, khuyến tài, học vì ngày mai lập nghiệp.', NULL, N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGCBYVExcVFRMYGBcZGiAaGhoaGhkbGRocGxoaGhodGhwdICsjGh8oHx0fJDUlKCwuMjIyHyE3PDcxOysxMi4BCwsLDw4PHRERHTEpIygyMTQzMzExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMf/AABEIALMBGgMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAFAAIDBAYBB//EAEEQAAIBAgQDBQUHAwMCBgMAAAECEQMhAAQSMQVBUQYTImFxMoGRobEHFCNCwdHwUmLhM3LxU5IWJEOCosIVRJP/xAAZAQACAwEAAAAAAAAAAAAAAAAAAgEDBAX/xAAsEQACAgIBBAIBAgYDAAAAAAAAAQIRAyESBDFBURMiYTJxgZGhscHwFCMz/9oADAMBAAIRAxEAPwDRAY7jjMBviJ8yo2vjaZSbCxWGbHQ4kpZpTvbBYEwGOjCBw4DAAlxmeLcSqMHXSAotExqtzMbdcGM7nqcPTLlTESBtbccjjDZ7NLqJ1k6WIEAgwd5Nvd78YernKkostxryxV6HeLpqSs6fD7+TEwfTFrLZZVMwW2EsR4VgAaVsBigvjYROlbmeZjfyOLKAnSCDBuLwBexvjE4tqi3Q18wqVSxJ0ld3IMeKIUAHUDbDquaqavCEZDYkKxdSZAlZvyG/MbYly7Bm0tTXWSSCyqSBEGGN4tiTiNc1dSP4FWDFKELuJvM7QTf+0Yshjg19u4rYKzlfSG7ytuPCOe0AsVgibwfXEmV4xTLaArvYwxvcDwwLGNxc+eBtTg1VnZ9Mf0wCwIG08zaNxfpg7wvhxCNUYqzsNcRBBA5EmRvBtb3YmUYRVyZJx813gCLUCtbWNBmI/K3K3Q4G5/NrRGqmSSznV4YB8JEByDfmcEc07LULBKfeEiA0a2WYmbXFhA64bxDJ98VfUKtNPCAG8cASfDAgTaYxMIpp60Q2VctxpimplHdzBJ3noOuLFPPqBrDnRvsykGeZHIfPFLifCPYNNHVSYI3aOsHlv54fW4cwZURDUDEDReZ9bW26b4qUIt/XyTbNv2b4p3i6WYHmpP5p6YMtjLdl+AVUIqVAFXcJLFhtGqdjbbGpbHTwKajUiidXo5hYWFi8UWFhYWABYWFhYAFhYWFgAWFhYaTgA7OOE45hYAEcMYYfhpxJBEwxHGJmGGRiAK1aqWOIxjnpjpOFGOYRGOzjoxJBPlq5Xe4xNVzR0ErGroemKGZYhZG/+cBKvFGB335DmPLrirJkUVsaMbG5zMElyQJNyBYH+W+fXAmpkmHiHikAACDA845+uLtCgajap08jflvEcrW+OKGczCswIZiurbwhfIAxcA9fPHN5OTLyxmcqCNIYqWPKYJM2HWMMZNACtMQLTOkA8x1NsW6OWKkQsqNtrHncW898PWh3jQV8AHXmd4+GE5/yJ4lTLuwBc+IOYjciLSP513xHxOqdIElQCszYAExB6264NPTBkra1xtOBPEMoro5FNpUFpDESQBG9iBe2LccouQrTRbpUwgRkdqjMQWcAinCCXO5Onxb2H6rtHUZKYcFSpYDwAsCoJuag62sDa+NLla+jLLVqaFhZcAhiyxyMadjO0Yx3GeO06iPTp6jTi+uNQcsGlQohVG0cz05654cdWKpNsgOYJLpTFNtILOdJgKCLDXBI8Qt5H1xZyHekOBRZR3YK6EALgwFYkm4gyTilkcgjvURK+lNIksRdzpG19Q1TsdiMbBcxlcvTpVwpcle7BBghVJHsA+onBHHFfsDkZullkQd47uTYkMQYJsA5tHK+2C3CkNUoyELDgmK0FuTL4fhHpivxqmK6GpTRaakDcibgHxTYGJhemKnDgaenQUYqTdAZWWBZiwkE2A5fLGWoQlybt+KJ20ekviJsB+zHETUNRST4bxY6SZsSPpg0wx0cc1OPIpkqdDMLCwsWWQLCwsLAAsLCw1mjAA7CxXzOaVFJJEjl9MVspxVWgN4T8vjywWARw04WsRIM4bqwEHcLCnHYwEnMcOHRjkYAGMMMjEhw3TgIA2QVgsl9QN1tBAPU88WCMUMhTYqs1DYWiNunTFmGEyQ3S0H3nY/LFcXSHktk64cMVQ/M/wAOJNR0yL9LXwKdg40Q8TpyuozA3AMEj1NhjPfhsWBkad9O0C4PSJm/PD+MZlqkgGNVtOoiSDB91j5SMC6GVOzq4Q+1DaQT5/23nGLLJTdrRZFUiXOZ6kkIriNyfFJEciLH0MYl4dmqb7ApIi/5uthYH37YipZKnUI0kMqmAsELMWBc38zgllOHhAsm4tyIkj0k74yzcUq3ZZFEmTf1iBtETtO9hbpiRnM8tJMyLW9Bhio3taZtspPx6C18NqVCxg6hbwkgwR69MZ+5YczcKPCdXkOXr1w9VaBDETI0gxPqf0xCmagkC55RtvuMOFWSYba0bm3MjDpyXYUq5RKroaLgikhZ2UtILKRpAtJ2FsVM1lXp0tBRiHfUJUAwJMFo/Tlg/wAJzAFTnzAa0jy8r4KcQqxTkwWncid5keVjjdjyco2/ArWwR2OyIFWowposERq/KxUTETq57Ri5xfKioGXUsbEID+UmxG0XJ6zzxS4aFJaBF5HQWFh/VcbdIx2pUKtrg6Q0r8/eOcHDSyPjSErdlXNqUnXU0o4AYsCeW9vZMTGAVShUQM9B27oXgMJEj2j5R9YxrGrpXGghRbxahIHqNsBauRWkSpqIFJsFUywMbweW3pimMm7sZoK/ZnnlRXptMsS0m1gBvyP+cbbXIkbY84LUqUX8OnwqJk3gsTO8DYgX64P5bPsaQVbCBPUTcjrPXGnDnbfFrRXOHkMNxEawsCJ3n9sWxVBOkG++Mvrg2tifJ5tkabkdPXGlSEo0FbMIhhmAOOVswqprmR5Yz7nWxLEyelz6Y5WMAAHfdQbCOvnibIoKZXiOqQ0KZt54nzWaVYB3OANE35HEtRJNziOdE0LPPqcnbFWsLYsVEHX1w4INyMLyJoudnqh0lDyuPfywUjADLVChlbWjEtXPsYvFotzw6yaFcQgM2uvTNuvL0xzM5sAGGE4DFgbcscbC82TxCI4rpsRq89pxaTPI0DVc8sBCoxC0rcGMHyBxNMzCMM1+eMv98dra5gzGLQr/AN4xCzIb4y5ll8IAHLDazwQTbeRvhymFG+IqhncfC9voMJPIkkhoxtsfML4emJxtffFMMBykfz4YkNcRAI/bBHIkQ4lTiVMKRbwmwAt4upPLpjH8SzxZmph9AkiATJ6TvzGNdxNmZdGr2ue3x6YdS7Bdw/fValOpSdRpZL3YgmC1hAkSNwSRBEYyycVJyLsUHOSiee5XiFWhUt4hvG9uZB5euNc2apvpmZNx4omQD77HE+by1GmAlIB3kgs12VLnfaYA9cC6lHSpMKZI0+EkiBHL4XxVKUcjvsW5cbx6JM3m1pJ4gTfSu+nptz6/vian37oancOaIXUKiggEWBNxcAXt0w/hGVXMMtPNABZDJAIOpXU6T01LqHkMbbjud/DZRmKa05CKCrEjwkuJm5HhFtsK1FeNjYsXKNtmHDqoYCNUDyvY8r88Va1ccwSDb3/4xDoJLaCBpAi5naPTFRKhI1KxPUGAPO2JjjtmewxSr6SoABBJPPwwPTbBajW1wpUFfMmxAk8rcreeM2M6wTTuCDPlaZ8zi/w6qC8q5aBclgsECBY7+nOcT+hOwTQQy80ySpULPPcC03i+2Lb5kPKPcCb2IMbbXi/uwMarBCgbgEt0B2+fLEKuSwBkRsPXyJ2w2LI3snjYSXIs4LIY5wIAAIiAdzyxFVACgsJ5TFxIvptjuWzbLIaV5EcoO2LFOoCLXv8AyPLFjjGRNUB+JZB6jJ3Caqjs3tEAABZmenzwJ4zRzeUdRVrwxE2OpLcjO+49xxskqhXBLMl91IB9L2g7e/lhdo6lPQqkGpDBpZw1QkGVXUJgjaR88LLK4SSXY04sMZwbfcq8LrCrTpvEalBPLfFvQI2xHVptT8NQBGm6GQRMm0+0LG+/XHDVtG040KTZllCiQPG1sNqsTuccRpw9lw3MTgMpg9MTMwA1MQoG5JgDEai+K3H+FnMUgFJOg69A3bYSOpHTz9ME5qMbZEMblLih4ztJ28FRSJi3P/OLgqDTp9/pjzTjlZ4UKjJTViAdvEImeh2xuuC5jvKFJzdmQE+ZiD85wQnyWycmPi9BDWAJOB+bzADC8g/LFmu6sNO/8+WAvECqKSqkmwGrYkmB7r4WT9CpBcSPr6YB8Q7RqlcIACg3M8yBEQOWKWdR40tmyXI9gQBYXUxionCKtQJUVfCwLLtJ0kq1/Ig/LDSyUtjwxNvRqeEcTSuCVPs2Yef7eeLNdgQf2xkOypP3nRewYtO4AEQRy8RGNdVwssmiPj2VkQAnz64ra/7fniabtflI57YZpQ364zci3iHq1QRc8unnbFZrXGH1Hg4QIJOBu3sKohL8tpthI14kzsOQnlM/y+G1UM25YfwZdVUMx8KmW8+QF/7owyWxX2Gdrs/SoZUoqLUqs4Qu62QadRKDcHYD1k7RgX2G7YvTnK1xry9QEKogMlQ+yUJssm0G0kEwJONJ2oo0M3QamjBXN6eoMsMSp6EQxAmInEXYXs9l0y+uqiVKjL+IWUMEB3RVMxHM7nyEY0Rhy0yuD7ySaZmWzRd3GghEBZPyrZjq1D+oi/MjSRffFbN8TRIdfZG5sZ5QBzHnjYcQygSo5RIRm1I0BZMSwG8EkbkSZOMp2gpLmq6U6aqrI6d4XBCMtQLDsbOVXYnow6YoeKKl+C6UnNcn3PRux3BaRVa9Rmc1KYjUCgGoHZWAPW55AHniXjXZ0vpUlXWCAyoQ9+viINudsAeK/aPSy1erQFNvwyUDrDKdCDTEmRLyvOBBnkKX2mcfrHI0QwqU6lVVqvpRu7VSSFRamqUI2I5+/E8Y60VrJJR4ryAe0Rp0a7UkqK7ppJZRCxpBIiSDuL/LEFPLJVnuzYmSu8X8JH64x2Xc6wd7/GbY0GVZ0JZJsZ58pJmMDhXYPFF/JZVm12J0g+EdSwWPW5+ODT8PWgqeEiozDVGxG9+un6xitwnOs1MMp0sWEgWBg3PnyPvGLbZl2F2WRsSCYsJmT0xjyc5SrwFEVJfDeTO/x6+uJGIMG19jtyjn9cRZTLqtQanLtchQGJLGdhvudsEMzlKVNYqGapEaAbJPKoTaeWgX6kbYlPjotim0Uq5nZpG28z5/TDlQCLkQdvnBO+OJTCgXgbQbQekzhLTOpV5sQBPIkgAfHFqbeiDX8C4TTqZUufE9RTDH8oJIgedjflinwH7tTzApwatYHUtNqbRTUXm66BvOrV6Tghw7J00qNSCuVSBqDIBLSdip2jbzGHZLIBczVYeIhVA8QDR4j420EkDUf33ONDg1Sa/qc+OecZSaen+Q0yooqPUKksLyAQq9ADuOZnf5Y8i4LxZ6zVQVhblWCmFBJIVjsGjbab49H4yB3TTlw8Kf/wBioGO/9NMXv9MVsjkaZyHd06YVDTDKq9Y1LJN2Yncm9sWcHJO1RGLK4O5eX4Mu5kqwtIiR64uUjbywOp1JXSvMGP19dsWaZkafQeUYyqdM6NWWotiWhm6lOWQAnoRuOcHcGMQFwLfyDiUvYk7DfbbDuXKNMmP1kpLwRZ3KZbMpTfOVxllYkLT0FqjAE6nMAlRNgWtYn1z3Hc3k9R+6l17uFTvIU1EBjwgAQN4mD1GLdPsTn8zSXMd5RmouoKajBgpuoshUW5T88Y2sjJWKVBDUnKuPNCZHxXfFkcajGiJZ/kldm44cA9OZJAO839CeeI+I5EvTZRFxIB5EXUg9QRiXslm+9y6EiCn4bDzWL+8EH34XGON0MtUNOpr1gAlEXxAMAwuxAEgg78xbEcvCFr7WZGjlwWdnptri7EsNDHbTa8yN5jpjR8MrMlFcuQQT4QYBUFpN+QjfA3idUVHavT7xUfS6K8SQsDlvcG+C3avtEMrmBSOVDFQlTU1QSwZQy6kVT3ZE7G9gSL4WcOaqzWskMak423evygpkeAL3j1EYlqgGpvyCOjGJmJtN+mJc5wmoiM1mUA6is2HmDi52N7QUs+HiaVRLtTJBYgmNStFxyNrGOuD+YrKiGYCjfoOpPX1xf/x8cYW5WcjJ1mSWT9KX4uzzlnhrGLCT64d3bdflh9ahT1sKR8AYkAgiFbxBY6AMAPKMd0+YxkaN8fsrL7GT18vfjg8+VvP34ZUFpw1Kl4PqMBNEsb4tcBoq1Ryx0qIPtQCb7zvA5HrimDzwX4Fw4VU1MoK6uTOGMMpYiPCTYRIsR6y8FbKsrSjt0X83kKTePUHYGR7BEzANgDN+X6YBd193rlpVaZKjUCQu8UwVO25UXMgDyAMZ7htNVaaVRGjQHSorAe1AIaDCgsxC7nqbjN8YyrlxRZyQWL6nR6f4as51CbggQYO1ulrE0nbRTG71K/3NfVzCPT7uRLKYGx5wQYtB2HXfHmPHOF16FfLtrqK/eLTNRFZmZQ8030/+o2mQV6pGCXAOJ9w2irVWppchXV1gGBIk3WxFvLGrzK/fEU06uhlOunVWCyMp3gja0EcxI54sl99+fRcnxTXs8041kRW4m6pLf+Z0Ov5hFTQWgbqeZGxmeRK+0fiTtnKqa10r4Pw31I4GxJEXiJXkQRjaU/s4rLmRnFzNMk1DVjQwUliWIBDEgGelsVc39n1SpmFeq1NtdQNUKhqesTLykEAkA+JWHWCb4r4NO/SKozi2kmeVKb4P1KsgE/mPxgD98b3tR2cyTt3WWoslWn4tVMEoxBQFKhYwLCR4heTe8hct2WLmKtVFSmGDd2QxBZZWWMJT5HxETcDFUssauzVHFN6oDiuEoqpMB21K022AInlcD440PCuHV6qB4CUxY1KjFKQgHxS24/2g3gc8G+G5DLZRPw6RZlGrU5lyYiQXACTyskzYVBjJdpuPZiuwDqUpAwKQUhR0Mn2jGxtHIAWxUpcnUV/Fjyx8VbNPkeL0qAZcuO8cLeu4iYB1d2hnSOkyTeeWAmb4mWBLkjVfWATBkb+t/nijwgxrcHUpUiCfEC0AyB/Dh2czFIKo1EkCBzteekYVY0pFcp6ogObSNUvI38W/z68saDsbmO9zNJHAYe0CbRpUsJgWuB8sZynVpr+GQYaT4r7iZ8O5A8ueNh9nfDQK5qBSU7ohWJBuXFt9oBF8aMauaRRkbUGwjna4WsdfeqJJYJ4ySIA038Q9T85hLSq1KjmjqVBpB71irN0aFmxAI3BE7c8LiHE6Rd0VH75W0gghaYBXUCWIJt/SPjiJlqguKdYkyop6iZYQP9Qr7NtRsT+UcyRZNLltPv7ObJV4RDnznVB1JRWnvCqXKw0yWLaz0jVEEwBvg32Wzfeo9VVCop06TZQwA1BRFheRvv5YzxzdZFd6gR0jRBNVtDEAagDdzvYmAdtgDqK1E5bIhI8emDFpqPuBHmfLFuPT7UCtowlWpDnTYeKBIm7NA25yLz1xOtWLRLAX6A8vhitmqZpeIglpBgDkDpEz0k+uOVMqEiQdZI3vM9De30xi7s7CVIu0BN5jkcLiNUrQrHmtJz1/IRt7/djmWYxBW3K0z547Vpl0ZQPaRluNpBA9cNVMDY/Z5W18Ly5bfu9M/wC1iov6DHjfbAlM5Xnc1WkeTA/XVOPUexWvJ5CnTq7hS/KFDMzFWOrcTtGPMO2ucSrnatRTKWieZCqtp5QBjbJfRGDB/wCsq/3Ye+zeoAtUusoKmoqDFtILCbxYDGF4jm2q1XqOxZnYkljJM9TA9LAegxruwdGoRXYq2jTqBNgSBexve14xhxijybE2F+CozJVeZKKLHpB29AMD87WLuzsSSxkkkkz5k4IcB9moAYaFI+dv51wOzFOCY/yMSM+wV7E8TOXzlN5OktpcDmrWM+hg+7HtebRWPiMwQQsnSPd+bfdpx47/AOF61VEqZan3itSV2CupYMPCw0zMk3jfeNseq9ma9VaNNmREqd0pJqKxKsYEFS06oHO9xa+HhV9rZi6lOlJOvYK7QsgqW9rTLGxU+XXVtgZpPQfLBviiqo0hJqP+VRfzaCOsjrgF3XkfgP3xlyP7M1YGuCNknBUOVkIdbRfxFvaFgvUi2A1LhxdTUVT3a7szINJ28XTfnjV5JytBLGRpv/71wHyNP/yubABkuCPMBpt1sMI5X+kuqu5RXhThkXR7d0h08YtJW8EYZmONUqdaplqmabLvTOkfgsygmfGStgIvf388aGizBsiWBhRe210gH3T8Mea/axlynEmqQQlWRPIsD1964fGrdMWXY0Wf46qtUprn8vUFOh3qMGOmpULkd2CJh+7Hs3Mv5YsNmlqOxpZijWqiZFOprfSqySlhIkgCLGSNxjzKpSBFxJ58jiTJOUIILW84ZeYKne2L3H0VOEX3RfpcLFZnXQy5hqtPuyZ1N3q2lSLrKsS3L5YJn/8AI5A1KbUiALB41I7fl0MI17ExuIuBjT9huHLV1ZtawWoiLTkhqjJZgSBqBBIjTHVusYH9raoNVpq1zTHhZqrChTZwTq8RGpgNtKKTYyZsElKUVofDU3XrwEOzPF3XLopdxVglhBtJJ1Wswjpubb2xezfGajeDWnQFiXZufgp0xqcQZkWOBWQ4UX7vLOppWDAqCqlGUsunxGo9xB1MpnkIjGW7a8SqfeWyuXqOKSN3ZCaV1MI1+zEKDKhZjw4zQhkyWl7N2TJjhTpXXf8ABtqbGoWSdTAFiphQAN/wqbwLf9SpP9nLDeCLTqImZk90QVFMaVfUpZRDBQtKxa9NQeUmcUOxmQILlUVNVMrYyxgLuYvcnmeeDHZjgdRckKbD8QMxUDaRJA/9wn3kYuxdNCGZRn2tWZcnUynjcodyxS7OU8yBVy9c0m1jXSqBaiSCCYNjJBBB3PO+y7Q8MDAgqkrLEOAy+EH5xin2Z4mveaXlVdgA6sVKvBW4KnSt7k3HuM6jtPlNKd4oaCGDco1Lb0G/xGNnWYPjk0u3j9ijBkc4q3vyeYU6hYN3FGl4QNcqABzi3kP8Yu9n0XMF1FOkGRdRhAw9Nx88WuCouXy9QVKLOjzULDUVVxK6WK32AttjnY2klHMVnFN6aOiqKdRXWosE6dSsJuATO3LljA3JW6Ncow4p3sqCqpyJzmhBD6ChpqDOoLvMc8bHhr91lA40khWMKAAQfFcdQbefljP1+Fu2RqZeVDu+sXsJIO4HKMOzdF1oiqjeCnrDqTAN1Yk9BCm15m4xEcj7x7iLHGWpdilxXi1B6horNOtqAYBWZWbuwXJqW8U2ggAX9MVcvxU0zao6UyAGYgwCR4GgSdIMiIJhp5Xy3Cah7x6pJZiYA3mpVJEj3avjgzQz9N6ndg6iQxB28Ss4I87bemLZaZyc6UZvjHXk1fBM1RqqlX701QJ7SkEAPpDhSzAXHMAHbe8YocI4zUzOcekas00e6MgLDTqgo6kSJUTqBPyxl+L8QbKkqg8DqCeur2LzzARTPr1xz7Nc01XijVCADUFRiBtchot6YE5K5eKOhjjieKKiu+2b3j9EIHdXZXEC0EEXJm3KRhi8NcVaKd88VRPKQNJNrenxxZ4xLvVpmFJAg3vDTi4JLZeqGXTTEGTc2Kx5GcUqXktaKOVyPhrTWql6c6Yi8TM29MP7kBaLNVeHu8ldIjziw5Xxc+61fxjEiobRHhmfjuNumKnFOH1DRpKoWpB01KcgFkdl1QT0WfWTiVJp9g4qWrAXbTPd7WTLLUCGox1VGYU6ShBJBYk32AmIJXrjuQ7FA5XXRNNtYJNSpRp1YsAYaRpjfVfe2KH2gZBsxWqdzTnQwpuAygKYBVQCRuXm39Ixj8zl6uWc02LowEEJUKiGAaxWQQfqCOWNrcpfbsZIY4x0met8I4fVShoqLSLIhFSqjN405FRpBVoF/wDjGDq9gGFLSlecwQSVMrTenqCtDRbSd9Rv054l+zPiNV6tUVKjutOn4QxmPGCd9zE/TnijmMxUp1Kiq7AsfE35iAW2Jv7x09cJF3Lf8TZHp/8AolNPtVDH7H1srL1KtEnT/pozu5B6wsL6kxh3B+zuTqnXmOIU6U30SoafMmdPwwV+zuqPvndkiKqMhkTJ9q/wIkXvjX8Z4KoyNTK7lZNLrKkVFE+cRjRHGpbQQ6Z5MWpO/wAID5XLLQomlk6ofxB0qhlZgFEwWA0kHpG0emLPBc7VLXIqvHhDfm0rsfM9fTGJ7N8VSnVUMCUbwt4tMahp1TPKfgTjRZLiNIZgJQqCoy7ILSwBDC/KBc+ZxTJpOy3olCUJ4MqW1ab9rwGczxDuGD6QrljARpaSDsWJOmCecCepxURlgeF//wCh/bGZ4PnKuczT96gTuxdYMggooVpNyNB328WNWmXMDfGaTbZjhh4qpM0Wczapl/EbgTERJDbRijwzNLoqBXgELYCwiPLD2y0+0QfW+OplwplWAPUWxlWWma3jbJn4ggCB2OlSZMX+O22A3bhstmMhWJI1r+LRggt4Pakjqupf8jBQ0Ad2md+eGVOH03VkOkBlKmw2YQcP87sX4jx6n4lBG4/k4dS8Q8ViOYsPLFM66NRqT+0jET/tMH6Ys1EkakgHmDsf2/THQTszmk7HdoWyJq6kDLUpMovfWATTuIgTYxyM8sDey+VbN52mlVqjS2qqXOqUTxMCTyMaY/uGKuVYEQVFvl5g43n2PcKA77MagSSKaC0hbO4HO/gHuxKptWVzfGLaNL2rqaKf3jwq1EhlYmAdRAKkxsSRy3GPK+x6CpVd6jv4EZtSrLa2BF/Cw5tyxqPtiz2lKWXVYLHvH0mPCtlt5tJ2/LgF2IKrRrsW8Wg+uzWNvTE1FSspjKXw7/1Gz4cO70laL0xoW9SprJuTA8bmPePTBDg/aBlrBqkaAb22kECI3+eKmSzNM1KSapJRrTzUKbCeV/hh3axFGWqMAJlL8/8AUTGbPNPMq/Bo6aEpY77E3GBkawYU64p5gszA6WRWDMWCuHXofaEkE8xbFrI8WDZU5ep7WmA92gr4jqKgwvQ9Ix5jn82qjxsbCRuY8x02wS7IcTnvtTa6i0QyzuI0qTJ/3L8MX5cknCr0WRxxi7aNdkEy1FnqVM1UcqAppFopC1tNNlBJtubyDytgTS4x95zTjSQQkiIEjV0N7TM+eK+Z4XUr1VqNqUkJqnkfZBPnafSMX8rlGoZrSiBk0hXfT4jMFfGdoj2b7m22Im3LG1Hf+TLDislvv/YvGmwEgT0Egm0eXuwF7Q6ly1RCWUVWjcWFz77CPfjZ0qRK6tIj/cv0mcYj7Rs6AyU4hUU1CZ31EgW8gvzxgxOTmjoTikjLU+7pKviOvWSBaY7tlB22DN8sT8N7OslOnVDHxN4JiQdwQY/NBt09cCey/Dmz2bVfEEB1OR+WmOQPIn2R5meWPWe1lEHKtpSO7KssflAIW3opONGSaUlH2Z1huMmYLtTw9aiqxkaTBje/I9YKnHOwWS7rNCpT1MyqeQO5Uch54r5knUZJMmbkmLDbpgn2RrFM3Sj8xZW8wUIA/wC7ThpJqDEwY+KUWzWcRR6jM5U3G0EQd8D6eUc/lOnoQfpONWW8sRhvJfnjH8kjb8aAKNVRgyqZ6eKLepxb++1zPhA9VwRZuoGK+dr6aVRiANKMdzNlJ/TELJJySB46VgHhJqVfvD068K2YeR3SsrMgRdUxP5euKXbfgL1cu1ZqzPUpU9V0VBpHicWE2EkTPzxV+zxa33Yik1EJ3jkCoDqtpFiJkYP5+hmHy9QGtSUGlUBVKeoRpYEaieY8rY7SVxOS/rOzDdgWKmuyCXZVpj1qMFWfUz8Bgj22od3mSunTFNJEzeLk9Cd4xY+x7LVA2Ymm2hWTU0ahrTX4I5+1qkbaV64qdsahfM1GJkmL6SpiBAKm4MRiiMKTk/JpeZuSguyW/wBwRlazU3Wok6lYNHmDPzx6XxjjY7zK1BtXpeE/3oQRI5E6z8BjzN1tIJB+uCPD8zTzGV7io7JUpOWpPckT4hMbjVI+GLIZOJ0ehm+VLb7pe/aAXaCl3eZqoosHOkC3tGVA9xGCNPKV6PE2TLg95q1KAIXSw13B2UTt5RgvWyiZrRV9jMIyirpiGKESSL3gSG6RIPLacBy9MVqma063ZBTioVLKBqaRpM3JHppAttirK0oOQufp8sMilWnbvx+z9M5wfL5Z9dTuyru6tU7sFQX7tdQIYwCCTIEwZG84IfdaH9dX/wCGGhVUQqqBOyiACTJj3knC7wf0jHMeVg4J7ICTFp9Np+OOmQdj6SLfPyxYWnzMfPHQn18sVWPsrgz9f4MSU1vtfEip5mPd+mH6B/mwxFgeU/adw/RmS4EalDjofysPiJ9/ngHkySobkfjj037T8hqyoqQNVJgeXsuQjD4lT7seV5CroqFdlfbyP8t8MdPBPlBGTJGpBNCBB3GD3Ybi/c1NLH8NyA0n2TMBvdNx09MANEGxgdMcGouqIjVHewRRJMb2xbNJqmJG07Qe7UcJqNUeoz1GUOyKahLwqs0KC0mBJgbYOt2FyrUxp1020jUUqGSYEyH1Dfpierl6rjLUqohiAaokGIu8kWvHxONO5vyv/OX745880lqza8cF4AXCuzOXouKlNYcTBJJIkEEb9Cd5+WL/ABzK68vUTVEiZNxZg149MXNQmJ+GIuKR3FQHxW+EEHaL/EYSE25ptgoJ/VHl3arJqoEVS+wYIjCBtOph1Mbb2xo+wPCKT97VCVQGHdRUKyRpXXsBzA58trYrZ7KpUy9d0J1I1IAEEDTrktvc3vH9I6jGh7BOBloDKYdtp3OknfqTPS++NOXM3F0NLp1Hd9gvw+jLrLMNTMTKgG0qul7GYQGL21ERc4dVcs9XcmYmZ2ECW5n0225YopxuhSrJTasAwL61GtghJJAZY1BmLCLcjFt3ZHiVN6lTQ4JZzpGkhyBE+E3G25HnacbsU4xSv0cLLCcm6Xn/ACQdoeMNRpo4XUz2B/KLTc7nyHrjBcXrtXLNVOosI6WGwEbRjc9qcqamTcKJqUxrUczpnpudBNhzx5rwjMCo6UZJZ2CKQCZ1GJJHTf0xkxcKbR0ZOTqz0bsFwNcrlV/6lSHcxBv7C+gXl1LY0oQHc/za+Iw6xZh0ifdGOKyke3byHnjHKfKVs0JUqPJa6QSPM/XC4c5GZoGYitTUe9wD+oxXfPU9enUdUmbG0b3xTbMEFalwVYPJ/tIa3v8ApjpPaMq7nt7L8eeGBD/CMPdvP9sRnlL+kecRP8645dmwjqUzb/Hww3RaCRB3BiCPOcPLz+YfP98R1tjG4Bj4R64jySt6APZnRRZ6JcLdnuVUFXANptAMra4geWDFSuppOveAyreyZ3BH5PXnjH8V4c9RartBQMFFr2BLe664t/Zvl9NKuni061MCdypB222F8dGPV8YK1tGLL0NzclJ0brhtCnRoBE0ySalQiDqqN7RJG55egx5P2wqTm6+/twPcAv6Y3b8MZSO6qsvk5LD3nefOTgB2k7MM5qV6lUUx7RKA1dV4srd3p/7ji99TinH6v+Znx9LOE23sw1WsY3+mBusg2kHrMY03Cez6Zt2p0cyO8VSxFSlUp2BAN1ZxzxNmewtWlTerUr0NCCSwNU84nw0zzIxW5xurNSUkQcEJqV8uKVQisQRUEEKyqpbxEWO2n4G0Tj0fhWpJV1CsBMgyGB2gn0I/5x5RTJot3yV0JSy6PvALFhEBiix1uRMY2P2eV/vBNVq795T8L05OkqwIUkkkke8QR6S05QWGVjvN1EslKVRdWvf5Nezgc8M7/wDsHwP7YlZI2iPX98c7vyHxH745BfbHGsLjY7bjf0BwjVHLY2F9/fYYYGHofd0+GO6bWInkfCOX0vgAca0Hznr/AD64ctdRz+J6n5YjKAxtI/zjiNFiBI6D9Of89MFAZ77TM8q5dUBMs+0nxBVMz6EjHkuZkvb3R8sekdsc9TqC+jQjMgJI1MRGplG8bAH1xleB06XfB3So+kyEQKSwF5kn2vILzne2OlhjwgkzLkfKWgrk+zoq5imjV30MTqC2ZYUkEGCCCwGN72W4FSyepKRZmc3app1Wmw0gQOv+BjzatxKqKmsNDXKsJ1gbbG/W/ryxuMjxc1aSOK4Rog2JZWESV0sN/hivqE3VPQ2KvIazTqM053K0wotIAJH7fLFgv0Hyn+bYC5Wi2o1qlYszhZZUCCxMGJJ5zivUAM/j1JFoUD3RIxllDZolJSdo0TuI2HP425YrZt5Rk0xqUi4jqL/XAd8qh/8AWqg2MHSOnlifL8NW472rtfxAbzzt8vLC8UgUnZE3CGp0qia0q97BOkgFNJtuF1dQPK++LmXyvcUooQ0kswqeAzCgRpkXjb95x1OG0omWbndj/Of85Po5OmsRv1Jn5E4aUkxnOUlTB/EKGYr/AIeimindw0aYkC+5B6AH44goZOrT0VRTQuFCaA0MAoC6ibCY6H9sHyg6nafy/PCRBtqJvEGLeQgYjlqqFWkDanEMwhXWlNAbambwi0yxF/gL/HAvgFFDnGbuqfhVmFVVGnW5AYygCmxMSJHiucaeoW5G8c/PlM/TFGpQqlj+IQvIBRPTdj0xMZ6aoWg3k6lMkioBAEgpq+EG42xZNfK3ksY29r5264AjKVLfit8FHwMWOOZ3h+tf9RuhEgSJ2koeVrj9sEePYGmefZPspmHr1DWApO3jJI1LDkzo0Eg3/uwZr9iVKhRmW28U0gAeoH4lpE9cGzwQ6pWoKacwg+NkVRf0m3PEX/h9yY+8MVnYj/JxdLM/D/oJ8a9GpzPEabAeDzAJJj0BGKRqrvBJvNzebdPTAShwFt2reogg/Gf0xapcOAnx1LWjUQd+fwPzxRJL2OrCOUzmhv8ATVhEFXmPcepjfF81qFWCfwCLTEo3vBB95jAqlAG5jqT6WnEictTQDuy+Ixf2RaeXPBGTWieztEOYoLDorB1JYhoibyY+MYGdl6XdVK9M2IZfL+qfkBjU5XMZULpZKzt1PhjygNA984G8Qo0vFUy4qd8Y/wBQjSYiQdO1h8sPxVPaJ+TVUTqx5AbiZPl/PhirxemXoupA5e7xA9b4GLlc0WIeosTFr25R4fOL4Y7vSAatWApkhRpViSWNgFCzhYw+ypkcvZD2M4YKdWtU6gJtO5LN9B8cQcc4JXUFabhsufFUEkMqiTBBswFj1tt1K8Nrq+p6baqTOdJ0sGt4TqG4uI+PXF2tXAHinoRDX1WvbzM2thnKUZOiWk2Yf7R+FHL5anKhdbiBzgKxkjGe7B8UXL5pGdtNNgyObxDDwkxyDBT8cer9t8xlw9NswgYKs0wQTJ0gvA2NmXfHkmYyK1Mw/dkU0YsyK2ptIuQsU1J+AsIvjXj+0XFrRTm1K0eyK6ModWlWEggypFiCImQbXGOav54sZLsbxZly602R3NOVBA/L+WxvYGPcMGfvrf8ASq/9o/bGGcHGTRbFpoIMy7Qef9Q36ee+/wA8OQzy2jly6ev7YmIEkgEn6e/l+04R5bxy36/p64rsYhTpvHTCdebSR0jn/P0xYZZkCfcfr7vnjgRt7R/z/P5OCwAOY7JZVzqKE+QIHUja8H16YenZ/LDwpTZQbmNzF9yCbGLe7B4r5yOl9vPzwhTJvaY5knz62w/yz9i8I+jO1+yFKoEaakodUlp5gkSbX6YZluy9JGEVKkj2roC8DmIjrf57Y0gQ7NBvy1FT5+duuHPSMi6rFpjfpuenTB8k/YcI+gSOEU0MprHmGNxz/wB1+WL2iAIEmPpO8dMT90NQ5zG15vHX9MdVBfcifdYC04VybJoh0KZtPnHMc+eOUkFpHLePp++JxTEx7/5bHCoIN56ySeuIskhJjn6GT/yfdjqvvMC9o8o3jniwKcHzHl9Z64jrIIkAzO38/TBYHFGq5i3Qi9p2j+ThxQgajpIJvcdcddB05C9vW+3Kd8NmBEXjl8pMWHPBYDJ3mDfl8esc8PZhsDyneOVovjhaRBjznr/P5bEipAG2/wC3lHvwWTREokGL+6foMLQLErfYc/XpM338sWIjY/MfON8c1SLSY6C3xMYLIKz0x/SN+QN56AeX0w5lttvzg/rbfr0xPB3mbWuDf3746C0ibx1/nTBYEHdja56ARHO1uX854iZBPvt5G0xf+fS0GjznlBEib4QcTEbTz6bE38vLBZNFM0z5j4fzyw4Uh7vd/wADfFuSYAE+fqbgzYYYrc/lPr855+eCworMsDcC3mZ5bDe08/8ADgknYE/2qTvyIkxiwmq0gX62uLdJxwURMfQfr8P4ZwWFFbuecn5gfI7fycUOIcM7wKAygC4VqepZgjYnfoRG+DvdR1iZ58/d5YaqEgQYPWL+sc7ziVKuxFGbyHATTQIKx0qSYWmF9oliACdrxHL3YWZ7MkglazK0GDE6Wi2x3BvvvGNNTWY6kf59cc0NEDYcj9Z9+G+R9yOKMjkuyz37yu9QACNSkkGIbdiBOkTG5GLdHs7TDG7k7zCjy3j3Y0Wi8gkfCD6898QtSM72+JMXvb34l5ZPyQoIqZDgtHeoUEGx0AubdR/Plif7nQ61/h/nHWU7A2HW/Py+npiPWf7/APuH74XkTxLi7/H9ccZrj3/rhYWEJFTclhfy+WHML+/9MLCwDCb9R8jiVLx7/pjuFgXcjwNKAXj8pxT79tRE8+g6nHcLAyC431wylz9P2wsLAMNFgfdjr7D1/XCwsAoiP0xym5jfl9Yx3CwEsc17/wBx+U47UQSbch9BhYWAkYOf85YjY25fAdCcLCwMCUezPliOlufSfkMLCxAD6m49cTrYAdQMLCwyIZW1kKbnEmX/ACev7YWFiPIMbWFyL79Thzfp+uOYWAkR3Pr/APbEGXYmZJP+cLCxBCJsu5kCbBdvSMcfePX5A45hYkklXaPX64Snb3/rhYWIAiRz15H6Y5nLAxa/64WFiQBpc6Fub7+dpwTo+yPQfTCwsBDP/9k=', NULL, NULL, N'   Điều 20. Mỗi con cháu đều có trách nhiệm thực hiện tốt mọi chủ trương, chính sách pháp luật của Nhà nước trong mọi lĩnh vực của đời sống xã hội.')
INSERT [dbo].[TinTuc] ([ID], [IdLoaiTinTuc], [TieuDe], [NoiDung], [TacGia], [AnhDaiDien], [TinNoiBat], [TrangThai], [TomTat]) VALUES (6, NULL, N'A. Nghĩa vụ và quyền của thành viên', NULL, NULL, N'/Files/TinTuc/6/OIP.jpg', NULL, NULL, N'Điều 7. Tất cả con cháu của dòng họ Giàng khi sinh ra đều phải được gia đình nuôi dưỡng, chăm sóc, giáo dục chu đáo, không để trẻ lang thang, cơ nhỡ, thất học')
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
GO
SET IDENTITY_INSERT [dbo].[TocUoc] ON 

INSERT [dbo].[TocUoc] ([ID], [TocUoc]) VALUES (1, N'IV. VIỆC THĂM HỎI, PHÚNG VIẾNG VÀ ÚY NẠP 1. Mừng thọ: Hàng năm cứ vào lệ khai xuân 15/2 (âm lịch), dòng Họ sẽ mừng thọ cho các bậc cao niên bước sang tuổi 70, lễ mừng gồm có: - Thư mừng thọ, khăn đỏ và lộc Tổ trị giá 100.000đ. Sau đó cứ đến tuổi 80, 90, 100 trở lên dòng Họ sẽ chúc lại gồm thư mừng thọ + lộc Tổ trị giá 70.000đ. Bước sang tuổi 90 dòng Họ sẽ mừng bộ quần áo đỏ, tiến hành vào dịp lễ khai xuân tại Tổ đường do dòng Họ tổ chức. 2. Thăm hỏi: Người trong dòng Họ (đinh Họ, râu họ, nữ quy nam, bà cô) có công hoặc đóng góp tiền của lớn vào Tổ đường, khi bị ốm nặng đi bệnh viện về hay bị tai nạn rủi ro đột xuất. Ban thường trực tổ chức đến thăm hỏi động viên và biếu quà vật chất bằng 1kg đường trắng và 01 hộp sữa theo thời giá tại thời điểm đó, mức độ 01 lần/năm cho mỗi người. Các lần sau chủ yếu thăm hỏi bằng tinh thần. 3. Phúng viếng, các đối tượng: - Đinh Họ, râu họ: Khi qua đời dòng Họ tổ chức lễ phát tang, lễ viếng của dòng Họ, lễ tiễn biệt (vật chất lễ phát tang, lễ tiễn biệt gia đình lo). Lễ viếng của dòng Họ gồm: Chiêng trống, biển tang, hương nến, tửu quả..tiền khiêng chiêng trống quỹ họ đảm nhận (người khiêng chiêng trống gia đình thuộc chi nào thì chi đó cử người khiêng). Những trường hợp ở xa, dòng Họ cử đoàn đại biể thay mặt cho dòng Họ tộc để tổ chức lễ phúng viếng, mọi chi phí do quỹ dòng Họ đảm nhận. - Cô họ là nữ quy nam: Cũng như đinh Họ (nhưng không có phần tổ chức lễ phát tang) nếu như chồng họ vẫn còn đảm nhận. - Cô họ khi qua đời: Có lễ thỉnh Họ và 100.000đ, Ban thường trực dòng Họ tổ chức cùng với chi lễ viếng gồm: Hương nến và lễ đen. - Chồng bà cô và bố mẹ chồng bà cô khi qua đời: Có lễ và 100.000đ báo về dòng Họ chi. Ban thường trực dòng Họ chi có trách nhiệm tổ chức lễ viếng. Lễ viếng gồm: Hương nến, tửu quả và lễ đen. - Cô không xuất giá khi chết: Dòng Họ tổ chức phát tang, phúng viếng và tiễn biệt như đinh Họ. - Cô nào chưa thành niên không may qua đời theo lời thỉnh của cha mẹ thì dòng Họ tổ chức phát tang nhưng không tổ chức lễ viếng. Nam giới chưa vọng họ cũng như người ăn theo bố mẹ (bà cô chưa thành niên). Việc đi phúng viếng và đi đưa tiễn biệt là trách nhiệm của mỗi thành viên trong dòng Họ trên tinh thần tự giác, tình cảm và máu thịt chung dòng Họ. Xưa các cụ có câu: “Nay người, mai ta, nghĩa tử là nghĩa tận”. 4. Vào phú úy: Sau khi cải táng, con cháu có lễ cáo Tổ và báo cáo dòng Họ. Dòng Họ có trách nhiệm ghi vào phú úy của dòng Họ. Các trường hợp đi hỏa táng thì áp dụng sau khi hết tang sẽ tổ chức ghi chép vào phú úy.')
SET IDENTITY_INSERT [dbo].[TocUoc] OFF
GO
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([ID], [TieuDe], [DuongDan], [MoTa], [TrangThai]) VALUES (2, N'Video không có ảnh 2', N'/Files/Video/2/Bài đọc AI.mp4', N'BBB', N'AC')
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_ChucNang] FOREIGN KEY([idChucNang])
REFERENCES [dbo].[ChucNang] ([idChucNang])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_ChucNang]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH NOCHECK ADD  CONSTRAINT [FK_ThanhVien_ThanhVien] FOREIGN KEY([VoChong])
REFERENCES [dbo].[VoChong] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[ThanhVien] NOCHECK CONSTRAINT [FK_ThanhVien_ThanhVien]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_TinTuc] FOREIGN KEY([IdLoaiTinTuc])
REFERENCES [dbo].[LoaiTinTuc] ([ID])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_TinTuc]
GO
USE [master]
GO
ALTER DATABASE [GiaPha.KimToc] SET  READ_WRITE 
GO
