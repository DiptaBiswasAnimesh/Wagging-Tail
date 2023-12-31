USE [master]
GO

/****** Object:  Database [OnlineDiagnosticLabSystemDb]    Script Date: 11/11/2019 1:44:46 PM ******/
CREATE DATABASE [OnlineDiagnosticLabSystemDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineDiagnosticLabSystemDb', FILENAME = N'F:\Aust - 3.2\CSE-3200 (SD)\WAGGING TAIL\Database\OnlineDiagnosticLabSystemDb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineDiagnosticLabSystemDb_log', FILENAME = N'F:\Aust - 3.2\CSE-3200 (SD)\WAGGING TAIL\Database\OnlineDiagnosticLabSystemDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineDiagnosticLabSystemDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OnlineDiagnosticLabSystemDb]
GO
/****** Object:  Table [dbo].[AccountTypeTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTypeTable](
	[AccountTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_AccountTypeTable] PRIMARY KEY CLUSTERED 
(
	[AccountTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorAppointTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorAppointTable](
	[DoctorAppointID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorTimeSlotID] [int] NOT NULL,
	[AppointDate] [date] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[IsFeeSubmit] [bit] NOT NULL,
	[IsChecked] [bit] NOT NULL,
	[TransectionID] [nvarchar](150) NOT NULL,
	[DoctorComment] [nvarchar](500) NULL,
 CONSTRAINT [PK_DoctorAppointTable] PRIMARY KEY CLUSTERED 
(
	[DoctorAppointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorTable](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[Fees] [float] NOT NULL,
	[Splztion] [nvarchar](150) NOT NULL,
	[ClinicAddress] [nvarchar](300) NOT NULL,
	[PermanentAddress] [nvarchar](300) NOT NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[ClinicPhoneNo] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[PerDayMaxAppitmnt] [int] NULL,
	[Photo] [nvarchar](300) NULL,
	[AccountTypeID] [int] NOT NULL,
	[AccountNo] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DoctorTable] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorTimeSlotTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorTimeSlotTable](
	[DoctorTimeSlotID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[ToTime] [time](7) NOT NULL,
	[FromTime] [time](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DoctoTimeSlotTable] PRIMARY KEY CLUSTERED 
(
	[DoctorTimeSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabAppointTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabAppointTable](
	[LabAppointID] [int] IDENTITY(1,1) NOT NULL,
	[LabTestID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[LabID] [int] NOT NULL,
	[LabTimeSlotID] [int] NOT NULL,
	[AppointDate] [date] NOT NULL,
	[IsFeeSubmit] [bit] NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[Description] [nvarchar](300) NULL,
	[TransectionID] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_LabAppointTable] PRIMARY KEY CLUSTERED 
(
	[LabAppointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTable](
	[LabID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Photo] [nvarchar](300) NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[PhoneNo] [nvarchar](150) NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[PermanentAddress] [nvarchar](300) NOT NULL,
	[AboutLab] [nvarchar](500) NULL,
	[AccountTypeID] [int] NOT NULL,
	[AccountNo] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LabTable] PRIMARY KEY CLUSTERED 
(
	[LabID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabTestDetailsTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTestDetailsTable](
	[LabTestDetailID] [int] IDENTITY(1,1) NOT NULL,
	[LabTestID] [int] NOT NULL,
	[LabID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[MinValue] [int] NOT NULL,
	[MaxValue] [int] NOT NULL,
 CONSTRAINT [PK_LabTestDetailsTable] PRIMARY KEY CLUSTERED 
(
	[LabTestDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabTestTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTestTable](
	[LabTestID] [int] IDENTITY(1,1) NOT NULL,
	[LabID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Cost] [float] NOT NULL,
 CONSTRAINT [PK_LabTestTable] PRIMARY KEY CLUSTERED 
(
	[LabTestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabTimeSlotTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTimeSlotTable](
	[LabTimeSlotID] [int] IDENTITY(1,1) NOT NULL,
	[LabID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ToTime] [time](7) NOT NULL,
	[FromTime] [time](7) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_LabTimeSlotTable] PRIMARY KEY CLUSTERED 
(
	[LabTimeSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientTable](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Photo] [nvarchar](300) NULL,
 CONSTRAINT [PK_PatientTable] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientTestDetailTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientTestDetailTable](
	[LabAppointDetailID] [int] IDENTITY(1,1) NOT NULL,
	[LabAppointID] [int] NOT NULL,
	[LabTestDetailID] [int] NOT NULL,
	[PatientValue] [int] NOT NULL,
 CONSTRAINT [PK_PatientTestDetailTable] PRIMARY KEY CLUSTERED 
(
	[LabAppointDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[isVerified] [bit] NOT NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTypeTable]    Script Date: 11/11/2019 1:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeTable](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypeTable] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AccountTypeTable] ON 

INSERT [dbo].[AccountTypeTable] ([AccountTypeID], [Name]) VALUES (1, N'Bank Account')
INSERT [dbo].[AccountTypeTable] ([AccountTypeID], [Name]) VALUES (2, N'Easy Paisa')
INSERT [dbo].[AccountTypeTable] ([AccountTypeID], [Name]) VALUES (3, N'Mobile Account')
SET IDENTITY_INSERT [dbo].[AccountTypeTable] OFF
SET IDENTITY_INSERT [dbo].[UserTypeTable] ON 

INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (1, N'Admin')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (2, N'Doctor')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (3, N'Lab')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (4, N'Patient')
SET IDENTITY_INSERT [dbo].[UserTypeTable] OFF
ALTER TABLE [dbo].[DoctorAppointTable] ADD  CONSTRAINT [DF_DoctorAppointTable_IsFeeSubmit]  DEFAULT ((0)) FOR [IsFeeSubmit]
GO
ALTER TABLE [dbo].[DoctorAppointTable] ADD  CONSTRAINT [DF_DoctorAppointTable_IsChecked]  DEFAULT ((0)) FOR [IsChecked]
GO
ALTER TABLE [dbo].[DoctorTimeSlotTable] ADD  CONSTRAINT [DF_DoctoTimeSlotTable_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LabAppointTable] ADD  CONSTRAINT [DF_LabAppointTable_IsFeeSubmit]  DEFAULT ((0)) FOR [IsFeeSubmit]
GO
ALTER TABLE [dbo].[LabAppointTable] ADD  CONSTRAINT [DF_LabAppointTable_IsComplete]  DEFAULT ((0)) FOR [IsComplete]
GO
ALTER TABLE [dbo].[LabTimeSlotTable] ADD  CONSTRAINT [DF_LabTimeSlotTable_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
USE [master]
GO
ALTER DATABASE [OnlineDiagnosticLabSystemDb] SET  READ_WRITE 
GO
