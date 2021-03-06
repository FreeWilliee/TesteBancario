USE [master]
GO
/****** Object:  Database [Login]    Script Date: 11/19/2021 12:13:16 ******/
CREATE DATABASE [Login] ON  PRIMARY 
( NAME = N'Login', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Login.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Login_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Login_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Login] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Login].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Login] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Login] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Login] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Login] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Login] SET ARITHABORT OFF
GO
ALTER DATABASE [Login] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Login] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Login] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Login] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Login] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Login] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Login] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Login] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Login] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Login] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Login] SET  DISABLE_BROKER
GO
ALTER DATABASE [Login] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Login] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Login] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Login] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Login] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Login] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Login] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Login] SET  READ_WRITE
GO
ALTER DATABASE [Login] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Login] SET  MULTI_USER
GO
ALTER DATABASE [Login] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Login] SET DB_CHAINING OFF
GO
USE [Login]
GO
/****** Object:  Table [dbo].[Cadastro]    Script Date: 11/19/2021 12:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cadastro](
	[ID_Cadastro] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Rua] [varchar](50) NOT NULL,
	[Bairro] [varchar](50) NOT NULL,
	[Cep] [varchar](50) NOT NULL,
	[Numero] [int] NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[RG] [varchar](11) NOT NULL,
	[CPF] [varchar](16) NOT NULL,
	[DTNascimento] [varchar](50) NULL,
	[UF] [char](2) NOT NULL,
	[Telefone] [varchar](50) NULL,
	[celular] [varchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Cadastro] PRIMARY KEY CLUSTERED 
(
	[ID_Cadastro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 11/19/2021 12:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIO](
	[USU_NOME] [varchar](40) NOT NULL,
	[USU_SENHA] [varchar](40) NOT NULL,
	[USU_ID] [int] NULL,
 CONSTRAINT [PK_USUARIO_1] PRIMARY KEY CLUSTERED 
(
	[USU_NOME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Conta]    Script Date: 11/19/2021 12:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Conta](
	[id_conta] [int] NOT NULL,
	[ID_Cadastro] [int] NULL,
	[Agencia] [int] NULL,
	[banco] [varchar](50) NULL,
 CONSTRAINT [PK_Conta] PRIMARY KEY CLUSTERED 
(
	[id_conta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usu]    Script Date: 11/19/2021 12:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usu]
		@acao int,
		@ID_Cadastro int = null,
		@Nome varchar(50) = null,
		@Rua varchar(50) = null,
		@Bairro Varchar(50) = null,
		@Cep Varchar (50) = null,
		@Numero int = null,
		@Cidade Varchar(50) = null,
		@RG Varchar(11) = null,
		@CPF varchar(16) = null,
		@DTNascimento varchar(50) = null,
		@UF varchar(2) = null,
		@Telefone varchar(50) = null,
		@celular varchar(50) = null,
		@email varchar(50) = null		
as

begin
	
	if(@acao = 0)
	begin
		delete from Cadastro
		where ID_Cadastro = @ID_Cadastro
		select @ID_Cadastro as retorno
	end
	if(@acao = 1)
	begin
		insert into Cadastro (Nome, Rua, Bairro, Cep, Numero, Cidade, RG, CPF, DTNascimento, UF, Telefone, celular, email)
		values (@Nome, @Rua, @Bairro, @Cep, @Numero, @Cidade, @RG, @CPF, @DTNascimento, @UF, @Telefone, @celular, @email)
		
		select @@IDENTITY as retorno
	end
	if(@acao = 2)
	begin
		update Cadastro
		set Nome = @Nome, Rua = @Rua, Bairro = @Bairro, Cep = @Cep, Numero = @Numero, Cidade = @Cidade, RG = @RG, CPF = @CPF, DTNascimento = @DTNascimento, UF = @UF, Telefone = @Telefone, celular = @celular, email = @email 
		where ID_Cadastro = @ID_Cadastro
		
		select @ID_Cadastro as retorno
	end
	else
	begin
		raiserror('Ação não implementada', 14,1);
end
end
GO
/****** Object:  Table [dbo].[Mov]    Script Date: 11/19/2021 12:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mov](
	[id_conta] [int] NULL,
	[Agencia] [int] NULL,
	[banco] [varchar](50) NULL,
	[descricao] [varchar](100) NULL,
	[data] [datetime] NULL,
	[entrada] [decimal](10, 2) NULL,
	[saida] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[dnvUPDATE]    Script Date: 11/19/2021 12:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dnvUPDATE]
	@i int,
	@id int,
	@banco varchar(50) = null,
	@agencia int = null
AS
BEGIN
		if (@i = 0)
	begin
		update Mov
		set banco = @banco, Agencia = @agencia
		where id_conta = @id
	
			update Conta
			set banco = @banco, Agencia = @agencia
			where id_conta = @id
	end

END
GO
/****** Object:  StoredProcedure [dbo].[CadCon]    Script Date: 11/19/2021 12:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CadCon]
		@con int,
		@id_conta int = null,
		@ID_Cadastro int = null,
		@Agencia int = null,
		@banco Varchar(50) = null,
		@descricao varchar(100) = null,
		@data datetime = null,
		@entrada decimal(10,2) = null,
		@saida decimal(10,2) = null,
		@total decimal(10,2) = null
				
as
begin
	
	if(@con = 0)
	begin
		delete from Mov where id_conta = @id_conta
		select @id_conta as retorno
		delete from Conta where id_conta = @id_conta
		select @id_conta as retorno
	end
	if(@con = 1)
	begin
		insert into Conta (id_conta, ID_Cadastro)
		values (@id_conta, @ID_Cadastro)
    end
    IF (@con = 3)
    begin
		select a.id_conta, a.id_Cadastro, b.id_conta, b.agencia, b.banco, b.descricao, b.data, b.entrada, b.saida, b.total
		from Conta as a, Mov as b
		where b.id_conta = a.id_conta and b.id_conta = a.ID_Cadastro
		
		insert into Mov (id_conta, Agencia, banco, descricao, data,entrada ,saida ,total)
		values (@id_conta, @Agencia, @banco, @descricao, @data,@entrada ,@saida ,@total)
		 
		update Mov
		set total = @total
		where id_conta = @id_conta
	end

end
GO
/****** Object:  ForeignKey [FK_IDCadastro_IDCadastro]    Script Date: 11/19/2021 12:13:17 ******/
ALTER TABLE [dbo].[Conta]  WITH CHECK ADD  CONSTRAINT [FK_IDCadastro_IDCadastro] FOREIGN KEY([ID_Cadastro])
REFERENCES [dbo].[Cadastro] ([ID_Cadastro])
GO
ALTER TABLE [dbo].[Conta] CHECK CONSTRAINT [FK_IDCadastro_IDCadastro]
GO
/****** Object:  ForeignKey [fk_mov_con]    Script Date: 11/19/2021 12:13:19 ******/
ALTER TABLE [dbo].[Mov]  WITH CHECK ADD  CONSTRAINT [fk_mov_con] FOREIGN KEY([id_conta])
REFERENCES [dbo].[Conta] ([id_conta])
GO
ALTER TABLE [dbo].[Mov] CHECK CONSTRAINT [fk_mov_con]
GO
