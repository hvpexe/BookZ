
USE [master]
GO
/****** Object:  Database [BookZ]    Script Date: 17/7/2022 8:06:21 PM ******/
CREATE DATABASE [BookZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookZ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookZ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookZ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookZ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookZ] SET RECOVERY FULL 
GO
ALTER DATABASE [BookZ] SET  MULTI_USER 
GO
ALTER DATABASE [BookZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookZ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookZ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookZ', N'ON'
GO
ALTER DATABASE [BookZ] SET QUERY_STORE = OFF
GO
USE [BookZ]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 17/7/2022 8:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [char](6) NOT NULL,
	[Title] [nvarchar](120) NOT NULL,
	[Author] [nvarchar](120) NULL,
	[Publisher] [nvarchar](120) NULL,
	[Language] [nvarchar](20) NULL,
	[Cover] [varchar](255) NULL,
	[Description] [ntext] NULL,
	[NoDownload] [int] NOT NULL,
	[FilePDF] [varchar](255) NULL,
	[FileEpub] [varchar](255) NULL,
	[IsAccepted] [bit] NOT NULL,
	[DateUpload] [date] NOT NULL,
	[LastDateEdit] [date] NULL,
	[MemberUpload] [char](5) NOT NULL,
	[MemberLastEdit] [char](5) NULL,
	[CategoryID] [char](3) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17/7/2022 8:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [char](3) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Download]    Script Date: 17/7/2022 8:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Download](
	[DateDownload] [date] NOT NULL,
	[BookID] [char](6) NOT NULL,
	[MemberID] [char](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 17/7/2022 8:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [char](5) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Avatar] [varchar](255) NULL,
	[Role] [varchar](10) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Birthday] [date] NOT NULL,
	[NoUploadedBook] [int] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 17/7/2022 8:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingID] [char](6) NOT NULL,
	[Star] [int] NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[DateRating] [date] NOT NULL,
	[LastDateEdit] [date] NULL,
	[BookID] [char](6) NOT NULL,
	[MemberID] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportBook]    Script Date: 17/7/2022 8:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportBook](
	[DateReport] [date] NOT NULL,
	[Detail] [nvarchar](255) NOT NULL,
	[BookID] [char](6) NOT NULL,
	[MemberID] [char](5) NOT NULL,
	[ReportStateID] [char](2) NOT NULL,
	[ReportTypeID] [char](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportRating]    Script Date: 17/7/2022 8:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportRating](
	[DateReport] [date] NOT NULL,
	[Detail] [nvarchar](255) NOT NULL,
	[MemberID] [char](5) NOT NULL,
	[RatingID] [char](6) NOT NULL,
	[ReportStateID] [char](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportState]    Script Date: 17/7/2022 8:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportState](
	[ReportStateID] [char](2) NOT NULL,
	[ReportState] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 17/7/2022 8:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportType](
	[ReportTypeID] [char](3) NOT NULL,
	[Type] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00000', N'Sapiens: Lược Sử Loài Người', N'Yuval Noah Harari', N'Nhà Xuất Bản Tri Thức', N'Vietnamese', N'assets/images/bookCover/B00000.jpg', N'Sapiens: Lược sử loài người là một cuốn sách của Yuval Noah Harari xuất bản lần đầu bằng tiếng Do Thái ở Israel năm 2011, và bằng tiếng Anh vào năm 2014. Cuốn sách nói bao quát về lịch sử tiến hóa của loài người từ thời cổ xưa trong thời kỳ đồ đá cho đến thế kỷ XXI, tập trung vào loài Homo sapiens.', 521, N'B00000.pdf', N'assets/epubs/B00000.epub', 1, CAST(N'2021-05-05' AS Date), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00001', N'Tư Duy Phản Biện', N'Zoe McKey', N'NXB Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00001.jpg', N'Tư duy phản biện là chìa khóa để bạn thoát khỏi những lối mòn trong suy nghĩ, giúp bạn giải quyết các vấn đề khó khăn một cách sáng tạo và hiệu quả hơn.', 171, N'B00001.pdf', N'B00001.epub', 1, CAST(N'2021-06-05' AS Date), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00002', N'Đắc nhân tâm', N'Dale Carnegie', N'NXB Tổng Hợp TPHCM', N'Vietnamese', N'assets/images/bookCover/B00002.jpg', N'Đắc nhân tâm, tên tiếng Anh là How to Win Friends and Influence People là một quyển sách nhằm tự giúp bản thân bán chạy nhất từ trước đến nay. Quyển sách này do Dale Carnegie viết và đã được xuất bản lần đầu vào năm 1936, nó đã được bán 15 triệu bản trên khắp thế giới.', 213, N'B00002.pdf', N'B00002.epub', 1, CAST(N'2021-07-12' AS Date), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00003', N'Lối Sống Tối Giản Của Người Nhật', N'Sasaki Fumio', N'NXB Lao động', N'Vietnamese', N'assets/images/bookCover/B00003.jpg', N'Lối sống tối giản à cách sống cắt giảm vật dụng xuống còn mức tối thiểu. Và cùng với cuộc sống ít đồ đạc, ta có thể để tâm nhiều hơn tới hạnh phúc, đó chính là chủ đề của cuốn sách này.', 324, N'B00003.pdf', N'assets/epubs/B00003.epub', 1, CAST(N'2021-08-25' AS Date), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00004', N'Muôn Kiếp Nhân Sinh', N'Nguyên Phong', N'NXB Tổng Hợp TPHCM', N'Vietnamese', N'assets/images/bookCover/B00004.jpg', N'', 103, N'B00004.pdf', N'assets/epubs/B00004.epub', 1, CAST(N'2021-09-05' AS Date), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00005', N'Mindset - Tâm Lý Học Thành Công', N'Carol S Dweck', N'NXB Thanh Niên', N'Vietnamese', N'assets/images/bookCover/B00005.jpg', N'', 123, N'B00005.pdf', N'assets/epubs/B00005.epub', 1, CAST(N'2021-10-11' AS Date), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00006', N'Tâm Lý Học - Phác Họa Chân Dung Kẻ Phạm Tội', N'Diệp Hồng Vũ', N'NXB Lao động', N'Vietnamese', N'assets/images/bookCover/B00006.jpg', N'', 225, N'B00006.pdf', NULL, 1, CAST(N'2021-11-15' AS Date), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00007', N'Sự Trỗi Dậy Và Suy Tàn Của Đế Chế Thứ Ba - Lịch Sử Đức Quốc Xã', N'William L Shirer', N'NXB Thông tin và Truyền thông', N'Vietnamese', N'assets/images/bookCover/B00007.jpg', N'', 42, N'B00007.pdf', NULL, 1, CAST(N'2021-12-09' AS Date), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00008', N'Blockchain - Bản Chất Của Blockchain, Bitcoin, Tiền Điện Tử, Hợp Đồng Thông Minh Và Tương Lai Của Tiền Tệ', N'Mark Gates', N'NXB Lao động', N'Vietnamese', N'assets/images/bookCover/B00008.jpg', N'', 35, N'B00008.pdf', NULL, 1, CAST(N'2022-01-05' AS Date), NULL, N'M0000', NULL, N'C06', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00009', N'Lolita', N'Vladimir Nabokov', N'NXB Hội Nhà Văn', N'Vietnamese', N'assets/images/bookCover/B00009.jpg', N'', 78, N'B00009.pdf', N'assets/epubs/B00009.epub', 1, CAST(N'2022-02-05' AS Date), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00010', N'Lược sử thời gian', N'Stephen Hawking', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00010.jpg', N'', 61, N'B00010.pdf', N'B00010.epub', 1, CAST(N'2022-02-05' AS Date), NULL, N'M0000', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00011', N'Chủ Nghĩa Khắc Kỷ - Phong Cách Sống Bản Lĩnh Và Bình Thản', N'William B. Irvine', N'Nhà Xuất Bản Công Thương', N'Vietnamese', N'assets/images/bookCover/B00011.jpg', N'', 66, N'B00011.pdf', N'assets/epubs/B00011.epub', 1, CAST(N'2022-02-05' AS Date), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00012', N'Đồi Gió Hú', N'Emily Bronte', N'NXB Văn học', N'Vietnamese', N'assets/images/bookCover/B00012.jpg', N'', 45, N'B00012.pdf', N'assets/epubs/B00012.epub', 1, CAST(N'2022-04-05' AS Date), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00013', N'Homo Deus: Lược Sử Tương Lai', N'Yuval Noah Harari', N'Nhà Xuất Bản Tri Thức', N'Vietnamese', N'assets/images/bookCover/B00013.jpg', N'', 61, N'B00013.pdf', N'B00013.epub', 1, CAST(N'2022-04-06' AS Date), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00014', N'21 Bài Học Cho Thế Kỷ 21', N'Yuval Noah Harari', N'Nhà Xuất Bản Tri Thức', N'Vietnamese', N'assets/images/bookCover/B00014.jpg', N'', 66, N'B00014.pdf', N'assets/epubs/B00014.epub', 1, CAST(N'2022-04-05' AS Date), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00015', N'Cuốn theo chiều gió', N'Margaret Mitchell', N'NXB Văn Học', N'Vietnamese', N'assets/images/bookCover/B00015.jpg', N'', 56, N'B00015.pdf', N'B00015.epub', 1, CAST(N'2022-04-05' AS Date), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00016', N'Adolf Hitler - Chân Dung Một Trùm Phát Xít', N'John Toland', N'NXB Khoa học xã hội', N'Vietnamese', N'assets/images/bookCover/B00016.jpg', N'', 51, N'B00016.pdf', N'B00016.epub', 1, CAST(N'2022-05-04' AS Date), NULL, N'M0000', NULL, N'C08', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00017', N'300 bài code thiếu nhi', N'Phạm Huy Hoàng', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00017.jpg', N'', 999, N'B00017.pdf', NULL, 1, CAST(N'2022-05-05' AS Date), NULL, N'M0000', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00018', N'5 Centimet Trên Giây', N'Shinkai Makoto', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00018.jpg', N'', 23, N'B00018.pdf', N'B00018.epub', 1, CAST(N'2022-05-05' AS Date), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00019', N'Computer Organization and Architecture Designing for Performance (9th Edition)', N'William Stallings', N'Pearson', N'English', N'assets/images/bookCover/B00019.jpg', N'', 23, N'assets/pdfs/B00019.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0001', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00020', N'Foundations of Computer Science', N'Behrouz Forouzan', N'Cengage', N'English', N'assets/images/bookCover/B00020.jpg', N'', 67, N'B00020.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0001', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00021', N'Discrete Mathematics and Its Applications', N'Kenneth Rosen', N'McGraw-Hill Higher Education', N'English', N'assets/images/bookCover/B00021.jpeg', N'', 64, N'B00021.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0001', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00022', N'Modern Operating Systems', N'Andrew S. Tanenbaum', N'Pearson Prentice Hall', N'English', N'assets/images/bookCover/B00022.jpg', N'', 86, N'B00022.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0001', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00023', N'Giáo trình Triết học Mác - Lênin', N'Bộ Giáo dục và Đào tạo', N'Nhà Xuất Bản Chính Trị Quốc Gia Sự Thật', N'Vietnamese', N'assets/images/bookCover/B00023.jpg', N'', 23, N'B00023.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0001', NULL, N'C03', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00024', N'Súng, Vi Trùng Và Thép: Định Mệnh Của Các Xã Hội Loài Người', N'Jared Diamond', N'Nhà Xuất Bản Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00024.jpg', N'', 94, N'B00024.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0001', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00025', N'Thuyết Tương Đối Cho Mọi Người', N'Martin Gardner', N'Nhà xuất bản Đại học Quốc gia Hà Nội', N'Vietnamese', N'assets/images/bookCover/B00025.jpg', N'', 87, N'B00024.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0001', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00026', N'Nhập Môn Lập Trình Không Code', N'Phạm Huy Hoàng', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00026.png', N'', 78, N'B00026.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0001', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00027', N'Code Dạo Ký Sự – Lập Trình Viên Đâu Phải Chỉ Biết Code', N'Phạm Huy Hoàng', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00027.png', N'', 32, N'B00027.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0002', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00028', N'Minna no Nihongo Sơ Cấp 1 – Bản dịch tiếng Việt', N'unknown', N'スリーエーネットワーク – 2008', N'Vietnamese', N'assets/images/bookCover/B00028.jpg', N'', 34, N'B00028.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0002', NULL, N'C10', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00029', N'Minna no Nihongo Sơ Cấp 1 – Honsatsu (Sách Giáo Khoa)', N'unknown', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00029.jpg', N'', 25, N'B00029.pdf', NULL, 1, CAST(N'2022-06-05' AS Date), NULL, N'M0002', NULL, N'C10', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00030', N'Nghệ Thuật Sống', N'Epictetus', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00030.jpg', N'', 33, NULL, N'assets/epubs/B00030.epub', 1, CAST(N'2022-07-05' AS Date), NULL, N'M0003', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00031', N'Bạn à Sống đẹp lên', N'BuckFoy', N'Chính Hiệu', N'Vietnamese', N'assets/images/bookCover/B00031.jpg', N'asdsafsafsdafsddFSADF', 0, NULL, NULL, 0, CAST(N'2022-07-16' AS Date), NULL, N'M0001', NULL, N'C04', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00032', N'Trước Khi Khủng Hoảng', N'Nguyễn Thanh Bình', N'â', N'Vietnamese', N'assets/images/bookCover/B00032.png', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 0, NULL, NULL, 0, CAST(N'2022-07-16' AS Date), CAST(N'2022-07-17' AS Date), N'M0001', N'M0001', N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00033', N'Bầu Trời đầy Sao', N'Nguyễn Thanh Bình', N'NXB Nguyễn Thanh Bình', N'Vietnamese', N'assets/images/bookCover/B00033.jpg', N'phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet enim tortor at auctor urna nunc id cursus metus aliquam eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper eget duis at tellus at urna condimentum mattis pellentesque id nibh tortor id aliquet lectus proin nibh nisl condimentum id venenatis a condimentum vitae sapien pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas sed tempus urna et pharetra pharetra massa massa ultricies mi quis hendrerit dolor magna eget est lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus', 0, N'assets/pdfs/B00033.pdf', NULL, 0, CAST(N'2022-07-16' AS Date), CAST(N'2022-07-17' AS Date), N'M0001', N'M0001', N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00034', N'ádsad', N'ádasdas', N'đasadsaa', N'Vietnamese', N'assets/images/bookCover/B00034.jpg', N'dsadasdsadasdsad', 0, NULL, N'assets/epubs/B00034.epub', 0, CAST(N'2022-07-16' AS Date), NULL, N'M0001', NULL, N'C00', 0)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C00', N'Văn học')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C01', N'Tâm lý - Kỹ năng sống')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C02', N'Lịch sử - Địa lý')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C03', N'Tôn giáo - Triết học')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C04', N'Chính trị - Pháp luật')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C05', N'Khoa học kỹ thuật')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C06', N'Kinh tế')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C07', N'Sức khoẻ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C08', N'Nhân vật - Sự kiện')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C09', N'Thiếu nhi')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C10', N'Ngoại ngữ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C11', N'Giáo trình')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C12', N'Khác')
