CREATE TABLE [dbo].[Table]
(
	[id] NCHAR(5) NOT NULL PRIMARY KEY,
	[Username] NCHAR(8) NOT NULL,
	[Email] NVARCHAR(255) NOT NULL, 
    [Password] NCHAR(8) NOT NULL,
	[Favcube] NCHAR(3) NOT NULL
)
