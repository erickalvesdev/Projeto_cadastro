USE smningatreinamentogrupo1

--Criação da procedure de insert na tabela cadastro empresa
CREATE OR ALTER PROC [dbo].[SP_INSERT_EMPRESA](
    @RazaoSocial VARCHAR(200),
    @Cnpj VARCHAR(13),
    @NomeFantasia VARCHAR(200),
    @InscricaoEstadual BIGINT = NULL,
    @InscricaoMunicipal BIGINT,
    @Email VARCHAR(250),
	@TelefoneFixo VARCHAR(15),
	@DddTelefoneFixo VARCHAR(5)
	)

	AS

		/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE.....: ProcInsertCompletadboEmpresa.sql
		OBJETIVO..........: INSERIR DADOS NA TABELA CADASTRO EMPRESA
		AUTOR.............: ERICK ALVES
		DATA..............: 04/01/2024
		EX................:	DECLARE @Retorno INT
							EXEC @Retorno = [dbo].[SP_INSERT_EMPRESA]  @RazaoSocial = 'QRS Indústria e Comércio Ltda.', 
															@Cnpj = '901234567000789',
															@NomeFantasia = 'QRS Indústria',
															@InscricaoEstadual = NULL,
															@InscricaoMunicipal = 99887755,
															@Email = 'contato@qrsindustria.com',
															@TelefoneFixo = '45678901',
															@DddTelefoneFixo = '31'
							SELECT @Retorno AS Retorno
		RETORNO...........:	0 - Existe
							1 - Insere os dados
		*/
	BEGIN
	
		
		-- Verifica se o CNPJ já existe
			IF EXISTS (SELECT 1 Id 
				FROM CadastroEmpresa
				WHERE Cnpj = @Cnpj)
				RETURN 0

		-- Insere os dados na tabela CadastroEmpresa
			INSERT INTO CadastroEmpresa(RazaoSocial, Cnpj, NomeFantasia,
										InscricaoEstadual, InscricaoMunicipal,
										Email, TelefoneFixo, DddTelefoneFixo)
			VALUES(@RazaoSocial, @Cnpj, @NomeFantasia, CASE WHEN @InscricaoEstadual IS NOT NULL THEN @InscricaoEstadual ELSE NULL END,
					   @InscricaoMunicipal, @Email, @TelefoneFixo, @DddTelefoneFixo)
			RETURN 1
		
	END
GO

--Criada procedure para insert na tabela  CNAE
CREATE OR ALTER PROC [dbo].[SP_INSERT_CNAE](
    @Codigo VARCHAR(7),
    @Descricao VARCHAR(50)
	)
	AS
		/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE.....: ProcInsertCompletadboEmpresa.sql
		OBJETIVO..........: INSERIR DADOS NA TABELA CNAE
		AUTOR.............: ERICK ALVES
		DATA..............: 04/01/2024
		EX................:	DECLARE @Retorno INT
							EXEC @Retorno = [dbo].[SP_INSERT_CNAE]  @Codigo = '271015', @Descricao = 'Fabricação de produtos de metal.'
							SELECT @Retorno AS Retorno
		RETORNO...........:	1 - Insere os dados
							
		*/
	BEGIN

		BEGIN
			-- Insere os dados na tabela Cnae
			INSERT INTO Cnae(Codigo, Descricao)
				VALUES(@Codigo, @Descricao)
			RETURN 1
		END
	END
GO

--Criada procedure para insert na tabela CADASTRO EMPRESA CNAE
CREATE OR ALTER PROC [dbo].[SP_INSERT_CADASTRO_EMPRESA_CNAE](
        @IdCadastroEmpresa INT,
        @IdCnae INT,
        @Principal BIT
	)
	AS
		/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE.....: ProcInsertCompletadboEmpresa.sql
		OBJETIVO..........: INSERIR DADOS NA TABELA CNAE
		AUTOR.............: ERICK ALVES
		DATA..............: 04/01/2024
		EX................: DECLARE @Retorno INT;
							EXEC @Retorno = [SP_INSERT_CADASTRO_EMPRESA_CNAE] @IdCadastroEmpresa = 4, @IdCnae = 2, @Principal = 0
							SELECT @Retorno AS Retorno
		RETORNO...........:	0 - Existe
							1 - Insere os dados
		*/

	BEGIN
	
			-- Verifica se já existe uma atividade principal cadastrada para a empresa
		IF EXISTS (SELECT 1 Id 
			FROM CadastroEmpresaCnae
			WHERE IdCadastroEmpresa = @IdCadastroEmpresa
			AND Principal = 1)
			RETURN 0
	
		-- Insere os dados na tabela CadastroEmpresaCnae
			INSERT INTO CadastroEmpresaCnae(IdCadastroEmpresa, IdCnae, Principal)
				VALUES(@IdCadastroEmpresa, @IdCnae, @Principal)
			RETURN 1

	END
