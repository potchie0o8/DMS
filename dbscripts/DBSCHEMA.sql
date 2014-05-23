/****** Object:  Table [dbo].[Fingerprints]    Script Date: 03/19/2014 14:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fingerprints](
	[FingerprintID] [int] IDENTITY(1,1) NOT NULL,
	[Template] [varbinary](max) NOT NULL,
	[Quality] [int] NOT NULL,
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
INSERT [dbo].[Fingerprints] ([FingerprintID], [Template], [Quality], [DateAdded]) VALUES (10, 0xA7FF011DC300A700027200B6009F00012B01CC004401015C01D900390101AC008A003A01013F019A003001018F00ED00AA00011C01F2009700011E01CA00B900022501C6009100027700C4000501024701B800F4000184007D00B900017900ED00450101B400CE002901016101DF008F00027400C6004B0101A50073004E010144019800DD00017900E9001C0101060007011B0101CB00ED00FD0001C400AF00530101560195007A00019300A1005A00019B001701A90001120102016700017900DB00CC00021A01D400EE0001A000A8001002000102030800030E04050607070F01090A0B00090D031610090F1B081003020E0A1C0B1C151C060F11040E1313141315080116020D02031317181C1B100E0E0A000F08061B060B12100D14150809190716050D130A150D0E060006191B00010F0709130A1604120C0609080F11050D140213160301170007071A131C0807151B160E050E10050F1A0B1B150B1C080E15091702050314030A06010E0B1B011B0710130E140A120E1C050A161101070A1B1B0F10040B08190F12081C12130B1B090C010315020A0017160D030509180204050B0C17141C1200191A1B191201121B040E061A140A0C00021401180D15091A0F170C08040A08190403051308170F180512111015060B0C0C09190900181900040B0B010D05051C141B001A11020B061519011A04121C191B0C07171A18110E121707180C181103110A141911121612050C13190508040C110C0401160C, 69, CAST(0x0000A2F0012B5319 AS DateTime))
INSERT [dbo].[Fingerprints] ([FingerprintID], [Template], [Quality], [DateAdded]) VALUES (11, 0xA7FF0117D2008E000215011401C000020601AA007100026D00B4006600022201C400D100019400C500BD00022601DC004100011D01D600E50001BA00C200AA00021E01E0000B0101BB00E600E8000125009E00F1000185008900D200022D018B00C70002760097001F01018B002501F20001F1004600E500016E0028010301013800C900AF00021401B0008600021F01AB006401029E0011015E0101C80078004401018D00830012080C0D051202030A07110F050804051302070413030800120004120013090A0B0C0408090708130A0407050B0D0E0B1213160E0002050000030B040F0103060A0507120B07040D05130D050C0414160A010D08070808020C0509040A120F0A0B050D120400120208030206100C0C081101110A090B140E070109110C120B0A090F100D0D130E0912030112041300060E0C070C01050F070502070D040113060100090501080E07110705030E0D0B100E040D02160B09010D00151115090E1014150C020F0414090D0316100806150F0F0512061104160C140B16091105150A160D0506100401031005140716071507150E140A100801061013140410021516141109101410, 69, CAST(0x0000A2F0012B9D5D AS DateTime))
INSERT [dbo].[Fingerprints] ([FingerprintID], [Template], [Quality], [DateAdded]) VALUES (12, 0xA7FF011DBF00E700020B00B700DD000201008300130101A4008E000A01015E01AE00CF00024B01EE00EA00012E00DE00E00001DC00EB00D200023900E700520101DE0086003D0101AA007F00F300014C018E00E400019300EA002F0101E500D6002101012300B3001501010A00C80008010218000E019700014B00A2003E0101070063002B01014D01AF00F600010000EE009A00014A000F010F01023E00F2000C01013000E3003801012A00D50043010227007E001F0102A000C0004401021A0084001B010255017A003A0001F800A200191B1B02170C19020001020301041817050606071B031A180A0B1300081805070C0D0E0F19031301170D0817030A110900040D0F180C151612191A110E1309190F13020A000614100F00180D091B1605080C0D160C160D0E1A17121B130B0B04030B06010E030313091213041B0A12021A0D081A09020B01160F190A110E1716111B0F060F011A0C1B0E05000F051119130A1606020B0E020E001A0E000B00070C151505181106041306080D09030C0F010711021203190E170F07141B0B11030E0105011B13180E1A091607030F0D13170E0A041715110D0D050D15090E180F0A0107040E0B03011A0F120A0F040F070E16111215060C05050407100816150F1507061408111A1B081518090B060514120B0414120E06100114051000140809041013140010011015100B141514141C041C0B1C011C101C0A1C001C071C031C021C121C, 45, CAST(0x0000A2F00143355A AS DateTime))
INSERT [dbo].[Fingerprints] ([FingerprintID], [Template], [Quality], [DateAdded]) VALUES (13, 0xA7FF0118E4000901010600E900000102BF00EB00A500026701F300CF00011700F600BD00021400A2000001024D01A000BB00013701FA003C0102170010013801022200DF003F0101BA00E80024010209007800F600028A001601E800012700A700D800024001D800A500013E01F4009F00020000BB00A400022801C000230101A200E5005A00023E002B0146010125001E01420102D9004301C40001330090008B00011D011C016C0002F50082000001020F131414080304020E070804020A000907090A0E100E0F070A040F13080D0606100A011407040E050D0A1109110C030302050B1100080A11050210030F090813071016030E01030616010C090011010C0407000D100B0D100F17120C15000C0003060E140A0701071114090800090104100F1700050104080105060D0E0F12010503100B0602120217130A0E120A0C13090E160D03010D1504000D0602110D0A050C020D16080C031514000C0F0D040811110B030614011012150F090504170E17140C0C0E010E15021300050302161517130C1301161204120F160B10031701150803000B0B16150E10170C0D010B031206120A0B090B081513150D1215121304, 54, CAST(0x0000A2F0015EF45E AS DateTime))
SET IDENTITY_INSERT [dbo].[Fingerprints] OFF
/****** Object:  Table [dbo].[Expenses]    Script Date: 03/19/2014 14:28:49 ******/
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
	[Amount] [money] NOT NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[ExpenseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Expenses] ON
