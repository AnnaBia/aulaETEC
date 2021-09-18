CREATE DATABASE DS1AV3;
GO

USE [DS1AV3]
GO

/****** Object:  Table [dbo].[Clientes]    Script Date: 08/11/2018 14:18:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NULL,
	[endereco] [varchar](50) NULL,
	[telefone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

Create procedure dbo.LocalizarPorNome ( @nome varchar(50) )
as
SELECT [id]
      ,[nome]
      ,[endereco]
      ,[telefone]
      ,[email]
  FROM [dbo].[Clientes]
  WHERE NOME LIKE '%' + @NOME + '%';

GO

INSERT INTO [dbo].[Clientes]
           ([nome]
           ,[endereco]
           ,[telefone]
           ,[email])
     VALUES
           ('ANA BIA'
           ,'R. JON PEDRO, 27, SAO PAULO'
           ,'114002-8922'
           ,'ana_bia@email.com')
GO