GO


--Criada procedure para insert na tabela RANKING
CREATE OR ALTER PROC [dbo].[SP_INSERT_RANKING](
    @Nome VARCHAR(20),
    @Valor MONEY
	)
	AS
	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE.....: ProcInsertCompletadboEmpresa.sql
	OBJETIVO..........: INSERIR DADOS NA TABELA RANKING
	AUTOR.............: ERICK ALVES
	DATA..............: 04/01/2024
						DECLARE @Retorno INT
	EX................: EXEC [SP_INSERT_RANKING] @Nome = , @Valor = 
						SELECT @Retorno AS Retorno
	RETORNO...........:	0 - Existe
						1 - Insere os dados
	*/
    
    BEGIN

		-- Verifica se o nome do ranking já existe
		IF EXISTS (SELECT 1 Id 
			FROM Ranking
			WHERE Nome = @Nome)
			RETURN 0

		-- Insere os dados na tabela Ranking
        INSERT INTO Ranking(Nome, Valor)
            VALUES(@Nome, @Valor)
		RETURN 1
    END
GO

--Criada procedure para insert na tabela Tipo de Premiacao
CREATE OR ALTER PROC [dbo].[SP_INSERT_TipoPremiacao](
    @NomePremiacao VARCHAR(50)
	)
	AS
	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE.....: ProcInsertCompletadboEmpresa.sql
	OBJETIVO..........: INSERIR DADOS NA TABELA TIPO DE PREMIAÇÃO
	AUTOR.............: ERICK ALVES
	DATA..............: 04/01/2024
						DECLARE @Retorno INT
	EX................: EXEC [SP_INSERT_TipoPremiacao] @NomePremiacao = 
						SELECT @Retorno AS Retorno
	RETORNO...........:	0 - Existe
						1 - Insere os dados
	*/

    BEGIN

		-- Verifica se o nome do tipo de premiação já existe
		IF EXISTS (SELECT 1 Id 
			FROM TipoPremiacao
			WHERE NomePremiacao = @NomePremiacao)
			RETURN 0

		-- Insere os dados na tabela TipoPremiacao
        INSERT INTO TipoPremiacao(NomePremiacao)
            VALUES(@NomePremiacao)
		RETURN 1
    END
GO

--Criada procedure para insert na tabela Premiacao
CREATE OR ALTER PROC [dbo].[SP_INSERT_Premiacao](
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
		ARQUIVO FONTE.....: ProcInsertCompletadboEmpresa.sql
		OBJETIVO..........: INSERIR DADOS NA TABELA PREMIAÇÃO
		AUTOR.............: ERICK ALVES
		DATA..............: 04/01/2024
							DECLARE @Retorno INT
		EX................: EXEC [SP_INSERT_Premiacao] @IdRanking =1 , @IdCadastroEmpresa = ,@IdTipoPremiacao = , @PremiacaoAtual = , @Mes = , @Ano =
							SELECT @Retorno AS Retorno
		RETORNO...........:	0 - Inexistente
							1 - Insere os dados
		*/
    
    BEGIN
		-- Verifica se o ID do ranking existe
		IF NOT EXISTS (SELECT 1 Id 
			FROM Ranking
			WHERE Id = @IdRanking)
			RETURN 0

		-- Verifica se o ID da empresa existe
		IF NOT EXISTS (SELECT 1 Id 
			FROM CadastroEmpresa
			WHERE Id = @IdCadastroEmpresa)
			RETURN 0

		-- Verifica se o ID do tipo de premiação existe
		IF NOT EXISTS (SELECT 1 Id 
			FROM TipoPremiacao
			WHERE Id = @IdTipoPremiacao)
			RETURN 0

		-- Insere os dados na tabela Premiacao
        INSERT INTO Premiacao(IdRanking, IdCadastroEmpresa, IdTipoPremiacao, 
                              PremiacaoAtual, Mes, Ano)
            VALUES(@IdRanking, @IdCadastroEmpresa,@IdTipoPremiacao, 
                   @PremiacaoAtual, @Mes, @Ano)
			RETURN 1
    END
GO