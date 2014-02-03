USE [DMS]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 01/23/2014 16:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants](
	[TenantID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](200) NULL,
	[MName] [nvarchar](200) NULL,
	[LName] [nvarchar](200) NULL,
	[Gender] [nvarchar](1) NULL,
	[Email] [nvarchar](150) NULL,
	[BDate] [datetime] NULL,
	[Street] [nvarchar](200) NULL,
	[City] [nvarchar](200) NULL,
	[Region] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[MobileNo] [nvarchar](20) NULL,
	[UN] [nvarchar](150) NULL,
	[Pwd] [nvarchar](40) NULL,
	[PhotoFile] [nvarchar](150) NULL,
	[DateRegistered] [datetime] NULL,
 CONSTRAINT [PK_Tenants] PRIMARY KEY CLUSTERED 
(
	[TenantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01/23/2014 16:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(2014001,1) NOT NULL,
	[FName] [nvarchar](200) NULL,
	[MName] [nvarchar](200) NULL,
	[LName] [nvarchar](200) NULL,
	[Gender] [nvarchar](1) NULL,
	[BDate] [datetime] NULL,
	[ContactNo] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
	[AdminLevel] [int] NULL,
	[UN] [nvarchar](150) NULL,
	[Pwd] [nvarchar](40) NULL,
	[DateOfEmployment] [datetime] NULL,
	[PhotoFile] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 01/23/2014 16:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[AnnouncementID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](250) NULL,
	[Message] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[AnnouncementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF_Announcement_DateCreated]    Script Date: 01/23/2014 16:22:29 ******/
ALTER TABLE [dbo].[Announcement] ADD  CONSTRAINT [DF_Announcement_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Tenants_DateRegistered]    Script Date: 01/23/2014 16:22:29 ******/
ALTER TABLE [dbo].[Tenants] ADD  CONSTRAINT [DF_Tenants_DateRegistered]  DEFAULT (getdate()) FOR [DateRegistered]
GO
