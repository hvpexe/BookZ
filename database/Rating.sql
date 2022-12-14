USE [BookZ]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 18/7/2022 9:57:44 PM ******/
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
