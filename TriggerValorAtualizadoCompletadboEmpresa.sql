USE smningatreinamentogrupo1

-- Criando a trigger para atualizar automaticamente
CREATE OR ALTER TRIGGER [dbo].[TRG_PREMIACAO_ATUAL]
ON Premiacao
AFTER INSERT
AS
/*
Documentação
Arquivo Fonte.....: TRG_VALOR_TOTAL.SQL
Objetivo..........: PREENCHE VALOR TOTAL COM O CALCULO DA FUNCTION 
Autor.............: ERICK ALVES
Data..............: 29/12/2023
Ex................: SELECT [dbo].[TRG_VALOR_TOTAL]
*/
	BEGIN
			
		-- Declarando variáveis
		DECLARE @IdEmpresa INT,
				@idPremicao INT,
				@IdRankingI INT,
				@valorRanking MONEY,
				@valor MONEY

		-- Recuperando dados da tabela inserida
		SET @IdEmpresa =(SELECT IdCadastroEmpresa FROM inserted)
		SET @idPremicao =(SELECT id FROM inserted)
		SET @IdRankingI = (SELECT IdRanking FROM inserted)
		SET @valorRanking = (SELECT Valor FROM Ranking WHERE id = @IdRankingI)
			
		-- Calculando o valor da premiação
		SET @valor = (SELECT [dbo].[FUNC_SALDO_PREMIACAO](@IdEmpresa, @IdRankingI));

		-- Atualizando o valor da premiação
		IF @idPremicao IS NOT NULL 
		UPDATE Premiacao
			SET PremiacaoAtual = @valor
		WHERE ID = @idPremicao;
	END
GO