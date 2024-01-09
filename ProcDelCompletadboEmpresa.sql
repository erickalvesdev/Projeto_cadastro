USE smningatreinamentogrupo1


--DELETANDO DADOS DAS TABELAS CadastroEmpresaCnae E CadastroEmpresa
CREATE OR ALTER PROC [dbo].[SP_DelCadastroCnae] (
	@IdCadastroEmpresa INT
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcDelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	03/01/2024
							DECLARE @Retorno INT
		EX...............:	EXEC [dbo].[SP_DelCadastroCnae]	@IdCadastroEmpresa = 4
							SELECT @Retorno AS Retorno
		RETORNO..........:	0 - Empresa inexistente
							1 - Deletou os Dados
							3 - Erro
	*/

	BEGIN 
		--VERIFICANDO SE A EMPRESA EXISTE
		BEGIN
		
		IF NOT EXISTS (SELECT 1 Id 
			FROM CadastroEmpresa
			WHERE Id = @IdCadastroEmpresa)
			RETURN 0

		END

		--DELETANDO REGISTROS NA TABELA CadastroEmpresaCnae
		BEGIN
		
			DELETE FROM CadastroEmpresaCnae
			WHERE IdCadastroEmpresa = @IdCadastroEmpresa

		--DELETANDO REGISTROS NA TABELA CadastroEmpresa
			DELETE FROM CadastroEmpresa
			WHERE Id = @IdCadastroEmpresa
			RETURN 2

		END

		BEGIN

			IF @@ERROR <> 0
			RETURN 3

		END
		
	END
GO

--DELETANDO DADOS DA TABELA 
CREATE OR ALTER PROC [dbo].[SP_DelCnae] (
	@IdCnae INT
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcDelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	03/01/2024
							DECLARE @Retorno INT
		EX...............:	EXEC [dbo].[SP_DelCadastroCnae]	@IdCnae = 4
							SELECT @Retorno AS Retorno
		RETORNO..........:	0 - Empresa inexistente
							1 - Deletou os Dados
							2 - Erro
	*/

	BEGIN 
		--VERIFICANDO SE A EMPRESA EXISTE
		BEGIN
		
		IF NOT EXISTS (SELECT 1 Id 
			FROM Cnae
			WHERE Id = @IdCnae)
			RETURN 0

		END

		--DELETANDO REGISTROS NA TABELA Cnae
		BEGIN
		
			DELETE FROM Cnae
			WHERE Id = @IdCnae
			RETURN 1
		END

		BEGIN

			IF @@ERROR <> 0
			RETURN 2

		END
		
	END
GO

--DELETANDO DADOS DA TABELA Ranking
CREATE OR ALTER PROC [dbo].[SP_DelRanking] (
	@IdRanking INT
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcDelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	03/01/2024
							DECLARE @Retorno INT
		EX...............:	EXEC [dbo].[SP_DelCadastroCnae]	@IdRanking = 4
							SELECT @Retorno AS Retorno
		RETORNO..........:	0 - Empresa inexistente
							1 - Deletou os Dados
							2 - Erro
	*/

	BEGIN 
		--VERIFICANDO SE A EMPRESA EXISTE
		BEGIN
		
		IF NOT EXISTS (SELECT 1 Id 
			FROM Ranking
			WHERE Id = @IdRanking)
			RETURN 0

		END

		--DELETANDO REGISTROS NA TABELA Cnae
		BEGIN
		
			DELETE FROM Ranking
			WHERE Id = @IdRanking
			RETURN 1
		END

		BEGIN

			IF @@ERROR <> 0
			RETURN 2

		END
		
	END
GO

--DELETANDO DADOS DA TABELA TipoPremiacao
CREATE OR ALTER PROC [dbo].[SP_DelTipoPremiacao] (
	@IdTipoPremiacao INT
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcDelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	03/01/2024
							DECLARE @Retorno INT
		EX...............:	EXEC [dbo].[SP_DelCadastroCnae]	@IdTipoPremiacao = 4
							SELECT @Retorno AS Retorno
		RETORNO..........:	0 - Empresa inexistente
							1 - Deletou os Dados
							2 - Erro
	*/

	BEGIN 
		--VERIFICANDO SE A EMPRESA EXISTE
		BEGIN
		
		IF NOT EXISTS (SELECT 1 Id 
			FROM TipoPremiacao
			WHERE Id = @IdTipoPremiacao)
			RETURN 0

		END

		--DELETANDO REGISTROS NA TABELA Cnae
		BEGIN
		
			DELETE FROM TipoPremiacao
			WHERE Id = @IdTipoPremiacao
			RETURN 1
		END

		BEGIN

			IF @@ERROR <> 0
			RETURN 2

		END
		
	END
GO

--DELETANDO DADOS DA TABELA TipoPremiacao
CREATE OR ALTER PROC [dbo].[SP_DelPremiacao] (
	@IdPremiacao INT
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcDelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	03/01/2024
							DECLARE @Retorno INT
		EX...............:	EXEC [dbo].[SP_DelCadastroCnae]	@IdPremiacao = 4
							SELECT @Retorno AS Retorno
		RETORNO..........:	0 - Empresa inexistente
							1 - Deletou os Dados
							2 - Erro
	*/

	BEGIN 
		--VERIFICANDO SE A EMPRESA EXISTE
		BEGIN
		
		IF NOT EXISTS (SELECT 1 Id 
			FROM Premiacao
			WHERE Id = @IdPremiacao)
			RETURN 0

		END

		--DELETANDO REGISTROS NA TABELA Cnae
		BEGIN
		
			DELETE FROM Premiacao
			WHERE Id = @IdPremiacao
			RETURN 1
		END

		BEGIN

			IF @@ERROR <> 0
			RETURN 2

		END
		
	END
GO