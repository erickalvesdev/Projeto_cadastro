CREATE FUNCTION [DBO].[FUNC_SALDO_PREMIACAO] (
                @ID_CadastroEmpresa INT,
                ) 
		RETURNS INT
AS
/*
DOCUMENTAÇÃO
ARQUIVO FONTE.....: FUNC_SALDO_PREMIACAO.SQL
OBJETIVO..........: CALCULAR A PREMIACAO
AUTOR.............: SMN - ERICK ALVES
DATA..............: 05/01/2024
EX................: SELECT [DBO].[FUNC_SALDO_PREMIACAO](1)
*/
    BEGIN
        DECLARE @VALOR_ATUAL DECIMAL(10,2)
        DECLARE @NOVO_VALOR DECIMAL(10,2)
        DECLARE @NOVO_VALOR_PREMIAÇÃO(10,2)


        SELECT @VALOR_ATUAL = PremiacaoAtual,
            FROM Premiacao
        WHERE ID_CadastroEmpresa = @ID_CadastroEmpresa AND PremiacaoAtual IS NOT NULL
        ORDER BY ID, Mes, Ano DESC

        IF @VALOR_ATUAL IS NULL 
        SET @VALOR_ATUAL = 0

        SELECT @NOVO_VALOR = R.Valor
            FROM Ranking R
            INNER JOIN Premiacao P ON R.ID = P.IdRanking
        WHERE ID_CadastroEmpresa = @ID_CadastroEmpresa
        ORDER BY P.ID DESC

        SET @NOVO_VALOR_PREMIAÇÃO = @VALOR_ATUAL + @NOVO_VALOR
        RETURN @NOVO_VALOR_PREMIAÇÃO

    END
GO