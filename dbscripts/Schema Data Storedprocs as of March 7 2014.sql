/****** Object:  Table [dbo].[Fingerprints]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fingerprints](
	[FingerprintID] [int] IDENTITY(1,1) NOT NULL,
	[Template] [int] NOT NULL,
	[Quality] [varbinary](max) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_Fingerprints] PRIMARY KEY CLUSTERED 
(
	[FingerprintID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Fingerprints] ON
INSERT [dbo].[Fingerprints] ([FingerprintID], [Template], [Quality], [DateAdded]) VALUES (1, 320213267, 0x00000044, CAST(0x0000A2E100E7E085 AS DateTime))
SET IDENTITY_INSERT [dbo].[Fingerprints] OFF
/****** Object:  Table [dbo].[Expenses]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ExpenseID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Remarks] [nvarchar](200) NULL,
	[EmployeeID] [int] NOT NULL,
	[ExpenseType] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[ExpenseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 03/07/2014 16:52:52 ******/
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
	[FingerprintID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014001, N'Megan', N'Manuel', N'Japzon', N'2', CAST(0x000081BD00000000 AS DateTime), N'09272814353', N'potchie0o8@gmail.com', 1, N'mjapz', N'$2a$10$MmBAglHSsnaMLYvJ.Jtp2uz7rp6fIgl8ykIMNUU9R1xl6KM5qRjDK', CAST(0x0000A2B500000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014002, N'Shar', N'Rosario', N'Ku', N'2', CAST(0x0000805600000000 AS DateTime), N'1234567890', N'potchie0o8@gmail.com', 1, N'sharku', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', CAST(0x0000A2BE00000000 AS DateTime), N'Employee_2014125_18223735.jpg', NULL)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014003, N'Reiner', N'Sales', N'Tupaz', N'1', CAST(0x0000810200000000 AS DateTime), N'09178910982', N'enneth.19@gmail.com', 1, N'reins', N'$2a$10$yYnh7C71FcXDAPW3tfT4hO8.0gQDW4J4OIeYvHsjmKhKWNz7MmV4y', CAST(0x0000A2D300000000 AS DateTime), N'Employee_reins_2014215_114326878.jpg', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014004, N'Aaron', N'Castillo', N'Almeda', N'1', CAST(0x0000803A00000000 AS DateTime), N'09051817438', N'aaronjohnalmeda16@yahoo.com', 2, N'aaron', N'$2a$10$f1RMqfGDg/NuVfjrMg3XguhwB6RTyTxgC1hovPpOKGvvL0n4YaRxa', CAST(0x0000A2D200000000 AS DateTime), N'Employee_aaron_2014215_1303143.jpg', 1001)
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[DTR]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DTR](
	[DTR_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[TenantID] [int] NULL,
	[EntryType] [nvarchar](3) NOT NULL,
	[Remarks] [nvarchar](200) NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DTR] PRIMARY KEY CLUSTERED 
(
	[DTR_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 03/07/2014 16:52:52 ******/
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
	[IsValid] [bit] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON
INSERT [dbo].[Contracts] ([ContractID], [TenantID], [BedSpaceID], [Period], [StartDate], [EmployeeID], [EndDate], [IsValid], [DateCreated]) VALUES (1, 7, 9, N'Annually', CAST(0x0000A2DA00000000 AS DateTime), 2014003, CAST(0x0000A44700000000 AS DateTime), 1, NULL)
INSERT [dbo].[Contracts] ([ContractID], [TenantID], [BedSpaceID], [Period], [StartDate], [EmployeeID], [EndDate], [IsValid], [DateCreated]) VALUES (2, 8, 14, N'Daily', CAST(0x0000A2DA00000000 AS DateTime), 2014003, CAST(0x0000A2DB00000000 AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Contracts] OFF
/****** Object:  Table [dbo].[Complaints]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaints](
	[ComplaintID] [int] IDENTITY(1,1) NOT NULL,
	[TenantID] [int] NULL,
	[Subject] [nvarchar](150) NULL,
	[Details] [nvarchar](300) NULL,
	[Date] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Complaints] PRIMARY KEY CLUSTERED 
(
	[ComplaintID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Complaints] ON
INSERT [dbo].[Complaints] ([ComplaintID], [TenantID], [Subject], [Details], [Date], [Status]) VALUES (1, 4, N'test', N'Vestibulum mollis risus quis enim rutrum, sed faucibus ligula rhoncus. 
Etiam aliquam odio eget velit commodo adipiscing. Cras sodales quam in 
lacus molestie dictum. Suspendisse tellus metus, porta quis vehicula a, 
consequat at nunc. Maecenas imperdiet tellus arcu, nec semper sem dictum
 ut.', CAST(0x0000A2E100C62F40 AS DateTime), 1)
INSERT [dbo].[Complaints] ([ComplaintID], [TenantID], [Subject], [Details], [Date], [Status]) VALUES (2, 4, N'maingay', N'maingay na katabing room', CAST(0x0000A2E101099CE6 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Complaints] OFF
/****** Object:  Table [dbo].[Bills]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[TenantID] [int] NULL,
	[DateGenerated] [datetime] NULL,
	[TotalAmount] [money] NULL,
	[EmployeeID] [int] NULL,
	[ReceiptID] [int] NULL,
	[IsPaid] [bit] NULL,
	[IsFinalized] [bit] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bills] ON
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (1, 4, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (2, 7, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (3, 7, CAST(0x0000A2E700EF1FC5 AS DateTime), 5000.0000, NULL, NULL, 0, 1)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (4, 6, NULL, NULL, 2014003, NULL, NULL, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (5, 5, NULL, NULL, 2014003, NULL, NULL, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (6, 8, CAST(0x0000A2E700F0DEAD AS DateTime), 700.0000, 2014003, NULL, 0, 1)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (7, 8, NULL, NULL, 2014003, NULL, NULL, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (9, 8, NULL, NULL, 2014003, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Bills] OFF
/****** Object:  Table [dbo].[Bill_Items]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Items](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[BillID] [int] NULL,
	[Particular] [nvarchar](100) NULL,
	[Amount] [money] NULL,
 CONSTRAINT [PK_BillI_Items] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill_Items] ON
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (1, 3, N'RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (2, 6, N'RENT FEE', 700.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (4, 8, N'RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (5, 9, N'RENT FEE', 700.0000)
SET IDENTITY_INSERT [dbo].[Bill_Items] OFF
/****** Object:  Table [dbo].[BedSpaces]    Script Date: 03/07/2014 16:52:52 ******/
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
/****** Object:  Table [dbo].[AuditTrail]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditTrail](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[TenantID] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[Action] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AuditTrail] PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 03/07/2014 16:52:52 ******/
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
INSERT [dbo].[Assets] ([AssetID], [TenantID], [AssetType], [ModelName], [BrandName], [SerialNo], [Amount], [IsIn]) VALUES (2, 7, N'Laptop', N'Compaq', N'HP', N'XXX!111222', 500.0000, NULL)
SET IDENTITY_INSERT [dbo].[Assets] OFF
/****** Object:  Table [dbo].[Announcement]    Script Date: 03/07/2014 16:52:52 ******/
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
/****** Object:  Table [dbo].[Violations]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Violations](
	[ViolationID] [int] IDENTITY(1,1) NOT NULL,
	[TenantID] [int] NULL,
	[EmployeeID] [int] NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Fine] [money] NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK_Violations] PRIMARY KEY CLUSTERED 
(
	[ViolationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Violations] ON
INSERT [dbo].[Violations] ([ViolationID], [TenantID], [EmployeeID], [Title], [Description], [Fine], [DateTime]) VALUES (1, 4, 2014002, N'Test', N'Test test test Violation', 100.0000, CAST(0x0000A2D700EDB3AC AS DateTime))
INSERT [dbo].[Violations] ([ViolationID], [TenantID], [EmployeeID], [Title], [Description], [Fine], [DateTime]) VALUES (2, 7, 2014003, N'Test Violation with Fine', N'Forgot to flush toilet. Test', 500.0000, CAST(0x0000A2E700E1DF4D AS DateTime))
SET IDENTITY_INSERT [dbo].[Violations] OFF
/****** Object:  Table [dbo].[UnitType]    Script Date: 03/07/2014 16:52:52 ******/
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
INSERT [dbo].[UnitType] ([UnitTypeID], [UnitTypeName], [DailyRate], [MonthlyRate], [YearlyRate], [Gender]) VALUES (1, N'DoubleDeck', 700.0000, 6000.0000, 5000.0000, N'1')
INSERT [dbo].[UnitType] ([UnitTypeID], [UnitTypeName], [DailyRate], [MonthlyRate], [YearlyRate], [Gender]) VALUES (2, N'DoubleDeck', 700.0000, 6000.0000, 5000.0000, N'2')
INSERT [dbo].[UnitType] ([UnitTypeID], [UnitTypeName], [DailyRate], [MonthlyRate], [YearlyRate], [Gender]) VALUES (3, N'Singles', 800.0000, 7000.0000, 6000.0000, N'1')
INSERT [dbo].[UnitType] ([UnitTypeID], [UnitTypeName], [DailyRate], [MonthlyRate], [YearlyRate], [Gender]) VALUES (4, N'Singles', 800.0000, 7000.0000, 6000.0000, N'2')
/****** Object:  Table [dbo].[TGLink]    Script Date: 03/07/2014 16:52:52 ******/
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
/****** Object:  Table [dbo].[Tenants]    Script Date: 03/07/2014 16:52:52 ******/
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
	[CurfewTime] [nvarchar](10) NULL,
 CONSTRAINT [PK_Tenants] PRIMARY KEY CLUSTERED 
(
	[TenantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tenants] ON
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (1, N'Megan', N'Manuel', N'Japzon', N'2', N'potchie0o8@gmail.com', CAST(0x0000814700000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09272814353', N'mjapz', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BA002D0768 AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (2, N'Megan', N'Manuel', N'Japzon', N'2', N'potchie0o8@gmail.com', CAST(0x000081BD00000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09272814353', N'mjapzon', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BD00FEE8F9 AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (3, N'Megan', N'Manuel', N'Japzon', N'2', N'potchie0o8@gmail.com', CAST(0x000081BD00000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09272814353', N'mjapzon1', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BD01083399 AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (4, N'Babylyn', N'Rivero', N'Tan', N'2', N'babylyntan05@gmail.com', CAST(0x00007FD300000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09064408499', N'baby05', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BD0120A8F2 AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (5, N'Calvin', N'Q', N'Siu', N'1', N'calsiugay@yahoo.com', CAST(0x0000844100000000 AS DateTime), N'Ewan', N'Lucena', N'Region VI', N'Philippines', N'09051817438', N'calvinsiu', N'$2a$10$66x4z48PXic88Jrrppb7le3RBCDqtRFDpY4a.2Dde39I4tMVbZHP.', NULL, CAST(0x0000A2D900C2A0DB AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (6, N'Amiel', N'D', N'Valecina', N'1', N'calsiugay@yahoo.com', CAST(0x00008BC500000000 AS DateTime), N'Ewan', N'Laguna', N'Region VI', N'Philippines', N'09051817438', N'amiel', N'$2a$10$0V9HQUsdKSpxABXNcKZjqek9clFnWxEX9pgrjRjn2mNHSL6VTVU3.', NULL, CAST(0x0000A2D900FF0139 AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (7, N'Cyrus', N'Bondoc', N'Macaspac', N'1', N'cymacaspac@yahoo.com', CAST(0x0000837600000000 AS DateTime), N'Mekeni St., Longganisa Subdivision', N'Pampanga', N'Region III', N'Philippines', N'09051817438', N'cymacaspac', N'$2a$10$2xkTZltogH9QVry9XrDIYObCgLM83QUnHTA9I3zB.xyp.gA7hLo4i', NULL, CAST(0x0000A2DA00EC25D9 AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (8, N'Juan', N'Macasoac', N'Dela Cruz', N'1', N'calsiugay@yahoo.com', CAST(0x0000837500000000 AS DateTime), N'Ewan', N'Laguna', N'Region VI', N'Philippines', N'09051817438', N'juandelacruz', N'$2a$10$nDfFFUxvKPdFyvByZ.7f0.HMqNeDZ29nEE2ym/kxIL1DLvRc489VG', NULL, CAST(0x0000A2DA01079117 AS DateTime), NULL, N'23:00')
SET IDENTITY_INSERT [dbo].[Tenants] OFF
/****** Object:  Table [dbo].[ServiceRequest]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequest](
	[ServiceRequestID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[TenantID] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[Details] [nvarchar](200) NULL,
	[Remarks] [nvarchar](20) NULL,
	[Priority] [nvarchar](20) NULL,
	[DateRequested] [datetime] NULL,
	[DateCompleted] [datetime] NULL,
 CONSTRAINT [PK_ServiceRequest] PRIMARY KEY CLUSTERED 
(
	[ServiceRequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ServiceRequest] ON
INSERT [dbo].[ServiceRequest] ([ServiceRequestID], [EmployeeID], [TenantID], [Title], [Details], [Remarks], [Priority], [DateRequested], [DateCompleted]) VALUES (1, 2014001, 4, N'Test', N'asdfgh jahdfja as sadasafaf', N'Pending', N'Average', CAST(0x0000A2D601815E37 AS DateTime), CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[ServiceRequest] ([ServiceRequestID], [EmployeeID], [TenantID], [Title], [Details], [Remarks], [Priority], [DateRequested], [DateCompleted]) VALUES (2, 2014001, 4, N'Laundry', N'Pick up my laundry at 8a.m.', N'Pending', N'Average', CAST(0x0000A2E1010418AF AS DateTime), CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[ServiceRequest] ([ServiceRequestID], [EmployeeID], [TenantID], [Title], [Details], [Remarks], [Priority], [DateRequested], [DateCompleted]) VALUES (3, 2014001, 4, N'Clean Room', N'Please clean my room Friday 4p.m.', N'Pending', N'Average', CAST(0x0000A2E101049890 AS DateTime), CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[ServiceRequest] ([ServiceRequestID], [EmployeeID], [TenantID], [Title], [Details], [Remarks], [Priority], [DateRequested], [DateCompleted]) VALUES (4, 2014001, 4, N'Repair Aircondition', N'Please repair our air condition asap.', N'Pending', N'Average', CAST(0x0000A2E10106238E AS DateTime), CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[ServiceRequest] ([ServiceRequestID], [EmployeeID], [TenantID], [Title], [Details], [Remarks], [Priority], [DateRequested], [DateCompleted]) VALUES (5, NULL, 4, N'Laundry', N'Pick up laundry 4pm', N'Pending', N'Average', CAST(0x0000A2E1010A0E78 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ServiceRequest] OFF
/****** Object:  Table [dbo].[Rooms]    Script Date: 03/07/2014 16:52:52 ******/
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
/****** Object:  Table [dbo].[Receipts]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipts](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Remarks] [nvarchar](200) NULL,
	[Amount] [money] NULL,
 CONSTRAINT [PK_Receipts] PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 03/07/2014 16:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[TenantID] [int] NULL,
	[Subject] [nvarchar](150) NULL,
	[Message] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
	[IsRead] [int] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Messages] ON
INSERT [dbo].[Messages] ([MessageID], [EmployeeID], [TenantID], [Subject], [Message], [Date], [IsRead]) VALUES (1, 2014002, 4, N'test', N'&lt;a style="text-decoration: none; border-bottom: medium dotted;" target="scSearchLink" href="http://www.surfcanyon.com/search?q=Lorem%20ipsum&f=slc&p=wtiffrwo"&gt;Lorem ipsum dolor
 sit amet, consectetur adipiscing elit. Donec aliquam luctus leo, et 
tincidunt ipsum congue ut. Aenean feugiat dolor nec risus ultricies, nec
 laoreet erat consectetur. Integer hendrerit magna sit amet erat 
consectetur tristique. Proin sodales ullamcorper sem id tempus.
 Suspendisse ac dui a enim suscipit tristique eu eget turpis. In posuere
 ultricies mi ac rutrum. Curabitur viverra ac nibh ut suscipit. 
Phasellus porta consectetur 
quam, non adipiscing nisi scelerisque quis. Ut sem urna, aliquet vel 
condimentum sit amet, auctor vitae lectus. Fusce et tempus dui. Morbi 
fringilla nisl non augue tempus condimentum. Maecenas semper sed ligula 
in lobortis. Ut posuere sapien eget nisl viverra accumsan. Ut mollis 
sapien libero, ornare sagittis sapien malesuada vitae. Suspendisse 
potenti.', CAST(0x0000A2D901016F09 AS DateTime), NULL)
INSERT [dbo].[Messages] ([MessageID], [EmployeeID], [TenantID], [Subject], [Message], [Date], [IsRead]) VALUES (2, 2014002, 4, N'test2', N'Mauris et purus viverra, pharetra lacus ac, scelerisque quam. Interdum et malesuada fames ac ante ipsum primis in faucibus', CAST(0x0000A2E100D58DFE AS DateTime), NULL)
INSERT [dbo].[Messages] ([MessageID], [EmployeeID], [TenantID], [Subject], [Message], [Date], [IsRead]) VALUES (3, 2014002, 4, N'test3', N'Sed tincidunt nisi eget neque condimentum, ac elementum lacus posuere. Aliquam quis rhoncus justo, ac pulvinar urna.', CAST(0x0000A2E100D67B68 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Messages] OFF
/****** Object:  Table [dbo].[Guardians]    Script Date: 03/07/2014 16:52:52 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTenantList]    Script Date: 03/07/2014 16:53:03 ******/
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
/****** Object:  StoredProcedure [dbo].[GetContract]    Script Date: 03/07/2014 16:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetContract]

@CID int

AS

BEGIN

SELECT Contracts.ContractID, Contracts.TenantID, Tenants.LName, Tenants.FName, Tenants.MName, Tenants.Gender, 
Rooms.RoomNo, UnitType.UnitTypeName, BedSpaces.BedSide, Employees.FName, Employees.MName, Employees.LName, Contracts.StartDate, 
Contracts.EndDate, Contracts.Period, Contracts.IsValid, UnitType.DailyRate, UnitType.MonthlyRate, UnitType.YearlyRate, Contracts.DateCreated,
Tenants.Street + ', ' + Tenants.City + ', ' + Tenants.Region + ', ' + Tenants.Country AS 'Address' 
FROM UnitType INNER JOIN Rooms 
ON UnitType.UnitTypeID = Rooms.UnitTypeID INNER JOIN BedSpaces 
ON Rooms.RoomID = BedSpaces.RoomID INNER JOIN Contracts INNER JOIN Tenants 
ON Contracts.TenantID = Tenants.TenantID INNER JOIN Employees 
ON Contracts.EmployeeID = Employees.EmployeeID ON BedSpaces.BedSpaceID = Contracts.BedSpaceID

WHERE ContractID=@CID

END
GO
/****** Object:  StoredProcedure [dbo].[RetrieveBill]    Script Date: 03/07/2014 16:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RetrieveBill]

@BID int

AS

BEGIN



SELECT Tenants.LName + ' , ' + Tenants.FName + ' ' + Tenants.MName AS 'BillTo', Tenants.TenantID, Employees.FName + ' ' +  Employees.LName AS 'GenBy', Bill_Items.Amount, Bill_Items.Particular, Bills.TotalAmount, Bills.DateGenerated
 FROM Bills, Tenants, Bill_Items, Employees  WHERE (Bills.IsFinalized=1) 
 
 AND Bills.TenantID=Tenants.TenantID
 AND Bills.BillID=Bill_Items.BillID
 AND Bills.EmployeeID=Employees.EmployeeID
AND Bills.BillID=@BID

END
GO
/****** Object:  Default [DF_Announcement_DateCreated]    Script Date: 03/07/2014 16:52:52 ******/
ALTER TABLE [dbo].[Announcement] ADD  CONSTRAINT [DF_Announcement_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_AuditTrail_DateCreated]    Script Date: 03/07/2014 16:52:52 ******/
ALTER TABLE [dbo].[AuditTrail] ADD  CONSTRAINT [DF_AuditTrail_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Complaints_Date]    Script Date: 03/07/2014 16:52:52 ******/
ALTER TABLE [dbo].[Complaints] ADD  CONSTRAINT [DF_Complaints_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_DTR_DateTime]    Script Date: 03/07/2014 16:52:52 ******/
ALTER TABLE [dbo].[DTR] ADD  CONSTRAINT [DF_DTR_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
/****** Object:  Default [DF_Fingerprints_DateAdded]    Script Date: 03/07/2014 16:52:52 ******/
ALTER TABLE [dbo].[Fingerprints] ADD  CONSTRAINT [DF_Fingerprints_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
/****** Object:  Default [DF_Messages_Date]    Script Date: 03/07/2014 16:52:52 ******/
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_Receipts_Date]    Script Date: 03/07/2014 16:52:52 ******/
ALTER TABLE [dbo].[Receipts] ADD  CONSTRAINT [DF_Receipts_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_ServiceRequest_DateRequested]    Script Date: 03/07/2014 16:52:52 ******/
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_DateRequested]  DEFAULT (getdate()) FOR [DateRequested]
GO
/****** Object:  Default [DF_Tenants_DateRegistered]    Script Date: 03/07/2014 16:52:52 ******/
ALTER TABLE [dbo].[Tenants] ADD  CONSTRAINT [DF_Tenants_DateRegistered]  DEFAULT (getdate()) FOR [DateRegistered]
GO
/****** Object:  Default [DF_Table_1_Date]    Script Date: 03/07/2014 16:52:52 ******/
ALTER TABLE [dbo].[Violations] ADD  CONSTRAINT [DF_Table_1_Date]  DEFAULT (getdate()) FOR [DateTime]
GO
