USE [database]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[doviz](
	[doviz_id] [dbo].[utn19_id] IDENTITY(1,1) NOT NULL,--nox
	[doviz_kod] [dbo].[uts_20] NULL,
	[ad] [dbo].[uts_25] NULL,
	[doviz_gumruk_kod] [dbo].[utn9] NULL,
	[siralama_no] [dbo].[utn9] NULL,
	[giren_user] [dbo].[utn9] NULL,
	[giris_tarih] [dbo].[utsdt] NULL,
	[duzelten_user] [dbo].[utn9] NULL,
	[duzelten_tarih] [dbo].[utsdt] NULL,
	[aktif_pasif] [dbo].[utt] NULL,
	  efatura_ihracat_iban    uts_30                           null  

 CONSTRAINT [pk_doviz] PRIMARY KEY CLUSTERED 
(
	[doviz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


