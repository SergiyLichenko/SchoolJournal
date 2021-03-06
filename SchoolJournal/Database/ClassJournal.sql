/****** Объект:  ForeignKey [FK_Classes_Subjects_Classes]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Classes_Subjects_Classes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Classes_Subjects]'))
ALTER TABLE [dbo].[Classes_Subjects] DROP CONSTRAINT [FK_Classes_Subjects_Classes]
GO
/****** Объект:  ForeignKey [FK_Classes_Subjects_Subjects]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Classes_Subjects_Subjects]') AND parent_object_id = OBJECT_ID(N'[dbo].[Classes_Subjects]'))
ALTER TABLE [dbo].[Classes_Subjects] DROP CONSTRAINT [FK_Classes_Subjects_Subjects]
GO
/****** Объект:  ForeignKey [FK_Marks_Peoples]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Marks_Peoples]') AND parent_object_id = OBJECT_ID(N'[dbo].[Marks]'))
ALTER TABLE [dbo].[Marks] DROP CONSTRAINT [FK_Marks_Peoples]
GO
/****** Объект:  ForeignKey [FK_Marks_Subjects]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Marks_Subjects]') AND parent_object_id = OBJECT_ID(N'[dbo].[Marks]'))
ALTER TABLE [dbo].[Marks] DROP CONSTRAINT [FK_Marks_Subjects]
GO
/****** Объект:  ForeignKey [FK_Peoples_Classes]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Peoples_Classes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Peoples]'))
ALTER TABLE [dbo].[Peoples] DROP CONSTRAINT [FK_Peoples_Classes]
GO
/****** Объект:  ForeignKey [FK_Subjects_Teachers]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subjects_Teachers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subjects]'))
ALTER TABLE [dbo].[Subjects] DROP CONSTRAINT [FK_Subjects_Teachers]
GO
/****** Объект:  StoredProcedure [dbo].[GetTeachersSubjects]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTeachersSubjects]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTeachersSubjects]
GO
/****** Объект:  StoredProcedure [dbo].[GetClassesBySubject]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetClassesBySubject]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetClassesBySubject]
GO
/****** Объект:  StoredProcedure [dbo].[GetTeachersSubjectsClasses]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTeachersSubjectsClasses]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTeachersSubjectsClasses]
GO
/****** Объект:  Table [dbo].[Classes_Subjects]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Classes_Subjects]') AND type in (N'U'))
DROP TABLE [dbo].[Classes_Subjects]
GO
/****** Объект:  Table [dbo].[Marks]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marks]') AND type in (N'U'))
DROP TABLE [dbo].[Marks]
GO
/****** Объект:  Table [dbo].[Peoples]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Peoples]') AND type in (N'U'))
DROP TABLE [dbo].[Peoples]
GO
/****** Объект:  Table [dbo].[Subjects]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subjects]') AND type in (N'U'))
DROP TABLE [dbo].[Subjects]
GO
/****** Объект:  Table [dbo].[Classes]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Classes]') AND type in (N'U'))
DROP TABLE [dbo].[Classes]
GO
/****** Объект:  StoredProcedure [dbo].[GetMonthSubjectClassesMarks]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetMonthSubjectClassesMarks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetMonthSubjectClassesMarks]
GO
/****** Объект:  Table [dbo].[Teachers]    Дата сценария: 09/01/2009 22:27:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Teachers]') AND type in (N'U'))
DROP TABLE [dbo].[Teachers]
GO
/****** Объект:  Table [dbo].[Teachers]    Дата сценария: 09/01/2009 22:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Teachers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Teachers](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[password] [text] COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Teachers] ([ID], [Name], [password]) VALUES (N'00000000-0000-0000-0000-000000000001', N'Мария Ивановна', N'1')
INSERT [dbo].[Teachers] ([ID], [Name], [password]) VALUES (N'00000000-0000-0000-0000-000000000002', N'Жанна Валерьевна', N'2')
INSERT [dbo].[Teachers] ([ID], [Name], [password]) VALUES (N'00000000-0000-0000-0000-000000000003', N'Ольга Петровна', N'3')
INSERT [dbo].[Teachers] ([ID], [Name], [password]) VALUES (N'00000000-0000-0000-0000-000000000004', N'Валентина Николаевна', N'4')
/****** Объект:  StoredProcedure [dbo].[GetMonthSubjectClassesMarks]    Дата сценария: 09/01/2009 22:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetMonthSubjectClassesMarks]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetMonthSubjectClassesMarks]
(
	@className NVARCHAR(50),
	@subjectName NVARCHAR(50),
	@month Integer,
	@year Integer 
)

AS
DECLARE @MAIN_QUERY nvarchar(4000) 
Set @MAIN_QUERY=''[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
          [11],[12],[13],[14],[15],[16],[17],[18],[19],[20],
          [21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31]
from(
SELECT peopleName=(
					SELECT [name] FROM Peoples where [id]=people_ID),
					[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
					[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],
					[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31]
		FROM 
		(
			SELECT date_today,people_ID,mark=case when mark is null then CHAR(32) else cast(mark as varchar) end 
			FROM(
					SELECT 6*(we-1) + md AS date_today 
					FROM 
						(
							SELECT 1 we UNION ALL SELECT 2 UNION ALL SELECT 3 
							UNION ALL SELECT 4 UNION ALL SELECT 5 union all select 6
						) 
					temp1 CROSS JOIN
						(
							SELECT 1 md UNION ALL SELECT 2 UNION ALL SELECT 3 
							UNION ALL SELECT 4 UNION ALL SELECT 5 union all select 6
						)	
					temp2 WHERE 6*(we-1) + md <= 31)TempTab1 CROSS JOIN
						(
						SELECT peoples.[id] as people_ID from Peoples
						INNER JOIN Classes 
						ON Peoples.[classID]=Classes.[id] 
						AND Classes.[name]=''''''+cast(@className as varchar)+'''''')TempTab2
					LEFT JOIN
						(
							SELECT * from Marks inner join Subjects on Marks.subjectID=Subjects.[id]
							WHERE Subjects.[name]=''''''+cast(@subjectName as varchar)+'''''')TempTab3 
				 ON TempTab3.[peopleID]=TempTab2.people_ID and month([DateMark])=''+cast(@month as varchar)+'' and
				year([DateMark])=''+cast(@year as varchar)+'' and day([dateMark])=TempTab1.date_today)
		P PIVOT
		(
		max(mark)
		FOR date_today IN
		( [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],
		  [18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31] )
		) AS pvt)Q
		order by peopleName''

EXEC(''SELECT peopleName as [''+@subjectName+''], ''+@MAIN_QUERY)

' 
END
GO
/****** Объект:  Table [dbo].[Classes]    Дата сценария: 09/01/2009 22:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Classes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Classes](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](5) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Classes] ([ID], [Name]) VALUES (N'00000000-0000-0000-0000-000000000001', N'1-А')
INSERT [dbo].[Classes] ([ID], [Name]) VALUES (N'00000000-0000-0000-0000-000000000002', N'2-А')
INSERT [dbo].[Classes] ([ID], [Name]) VALUES (N'00000000-0000-0000-0000-000000000003', N'3-А')
INSERT [dbo].[Classes] ([ID], [Name]) VALUES (N'00000000-0000-0000-0000-000000000004', N'4-А')
INSERT [dbo].[Classes] ([ID], [Name]) VALUES (N'00000000-0000-0000-0000-000000000005', N'11-А')
/****** Объект:  Table [dbo].[Subjects]    Дата сценария: 09/01/2009 22:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subjects]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Subjects](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[TeacherID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Subjects] ([ID], [Name], [TeacherID]) VALUES (N'00000000-0000-0000-0000-000000000001', N'Математика', N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[Subjects] ([ID], [Name], [TeacherID]) VALUES (N'00000000-0000-0000-0000-000000000002', N'Литература', N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[Subjects] ([ID], [Name], [TeacherID]) VALUES (N'00000000-0000-0000-0000-000000000003', N'Физкультура', N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[Subjects] ([ID], [Name], [TeacherID]) VALUES (N'00000000-0000-0000-0000-000000000004', N'Рисование', N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[Subjects] ([ID], [Name], [TeacherID]) VALUES (N'00000000-0000-0000-0000-000000000005', N'Физика', N'00000000-0000-0000-0000-000000000001')
/****** Объект:  Table [dbo].[Peoples]    Дата сценария: 09/01/2009 22:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Peoples]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Peoples](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[ClassID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Peoples_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Peoples] ([ID], [Name], [ClassID]) VALUES (N'00000000-0000-0000-0000-000000000001', N'Петя', N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[Peoples] ([ID], [Name], [ClassID]) VALUES (N'00000000-0000-0000-0000-000000000002', N'Ваня', N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[Peoples] ([ID], [Name], [ClassID]) VALUES (N'00000000-0000-0000-0000-000000000003', N'Рома', N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[Peoples] ([ID], [Name], [ClassID]) VALUES (N'00000000-0000-0000-0000-000000000004', N'Вика', N'00000000-0000-0000-0000-000000000002')
INSERT [dbo].[Peoples] ([ID], [Name], [ClassID]) VALUES (N'00000000-0000-0000-0000-000000000005', N'Лена', N'00000000-0000-0000-0000-000000000002')
INSERT [dbo].[Peoples] ([ID], [Name], [ClassID]) VALUES (N'00000000-0000-0000-0000-000000000006', N'Славик', N'00000000-0000-0000-0000-000000000002')
INSERT [dbo].[Peoples] ([ID], [Name], [ClassID]) VALUES (N'00000000-0000-0000-0000-000000000007', N'Алексей', N'00000000-0000-0000-0000-000000000003')
INSERT [dbo].[Peoples] ([ID], [Name], [ClassID]) VALUES (N'00000000-0000-0000-0000-000000000008', N'Марина', N'00000000-0000-0000-0000-000000000003')
/****** Объект:  Table [dbo].[Marks]    Дата сценария: 09/01/2009 22:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Marks](
	[PeopleID] [uniqueidentifier] NOT NULL,
	[SubjectID] [uniqueidentifier] NOT NULL,
	[DateMark] [datetime] NOT NULL,
	[Mark] [tinyint] NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[PeopleID] ASC,
	[SubjectID] ASC,
	[DateMark] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000001', CAST(0x0000901A00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000001', CAST(0x00009C7B00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000001', CAST(0x00009C7C00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000001', CAST(0x00009C7D00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000001', CAST(0x00009C7E00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x0000901A00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7700000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7800000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7900000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7A00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7B00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7C00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7D00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7E00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7F00000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8000000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8100000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8200000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8300000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8400000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8500000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8600000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8700000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8800000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8900000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8A00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8B00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8C00000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8D00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8E00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8F00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C9000000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C9100000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C9200000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000003', CAST(0x0000901A00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000003', CAST(0x00009C7C00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000003', CAST(0x00009C7E00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000003', CAST(0x00009C8200000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000001', CAST(0x0000901B00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000001', CAST(0x00009C7A00000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000001', CAST(0x00009C7B00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000001', CAST(0x00009C7D00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7700000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7800000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7900000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7A00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7B00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7C00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7D00000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7E00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7F00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8000000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8100000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8200000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8300000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8400000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8500000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8600000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8700000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8800000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8900000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8A00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8B00000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8C00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8D00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8F00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C9000000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000003', CAST(0x00009C7900000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000003', CAST(0x00009C7E00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000001', CAST(0x00009C7B00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000001', CAST(0x00009C7D00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000001', CAST(0x00009C8400000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7700000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7800000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7900000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7A00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7B00000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7C00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7D00000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7E00000000 AS DateTime), 2)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C7F00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8000000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8100000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8200000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8300000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8400000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8500000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8600000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8700000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8800000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8900000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8A00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8B00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8C00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8D00000000 AS DateTime), 4)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C8E00000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000002', CAST(0x00009C9200000000 AS DateTime), 5)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000004', N'00000000-0000-0000-0000-000000000003', CAST(0x00009C7F00000000 AS DateTime), 3)
INSERT [dbo].[Marks] ([PeopleID], [SubjectID], [DateMark], [Mark]) VALUES (N'00000000-0000-0000-0000-000000000005', N'00000000-0000-0000-0000-000000000003', CAST(0x00009C7E00000000 AS DateTime), 4)
/****** Объект:  Table [dbo].[Classes_Subjects]    Дата сценария: 09/01/2009 22:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Classes_Subjects]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Classes_Subjects](
	[ClassID] [uniqueidentifier] NOT NULL,
	[SubjectsID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Classes_Subjects] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[SubjectsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Classes_Subjects] ([ClassID], [SubjectsID]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[Classes_Subjects] ([ClassID], [SubjectsID]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000002')
INSERT [dbo].[Classes_Subjects] ([ClassID], [SubjectsID]) VALUES (N'00000000-0000-0000-0000-000000000001', N'00000000-0000-0000-0000-000000000003')
INSERT [dbo].[Classes_Subjects] ([ClassID], [SubjectsID]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[Classes_Subjects] ([ClassID], [SubjectsID]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000002')
INSERT [dbo].[Classes_Subjects] ([ClassID], [SubjectsID]) VALUES (N'00000000-0000-0000-0000-000000000002', N'00000000-0000-0000-0000-000000000003')
INSERT [dbo].[Classes_Subjects] ([ClassID], [SubjectsID]) VALUES (N'00000000-0000-0000-0000-000000000003', N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[Classes_Subjects] ([ClassID], [SubjectsID]) VALUES (N'00000000-0000-0000-0000-000000000004', N'00000000-0000-0000-0000-000000000002')
INSERT [dbo].[Classes_Subjects] ([ClassID], [SubjectsID]) VALUES (N'00000000-0000-0000-0000-000000000004', N'00000000-0000-0000-0000-000000000003')
INSERT [dbo].[Classes_Subjects] ([ClassID], [SubjectsID]) VALUES (N'00000000-0000-0000-0000-000000000005', N'00000000-0000-0000-0000-000000000005')
/****** Объект:  StoredProcedure [dbo].[GetTeachersSubjectsClasses]    Дата сценария: 09/01/2009 22:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTeachersSubjectsClasses]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetTeachersSubjectsClasses]

	@teachID UniqueIdentifier
	
AS
	SELECT * FROM Classes WHERE ID IN
	(
		SELECT ClassID FROM Classes_Subjects WHERE SubjectsID IN
		(
			SELECT ID FROM Subjects WHERE TeacherID = @teachID
		)
	)
	RETURN' 
END
GO
/****** Объект:  StoredProcedure [dbo].[GetClassesBySubject]    Дата сценария: 09/01/2009 22:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetClassesBySubject]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetClassesBySubject]
	
@subjectID UniqueIdentifier
	
AS
	SELECT * FROM Classes WHERE ID IN
	(
		SELECT ClassID FROM Classes_Subjects WHERE SubjectsID = @subjectID
	)
	RETURN' 
END
GO
/****** Объект:  StoredProcedure [dbo].[GetTeachersSubjects]    Дата сценария: 09/01/2009 22:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTeachersSubjects]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetTeachersSubjects]
	
	@teachID UniqueIdentifier
	
AS
	SELECT * FROM Subjects WHERE TeacherID = @teachID
	
	RETURN' 
END
GO
/****** Объект:  ForeignKey [FK_Classes_Subjects_Classes]    Дата сценария: 09/01/2009 22:27:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Classes_Subjects_Classes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Classes_Subjects]'))
ALTER TABLE [dbo].[Classes_Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Classes_Subjects_Classes] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ID])
GO
ALTER TABLE [dbo].[Classes_Subjects] CHECK CONSTRAINT [FK_Classes_Subjects_Classes]
GO
/****** Объект:  ForeignKey [FK_Classes_Subjects_Subjects]    Дата сценария: 09/01/2009 22:27:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Classes_Subjects_Subjects]') AND parent_object_id = OBJECT_ID(N'[dbo].[Classes_Subjects]'))
ALTER TABLE [dbo].[Classes_Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Classes_Subjects_Subjects] FOREIGN KEY([SubjectsID])
REFERENCES [dbo].[Subjects] ([ID])
GO
ALTER TABLE [dbo].[Classes_Subjects] CHECK CONSTRAINT [FK_Classes_Subjects_Subjects]
GO
/****** Объект:  ForeignKey [FK_Marks_Peoples]    Дата сценария: 09/01/2009 22:27:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Marks_Peoples]') AND parent_object_id = OBJECT_ID(N'[dbo].[Marks]'))
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Peoples] FOREIGN KEY([PeopleID])
REFERENCES [dbo].[Peoples] ([ID])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Peoples]
GO
/****** Объект:  ForeignKey [FK_Marks_Subjects]    Дата сценария: 09/01/2009 22:27:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Marks_Subjects]') AND parent_object_id = OBJECT_ID(N'[dbo].[Marks]'))
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([ID])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Subjects]
GO
/****** Объект:  ForeignKey [FK_Peoples_Classes]    Дата сценария: 09/01/2009 22:27:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Peoples_Classes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Peoples]'))
ALTER TABLE [dbo].[Peoples]  WITH CHECK ADD  CONSTRAINT [FK_Peoples_Classes] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ID])
GO
ALTER TABLE [dbo].[Peoples] CHECK CONSTRAINT [FK_Peoples_Classes]
GO
/****** Объект:  ForeignKey [FK_Subjects_Teachers]    Дата сценария: 09/01/2009 22:27:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Subjects_Teachers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Subjects]'))
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([ID])
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Teachers]
GO