GO
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-13' AS Date), N'B00000', N'M0003')
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-14' AS Date), N'B00001', N'M0003')
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-14' AS Date), N'B00002', N'M0003')
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-10' AS Date), N'B00005', N'M0004')
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-11' AS Date), N'B00006', N'M0004')
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-12' AS Date), N'B00007', N'M0004')
GO
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0000', N'admin0@gmail.com', N'123456789', N'admin0.jpg', N'admin', N'Phu', N'Huynh', CAST(N'2002-06-05' AS Date), 19, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0001', N'admin1@gmail.com', N'123456789', N'admin1.jpg', N'admin', N'Binh', N'Nguyen', CAST(N'2002-01-01' AS Date), 8, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0002', N'admin2@gmail.com', N'123456789', N'admin2.jpg', N'admin', N'Kiet', N'Chu', CAST(N'2002-01-02' AS Date), 3, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0003', N'user3@gmail.com', N'123456', NULL, N'user', N'Phuong', N'Tran', CAST(N'2000-01-02' AS Date), 1, N'Female')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0004', N'user4@gmail.com', N'123456', NULL, N'user', N'Tram', N'Mai', CAST(N'2000-01-02' AS Date), 0, N'Female')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0005', N'user5@gmail.com', N'123456', N'img_M0005.jpg', N'user', N'Hoa', N'Doan Nguyen Thanh Hoa', CAST(N'1980-01-02' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0006', N'user6@gmail.com', N'123456', NULL, N'user', N'Khanh', N'Kieu Trong', CAST(N'1970-01-02' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0007', N'user7@gmail.com', N'123456', NULL, N'user', N'Thanh', N'Pham Cong', CAST(N'2000-01-02' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0008', N'user8@gmail.com', N'123456', NULL, N'user', N'Nhan', N'Nguyen', CAST(N'2000-01-02' AS Date), 0, N'O')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0009', N'user9@gmail.com', N'123456', NULL, N'user', N'Van', N'Than Thi Ngoc', CAST(N'2000-01-02' AS Date), 0, N'Female')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0010', N'user10@gmail.com', N'123456', NULL, N'user', N'Su', N'Than Van', CAST(N'2000-01-02' AS Date), 0, N'Male')
GO
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID]) VALUES (N'R00000', 5, N'Cảm ơn bạn, nghe nói cuốn sách này khá hay', CAST(N'2022-06-06' AS Date), NULL, N'B00000', N'M0003')
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID]) VALUES (N'R00001', 5, N'Sách rất hay', CAST(N'2022-06-06' AS Date), NULL, N'B00000', N'M0004')
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID]) VALUES (N'R00002', 5, N'hayyyyy lắm mn oi', CAST(N'2022-06-07' AS Date), NULL, N'B00000', N'M0005')
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID]) VALUES (N'R00003', 4, N'Cx đc', CAST(N'2022-06-08' AS Date), NULL, N'B00000', N'M0006')
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID]) VALUES (N'R00004', 5, N'Xuất sắc', CAST(N'2022-06-09' AS Date), NULL, N'B00000', N'M0007')
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID]) VALUES (N'R00005', 5, N'CƠ HỘI TỚI - KINH DOANH PHƠI PHỚI 💥💥💥
TUYỂN SỈ TẬN GỐC NEM NƯỚNG NHA TRANG, NEM LỤI + GÀ Ủ MUỐI HOA TIÊU HÙNG VIỆT TOÀN QUỐC
💌 Ib em ngayyyy
Nếu ib fb Cao Phương Nem em chưa rep hãy ☎️📞 0359 029 677 Cao Phương', CAST(N'2022-06-09' AS Date), NULL, N'B00000', N'M0007')
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID]) VALUES (N'R00006', 5, N'Tuyệt zời', CAST(N'2022-06-10' AS Date), NULL, N'B00000', N'M0008')
GO
INSERT [dbo].[ReportBook] ([DateReport], [Detail], [BookID], [MemberID], [ReportStateID], [ReportTypeID]) VALUES (CAST(N'2022-07-10' AS Date), N'Thiếu tên NXB', N'B00030', N'M0003', N'S0', N'T03')
INSERT [dbo].[ReportBook] ([DateReport], [Detail], [BookID], [MemberID], [ReportStateID], [ReportTypeID]) VALUES (CAST(N'2022-07-10' AS Date), N'Thiếu file EPUB', N'B00017', N'M0003', N'S0', N'T03')
INSERT [dbo].[ReportBook] ([DateReport], [Detail], [BookID], [MemberID], [ReportStateID], [ReportTypeID]) VALUES (CAST(N'2022-07-01' AS Date), N'Không tải được file ', N'B00027', N'M0004', N'S1', N'T01')
INSERT [dbo].[ReportBook] ([DateReport], [Detail], [BookID], [MemberID], [ReportStateID], [ReportTypeID]) VALUES (CAST(N'2022-06-20' AS Date), N'Sách không hay', N'B00017', N'M0003', N'S2', N'T00')
INSERT [dbo].[ReportBook] ([DateReport], [Detail], [BookID], [MemberID], [ReportStateID], [ReportTypeID]) VALUES (CAST(N'2022-07-10' AS Date), N'Spam', N'B00017', N'M0005', N'S0', N'T00')
GO
INSERT [dbo].[ReportRating] ([DateReport], [Detail], [MemberID], [RatingID], [ReportStateID]) VALUES (CAST(N'2022-12-12' AS Date), N'SPAM', N'M0004', N'R00005', N'S0')
INSERT [dbo].[ReportRating] ([DateReport], [Detail], [MemberID], [RatingID], [ReportStateID]) VALUES (CAST(N'2022-12-12' AS Date), N'KO tốt cho web', N'M0005', N'R00005', N'S0')
GO
INSERT [dbo].[ReportState] ([ReportStateID], [ReportState]) VALUES (N'S0', N'Processing')
INSERT [dbo].[ReportState] ([ReportStateID], [ReportState]) VALUES (N'S1', N'Completed')
INSERT [dbo].[ReportState] ([ReportStateID], [ReportState]) VALUES (N'S2', N'Denied')
GO
INSERT [dbo].[ReportType] ([ReportTypeID], [Type]) VALUES (N'T00', N'Remove the book (spam, inappropriate file)')
INSERT [dbo].[ReportType] ([ReportTypeID], [Type]) VALUES (N'T01', N'Damaged File')
INSERT [dbo].[ReportType] ([ReportTypeID], [Type]) VALUES (N'T02', N'Broken link')
INSERT [dbo].[ReportType] ([ReportTypeID], [Type]) VALUES (N'T03', N'Wrong book information')
INSERT [dbo].[ReportType] ([ReportTypeID], [Type]) VALUES (N'T04', N'Other problem')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Member__A9D1053415C4EA22]    Script Date: 17/7/2022 8:06:22 PM ******/
ALTER TABLE [dbo].[Member] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FKBook712907] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FKBook712907]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FKBook935807] FOREIGN KEY([MemberUpload])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FKBook935807]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FKBook950482] FOREIGN KEY([MemberLastEdit])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FKBook950482]
GO
ALTER TABLE [dbo].[Download]  WITH CHECK ADD  CONSTRAINT [FKDownload32955] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Download] CHECK CONSTRAINT [FKDownload32955]
GO
ALTER TABLE [dbo].[Download]  WITH CHECK ADD  CONSTRAINT [FKDownload466591] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Download] CHECK CONSTRAINT [FKDownload466591]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FKRating736872] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FKRating736872]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FKRating762673] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FKRating762673]
GO
ALTER TABLE [dbo].[ReportBook]  WITH CHECK ADD  CONSTRAINT [FKReportBook659826] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[ReportBook] CHECK CONSTRAINT [FKReportBook659826]
GO
ALTER TABLE [dbo].[ReportBook]  WITH CHECK ADD  CONSTRAINT [FKReportBook812217] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[ReportBook] CHECK CONSTRAINT [FKReportBook812217]
GO
ALTER TABLE [dbo].[ReportBook]  WITH CHECK ADD  CONSTRAINT [FKReportBook849915] FOREIGN KEY([ReportStateID])
REFERENCES [dbo].[ReportState] ([ReportStateID])
GO
ALTER TABLE [dbo].[ReportBook] CHECK CONSTRAINT [FKReportBook849915]
GO
ALTER TABLE [dbo].[ReportBook]  WITH CHECK ADD  CONSTRAINT [FKReportBook996857] FOREIGN KEY([ReportTypeID])
REFERENCES [dbo].[ReportType] ([ReportTypeID])
GO
ALTER TABLE [dbo].[ReportBook] CHECK CONSTRAINT [FKReportBook996857]
GO
ALTER TABLE [dbo].[ReportRating]  WITH CHECK ADD  CONSTRAINT [FKReportRati63346] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[ReportRating] CHECK CONSTRAINT [FKReportRati63346]
GO
ALTER TABLE [dbo].[ReportRating]  WITH CHECK ADD  CONSTRAINT [FKReportRati846935] FOREIGN KEY([RatingID])
REFERENCES [dbo].[Rating] ([RatingID])
GO
ALTER TABLE [dbo].[ReportRating] CHECK CONSTRAINT [FKReportRati846935]
GO
ALTER TABLE [dbo].[ReportRating]  WITH CHECK ADD  CONSTRAINT [FKReportRati870546] FOREIGN KEY([ReportStateID])
REFERENCES [dbo].[ReportState] ([ReportStateID])
GO
ALTER TABLE [dbo].[ReportRating] CHECK CONSTRAINT [FKReportRati870546]
GO
USE [master]
GO
ALTER DATABASE [BookZ] SET  READ_WRITE 
GO
