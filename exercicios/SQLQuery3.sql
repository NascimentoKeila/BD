-- Criação do banco de dados
CREATE DATABASE MeuBancoDeDados;

-- Criação da tabela 'Funcionarios'
CREATE TABLE MeuBancoDeDados.dbo.Funcionarios (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(100),
    Salario DECIMAL(10, 2)
);
GO
-- Criação da tabela 'Departamentos'


CREATE TABLE MeuBancoDeDados.dbo.Departamentos (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100),
    FuncionarioID INT,
    FOREIGN KEY (FuncionarioID) REFERENCES MeuBancoDeDados.dbo.Funcionarios(ID)
);
GO
-- Inserção de dados na tabela 'Funcionarios'
INSERT INTO MeuBancoDeDados.dbo.Funcionarios (Nome, Cargo, Salario) VALUES
('Joâo', 'Gerente', 5000.00),
('Maria', 'Desenvolvedora', 7000.00),
('Pedro', 'Analista', 6000.00);
GO

-- Inserção de dados na tabela 'Departamentos'
INSERT INTO MeuBancoDeDados.dbo.Departamentos (Nome, FuncionarioID) VALUES
('RH', 1),
('TI', 2),
('Financeiro', 3);
GO
-- Consulta utilizando JOIN
SELECT Funcionarios.Nome, Departamentos.Nome
FROM MeuBancoDeDados.dbo.Funcionarios
JOIN MeuBancoDeDados.dbo.Departamentos ON Funcionarios.ID = Departamentos.FuncionarioID;
GO

-- LEFT JOIN
SELECT Funcionarios.Nome, Departamentos.Nome
FROM MeuBancoDeDados.dbo.Funcionarios
LEFT JOIN MeuBancoDeDados.dbo.Departamentos ON Funcionarios.ID = Departamentos.FuncionarioID;
GO

-- RIGHT JOIN
SELECT Funcionarios.Nome, Departamentos.Nome
FROM MeuBancoDeDados.dbo.Funcionarios
RIGHT JOIN MeuBancoDeDados.dbo.Departamentos ON Funcionarios.ID = Departamentos.FuncionarioID;
GO

-- INNER JOIN
SELECT Funcionarios.Nome, Departamentos.Nome
FROM MeuBancoDeDados.dbo.Funcionarios
INNER JOIN MeuBancoDeDados.dbo.Departamentos ON Funcionarios.ID = Departamentos.FuncionarioID;
GO

-- Criação da tabela 'Auditoria'
CREATE TABLE MeuBancoDeDados.dbo.Auditoria (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    FuncionarioID INT,
    Acao VARCHAR(50),
    DataHora DATETIME DEFAULT GETDATE()
);
GO

-- Verificar se a tabela 'Funcionarios' existe
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Funcionarios';
GO



USE MeuBancoDeDados;
GO
CREATE TRIGGER NovoFuncionario
ON dbo.Funcionarios
FOR INSERT
AS
BEGIN
    INSERT INTO dbo.Auditoria(FuncionarioID, Acao)
    SELECT ID, 'INSERT'
    FROM inserted;
END;
GO
