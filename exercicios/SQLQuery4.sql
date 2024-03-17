-- Criação do banco de dados fictício "Vendas"
CREATE DATABASE Vendas;
USE Vendas;

-- Criação da tabela "Compras"
CREATE TABLE Compras (
    IDCompra INT PRIMARY KEY,
    DataCompra DATE,
    Produto VARCHAR(100),
    Quantidade INT
);

-- Inserção de dados de exemplo
INSERT INTO Compras (IDCompra, DataCompra, Produto, Quantidade)
VALUES
    (1, '2024-03-17', 'Produto A', 10),
    (2, '2024-03-17', 'Produto B', 5),
    (3, '2024-03-18', 'Produto A', 8),
    (4, '2024-03-18', 'Produto C', 12);


-- Criação da procedure para levantamento diário
CREATE PROCEDURE CalcularQuantidadeProdutosPorDia
AS
BEGIN
    SELECT
        DataCompra AS Data,
        SUM(Quantidade) AS QuantidadeTotal
    FROM Compras
    GROUP BY DataCompra
    ORDER BY DataCompra;
END;
-- Execução da procedure
EXEC CalcularQuantidadeProdutosPorDia;