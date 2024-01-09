USE smningatreinamentogrupo1

-- PROC DE SELECT PARA BUSCANDO EMPRESA
CREATE OR ALTER PROC [dbo].[SP_SelEmpresaCnae] (
	@IdCadastroEmpresa INT = NULL,
	@Cnpj VARCHAR(13) = NULL,
	@NomeFantasia VARCHAR(200) = NULL,
	@InscricaoEstadual BIGINT = NULL,
	@InscricaoMunicipal BIGINT = NULL,
	@Email VARCHAR(250) = NULL,
	@Codigo VARCHAR(7) = NULL,
	@Principal BIT = NULL

	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcSelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	05/01/2024
		EX...............:	EXEC [dbo].[SP_SelEmpresaCnae]	@Principal = 1, @IdCadastroEmpresa = NULL, @Cnpj = NULL, @NomeFantasia = NULL, @InscricaoEstadual = NULL,
															@InscricaoMunicipal = NULL, @Email = NULL, @Codigo = NULL						
	*/														
	BEGIN														  
		--Buscando dados
		SELECT TOP 10 WITH TIES ce.NomeFantasia, ce.Cnpj, ce.InscricaoEstadual, ce.InscricaoMunicipal, ce.Email,
			CONCAT(c.Codigo, ' - ', c.Descricao) AS CNAE
		FROM CadastroEmpresa ce
		JOIN CadastroEmpresaCnae cec
		ON ce.Id = cec.IdCadastroEmpresa
		JOIN Cnae c
		ON c.Id = cec.IdCnae
		WHERE	(@IdCadastroEmpresa IS NULL OR ce.Id = @IdCadastroEmpresa) AND
				(@Cnpj IS NULL OR ce.Cnpj = @Cnpj) AND
				(@NomeFantasia IS NULL OR ce.NomeFantasia = @NomeFantasia) AND
				(@InscricaoEstadual IS NULL OR ce.InscricaoEstadual = @InscricaoEstadual) AND
				(@InscricaoMunicipal IS NULL OR ce.InscricaoMunicipal = @InscricaoMunicipal) AND
				(@Email IS NULL OR ce.Email = @Email) AND
				(@Codigo IS NULL OR c.Codigo = @Codigo) AND
				(@Principal IS NULL OR cec.Principal = @Principal) AND
				(cec.Principal = 1)
		ORDER BY ce.Id
		

	END
GO



-- PROC DE SELECT TABELA CadastroEmpresa
CREATE OR ALTER PROC [dbo].[SP_SelCadastroEmpresa] (
	@IdCadastroEmpresa INT = NULL,
	@Cnpj VARCHAR(13) = NULL,
	@NomeFantasia VARCHAR(200) = NULL,
	@InscricaoEstadual BIGINT = NULL,
	@InscricaoMunicipal BIGINT = NULL,
	@Email VARCHAR(250) = NULL,
	@RazaoSocial VARCHAR(200) = NULL,
	@TelefoneFixo VARCHAR(15) = NULL,
	@DddTelefoneFixo VARCHAR(5) = NULL

	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcSelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	05/01/2024
		EX...............:	EXEC [dbo].[SP_SelCadastroEmpresa]	@IdCadastroEmpresa = 4
	*/

	BEGIN
		--Buscando dados
		SELECT NomeFantasia, Cnpj, InscricaoEstadual, InscricaoMunicipal, Email,
			RazaoSocial, CONCAT('(',DddTelefoneFixo,')', ' - ', TelefoneFixo) AS TelefoneFixo
		FROM CadastroEmpresa ce
		WHERE	(@IdCadastroEmpresa IS NULL OR Id = @IdCadastroEmpresa) AND
				(@Cnpj IS NULL OR Cnpj = @Cnpj) AND
				(@NomeFantasia IS NULL OR NomeFantasia = @NomeFantasia) AND
				(@InscricaoEstadual IS NULL OR InscricaoEstadual = @InscricaoEstadual) AND
				(@InscricaoMunicipal IS NULL OR InscricaoMunicipal = @InscricaoMunicipal) AND
				(@Email IS NULL OR Email = @Email) AND
				(@RazaoSocial IS NULL OR RazaoSocial = @RazaoSocial) AND
				(@TelefoneFixo IS NULL OR TelefoneFixo = @TelefoneFixo) AND
				(@DddTelefoneFixo IS NULL OR DddTelefoneFixo = @DddTelefoneFixo)
	END
GO

-- PROC DE SELECT TABELA Cnae
CREATE OR ALTER PROC [dbo].[SP_SelCnae] (
	@IdCnae INT = NULL,
	@Codigo VARCHAR(7) = NULL,
	@Descricao VARCHAR(50) = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcSelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	05/01/2024
		EX...............:	EXEC [dbo].[SP_SelCnae]	@IdCnae = 4, @Codigo = , @Descricao
	*/

	BEGIN
		--Buscando dados
		SELECT Codigo, Descricao
		FROM Cnae
		WHERE	(@IdCnae IS NULL OR Id = @IdCnae) AND
				(@Codigo IS NULL OR Codigo = @Codigo) AND
				(@Descricao IS NULL OR Descricao = @Descricao) 

	END
GO

-- PROC DE SELECT TABELA CadastroEmpresaCnae
CREATE OR ALTER PROC [dbo].[SP_SelCadastroEmpresaCnae] (
	@IdCadastroEmpresa INT = NULL,
	@IdCnae INT = NULL,
	@Principal BIT = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcSelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	05/01/2024
		EX...............:	EXEC [dbo].[SP_SelCadastroEmpresaCnae]	@IdCnae = 4, @Codigo = , @Descricao
	
	*/

	BEGIN
		--Buscando dados
		SELECT IdCadastroEmpresa, IdCnae, Principal
		FROM CadastroEmpresaCnae
		WHERE	(@IdCadastroEmpresa IS NULL OR IdCadastroEmpresa = @IdCadastroEmpresa) AND
				(@IdCnae IS NULL OR IdCnae = @IdCnae) AND
				(@Principal IS NULL OR Principal = @Principal) 

	END
GO

-- PROC DE SELECT TABELA Ranking
CREATE OR ALTER PROC [dbo].[SP_SelRanking] (
	@IdRanking INT = NULL,
	@Nome VARCHAR(20) = NULL,
	@Valor MONEY = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcSelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	05/01/2024
		EX...............:	EXEC [dbo].[SP_SelRanking]	@Id = , @Nome = , @Valor = 
	
	*/

	BEGIN
		--Buscando dados
		SELECT Id, Nome, Valor
		FROM Ranking
		WHERE	(@IdRanking IS NULL OR Id = @IdRanking) AND
				(@Nome IS NULL OR Nome = @Nome) AND
				(@Valor IS NULL OR Valor = @Valor) 

	END
GO

-- PROC DE SELECT TABELA TipoPremiacao
CREATE OR ALTER PROC [dbo].[SP_SelTipoPremiacao] (
	@IdTipoPremiacao INT = NULL,
	@NomePremiacao VARCHAR(50) = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcSelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	05/01/2024
		EX...............:	EXEC [dbo].[SP_SelTipoPremiacao]	@Id = , @NomePremiacao = 
	
	*/

	BEGIN
		--Buscando dados
		SELECT Id, NomePremiacao
		FROM TipoPremiacao
		WHERE	(@IdTipoPremiacao IS NULL OR Id = @IdTipoPremiacao) AND
				(@NomePremiacao IS NULL OR NomePremiacao = @NomePremiacao)

	END
GO

-- PROC DE SELECT TABELA TipoPremiacao
CREATE OR ALTER PROC [dbo].[SP_SelPremiacao] (
	@IdPremiacao INT = NULL,
	@IdRanking INT = NULL,
	@IdCadastroEmpresa INT = NULL,
	@IdTipoPremiacao INT = NULL,
	@PremiacaoAtual MONEY = NULL,
	@Mes TINYINT = NULL,
	@Ano SMALLINT = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....:	ProcSelCompletadboEmpresa.sql
		OBJETIVO.........:	INSERIR DADOS NA TABELA LIVRO.
		AUTOR............:	SMN - JOÃO EMANOEL
		DATA.............:	05/01/2024
		EX...............:	EXEC [dbo].[SP_SelPremiacao]	@Id = NULL, @IdRanking = NULL, @IdCadastroEmpresa = NULL, @IdTipoPremiacao = NULL, @PremiacaoAtual = NULL, @Mes = NULL, @Ano = NULL
		
	
	*/

	BEGIN
		--Buscando dados
		SELECT TOP 10 WITH TIES Id, IdRanking, IdCadastroEmpresa, IdTipoPremiacao, PremiacaoAtual, Mes, Ano
		FROM Premiacao
		WHERE	(@IdPremiacao IS NULL OR Id = @IdPremiacao) AND
				(@IdRanking IS NULL OR IdRanking = @IdRanking) AND
				(@IdCadastroEmpresa IS NULL OR IdCadastroEmpresa = @IdCadastroEmpresa) AND
				(@IdTipoPremiacao IS NULL OR IdTipoPremiacao = @IdTipoPremiacao) AND
				(@PremiacaoAtual IS NULL OR PremiacaoAtual = @PremiacaoAtual) AND
				(@Mes IS NULL OR Mes = @Mes) AND
				(@Ano IS NULL OR Ano = @Ano) 
		ORDER BY Id
	END
GO