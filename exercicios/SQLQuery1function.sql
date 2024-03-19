CREATE TABLE Clientes
(
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    DataCadastro DATE
);


INSERT INTO Clientes (ClienteID, Nome, DataCadastro)
VALUES
    (1, 'Maria', '2024-03-19'),
    (2, 'João', '2024-03-19'),
    (3, 'Ana', '2024-03-18'),
    (4, 'Pedro', '2024-03-18');

	-- Lote 1: Criação da função
-- Lote 1: Criação da função
CREATE FUNCTION dbo.SomarClientesCadastradosNoDia (@DataReferencia DATE)
 
RETURNS INT
AS
BEGIN
    DECLARE @TotalClientes INT;

    SELECT @TotalClientes = COUNT(*) 
    FROM Clientes
    WHERE CAST(DataCadastro AS DATE) = @DataReferencia;

    RETURN @TotalClientes;
END;

-- Lote 2: Execução da função
DECLARE @DataReferencia DATE = '2024-03-19';
SELECT dbo.SomarClientesCadastradosNoDia(@DataReferencia) AS TotalClientes;

