-- Criação do banco projeto_estagio
CREATE DATABASE IF NOT EXISTS projeto_estagio;
USE projeto_estagio;

-- Tabela produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    categoria VARCHAR(30),
    preco DECIMAL(10,2)
);

-- Tabela clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    cidade VARCHAR(30)
);

-- Tabela vendas
CREATE TABLE vendas (
    id INT PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    data_venda DATE,
    quantidade INT,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);