INSERT [dbo].[Expenses] ([ExpenseID], [Date], [Remarks], [EmployeeID], [ExpenseType], [Amount]) VALUES (3, CAST(0x0000A2F300E7813D AS DateTime), N'Zonrox', 2014003, N'Others', 200.0000)
SET IDENTITY_INSERT [dbo].[Expenses] OFF
/****** Object:  Table [dbo].[Employees]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014001, N'Megan', N'Manuel', N'Japzon', N'2', CAST(0x000081BD00000000 AS DateTime), N'09272814353', N'potchie0o8@gmail.com', 1, N'mjapz', N'$2a$10$MmBAglHSsnaMLYvJ.Jtp2uz7rp6fIgl8ykIMNUU9R1xl6KM5qRjDK', CAST(0x0000A2B500000000 AS DateTime), N'', 8)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014002, N'Shar', N'Rosario', N'Ku', N'2', CAST(0x0000805600000000 AS DateTime), N'1234567890', N'potchie0o8@gmail.com', 1, N'sharku', N'$2a$10$zqZ2uNsbYFa8OoA3gtz4o.99r9F/7EcWcXMRupb2YzZ89ZS92dIIu', CAST(0x0000A2BE00000000 AS DateTime), N'Employee_2014125_18223735.jpg', 1)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014003, N'Reiner', N'Sales', N'Tupaz', N'1', CAST(0x0000810200000000 AS DateTime), N'09178910982', N'enneth.19@gmail.com', 1, N'reins', N'$2a$10$yYnh7C71FcXDAPW3tfT4hO8.0gQDW4J4OIeYvHsjmKhKWNz7MmV4y', CAST(0x0000A2D300000000 AS DateTime), N'Employee_reins_2014215_114326878.jpg', 10)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014004, N'Aaron', N'Castillo', N'Almeda', N'1', CAST(0x0000803A00000000 AS DateTime), N'09051817438', N'aaronjohnalmeda16@yahoo.com', 2, N'aaron', N'$2a$10$MQ73x1ihajIeWHc58KLOX.HMClirw5YrMy/xlLfBmPhF6JBOKXXrO', CAST(0x0000A2D200000000 AS DateTime), N'Employee_aaron_2014215_1303143.jpg', 11)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014005, N'Annie', N'K', N'Fields', N'2', CAST(0x000047F000000000 AS DateTime), N'09051817438', N'calsiugay@yahoo.com', 1, N'annie', N'$2a$10$FOPsZDafjC0F2Qg66.m0eughnWHq8PAlihvQc1cNo7/NMitHHIM2.', CAST(0x0000A2EE00000000 AS DateTime), N'', NULL)
INSERT [dbo].[Employees] ([EmployeeID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [AdminLevel], [UN], [Pwd], [DateOfEmployment], [PhotoFile], [FingerprintID]) VALUES (2014006, N'kenneth', N'China', N'Guelas', N'1', CAST(0x00009F9800000000 AS DateTime), N'12323', N'2323232@yahoo.com', 2, N'guelas', N'$2a$10$3YTza7dcw3mh0NZMcmrM2Op9k8NIBPsBSNOIx12TvMsOgin1XzCDO', CAST(0x0000A2E300000000 AS DateTime), N'', NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[DTR]    Script Date: 03/19/2014 14:28:49 ******/
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
SET IDENTITY_INSERT [dbo].[DTR] ON
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (2, 0, NULL, N'IN', N'trial', CAST(0x0000A2EF011F308B AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (3, 0, NULL, N'IN', N'trial', CAST(0x0000A2EF011FA82E AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (4, 2014003, NULL, N'IN', N'', CAST(0x0000A2EF0120667B AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (5, 2014003, NULL, N'OUT', N'', CAST(0x0000A2EF01207659 AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (6, 2014003, NULL, N'IN', N'', CAST(0x0000A2EF0120F6A4 AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (7, 2014003, NULL, N'OUT', N'', CAST(0x0000A2EF01210D8E AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (8, NULL, 8, N'IN', N'', CAST(0x0000A2EF01212CBD AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (9, 2014003, NULL, N'IN', N'di gumagana fp scanner', CAST(0x0000A2F000CA9ECC AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (10, NULL, 2, N'IN', N'', CAST(0x0000A2F0014B4A92 AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (11, NULL, 2, N'OUT', N'amoy lasing', CAST(0x0000A2F0014B7187 AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (12, 2014003, NULL, N'IN', N'', CAST(0x0000A2F0014C73EB AS DateTime))
INSERT [dbo].[DTR] ([DTR_ID], [EmployeeID], [TenantID], [EntryType], [Remarks], [DateTime]) VALUES (13, NULL, 4, N'OUT', N'balalsfnkasfsa', CAST(0x0000A2F0015F3988 AS DateTime))
SET IDENTITY_INSERT [dbo].[DTR] OFF
/****** Object:  Table [dbo].[Contracts]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Contracts] ([ContractID], [TenantID], [BedSpaceID], [Period], [StartDate], [EmployeeID], [EndDate], [IsValid], [DateCreated]) VALUES (2, 8, 10, N'Daily', CAST(0x0000A2DA00000000 AS DateTime), 2014003, CAST(0x0000A2DB00000000 AS DateTime), 1, NULL)
INSERT [dbo].[Contracts] ([ContractID], [TenantID], [BedSpaceID], [Period], [StartDate], [EmployeeID], [EndDate], [IsValid], [DateCreated]) VALUES (3, 9, 9, N'Annually', CAST(0x0000A2EA00000000 AS DateTime), 2014003, CAST(0x0000A45700000000 AS DateTime), 0, NULL)
INSERT [dbo].[Contracts] ([ContractID], [TenantID], [BedSpaceID], [Period], [StartDate], [EmployeeID], [EndDate], [IsValid], [DateCreated]) VALUES (8, 11, 9, N'Annually', CAST(0x0000A2ED00000000 AS DateTime), 2014003, CAST(0x0000A45A00000000 AS DateTime), 1, NULL)
INSERT [dbo].[Contracts] ([ContractID], [TenantID], [BedSpaceID], [Period], [StartDate], [EmployeeID], [EndDate], [IsValid], [DateCreated]) VALUES (9, 12, 14, N'Annually', CAST(0x0000A2F300000000 AS DateTime), 2014003, CAST(0x0000A46000000000 AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Contracts] OFF
/****** Object:  Table [dbo].[Complaints]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Complaints] ([ComplaintID], [TenantID], [Subject], [Details], [Date], [Status]) VALUES (3, 12, N'sasd', N'smoking room mate', CAST(0x0000A2F300E39400 AS DateTime), 1)
INSERT [dbo].[Complaints] ([ComplaintID], [TenantID], [Subject], [Details], [Date], [Status]) VALUES (4, 12, N'test', N'smoking', CAST(0x0000A2F300E3BCEF AS DateTime), 2)
INSERT [dbo].[Complaints] ([ComplaintID], [TenantID], [Subject], [Details], [Date], [Status]) VALUES (5, 12, N'2321', N'sdsadsad', CAST(0x0000A2F300E40749 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Complaints] OFF
/****** Object:  Table [dbo].[Bills]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (1, 4, NULL, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (4, 6, NULL, NULL, 2014003, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (5, 5, NULL, NULL, 2014003, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (6, 8, CAST(0x0000A2E700F0DEAD AS DateTime), 700.0000, 2014003, 0, 0, 1)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (7, 8, NULL, NULL, 2014003, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (9, 8, NULL, NULL, 2014003, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (10, 4, NULL, NULL, 2014003, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (11, 8, NULL, NULL, 2014003, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (13, 8, NULL, NULL, 2014003, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (14, 8, NULL, NULL, 2014003, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (18, 5, NULL, NULL, 2014003, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (20, 8, NULL, NULL, 2014003, 0, 0, 0)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (23, 7, CAST(0x0000A2E80114F380 AS DateTime), 24250.0000, 2014003, 5, 1, 1)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (24, 9, CAST(0x0000A2EA015D2F7D AS DateTime), 5000.0000, 2014003, 0, 0, 1)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (28, 11, CAST(0x0000A2EE00E1A029 AS DateTime), 17750.0000, 2014003, 4, 1, 1)
INSERT [dbo].[Bills] ([BillID], [TenantID], [DateGenerated], [TotalAmount], [EmployeeID], [ReceiptID], [IsPaid], [IsFinalized]) VALUES (29, 12, CAST(0x0000A2F300DC399F AS DateTime), 12000.0000, 2014003, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Bills] OFF
/****** Object:  Table [dbo].[Bill_Items]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (6, 10, N'Test', 100.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (16, 12, N'MONTHLY RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (17, 13, N'DAILY RENT FEES', 700.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (18, 14, N'DAILY RENT FEES', 700.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (19, 14, N'UNSETTLED BALANCE', 700.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (20, 15, N'MONTHLY RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (21, 15, N'UNSETTLED BALANCE', 5750.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (22, 16, N'MONTHLY RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (23, 16, N'Test Violation with Fine', 500.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (24, 17, N'MONTHLY RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (25, 17, N'UNSETTLED BALANCE', 6250.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (26, 19, N'MONTHLY RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (27, 19, N'UNSETTLED BALANCE', 12000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (28, 20, N'DAILY RENT FEES', 700.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (29, 20, N'UNSETTLED BALANCE', 700.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (30, 21, N'MONTHLY RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (31, 21, N'UNSETTLED BALANCE', 12000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (32, 21, N'Asset Fee: Laptop', 500.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (33, 22, N'MONTHLY RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (34, 22, N'UNSETTLED BALANCE', 18250.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (35, 23, N'MONTHLY RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (36, 23, N'UNSETTLED BALANCE', 18250.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (37, 23, N'Test Violation with Fine', 500.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (38, 23, N'Asset Fee: Laptop', 500.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (39, 12, N'UNSETTLED BALANCE', 25000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (40, 24, N'MONTHLY RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (41, 25, N'TWO MONTHS RENTAL FEE - SECURITY DEPOSIT', 14000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (42, 26, N'TWO MONTHS RENTAL FEE - SECURITY DEPOSIT', 12000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (43, 27, N'TWO MONTHS RENTAL FEE - SECURITY DEPOSIT', 12000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (44, 28, N'MONTHLY RENT FEE', 5000.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (45, 28, N'UNSETTLED BALANCE', 12750.0000)
INSERT [dbo].[Bill_Items] ([ItemID], [BillID], [Particular], [Amount]) VALUES (46, 29, N'TWO MONTHS RENTAL FEE - SECURITY DEPOSIT', 12000.0000)
SET IDENTITY_INSERT [dbo].[Bill_Items] OFF
/****** Object:  Table [dbo].[BedSpaces]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[BedSpaces] ([BedSpaceID], [RoomID], [BedSide]) VALUES (17, 8, N'1')
SET IDENTITY_INSERT [dbo].[BedSpaces] OFF
/****** Object:  Table [dbo].[AuditTrail]    Script Date: 03/19/2014 14:28:49 ******/
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
SET IDENTITY_INSERT [dbo].[AuditTrail] ON
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (1, 2014003, NULL, CAST(0x0000A2F300D7F1A0 AS DateTime), N'Updated tenants details')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (2, 2014003, NULL, CAST(0x0000A2F300D8A7DB AS DateTime), N'Added new Employee')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (3, 2014003, NULL, CAST(0x0000A2F300D9342C AS DateTime), N'Added new Guardian')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (4, 2014003, NULL, CAST(0x0000A2F300DC0AAD AS DateTime), N'Added new Tenant')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (5, 2014003, NULL, CAST(0x0000A2F300E20894 AS DateTime), N'Added new Tenant link to Guardian')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (6, NULL, 12, CAST(0x0000A2F300E39412 AS DateTime), N'Added new complaints')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (7, NULL, 12, CAST(0x0000A2F300E3BCFC AS DateTime), N'Added new complaints')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (8, NULL, 12, CAST(0x0000A2F300E3DE36 AS DateTime), N'Added new service request')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (9, NULL, 12, CAST(0x0000A2F300E40749 AS DateTime), N'Added new complaints')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (10, 2014003, NULL, CAST(0x0000A2F300E46646 AS DateTime), N'Added new Violation')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (11, 2014003, NULL, CAST(0x0000A2F300E478B9 AS DateTime), N'Updated complaint status')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (12, 2014003, NULL, CAST(0x0000A2F300E48E1E AS DateTime), N'Updated complaint status')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (13, 2014003, NULL, CAST(0x0000A2F300E4EFE1 AS DateTime), N'Updated complaint status')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (14, 2014003, NULL, CAST(0x0000A2F300E54D20 AS DateTime), N'Updated complaint status')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (15, 2014003, NULL, CAST(0x0000A2F300E5F47C AS DateTime), N'Updated announcement')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (16, 2014003, NULL, CAST(0x0000A2F300E60A5E AS DateTime), N'Updated announcement')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (17, 2014003, NULL, CAST(0x0000A2F300E61A12 AS DateTime), N'Updated announcement')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (18, 2014003, NULL, CAST(0x0000A2F300E914AB AS DateTime), N'Sent a message')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (19, 2014003, NULL, CAST(0x0000A2F300E936EB AS DateTime), N'Added new Asset')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (20, 2014003, NULL, CAST(0x0000A2F300E9406D AS DateTime), N'Updated assets amount')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (21, 2014003, NULL, CAST(0x0000A2F300E9469B AS DateTime), N'Updated assets amount')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (22, 2014003, NULL, CAST(0x0000A2F300E9BB7B AS DateTime), N'Updated service request remarks and priority')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (23, 2014003, NULL, CAST(0x0000A2F300E9E9FC AS DateTime), N'Updated service request remarks and priority')
INSERT [dbo].[AuditTrail] ([AuditID], [EmployeeID], [TenantID], [DateCreated], [Action]) VALUES (24, 2014003, NULL, CAST(0x0000A2F300EB2894 AS DateTime), N'Added new Tenant link to Guardian')
SET IDENTITY_INSERT [dbo].[AuditTrail] OFF
/****** Object:  Table [dbo].[Assets]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Assets] ([AssetID], [TenantID], [AssetType], [ModelName], [BrandName], [SerialNo], [Amount], [IsIn]) VALUES (1, 1, N'Laptop', N'Vaio', N'Sony', N'1234567811234', 500.0000, 1)
INSERT [dbo].[Assets] ([AssetID], [TenantID], [AssetType], [ModelName], [BrandName], [SerialNo], [Amount], [IsIn]) VALUES (2, 7, N'Laptop', N'Compaq', N'HP', N'XXX!111222', 500.0000, 1)
INSERT [dbo].[Assets] ([AssetID], [TenantID], [AssetType], [ModelName], [BrandName], [SerialNo], [Amount], [IsIn]) VALUES (3, 12, N'Laptop', N'VAIO', N'Sony', N'7387r9453454657', 600.0000, NULL)
SET IDENTITY_INSERT [dbo].[Assets] OFF
/****** Object:  Table [dbo].[Announcement]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Announcement] ([AnnouncementID], [Subject], [Message], [DateCreated], [EmployeeID]) VALUES (2, N'test XSS', N'Panget ni AARON', CAST(0x0000A2ED0123F1DC AS DateTime), 2014003)
SET IDENTITY_INSERT [dbo].[Announcement] OFF
/****** Object:  Table [dbo].[Violations]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Violations] ([ViolationID], [TenantID], [EmployeeID], [Title], [Description], [Fine], [DateTime]) VALUES (3, 12, 2014003, N'asdsa', N'sadsadas', 500.0000, CAST(0x0000A2F300E46645 AS DateTime))
SET IDENTITY_INSERT [dbo].[Violations] OFF
/****** Object:  Table [dbo].[UnitType]    Script Date: 03/19/2014 14:28:49 ******/
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
/****** Object:  Table [dbo].[TGLink]    Script Date: 03/19/2014 14:28:49 ******/
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
SET IDENTITY_INSERT [dbo].[TGLink] ON
INSERT [dbo].[TGLink] ([TGID], [TenantID], [GuardianID], [Relation]) VALUES (1, 11, 1, N'Mother')
INSERT [dbo].[TGLink] ([TGID], [TenantID], [GuardianID], [Relation]) VALUES (2, 12, 1, N'mother')
SET IDENTITY_INSERT [dbo].[TGLink] OFF
/****** Object:  Table [dbo].[Tenants]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (2, N'Megan', N'Manuel', N'Japzon', N'2', N'potchie0o8@gmail.com', CAST(0x000081BD00000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09272814353', N'mjapzon', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BD00FEE8F9 AS DateTime), 12, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (3, N'Megan', N'Manuel', N'Japzon', N'2', N'potchie0o8@gmail.com', CAST(0x000081BD00000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09272814353', N'mjapzon1', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BD01083399 AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (4, N'Babylyn', N'Rivero', N'Tan', N'2', N'babylyntan05@gmail.com', CAST(0x00007FD300000000 AS DateTime), N'2246-C. Linceo St. Pandacan', N'Manila', N'NCR', N'Philippines', N'09064408499', N'baby05', N'$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS', NULL, CAST(0x0000A2BD0120A8F2 AS DateTime), 13, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (5, N'Calvin', N'Q', N'Siu', N'1', N'calsiugay@yahoo.com', CAST(0x0000844100000000 AS DateTime), N'Ewan', N'Lucena', N'Region VI', N'Philippines', N'09051817438', N'calvinsiu', N'$2a$10$66x4z48PXic88Jrrppb7le3RBCDqtRFDpY4a.2Dde39I4tMVbZHP.', NULL, CAST(0x0000A2D900C2A0DB AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (6, N'Amiel', N'D', N'Valecina', N'1', N'calsiugay@yahoo.com', CAST(0x00008BC500000000 AS DateTime), N'Ewan', N'Laguna', N'Region VI', N'Philippines', N'09051817438', N'amiel', N'$2a$10$0V9HQUsdKSpxABXNcKZjqek9clFnWxEX9pgrjRjn2mNHSL6VTVU3.', NULL, CAST(0x0000A2D900FF0139 AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (7, N'Cyrus', N'Bondoc', N'Macaspac', N'1', N'cymacaspac@yahoo.com', CAST(0x0000837600000000 AS DateTime), N'Mekeni St., Longganisa Subdivision', N'Pampanga', N'Region III', N'Philippines', N'09051817438', N'cymacaspac', N'$2a$10$2xkTZltogH9QVry9XrDIYObCgLM83QUnHTA9I3zB.xyp.gA7hLo4i', NULL, CAST(0x0000A2DA00EC25D9 AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (8, N'Juan', N'Macasoac', N'Dela Cruz', N'1', N'calsiugay@yahoo.com', CAST(0x0000837500000000 AS DateTime), N'Ewan', N'Laguna', N'Region VI', N'Philippines', N'09051817438', N'juandelacruz', N'$2a$10$nDfFFUxvKPdFyvByZ.7f0.HMqNeDZ29nEE2ym/kxIL1DLvRc489VG', NULL, CAST(0x0000A2DA01079117 AS DateTime), NULL, N'23:00')
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (9, N'John', N'Matthew', N'Doe', N'1', N'reiner.tupaz@istaphil.com', CAST(0x0000A2EA00000000 AS DateTime), N'Ewan', N'Laguna', N'Region VI', N'Philippines', N'09051817438', N'johndoe', N'$2a$10$igZi5eUxi4stte.eDGyukuSkHQiihXVEGIBNCbffGLpEuXGCMMevC', NULL, CAST(0x0000A2EA015CE24C AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (10, N'Juan', N'S', N'Dela Cruz', N'1', N'reiner.tupaz@istaphil.com', CAST(0x0000806800000000 AS DateTime), N'slfslfs', N'kwnkw', N'kwndkw', N'nfkfnwk', N'09051817438', N'jcruz', N'$2a$10$sxOkDwjEo6zjEvE7lvleU.u3Q0Fki77Nbkx.j9EmJ6DZMFT9Y7WnO', NULL, CAST(0x0000A2ED00E1F23A AS DateTime), NULL, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (11, N'Aaron', N'Castillo', N'Almeda', N'1', N'aaronjohnalmeda16@yahoo.com', CAST(0x0000803A00000000 AS DateTime), N'ewanko', N'Laguna', N'NCR', N'Philippines', N'09051817438', N'aarongaymeda', N'$2a$10$Sxj3Anff4EDeHw8oGd8oBuY.7KeK2j/ZjsuEsJOS4GUjoUgqeKknO', N'', CAST(0x0000A2ED0117A758 AS DateTime), 0, NULL)
INSERT [dbo].[Tenants] ([TenantID], [FName], [MName], [LName], [Gender], [Email], [BDate], [Street], [City], [Region], [Country], [MobileNo], [UN], [Pwd], [PhotoFile], [DateRegistered], [FingerprintID], [CurfewTime]) VALUES (12, N'lawrence', N'wong', N'almes', N'1', N'lawalmes@yahoo.com', CAST(0x0000812700000000 AS DateTime), N'123 pateros', N'binan', N'ncr', N'phil', N'6457480', N'law', N'$2a$10$mIF1lPtxp3pz8zUTGSfCCe9Zn5gnKL9k.8CyYssjDMZJMdxB3yudy', NULL, CAST(0x0000A2F300DC0AAD AS DateTime), NULL, N'10:00')
SET IDENTITY_INSERT [dbo].[Tenants] OFF
/****** Object:  Table [dbo].[ServiceRequest]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[ServiceRequest] ([ServiceRequestID], [EmployeeID], [TenantID], [Title], [Details], [Remarks], [Priority], [DateRequested], [DateCompleted]) VALUES (5, 0, 4, N'Laundry', N'Pick up laundry 4pm', N'Completed', N'Average', CAST(0x0000A2E1010A0E78 AS DateTime), CAST(0x0000A2F300000000 AS DateTime))
INSERT [dbo].[ServiceRequest] ([ServiceRequestID], [EmployeeID], [TenantID], [Title], [Details], [Remarks], [Priority], [DateRequested], [DateCompleted]) VALUES (6, 2014003, 12, N'food', N'kuya noys', N'Completed', N'Average', CAST(0x0000A2F300E3DE28 AS DateTime), CAST(0x0000A2F300000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[ServiceRequest] OFF
/****** Object:  Table [dbo].[Rooms]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Rooms] ([RoomID], [RoomNo], [UnitTypeID]) VALUES (7, N'801A', 2)
INSERT [dbo].[Rooms] ([RoomID], [RoomNo], [UnitTypeID]) VALUES (8, N'102a', 3)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
/****** Object:  Table [dbo].[Receipts]    Script Date: 03/19/2014 14:28:49 ******/
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
SET IDENTITY_INSERT [dbo].[Receipts] ON
INSERT [dbo].[Receipts] ([ReceiptID], [Date], [Remarks], [Amount]) VALUES (1, CAST(0x0000A2F10081B02F AS DateTime), N'ascsa', 24250.0000)
INSERT [dbo].[Receipts] ([ReceiptID], [Date], [Remarks], [Amount]) VALUES (2, CAST(0x0000A2F1008AE32D AS DateTime), N'sdsd', 17750.0000)
INSERT [dbo].[Receipts] ([ReceiptID], [Date], [Remarks], [Amount]) VALUES (3, CAST(0x0000A2F10098DCE6 AS DateTime), N'sfs', 17750.0000)
INSERT [dbo].[Receipts] ([ReceiptID], [Date], [Remarks], [Amount]) VALUES (4, CAST(0x0000A2F10099413D AS DateTime), N'test', 17750.0000)
INSERT [dbo].[Receipts] ([ReceiptID], [Date], [Remarks], [Amount]) VALUES (5, CAST(0x0000A2F300E5AAF0 AS DateTime), N'24250', 24250.0000)
SET IDENTITY_INSERT [dbo].[Receipts] OFF
/****** Object:  Table [dbo].[Messages]    Script Date: 03/19/2014 14:28:49 ******/
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
INSERT [dbo].[Messages] ([MessageID], [EmployeeID], [TenantID], [Subject], [Message], [Date], [IsRead]) VALUES (4, 2014003, 12, N'asdasd', N'asdafdsgfgfsdfsd', CAST(0x0000A2F300E914A0 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Messages] OFF
/****** Object:  Table [dbo].[Guardians]    Script Date: 03/19/2014 14:28:49 ******/
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
SET IDENTITY_INSERT [dbo].[Guardians] ON
INSERT [dbo].[Guardians] ([GuardianID], [FName], [MName], [LName], [Gender], [BDate], [ContactNo], [Email], [Address], [UN], [Pwd]) VALUES (1, N'shar', N'guelas', N'ku', N'1', CAST(0x0000A2E300000000 AS DateTime), N'12323', N'21323@yahoo.com', N'qweqweqwe1', N'shar', N'$2a$10$a/rdrn.nvxWb2XKY87y2f.1WAxnE2DcVXjvcSqfu55UJXDsH2tQp2')
SET IDENTITY_INSERT [dbo].[Guardians] OFF
/****** Object:  StoredProcedure [dbo].[GetTenantList]    Script Date: 03/19/2014 14:28:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPayments]    Script Date: 03/19/2014 14:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPayments]

AS

BEGIN

SELECT Bills.BillID, Tenants.FName, Tenants.MName, Tenants.LName, Receipts.ReceiptID, Receipts.Date, Receipts.Remarks, Receipts.Amount FROM Bills INNER JOIN Receipts ON Bills.ReceiptID = Receipts.ReceiptID INNER JOIN Tenants ON Bills.TenantID = Tenants.TenantID

END
GO
/****** Object:  StoredProcedure [dbo].[GetContract]    Script Date: 03/19/2014 14:28:51 ******/
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
/****** Object:  StoredProcedure [dbo].[RetrieveBill]    Script Date: 03/19/2014 14:28:51 ******/
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
/****** Object:  Default [DF_Announcement_DateCreated]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[Announcement] ADD  CONSTRAINT [DF_Announcement_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_AuditTrail_DateCreated]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[AuditTrail] ADD  CONSTRAINT [DF_AuditTrail_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Complaints_Date]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[Complaints] ADD  CONSTRAINT [DF_Complaints_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_DTR_DateTime]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[DTR] ADD  CONSTRAINT [DF_DTR_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
/****** Object:  Default [DF_Expenses_Date]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[Expenses] ADD  CONSTRAINT [DF_Expenses_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_Fingerprints_DateAdded]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[Fingerprints] ADD  CONSTRAINT [DF_Fingerprints_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
/****** Object:  Default [DF_Messages_Date]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_Receipts_Date]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[Receipts] ADD  CONSTRAINT [DF_Receipts_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  Default [DF_ServiceRequest_DateRequested]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_DateRequested]  DEFAULT (getdate()) FOR [DateRequested]
GO
/****** Object:  Default [DF_Tenants_DateRegistered]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[Tenants] ADD  CONSTRAINT [DF_Tenants_DateRegistered]  DEFAULT (getdate()) FOR [DateRegistered]
GO
/****** Object:  Default [DF_Table_1_Date]    Script Date: 03/19/2014 14:28:49 ******/
ALTER TABLE [dbo].[Violations] ADD  CONSTRAINT [DF_Table_1_Date]  DEFAULT (getdate()) FOR [DateTime]
GO
