USE projeto_estagio;

-- Inserir produtos
INSERT INTO produtos VALUES
(1, 'Notebook', 'Eletrônicos', 3500.00),
(2, 'Mouse', 'Acessórios', 150.00),
(3, 'Teclado', 'Acessórios', 250.00),
(4, 'Monitor', 'Eletrônicos', 1200.00),
(5, 'Cadeira', 'Móveis', 800.00);

-- Inserir clientes
INSERT INTO clientes VALUES
(1, 'Ana Silva', 'São Paulo'),
(2, 'João Santos', 'Rio de Janeiro'),
(3, 'Maria Oliveira', 'São Paulo'),
(4, 'Pedro Costa', 'Belo Horizonte');

-- Inserir vendas
INSERT INTO vendas VALUES
(1, 1, 1, '2024-01-15', 1, 3500.00),
(2, 1, 2, '2024-01-20', 2, 300.00),
(3, 2, 1, '2024-02-10', 1, 3500.00),
(4, 3, 3, '2024-02-15', 1, 250.00),
(5, 4, 4, '2024-03-05', 1, 1200.00),
(6, 1, 5, '2024-03-10', 1, 800.00);