USE [master]
GO
/****** Object:  Database [Travel]    Script Date: 17/1/2568 15:04:09 ******/
CREATE DATABASE [Travel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Travel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Travel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Travel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Travel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Travel] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Travel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Travel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Travel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Travel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Travel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Travel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Travel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Travel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Travel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Travel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Travel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Travel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Travel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Travel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Travel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Travel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Travel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Travel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Travel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Travel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Travel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Travel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Travel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Travel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Travel] SET  MULTI_USER 
GO
ALTER DATABASE [Travel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Travel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Travel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Travel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Travel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Travel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Travel] SET QUERY_STORE = ON
GO
ALTER DATABASE [Travel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Travel]
GO
/****** Object:  Table [dbo].[Location_tb]    Script Date: 17/1/2568 15:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location_tb](
	[LocationID] [int] NOT NULL,
	[LocationName] [nvarchar](50) NULL,
	[Details] [nvarchar](max) NULL,
	[Img] [nvarchar](max) NULL,
	[Province] [nvarchar](max) NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_tb]    Script Date: 17/1/2568 15:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_tb](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_tb]    Script Date: 17/1/2568 15:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_tb](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Useremail] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (1, N'วัดพระแก้ว', N'วัดที่มีชื่อเสียงที่สุดในประเทศไทย และเป็นที่ประดิษฐานของพระแก้วมรกต พระพุทธรูปที่สำคัญที่สุดของไทย', N'https://static.thairath.co.th/media/4DQpjUtzLUwmJZZO8tjGjU2UQAke6lo1oic4DDkqk3rC.jpg', N'กรุงเทพมหานคร', 1)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (2, N'วัดอรุณราชวราราม', N'วัดที่มีสถาปัตยกรรมที่งดงาม ตั้งอยู่ริมแม่น้ำเจ้าพระยาและมีความโดดเด่นด้วยเจดีย์ที่สูงและประดับด้วยกระเบื้องสีต่างๆ', N'https://img.kapook.com/u/2023/sireeporn/Travel-04/wat-arun01.jpg', N'กรุงเทพมหานคร', 1)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (3, N'วัดพระธาตุดอยสุเทพ', N'วัดสำคัญของเชียงใหม่ ตั้งอยู่บนยอดดอยสุเทพ มีวิวที่สวยงามของเมืองเชียงใหม่และเป็นสถานที่ที่ศักดิ์สิทธิ์', N'https://www.museumthailand.com/upload/evidence/1498710820_19818.jpg', N'เชียงใหม่', 1)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (4, N'วัดร่องขุ่น', N'วัดที่โดดเด่นด้วยสถาปัตยกรรมที่แปลกใหม่และสวยงาม ประดับด้วยกระจกสีขาวที่สะท้อนแสงทำให้ดูงดงามเหมือนวัดในเทพนิยาย

', N'https://image-tc.galaxy.tf/wijpeg-7pqufmqti0twcdzzq3btsb5lq/wat-rong-khun.jpg', N'เชียงราย', 1)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (5, N'วัดหลวงปู่ทวด', N'วัดที่มีชื่อเสียงในภาคใต้ของไทย และเป็นที่เคารพของชาวมุสลิมและพุทธศาสนิกชน', N'https://mpics.mgronline.com/pics/Images/557000007599901.JPEG', N'ปัตตานี', 1)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (6, N'วัดมหาธาตุ', N'วัดโบราณในอุทยานประวัติศาสตร์อยุธยา ที่มีพระบรมธาตุและเศษซากปูนเป็นเครื่องหมายความเจริญรุ่งเรืองในอดีต', N'https://www.wreathnawat.com/wp-content/uploads/2021/02/wat-mahathat-1-600x400.jpg', N'อยุธยา', 1)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (7, N'วัดช้างเขียว', N'วัดที่มีความสงบร่มเย็นและมีการสร้างเจดีย์สูงใหญ่ เป็นที่นิยมในการท่องเที่ยวสำหรับผู้ที่ชื่นชอบสถาปัตยกรรมเก่าแก่', N'https://files.thailandtourismdirectory.go.th/assets/upload/2017/12/18/201712186987aba91f28f20b0cb2dcbc3cdbf9b2111016.jpg', N'ชลบุรี', 1)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (8, N'วัดโสธร', N'วัดที่มีความสำคัญทางศาสนาและมีพระพุทธรูปโสธร ซึ่งเป็นที่เคารพสักการะของประชาชนในภาคกลาง', N'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B9%82%E0%B8%AA%E0%B8%98%E0%B8%A3%E0%B8%A7%E0%B8%A3%E0%B8%B2%E0%B8%A3%E0%B8%B2%E0%B8%A1%E0%B8%A7%E0%B8%A3%E0%B8%A7%E0%B8%B4%E0%B8%AB%E0%B8%B2%E0%B8%A33.jpg/1200px-%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B9%82%E0%B8%AA%E0%B8%98%E0%B8%A3%E0%B8%A7%E0%B8%A3%E0%B8%B2%E0%B8%A3%E0%B8%B2%E0%B8%A1%E0%B8%A7%E0%B8%A3%E0%B8%A7%E0%B8%B4%E0%B8%AB%E0%B8%B2%E0%B8%A33.jpg', N'ฉะเชิงเทรา', 1)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (9, N'วัดเจดีย์หลวง', N'วัดเจดีย์หลวงวรวิหาร เป็นพระอารามหลวงในจังหวัดเชียงใหม่ มีชื่อเรียกหลายชื่อ ได้แก่ ราชกุฏาคาร วัดโชติการาม', N'https://upload.wikimedia.org/wikipedia/commons/3/30/Wat_Chedi_Luang_stupa_%28I%29.jpg', N'เชียงใหม่', 1)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (10, N'วัดบวรนิเวศวิหาร', N'วัดสำคัญในกรุงเทพฯ ที่มีทั้งประวัติศาสตร์และวัฒนธรรม ตั้งอยู่ใกล้กับพระบรมมหาราชวัง และเป็นที่ประดิษฐานของพระราชาคณะหลายองค์', N'https://upload.wikimedia.org/wikipedia/commons/1/1e/%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%AD%E0%B8%B8%E0%B9%82%E0%B8%9A%E0%B8%AA%E0%B8%96%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B8%9A%E0%B8%A7%E0%B8%A3%E0%B8%99%E0%B8%B4%E0%B9%80%E0%B8%A7%E0%B8%A8%E0%B8%A7%E0%B8%B4%E0%B8%AB%E0%B8%B2%E0%B8%A3.jpg', N'กรุงเทพมหานคร', 1)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (11, N'หาดไร่เลย์', N'หาดที่ตั้งอยู่ในเขตเมืองกระบี่ที่สามารถเข้าถึงได้โดยเรือเท่านั้น มีหน้าผาหินสูงที่เหมาะสำหรับการปีนผา และหาดทรายขาวที่เงียบสงบ เหมาะแก่การพักผ่อนและชมวิวพระอาทิตย์ตก', N'https://s359.kapook.com/r/600/auto/pagebuilder/9d8242cd-e5d3-473a-a4ce-a340f3207675.jpg', N'กระบี่', 2)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (12, N'หาดป่าตอง', N'เป็นชายหาดที่โด่งดังที่สุดของภูเก็ต มีชีวิตชีวาและกิจกรรมทางน้ำหลากหลาย เช่น การดำน้ำ, การพายเรือ และการท่องราตรี', N'https://cbtthailand.dasta.or.th/upload-file-api/Resources/RelateAttraction/Images/RAT830076/2.jpeg', N'ภูเก็ต', 2)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (13, N'หาดกะตะ', N'หาดที่เงียบสงบและสวยงาม เหมาะสำหรับการพักผ่อนและกิจกรรมทางน้ำ เช่น ดำน้ำตื้น', N'https://img.salehere.co.th/p/1200x0/2022/05/25/zxjb7ybfhojo.jpg', N'ภูเก็ต', 2)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (14, N'หาดทรายรี', N'หาดทรายขาวละเอียดที่มีน้ำใสและทะเลเงียบสงบ เหมาะแก่การพักผ่อนและดำน้ำตื้น', N'https://projects.dmcr.go.th/ckeditor/upload/files/id453/DMCR4/4_1.jpg', N'เกาะสมุย', 2)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (15, N'หาดแม่รำพึง', N'เป็นชายหาดที่สวยงามและค่อนข้างเงียบสงบ มีทะเลน้ำใสและสิ่งอำนวยความสะดวกครบครัน', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNOGYCs1Rt9ZyeLobH8h2XYau5byMfIHCnPQ&s', N'ระยอง', 2)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (16, N'หาดบางแสน', N'หาดที่อยู่ใกล้กรุงเทพฯ สามารถเดินทางได้ง่าย มีร้านอาหารและกิจกรรมทางน้ำมากมาย', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkiMa4hsAruLn5WLkARMgbmi4hciq0mp_W0w&s', N'ชลบุรี', 2)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (17, N'หาดจอมเทียน', N'หาดที่มีบรรยากาศผ่อนคลายและกิจกรรมหลากหลาย เหมาะสำหรับการเที่ยวพักผ่อนและเล่นน้ำทะเล', N'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Jomtien_Beach_1.jpg/1200px-Jomtien_Beach_1.jpg', N'ชลบุรี', 2)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (18, N'เกาะหลีเป๊ะ', N'เกาะที่มีทะเลใสและชายหาดที่สวยงาม การดำน้ำตื้นและดำน้ำลึกเป็นกิจกรรมที่ได้รับความนิยมมาก', N'https://www.mamybooking.com/blog/wp-content/uploads/2023/03/lipe5-e1586924699550.jpeg', N'สตูล', 2)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (19, N'เกาะเสม็ด', N'เป็นเกาะที่ตั้งอยู่ในจังหวัดระยองของประเทศไทย และเป็นหนึ่งในจุดหมายปลายทางยอดนิยมสำหรับการท่องเที่ยวทะเล', N'https://www.trainandtravels.com/wp-content/uploads/2021/09/overview-30-1024x683-1.jpg', N'ระยอง', 2)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (20, N'เกาะพะงัน', N'เกาะที่มีทะเลใสและหาดทรายขาว มีความเงียบสงบและเป็นที่รู้จักกันดีสำหรับงานเทศกาล Full Moon Party', N'https://s359.kapook.com/pagebuilder/49afbe66-7bf5-4a56-b762-2462b7c6bc17.jpg', N'สุราษฎร์ธานี', 2)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (21, N'ดอยอินทนนท์', N'เดินป่า, ชมพระอาทิตย์ขึ้น, ชมดอกไม้ที่บานตามฤดูกาล', N'https://image-tc.galaxy.tf/wijpeg-sxrfid5inslt46adwg0pwpho/intanon.jpg', N'เชียงใหม่', 3)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (22, N'ดอยหลวงเชียงดาว', N'เดินป่าขึ้นดอย, ชมทิวทัศน์และความงามของธรรมชาติ', N'https://s359.kapook.com/pagebuilder/64f57a9d-ff8e-4195-a497-fd65be379c5f.jpg', N'เชียงใหม่', 3)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (23, N'ดอยผาหม่น ', N'ชมทะเลหมอก, เดินป่า', N'https://s359.kapook.com/pagebuilder/d63a3b6d-0f32-4c17-b6c2-500e66743485.jpg', N'เชียงราย', 3)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (24, N'เขาหลวง', N'เดินป่า, ท่องเที่ยวธรรมชาติ', N'https://img.kapook.com/u/2017/Tanapol/travel/august/khoarung/khoarung5.jpg', N'นครราชสีมา', 3)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (25, N'เขาพระวิหาร', N'เป็นภูเขาที่มีทั้งความสวยงามและมีความสำคัญทางประวัติศาสตร์ เนื่องจากมีปราสาทหินเขาพระวิหารตั้งอยู่', N'https://mpics.mgronline.com/pics/Images/556000014702701.JPEG', N'ศรีสะเกษ', 3)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (26, N'ภูเขาหลวง', N'เป็นภูเขาที่มีความสูงประมาณ 1,300 เมตร และเป็นที่ตั้งของวัดเขาวงพระจันทร์', N'https://s359.kapook.com/pagebuilder/088a2d4c-b9f1-4ef5-bd1d-a64404d34a1a.jpg', N'สระบุรี', 3)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (27, N'ดอยภูคา', N'มีความสวยงามของธรรมชาติและหมู่บ้านในหุบเขา ที่เต็มไปด้วยทุ่งดอกไม้และวิวที่สวยงาม', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXTbHymOHeIEyOgx06qBd1fqrrfetbcY67Sg&s', N'น่าน', 3)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (28, N'ดอยตุง', N'เป็นที่ตั้งของสวนแม่ฟ้าหลวงและพระตำหนักดอยตุงที่มีทิวทัศน์สวยงาม รวมถึงธรรมชาติที่อุดมสมบูรณ์', N'https://s359.kapook.com/pagebuilder/7cf3e4ad-f696-4de1-a6c3-376eb75d265b.jpg', N'เชียงราย', 3)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (29, N'ดอยแม่ฟ้าหลวง', N'เป็นภูเขาที่สูงและมีสวนดอกไม้ที่สวยงาม เป็นจุดชมวิวที่สามารถมองเห็นทั้งทิวเขาและท้องฟ้ากว้าง', N'https://www.museumthailand.com/upload/user/1573012494_8226.jpg', N'เชียงราย', 3)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (30, N'เขาช่องลม', N'เป็นภูเขาที่มีการเดินทางสะดวกและเหมาะสำหรับการปีนเขาและชมธรรมชาติ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1XmuR-AvF959teV0newNTc40rfbHu_kwWYQ&s', N'นครนายก', 3)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (31, N'น้ำตกเอราวัณ', N'น้ำตกที่มี 7 ชั้น และสวยงามมากในช่วงฤดูฝน มีน้ำใสและธรรมชาติที่สวยงาม', N'https://upload.wikimedia.org/wikipedia/commons/4/4f/1012_-_Erawan_Waterfall%2C_2nd_floor_-_Waterfall_in_Si_Sawat.jpg', N'กาญจนบุรี', 4)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (32, N'น้ำตกทีลอซู', N'น้ำตกที่ใหญ่และสูงที่สุดในประเทศไทย ตั้งอยู่ในเขตรักษาพันธุ์สัตว์ป่าภูเขาทะเล

', N'https://s359.kapook.com/pagebuilder/7fb0976d-5275-4588-8a4e-1144b0af60e1.jpg', N'ตาก', 4)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (33, N'น้ำตกห้วยแม่ขมิ้น', N'น้ำตกที่มีลำธารน้ำไหลเย็นสบาย ตั้งอยู่ในอุทยานแห่งชาติไทรโยค', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8LTkH7YEab0qS6ZcgkChN8IT2LpgDJh22wA&s', N'กาญจนบุรี', 4)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (34, N'น้ำตกป่าหวาย', N'น้ำตกที่มีความสวยงามและยังไม่ค่อยมีคนรู้จักมากนัก เป็นที่นิยมของนักท่องเที่ยวที่ชอบความสงบ', N'https://mpics.mgronline.com/pics/Images/559000008760501.JPEG', N'เชียงใหม่', 4)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (35, N'น้ำตกมณีพฤกษ์', N'น้ำตกที่มีสายน้ำตกลงมาจากหน้าผาสูง เหมาะแก่การเยี่ยมชมในช่วงฤดูฝน

', N'https://travel.mthai.com/app/uploads/2018/09/P9090593.jpg', N'กำแพงเพชร', 4)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (36, N'น้ำตกศรีดิษฐ์', N'น้ำตกที่มีความสูงประมาณ 30 เมตร น้ำไหลลงมาจากเขาและล้อมรอบด้วยธรรมชาติ

', N'https://www.khaokho.com/images/editor/Sridit02.jpg', N'นครนายก', 4)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (37, N'น้ำตกห้วยใหญ่', N'น้ำตกที่มีความสวยงามและตั้งอยู่ในป่าธรรมชาติ ให้ความรู้สึกสงบและผ่อนคลาย

', N'https://cbtthailand.dasta.or.th/upload-file-api/Resources/RelateAttraction/Images/RAT300428/2.jpg', N'ลำปาง', 4)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (38, N'น้ำตกปางสีดา', N'น้ำตกที่ตั้งอยู่ในเขตอุทยานแห่งชาติปางสีดา มีชั้นน้ำหลายชั้น', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnG9012H06C11V6bC5DFl9tuPS2G2P8gjRjA&s', N'สระแก้ว', 4)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (39, N'น้ำตกวังสายทอง', N'น้ำตกที่มีน้ำใสสะอาด ไหลผ่านแนวหินสวยงาม ล้อมรอบด้วยป่าเขียวขจี', N'https://cbtthailand.dasta.or.th/upload-file-api/Resources/RelateAttraction/Images/RAT910172/1.jpeg', N'อุตรดิตถ์', 4)
INSERT [dbo].[Location_tb] ([LocationID], [LocationName], [Details], [Img], [Province], [TypeID]) VALUES (40, N'น้ำตกตาดเหมย', N'ตั้งอยู่ในอุทยานแห่งชาติห้วยน้ำดัง น้ำตกตาดเหมยมีน้ำตกหลายชั้นสวยงาม ล้อมรอบด้วยป่าดิบชื้นและธรรมชาติที่สดชื่น เหมาะสำหรับการเดินป่าและสัมผัสบรรยากาศธรรมชาติ', N'https://f.ptcdn.info/057/061/000/pique39r9huEkC4PaHVh-o.jpg', N'เชียงใหม่', 4)
GO
INSERT [dbo].[Type_tb] ([TypeID], [TypeName]) VALUES (1, N'วัด')
INSERT [dbo].[Type_tb] ([TypeID], [TypeName]) VALUES (2, N'ทะเล')
INSERT [dbo].[Type_tb] ([TypeID], [TypeName]) VALUES (3, N'ภูเขา')
INSERT [dbo].[Type_tb] ([TypeID], [TypeName]) VALUES (4, N'น้ำตก')
GO
SET IDENTITY_INSERT [dbo].[User_tb] ON 

INSERT [dbo].[User_tb] ([UserID], [Username], [Useremail], [Password], [Role]) VALUES (1, N'jim', N'jim@gmail.com', N'jim123', N'Admin')
INSERT [dbo].[User_tb] ([UserID], [Username], [Useremail], [Password], [Role]) VALUES (2, N'nay', N'nay@gmail.com', N'nay123', N'Admin')
INSERT [dbo].[User_tb] ([UserID], [Username], [Useremail], [Password], [Role]) VALUES (3, N'a', N'a@gmail.com', N'a123', N'User')
INSERT [dbo].[User_tb] ([UserID], [Username], [Useremail], [Password], [Role]) VALUES (4, N'b', N'b@gmail.com', N'b123', N'User')
INSERT [dbo].[User_tb] ([UserID], [Username], [Useremail], [Password], [Role]) VALUES (5, N'c', N'c@gmail.com', N'c123', N'User')
INSERT [dbo].[User_tb] ([UserID], [Username], [Useremail], [Password], [Role]) VALUES (6, N'c', N'c@gmail.com', N'c123', N'User')
INSERT [dbo].[User_tb] ([UserID], [Username], [Useremail], [Password], [Role]) VALUES (7, N'd', N'd@gmdil.com', N'd123', N'User')
INSERT [dbo].[User_tb] ([UserID], [Username], [Useremail], [Password], [Role]) VALUES (8, N'q', N'q@gmail.com', N'q123', N'User')
SET IDENTITY_INSERT [dbo].[User_tb] OFF
GO
USE [master]
GO
ALTER DATABASE [Travel] SET  READ_WRITE 
GO
