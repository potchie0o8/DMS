/****** Object:  Table [dbo].[Employees]    Script Date: 02/22/2014 09:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(2014001,1) NOT NULL,
	[FName] [nvarchar](200) NOT NULL,
	[MName] [nvarchar](200) NOT NULL,
	[LName] [nvarchar](200) NOT NULL,
	[Gender] [nvarchar](1) NOT NULL,
	[BDate] [datetime] NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[AdminLevel] [int] NOT NULL,
	[UN] [nvarchar](150) NOT NULL,
	[Pwd] [nvarchar](60) NOT NULL,
	[DateOfEmployment] [datetime] NOT NULL,
	[PhotoFile] [nvarchar](150) NULL,
	[FingerprintID] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014001, N'Megan', N'Manuel', N'Japzon', N'2', CAST(0x000081BD00000000 AS DateTime), N'09272814353', N'potchie0o8@gmail.com', 1, N'mjapz', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', CAST(0x0000A2B500000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014002, N'Shar', N'Rosario', N'Ku', N'2', CAST(0x0000805600000000 AS DateTime), N'1234567890', N'potchie0o8@gmail.com', 1, N'sharku', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', CAST(0x0000A2BE00000000 AS DateTime), N'Employee_2014125_18223735.jpg', NULL)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014003, N'Reiner', N'Sales', N'Tupaz', N'1', CAST(0x0000810200000000 AS DateTime), N'09178910982', N'reiner.tupaz@istaphil.com', 1, N'reins', N'$2a$10$6CQvEsIHu4/eVwu/dVgnh.XcOkPzvNOwhthbNSMdYoMe2wwE9ac52', CAST(0x0000A2D300000000 AS DateTime), N'Employee_reins_2014215_114326878.jpg', NULL)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014004, N'Aaron', N'Castillo', N'Almeda', N'1', CAST(0x0000803A00000000 AS DateTime), N'09051817438', N'aaronjohnalmeda16@yahoo.com', 2, N'aaron', N'$2a$10$f1RMqfGDg/NuVfjrMg3XguhwB6RTyTxgC1hovPpOKGvvL0n4YaRxa', CAST(0x0000A2D200000000 AS DateTime), N'Employee_aaron_2014215_1303143.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[Contracts]    Script Date: 02/22/2014 09:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[TenantID] [int] NULL,
	[BedSpaceID] [int] NULL,
	[Period] [nvarchar](20) NULL,
	[StartDate] [datetime] NULL,
	[EmployeeID] [int] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BedSpaces]    Script Date: 02/22/2014 09:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BedSpaces](
	[BedSpaceID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NULL,
	[BedSide] [nvarchar](1) NULL,
 CONSTRAINT [PK_BedSpaces] PRIMARY KEY CLUSTERED 
(
	[BedSpaceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BedSpaces] ON
INSERT [dbo].[BedSpaces] ([BedSpaceID], [RoomID], [BedSide]) VALUES (9, 3, N'1')
INSERT [dbo].[BedSpaces] ([BedSpaceID], [RoomID], [BedSide]) VALUES (10, 3, N'2')
INSERT [dbo].[BedSpaces] ([BedSpaceID], [RoomID], [BedSide]) VALUES (11, 4, N'1')
INSERT [dbo].[BedSpaces] ([BedSpaceID], [RoomID], [BedSide]) VALUES (12, 4, N'2')
INSERT [dbo].[BedSpaces] ([BedSpaceID], [RoomID], [BedSide]) VALUES (13, 5, N'1')
INSERT [dbo].[BedSpaces] ([BedSpaceID], [RoomID], [BedSide]) VALUES (14, 5, N'2')
INSERT [dbo].[BedSpaces] ([BedSpaceID], [RoomID], [BedSide]) VALUES (15, 7, N'1')
INSERT [dbo].[BedSpaces] ([BedSpaceID], [RoomID], [BedSide]) VALUES (16, 7, N'2')
SET IDENTITY_INSERT [dbo].[BedSpaces] OFF
/****** Object:  Table [dbo].[Assets]    Script Date: 02/22/2014 09:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assets](
	[AssetID] [int] IDENTITY(1,1) NOT NULL,
	[TenantID] [int] NOT NULL,
	[AssetType] [nvarchar](20) NOT NULL,
	[ModelName] [nvarchar](100) NOT NULL,
	[BrandName] [nvarchar](100) NOT NULL,
	[SerialNo] [nvarchar](200) NOT NULL,
	[Amount] [money] NOT NULL,
	[IsIn] [bit] NULL,
 CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assets] ON
INSERT [dbo].[Assets] ([AssetID], [TenantID], [AssetType], [ModelName], [BrandName], [SerialNo], [Amount], [IsIn]) VALUES (1, 1, N'Laptop', N'Vaio', N'Sony', N'1234567811234', 500.0000, NULL)
SET IDENTITY_INSERT [dbo].[Assets] OFF
/****** Object:  Table [dbo].[Announcement]    Script Date: 02/22/2014 09:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[AnnouncementID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](250) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[AnnouncementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Announcement] ON
INSERT [dbo].[Announcement] ([AnnouncementID], [Subject], [Message], [DateCreated], [EmployeeID]) VALUES (1, N'Hello', N'Test normal &lt;b&gt;bold&lt;/b&gt;&lt;i&gt;&lt;b&gt; &lt;/b&gt;italic&lt;/i&gt;&lt;font color=&quot;&amp;#x23;0000FF&quot;&gt; colored&lt;/font&gt; &lt;strike&gt;crossed out&lt;/strike&gt; &lt;u&gt;underlined&lt;/u&gt;.', CAST(0x0000A2D300C3CB8E AS DateTime), 2014003)
SET IDENTITY_INSERT [dbo].[Announcement] OFF
/****** Object:  Table [dbo].[UnitType]    Script Date: 02/22/2014 09:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitType](
	[UnitTypeID] [int] NOT NULL,
	[UnitTypeName] [nvarchar](40) NULL,
	[DailyRate] [money] NULL,
	[MonthlyRate] [money] NULL,
	[YearlyRate] [money] NULL,
	[Gender] [nvarchar](1) NULL,
 CONSTRAINT [PK_UnitType] PRIMARY KEY CLUSTERED 
(
	[UnitTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UnitType] ([UnitTypeID], [UnitTypeName], [DailyRate], [MonthlyRate], [YearlyRate], [Gender]) VALUES (1, N'DoubleDeck', 200.0000, 6000.0000, 50000.0000, N'1')
INSERT [dbo].[UnitType] ([UnitTypeID], [UnitTypeName], [DailyRate], [MonthlyRate], [YearlyRate], [Gender]) VALUES (2, N'DoubleDeck', 200.0000, 6000.0000, 50000.0000, N'2')
INSERT [dbo].[UnitType] ([UnitTypeID], [UnitTypeName], [DailyRate], [MonthlyRate], [YearlyRate], [Gender]) VALUES (3, N'Singles', 300.0000, 8000.0000, 60000.0000, N'1')
INSERT [dbo].[UnitType] ([UnitTypeID], [UnitTypeName], [DailyRate], [MonthlyRate], [YearlyRate], [Gender]) VALUES (4, N'Singles', 300.0000, 8000.0000, 60000.0000, N'2')
/****** Object:  Table [dbo].[TGLink]    Script Date: 02/22/2014 09:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TGLink](
	[TGID] [int] IDENTITY(1,1) NOT NULL,
	[TenantID] [int] NULL,
	[GuardianID] [int] NULL,
	[Relation] [nvarchar](20) NULL,
 CONSTRAINT [PK_TGLink] PRIMARY KEY CLUSTERED 
(
	[TGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 02/22/2014 09:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants](
	[TenantID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](200) NOT NULL,
	[MName] [nvarchar](200) NOT NULL,
	[LName] [nvarchar](200) NOT NULL,
	[Gender] [nvarchar](1) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[BDate] [datetime] NOT NULL,
	[Street] [nvarchar](200) NOT NULL,
	[City] [nvarchar](200) NOT NULL,
	[Region] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[MobileNo] [nvarchar](20) NOT NULL,
	[UN] [nvarchar](150) NOT NULL,
	[Pwd] [nvarchar](60) NOT NULL,
	[PhotoFile] [nvarchar](150) NULL,
	[DateRegistered] [datetime] NOT NULL,
	[FingerprintID] [int] NULL,
 CONSTRAINT [PK_Tenants] PRIMARY KEY CLUSTERED 
(
	[TenantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tenants] ON
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID]) VALUES (1, N'Megan', N'Manuel', N'Japzon', N'2', N'potchie0o8@gmail.com', CAST(0x0000814700000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09272814353', N'mjapz', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BA002D0768 AS DateTime), NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID]) VALUES (2, N'Megan', N'Manuel', N'Japzon', N'2', N'potchie0o8@gmail.com', CAST(0x000081BD00000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09272814353', N'mjapzon', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BD00FEE8F9 AS DateTime), NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID]) VALUES (3, N'Megan', N'Manuel', N'Japzon', N'2', N'potchie0o8@gmail.com', CAST(0x000081BD00000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09272814353', N'mjapzon1', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BD01083399 AS DateTime), NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID]) VALUES (4, N'Babylyn', N'Rivero', N'Tan', N'2', N'babylyntan05@gmail.com', CAST(0x00007FD300000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09064408499', N'baby05', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BD0120A8F2 AS DateTime), NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID]) VALUES (5, N'Calvin', N'Q', N'Siu', N'1', N'calsiugay@yahoo.com', CAST(0x0000844100000000 AS DateTime), N'Ewan', N'Lucena', N'Region VI', N'Philippines', N'09051817438', N'calvinsiu', N'$2a$10$66x4z48PXic88Jrrppb7le3RBCDqtRFDpY4a.2Dde39I4tMVbZHP.', NULL, CAST(0x0000A2D900C2A0DB AS DateTime), NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID]) VALUES (6, N'Amiel', N'D', N'Valecina', N'1', N'calsiugay@yahoo.com', CAST(0x00008BC500000000 AS DateTime), N'Ewan', N'Laguna', N'Region VI', N'Philippines', N'09051817438', N'amiel', N'$2a$10$0V9HQUsdKSpxABXNcKZjqek9clFnWxEX9pgrjRjn2mNHSL6VTVU3.', NULL, CAST(0x0000A2D900FF0139 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Tenants] OFF
/****** Object:  Table [dbo].[Rooms]    Script Date: 02/22/2014 09:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [nvarchar](20) NULL,
	[UnitTypeID] [int] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON
INSERT [dbo].[Rooms] ([RoomID], [RoomNo], [UnitTypeID]) VALUES (3, N'706E', 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomNo], [UnitTypeID]) VALUES (4, N'706A', 3)
INSERT [dbo].[Rooms] ([RoomID], [RoomNo], [UnitTypeID]) VALUES (5, N'709A', 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomNo], [UnitTypeID]) VALUES (6, N'', 0)
INSERT [dbo].[Rooms] ([RoomID], [RoomNo], [UnitTypeID]) VALUES (7, N'801A', 2)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
/****** Object:  Table [dbo].[Guardians]    Script Date: 02/22/2014 09:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guardians](
	[GuardianID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](200) NULL,
	[MName] [nvarchar](200) NULL,
	[LName] [nvarchar](200) NULL,
	[Gender] [nvarchar](1) NULL,
	[BDate] [datetime] NULL,
	[ContactNo] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
	[Address] [nvarchar](200) NULL,
	[UN] [nvarchar](150) NULL,
	[Pwd] [nvarchar](60) NULL,
 CONSTRAINT [PK_Guardians] PRIMARY KEY CLUSTERED 
(
	[GuardianID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetTenantList]    Script Date: 02/22/2014 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE PROC [dbo].[GetTenantList]

AS

BEGIN

SELECT TenantID, FName, MName, LName,CASE WHEN Gender=1 THEN 'Male' ELSE 'Female' END AS 'Gender', Email, BDate, Street, City, Region, Country, MobileNo, UN, DateRegistered FROM Tenants

ORDER BY LName DESC

END
GO
/****** Object:  Default [DF_Announcement_DateCreated]    Script Date: 02/22/2014 09:36:00 ******/
ALTER TABLE [dbo].[Announcement] ADD  CONSTRAINT [DF_Announcement_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Tenants_DateRegistered]    Script Date: 02/22/2014 09:36:00 ******/
ALTER TABLE [dbo].[Tenants] ADD  CONSTRAINT [DF_Tenants_DateRegistered]  DEFAULT (getdate()) FOR [DateRegistered]
GO
