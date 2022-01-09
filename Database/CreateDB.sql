USE [master]
GO
/****** Object:  Database [OEAsmJ4]    Script Date: 8/01/2022 17:05:01 ******/
CREATE DATABASE [OEAsmJ4]

GO
ALTER DATABASE [OEAsmJ4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OEAsmJ4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OEAsmJ4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OEAsmJ4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OEAsmJ4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OEAsmJ4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OEAsmJ4] SET ARITHABORT OFF 
GO
ALTER DATABASE [OEAsmJ4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OEAsmJ4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OEAsmJ4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OEAsmJ4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OEAsmJ4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OEAsmJ4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OEAsmJ4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OEAsmJ4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OEAsmJ4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OEAsmJ4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OEAsmJ4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OEAsmJ4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OEAsmJ4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OEAsmJ4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OEAsmJ4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OEAsmJ4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OEAsmJ4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OEAsmJ4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OEAsmJ4] SET  MULTI_USER 
GO
ALTER DATABASE [OEAsmJ4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OEAsmJ4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OEAsmJ4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OEAsmJ4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OEAsmJ4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OEAsmJ4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OEAsmJ4] SET QUERY_STORE = OFF
GO
USE [OEAsmJ4]
GO

/****** Object:  Table [dbo].[Favorite]    Script Date: 8/01/2022 17:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[FavoriteID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[VideoID] [varchar](50) NOT NULL,
	[LikeDate] [date] NOT NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[FavoriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Share]    Script Date: 8/01/2022 17:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[ShareID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[VideoID] [varchar](50) NOT NULL,
	[Emails] [nvarchar](150) NOT NULL,
	[ShareDate] [date] NOT NULL,
 CONSTRAINT [PK_Share] PRIMARY KEY CLUSTERED 
(
	[ShareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/01/2022 17:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 8/01/2022 17:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[VideoID] [varchar](50) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Poster] [nvarchar](500) NOT NULL,
	[Views] [int] NOT NULL,
	[Description] [nvarchar](1500) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Users]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Videos] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Videos] ([VideoID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Videos]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK_Share_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK_Share_Users]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK_Share_Videos] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Videos] ([VideoID])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK_Share_Videos]
GO
USE [master]
GO
ALTER DATABASE [OEAsmJ4] SET  READ_WRITE 
GO