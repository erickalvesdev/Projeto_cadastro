USE smningatreinamentogrupo1

--Criada procedure para update na tabela cadastro empresa
CREATE OR ALTER PROC [dbo].[SP_UpCadastroEmpresa](
  @ID INT,
  @RazaoSocial VARCHAR(200),
  @NomeFantasia VARCHAR(200),
  @Email VARCHAR(250),
  @TelefoneFixo VARCHAR(15)
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE.....: ProcUptCompletadboEmpresa.sql
	OBJETIVO..........: ATUALIZANDO DADOS NA TABELA CADASTRO EMPRESA
	AUTOR.............: ERICK ALVES
	DATA..............: 04/01/2024
						DECLARE @Retorno INT
	EX................: EXEC @Retorno = [SP_UpCadastroEmpresa] @ID = , @RazaoSocial, @NomeFantasia,@Email, @TelefoneFixo
						SELECT @Retorno AS Retorno
	RETORNO...........: 0 - Id inexistente
						1 - Atualizado
	*/

   
 	BEGIN 
		BEGIN
			-- Verifica se o ID da empresa existe
			IF NOT EXISTS (SELECT 1 Id 
				FROM CadastroEmpresa
				WHERE Id = @ID)
				RETURN 0
		END

		BEGIN
			-- Atualiza os dados da empresa
			UPDATE CadastroEmpresa
				SET RazaoSocial = @RazaoSocial,
					NomeFantasia = @NomeFantasia,
					Email = @Email,
					TelefoneFixo = @TelefoneFixo
			WHERE ID = @ID
		
			RETURN 1
		END
	END
GO


--Criada procedure para update na tabela cadastro Cnae
CREATE OR ALTER PROC [dbo].[SP_UpCnae](
    @ID INT,
    @Codigo VARCHAR(7),
    @Descricao VARCHAR(50)
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE.....: ProcUptCompletadboEmpresa.sql
		OBJETIVO..........: ATUALIZANDO DADOS NA TABELA CADASTRO EMPRESA
		AUTOR.............: ERICK ALVES
		DATA..............: 04/01/2024
							DECLARE @Retorno INT
		EX................: EXEC @Retorono = [SP_UpCnae]  @ID, @Codigo,  @Descricao
							SELECT @Retorno AS Retorno
		RETORNO...........: 0 - Id inexistente
							1 - Atualizado
	*/

    
    BEGIN 
		-- Verifica se o ID do CNAE existe
		BEGIN
			IF NOT EXISTS (SELECT 1 Id 
			FROM Cnae
			WHERE Id = @ID)
			RETURN 0
		END

		-- Atualiza os dados do CNAE
		BEGIN
			UPDATE Cnae
				SET Codigo = @Codigo,
					Descricao = @Descricao
			WHERE ID = @ID
			RETURN 1
		END
	END
GO

--Criada procedure para update na tabela cadastro Cnae
CREATE OR ALTER PROC [dbo].[SP_UpCadastroEmpresaCnae](
    @IdCadastroEmpresa INT,
    @IdCnae INT,
    @Principal BIT
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE.....: ProcUptCompletadboEmpresa.sql
	OBJETIVO..........: ATUALIZANDO DADOS NA TABELA CADASTRO EMPRESA CNAE
	AUTOR.............: ERICK ALVES
	DATA..............: 04/01/2024
						DECLARE @Retorno INT
	EX................: EXEC @Retorno = [SP_UpCadastroEmpresaCnae]  @IdCadastroEmpresa, @IdCnae, @Principal
						SELECT @Retorno AS Retorno
	RETORNO...........: 0 - Id inexistente
						1 - Atualizado
	*/
    
    BEGIN 
		
		BEGIN
		-- Verifica se o ID da empresa existe
		IF NOT EXISTS (SELECT 1 Id 
			FROM CadastroEmpresa
			WHERE Id = @IdCadastroEmpresa)
			RETURN 0
		END

		BEGIN
		-- Verifica se o ID da empresa existe
			IF NOT EXISTS (SELECT 1 Id 
			FROM Cnae
			WHERE Id = @IdCadastroEmpresa)
			RETURN 0
		END

		BEGIN
		-- Atualiza o campo Principal da tabela CadastroEmpresaCnae
			UPDATE CadastroEmpresaCnae
				SET Principal = @Principal
			WHERE IdCadastroEmpresa  = @IdCadastroEmpresa AND IdCnae = @IdCnae
		END
	END
GO

--Criada procedure para update na tabela Ranking
CREATE OR ALTER PROC [dbo].[SP_UpRanking](
    @Id INT,
    @Nome VARCHAR(20),
    @Valor MONEY
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE.....: ProcUptCompletadboEmpresa.sql
	OBJETIVO..........: ATUALIZANDO DADOS NA TABELA CADASTRO EMPRESA CNAE
	AUTOR.............: ERICK ALVES
	DATA..............: 04/01/2024
						DECLARE @Retorno INT
	EX................: EXEC @Retorno = [SP_UpRanking]  @Id, @nome, @valor
						SELECT @Retorno AS Retorno
	RETORNO...........: 0 - Id inexistente
						1 - Atualizado
	*/
    
    BEGIN 
		BEGIN
		-- Verifica se o ID do ranking existe
			IF NOT EXISTS (SELECT 1 Id 
			FROM Cnae
			WHERE Id = @Id)
			RETURN 0
		END

		BEGIN
		-- Atualiza os dados do ranking
			UPDATE Ranking
				SET Nome = @Nome,
					Valor = @Valor
			WHERE Id  = @Id
		END
	END
GO

--Criada procedure para update na tabela tipo premiacao
CREATE OR ALTER PROC [dbo].[SP_UpTipoPremiacao](
    @Id INT,
    @NomePremiacao VARCHAR(50)
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE.....: ProcUptCompletadboEmpresa.sql
	OBJETIVO..........: ATUALIZANDO DADOS NA TABELA TIPO DE PREMIACAO
	AUTOR.............: ERICK ALVES
	DATA..............: 04/01/2024
						DECLARE @Retorno INT
	EX................: EXEC @Retorno = [SP_UpTipoPremiacao] @ID, @NomePremiacao 
						SELECT @Retorno AS Retorno
	RETORNO...........: 0 - Id inexistente
						1 - Atualizado
	*/
    
    BEGIN 
		BEGIN
		-- Verifica se o ID do tipo de premiação existe
			IF NOT EXISTS (SELECT 1 Id 
			FROM Cnae
			WHERE Id = @Id)
			RETURN 0
		END

		BEGIN
		-- Atualiza o campo NomePremiacao da tabela TipoPremiacao
			UPDATE TipoPremiacao
				SET NomePremiacao = @NomePremiacao
			WHERE Id  = @ID
		END
	END
GO

--Criada procedure para update na tabela premiacao
CREATE OR ALTER PROC [dbo].[SP_UpPremiacao](
    @Id INT,
    @IdRanking INT,
    @IdCadastroEmpresa INT,
    @IdTipoPremiacao INT,
    @PremiacaoAtual MONEY,
    @Mes TINYINT,
    @Ano SMALLINT
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE.....: ProcUptCompletadboEmpresa.sql
	OBJETIVO..........: ATUALIZANDO DADOS NA TABELA TIPO DE PREMIACAO
	AUTOR.............: ERICK ALVES
	DATA..............: 04/01/2024
	EX................: DECLARE @Retorno INT
						EXEC @Retorno = EXEC [SP_UpPremiacao] @ID, @IdRanking, @IdCadastroEmpresa, @IdTipoPremiacao, @PremiacaoAtual,
													@Mes, @Ano
						SELECT @Retorno AS Retorno
	RETORNO...........: 0 - Id inexistente
						1 - Atualizado
	*/
    
    BEGIN 
		BEGIN
		-- Verifica se o ID da premiação existe
			IF NOT EXISTS (SELECT 1 Id 
			FROM Premiacao
			WHERE Id = @ID)
			RETURN 0
		END

		BEGIN
		-- Atualiza os dados da premiação
			UPDATE Premiacao
				SET PremiacaoAtual = @PremiacaoAtual,
					Mes = @Mes,
					Ano = @Ano

			WHERE   ID = @ID AND
					IdRanking = @IdRanking AND
					IdCadastroEmpresa = @IdCadastroEmpresa AND
					IdTipoPremiacao = @IdTipoPremiacao
		END
	END
GO