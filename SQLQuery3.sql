-- Criação do banco de dados
CREATE DATABASE MeuBancoDeDados;

-- Uso do banco de dados criado
USE MeuBancoDeDados;

-- Criação da tabela 'Funcionarios'
CREATE TABLE Funcionarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(100),
    Salario DECIMAL(10, 2)
);

-- Criação da tabela 'Departamentos'
CREATE TABLE Departamentos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    FuncionarioID INT,
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionarios(ID)
);

-- Inserção de dados na tabela 'Funcionarios'
INSERT INTO Funcionarios (ID, Nome, Cargo, Salario) VALUES
(1, 'Jo�o', 'Gerente', 5000.00),
(2, 'Maria', 'Desenvolvedora', 7000.00),
(3, 'Pedro', 'Analista', 6000.00);

-- Inserção de dados na tabela 'Departamentos'
INSERT INTO Departamentos (ID, Nome, FuncionarioID) VALUES
(1, 'RH', 1),
(2, 'TI', 2),
(3, 'Financeiro', 3);

-- Consulta utilizando JOIN
SELECT Funcionarios.Nome, Departamentos.Nome
FROM Funcionarios
JOIN Departamentos ON Funcionarios.ID = Departamentos.FuncionarioID;
-- LEFT JOIN
SELECT Funcionarios.Nome, Departamentos.Nome
FROM Funcionarios
LEFT JOIN Departamentos ON Funcionarios.ID = Departamentos.FuncionarioID;

-- RIGHT JOIN
SELECT Funcionarios.Nome, Departamentos.Nome
FROM Funcionarios
RIGHT JOIN Departamentos ON Funcionarios.ID = Departamentos.FuncionarioID;

-- FULL JOIN
SELECT Funcionarios.Nome, Departamentos.Nome
FROM Funcionarios
FULL JOIN Departamentos ON Funcionarios.ID = Departamentos.FuncionarioID;

-- INNER JOIN
SELECT Funcionarios.Nome, Departamentos.Nome
FROM Funcionarios
INNER JOIN Departamentos ON Funcionarios.ID = Departamentos.FuncionarioID;