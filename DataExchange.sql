USE [master]
GO
/****** Object:  Database [DataExchange]    Script Date: 2017/8/10 1:47:10 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DataExchange')
BEGIN
CREATE DATABASE [DataExchange]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataExchange', FILENAME = N'D:\DATA\DataExchange.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DataExchange_log', FILENAME = N'D:\DATA\DataExchange_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [DataExchange] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataExchange].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataExchange] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataExchange] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataExchange] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataExchange] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataExchange] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataExchange] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataExchange] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataExchange] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataExchange] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataExchange] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataExchange] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataExchange] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataExchange] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataExchange] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataExchange] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DataExchange] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataExchange] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataExchange] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataExchange] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataExchange] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataExchange] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataExchange] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataExchange] SET RECOVERY FULL 
GO
ALTER DATABASE [DataExchange] SET  MULTI_USER 
GO
ALTER DATABASE [DataExchange] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataExchange] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataExchange] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataExchange] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DataExchange] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DataExchange', N'ON'
GO
USE [DataExchange]
GO
/****** Object:  Table [dbo].[History]    Script Date: 2017/8/10 1:47:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[History](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[RawData] [varbinary](max) NOT NULL,
	[DataTime] [datetime] NOT NULL CONSTRAINT [DF_History_DataTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Map]    Script Date: 2017/8/10 1:47:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Map]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Map](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[From] [varchar](50) NOT NULL,
	[To] [varchar](5000) NOT NULL,
	[Remark] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Map] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [DataExchange] SET  READ_WRITE 
GO
