USE smningatreinamentogrupo1

-- Function para calcular o saldo da premiacao
CREATE OR ALTER FUNCTION [DBO].[FUNC_SALDO_PREMIACAO] (
    @ID_CadastroEmpresa INT,
    @IdRankingI INT
) 
		RETURNS MONEY
AS
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: FUNC_SALDO_PREMIACAO.SQL
OBJETIVO..........: CALCULAR A PREMIACAO
AUTOR.............: SMN - ERICK ALVES
DATA..............: 05/01/2024
EX................: SELECT [DBO].[FUNC_SALDO_PREMIACAO](4, 6)
*/

	BEGIN  
		--Declarando variáveis
        DECLARE	@RESULTADO MONEY,
				@VALOR_ATUAL MONEY,
				@Valor MONEY

		-- Atribui o valor da premiação atual da empresa à variável @VALOR_ATUAL
        SET @VALOR_ATUAL = (SELECT TOP 1 PremiacaoAtual
            FROM Premiacao
				WHERE IdCadastroEmpresa = @ID_CadastroEmpresa
				AND Mes <= (SELECT MAX(Mes) FROM Premiacao WHERE IdCadastroEmpresa = @ID_CadastroEmpresa)
				AND Ano = (SELECT MAX(Ano) FROM Premiacao WHERE IdCadastroEmpresa = @ID_CadastroEmpresa) 
				AND PremiacaoAtual IS NOT NULL ORDER BY Id DESC )

		-- Atribui o valor da premiação do ranking especificado à variável @Valor
		SET @Valor = (SELECT Valor FROM Ranking WHERE Id = @IdRankingI)

		-- Verifica se o valor atual da premiação é NULL
		IF @VALOR_ATUAL IS NULL
			SET @RESULTADO = @Valor
		ELSE 
			SET @RESULTADO = @Valor + @VALOR_ATUAL
		
	
	RETURN @RESULTADO
	END
GO