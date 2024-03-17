
CREATE DATABASE Vendas;
USE Vendas;

CREATE TABLE Compras (
    IDCompra INT PRIMARY KEY,
    DataCompra DATE,
    Produto VARCHAR(100),
    Quantidade INT
);

INSERT INTO Compras (IDCompra, DataCompra, Produto, Quantidade)
VALUES
    (1, '2024-03-17', 'Produto A', 10),
    (2, '2024-03-17', 'Produto B', 5),
    (3, '2024-03-18', 'Produto A', 8),
    (4, '2024-03-18', 'Produto C', 12);
    

CREATE PROCEDURE CalcularQuantidadeProdutosPorDia;
FOR
BEGIN 
    SELECT
        DataCompra AS Data,
        SUM(Quantidade) AS QuantidadeTotal
    FROM Compras
    GROUP BY DataCompra
    ORDER BY DataCompra;
END;

EXEC CalcularQuantidadeProdutosPorDia;









  