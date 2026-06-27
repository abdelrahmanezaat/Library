USE [master]
GO
/****** Object:  Database [LibraryDb]    Script Date: 6/28/2026 2:18:25 AM ******/
CREATE DATABASE [LibraryDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryDb', FILENAME = N'C:\Users\user\LibraryDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryDb_log', FILENAME = N'C:\Users\user\LibraryDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibraryDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LibraryDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibraryDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LibraryDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryDb] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LibraryDb] SET QUERY_STORE = OFF
GO
USE [LibraryDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityLogs]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[Action] [nvarchar](max) NOT NULL,
	[EntityName] [nvarchar](max) NOT NULL,
	[EntityId] [int] NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_ActivityLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Summary] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[UpdateAt] [datetimeoffset](7) NULL,
	[DeleteAt] [datetimeoffset](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthors]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthors](
	[BookId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
 CONSTRAINT [PK_BookAuthors] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC,
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ISBN] [nvarchar](max) NOT NULL,
	[PublicationYear] [int] NOT NULL,
	[Language] [nvarchar](max) NOT NULL,
	[Summary] [nvarchar](max) NULL,
	[CoverImageUrl] [nvarchar](max) NULL,
	[IsAvailable] [bit] NOT NULL,
	[PublisherId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[UpdateAt] [datetimeoffset](7) NULL,
	[DeleteAt] [datetimeoffset](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowTransactions]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowTransactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[IsReturned] [bit] NOT NULL,
	[MemberId] [int] NOT NULL,
	[BorrowDate] [datetimeoffset](7) NOT NULL,
	[DueDate] [datetimeoffset](7) NOT NULL,
	[ReturnDate] [datetimeoffset](7) NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[UpdateAt] [datetimeoffset](7) NULL,
	[DeleteAt] [datetimeoffset](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BorrowTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[UpdateAt] [datetimeoffset](7) NULL,
	[DeleteAt] [datetimeoffset](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[NationalID] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[UpdateAt] [datetimeoffset](7) NULL,
	[DeleteAt] [datetimeoffset](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 6/28/2026 2:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[UpdateAt] [datetimeoffset](7) NULL,
	[DeleteAt] [datetimeoffset](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20260626220513_Books', N'8.0.26')
GO
SET IDENTITY_INSERT [dbo].[ActivityLogs] ON 
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (1, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Category', 1, CAST(N'2026-06-27T21:20:29.2967860+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (2, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Category', 1, CAST(N'2026-06-27T21:21:37.0208322+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (3, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Category', 1, CAST(N'2026-06-27T21:22:47.1773554+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (4, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Category', 1, CAST(N'2026-06-27T21:26:31.7862258+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (5, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Category', 2, CAST(N'2026-06-27T21:26:58.4735059+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (6, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Author', 1, CAST(N'2026-06-27T21:31:40.0020178+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (7, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Author', 2, CAST(N'2026-06-27T21:32:08.4247519+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (8, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Author', 3, CAST(N'2026-06-27T21:32:31.4651248+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (9, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Author', 1, CAST(N'2026-06-27T21:33:35.0713893+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (10, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Publisher', 1, CAST(N'2026-06-27T21:35:14.8671241+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (11, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Publisher', 2, CAST(N'2026-06-27T21:35:38.2652801+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (12, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Publisher', 3, CAST(N'2026-06-27T21:35:55.8577969+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (13, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Publisher', 1, CAST(N'2026-06-27T21:36:53.2575506+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (14, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Member', 1, CAST(N'2026-06-27T21:38:03.0218459+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (15, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Member', 2, CAST(N'2026-06-27T21:38:23.9803950+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (16, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Member', 3, CAST(N'2026-06-27T21:38:51.1690951+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (17, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Member', 4, CAST(N'2026-06-27T21:39:10.1669974+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (18, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Member', 3, CAST(N'2026-06-27T21:42:32.7930873+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (19, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Member', 3, CAST(N'2026-06-27T21:42:59.4612027+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (20, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Book', 1, CAST(N'2026-06-27T21:54:46.5280639+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (21, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Book', 1, CAST(N'2026-06-27T22:01:44.9137437+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (22, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Book', 1, CAST(N'2026-06-27T22:03:07.6826692+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (23, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Book', 2, CAST(N'2026-06-27T22:05:34.6386169+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (24, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Borrow', N'BorrowTransaction', 1, CAST(N'2026-06-27T22:08:16.8185457+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (25, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Return', N'BorrowTransaction', 1, CAST(N'2026-06-27T22:08:31.9367280+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (26, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Borrow', N'BorrowTransaction', 2, CAST(N'2026-06-27T22:09:01.2170516+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (27, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Return', N'BorrowTransaction', 2, CAST(N'2026-06-27T22:09:29.0068761+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (28, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Borrow', N'BorrowTransaction', 3, CAST(N'2026-06-27T22:09:32.9527993+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (29, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Category', 1, CAST(N'2026-06-27T23:07:56.3882859+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (30, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Category', 1, CAST(N'2026-06-27T23:09:01.4824314+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[ActivityLogs] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0e14ae08-bde8-41a5-aa6f-797b659f49e8', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1863ec25-e93a-4596-a62c-bc94a42ab8ac', N'Librarian', N'LIBRARIAN', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ea1187d7-a197-4b57-b7ed-fd6b41b8e46f', N'Staff', N'STAFF', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c940239f-32bb-4c05-9ada-7bb6ed70c496', N'0e14ae08-bde8-41a5-aa6f-797b659f49e8')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'1863ec25-e93a-4596-a62c-bc94a42ab8ac')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'abdo ezzat', N'abdo', N'ABDO', N'abdo@gmail', N'ABDO@GMAIL', 0, N'AQAAAAIAAYagAAAAEA+CyguReLy7oBiw1jXEBrhFzdjD+8EKAT6ikTfeM2p8AGMewnmQQxxd+jbybph0Ew==', N'YOQ76AYNUBOZMRPZATTETNHINYXUVSVG', N'035a8db3-6b13-48cf-913f-7610ac7b0f8c', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c940239f-32bb-4c05-9ada-7bb6ed70c496', N'System Admin', N'admin', N'ADMIN', N'admin@library.com', N'ADMIN@LIBRARY.COM', 1, N'AQAAAAIAAYagAAAAED1S19HwJ6CCsvaAi1rJg1EZvini7ObqJufhxfElgm/sOvCz1Mps1nsEN4U5ndUb5w==', N'2ML7JBDQLLWQOF4URWAAU3KGCTWR6FN6', N'3398530b-92d3-4195-ae09-5a1b13162c43', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 
GO
INSERT [dbo].[Authors] ([Id], [Name], [Summary], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, N'Mohamed Hassan', N'Software engineer', CAST(N'2026-06-27T21:31:39.6525292+00:00' AS DateTimeOffset), CAST(N'2026-06-27T21:33:35.0531591+00:00' AS DateTimeOffset), NULL, 0)
GO
INSERT [dbo].[Authors] ([Id], [Name], [Summary], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, N'Ali Mohamed', N'Software engineer', CAST(N'2026-06-27T21:32:08.3943941+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[Authors] ([Id], [Name], [Summary], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (3, N'Ahmed Mohamed', N'.Net Developer ', CAST(N'2026-06-27T21:32:31.4537537+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (1, 1)
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (1, 2)
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (2, 2)
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (1, 3)
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (2, 3)
GO
SET IDENTITY_INSERT [dbo].[Books] ON 
GO
INSERT [dbo].[Books] ([Id], [Title], [ISBN], [PublicationYear], [Language], [Summary], [CoverImageUrl], [IsAvailable], [PublisherId], [CategoryId], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, N'Clean Code', N'9780132350884', 2008, N'En', N'A practical guide to writing clean, maintainable, and readable code.', N'Uploads/786ad967-2c12-419a-ab6f-06b6ed536c90.png', 0, 1, 1, CAST(N'2026-06-27T21:54:46.1834599+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:03:07.6617920+00:00' AS DateTimeOffset), NULL, 0)
GO
INSERT [dbo].[Books] ([Id], [Title], [ISBN], [PublicationYear], [Language], [Summary], [CoverImageUrl], [IsAvailable], [PublisherId], [CategoryId], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, N'The Pragmatic Programmer', N'9780201616224', 2008, N'En', N'Best practices and techniques for becoming a better software developer.', N'Uploads/c1181cfe-fb91-43f2-9e48-271b7b98f8b0.png', 0, 2, 1, CAST(N'2026-06-27T22:05:34.6167935+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:05:34.6169537+00:00' AS DateTimeOffset), NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[BorrowTransactions] ON 
GO
INSERT [dbo].[BorrowTransactions] ([Id], [BookId], [IsReturned], [MemberId], [BorrowDate], [DueDate], [ReturnDate], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, 1, 0, 1, CAST(N'2026-06-27T22:08:16.7494037+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:07:55.7120000+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:08:31.9257004+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:08:16.7492597+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[BorrowTransactions] ([Id], [BookId], [IsReturned], [MemberId], [BorrowDate], [DueDate], [ReturnDate], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, 1, 0, 1, CAST(N'2026-06-27T22:09:01.2073669+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:07:55.7120000+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:09:28.9925527+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:09:01.2073663+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[BorrowTransactions] ([Id], [BookId], [IsReturned], [MemberId], [BorrowDate], [DueDate], [ReturnDate], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (3, 1, 0, 2, CAST(N'2026-06-27T22:09:32.9337404+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:07:55.7120000+00:00' AS DateTimeOffset), NULL, CAST(N'2026-06-27T22:09:32.9337395+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[BorrowTransactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, NULL, N'Computer science', CAST(N'2026-06-27T21:20:29.0091867+00:00' AS DateTimeOffset), CAST(N'2026-06-27T23:09:01.4730233+00:00' AS DateTimeOffset), NULL, 0)
GO
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, 1, N'Programing', CAST(N'2026-06-27T21:26:58.4588890+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 
GO
INSERT [dbo].[Members] ([Id], [FullName], [NationalID], [Email], [Address], [Phone], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, N'Ahmed Hassan', N'29801011234567', N'ahmed.hassan@example.com', N'15 Tahrir St, Cairo, Egypt', N'+201001234567', CAST(N'2026-06-27T21:38:02.9789319+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[Members] ([Id], [FullName], [NationalID], [Email], [Address], [Phone], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, N'Sara Mohamed', N'29905222345678', N'sara.mohamed@example.com', N'22 El Geish Rd, Alexandria, Egypt', N'+201112345678', CAST(N'2026-06-27T21:38:23.9549548+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[Members] ([Id], [FullName], [NationalID], [Email], [Address], [Phone], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (3, N'Omar Ali', N'30008153456789', N'omar.ali@example.com', N'10 Nile Corniche, Giza, Egypt', N'+201223456789', CAST(N'2026-06-27T21:38:51.1608510+00:00' AS DateTimeOffset), CAST(N'2026-06-27T21:42:59.4479725+00:00' AS DateTimeOffset), NULL, 0)
GO
INSERT [dbo].[Members] ([Id], [FullName], [NationalID], [Email], [Address], [Phone], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (4, N'Mariam Adel', N'30111044567890', N'mariam.adel@example.com', N'7 University St, Mansoura, Egypt', N'+201334567890', CAST(N'2026-06-27T21:39:10.1509510+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Publishers] ON 
GO
INSERT [dbo].[Publishers] ([Id], [Name], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, N'Scholastic', CAST(N'2026-06-27T21:35:14.8142946+00:00' AS DateTimeOffset), CAST(N'2026-06-27T21:36:53.2271537+00:00' AS DateTimeOffset), NULL, 0)
GO
INSERT [dbo].[Publishers] ([Id], [Name], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, N'HarperCollins', CAST(N'2026-06-27T21:35:38.2448414+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[Publishers] ([Id], [Name], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (3, N'Simon & Schuster', CAST(N'2026-06-27T21:35:55.8342774+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Publishers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookAuthors_AuthorId]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_BookAuthors_AuthorId] ON [dbo].[BookAuthors]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_CategoryId]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_Books_CategoryId] ON [dbo].[Books]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_PublisherId]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_Books_PublisherId] ON [dbo].[Books]
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BorrowTransactions_BookId]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_BorrowTransactions_BookId] ON [dbo].[BorrowTransactions]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BorrowTransactions_MemberId]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_BorrowTransactions_MemberId] ON [dbo].[BorrowTransactions]
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Categories_ParentId]    Script Date: 6/28/2026 2:18:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_ParentId] ON [dbo].[Categories]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Authors_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Authors_AuthorId]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Books_BookId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers_PublisherId]
GO
ALTER TABLE [dbo].[BorrowTransactions]  WITH CHECK ADD  CONSTRAINT [FK_BorrowTransactions_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BorrowTransactions] CHECK CONSTRAINT [FK_BorrowTransactions_Books_BookId]
GO
ALTER TABLE [dbo].[BorrowTransactions]  WITH CHECK ADD  CONSTRAINT [FK_BorrowTransactions_Members_MemberId] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BorrowTransactions] CHECK CONSTRAINT [FK_BorrowTransactions_Members_MemberId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories_ParentId]
GO
USE [master]
GO
ALTER DATABASE [LibraryDb] SET  READ_WRITE 
GO
