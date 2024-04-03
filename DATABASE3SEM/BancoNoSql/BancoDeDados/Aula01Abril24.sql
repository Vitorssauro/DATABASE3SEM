CREATE TABLE Fornecedor (
    Fcodigo INT PRIMARY KEY,
    Fnome VARCHAR(100),
    Status VARCHAR(50) DEFAULT 'Ativo',
    Cidade VARCHAR(100)
);

SELECT * FROM Fornecedor;

CREATE TABLE Peca (
    Pcodigo INT PRIMARY KEY,
    Pnome VARCHAR(100) NOT NULL,
    Cor VARCHAR(100) NOT NULL,
    Peso DECIMAL(10,2) NOT NULL,
    Cidade VARCHAR(100) NOT NULL
);

SELECT * FROM Peca;

CREATE TABLE Instituicao (
    Icodigo INT PRIMARY KEY,
    nome VARCHAR(100)
);

SELECT * FROM Instituicao;

CREATE TABLE Projeto (
    PRcodigo INT PRIMARY KEY,
    PRnome VARCHAR(100),
    Cidade VARCHAR(100),
    Icodigo INT,
    FOREIGN KEY (Icodigo) REFERENCES Instituicao(Icodigo)
);

SELECT * FROM Projeto;

CREATE TABLE Fornecimento (
    Fcodigo INT,
    Pcodigo INT,
    PRcodigo INT,
    Quantidade INT,
    PRIMARY KEY (Fcodigo, Pcodigo, PRcodigo),
    FOREIGN KEY (Fcodigo) REFERENCES Fornecedor(Fcodigo),
    FOREIGN KEY (Pcodigo) REFERENCES Peca(Pcodigo),
    FOREIGN KEY (PRcodigo) REFERENCES Projeto(PRcodigo)
);

SELECT * FROM Fornecimento;


SELECT * FROM Fornecedor;
SELECT * FROM Peca;
SELECT * FROM Instituicao;
SELECT * FROM Projeto;
SELECT * FROM Fornecimento;
