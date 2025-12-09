USE projeto_estagio;

-- ===================================
-- 9 QUERIES DE ANÁLISE DE VENDAS
-- ===================================

-- Query 1: Vendas por cliente
SELECT 
    c.nome as cliente,
    c.cidade,
    COUNT(v.id) as total_compras,
    SUM(v.total) as total_gasto
FROM clientes c
LEFT JOIN vendas v ON c.id = v.cliente_id
GROUP BY c.id, c.nome, c.cidade
ORDER BY total_gasto DESC;

-- Query 2: Produtos mais vendidos
SELECT 
    p.nome as produto,
    p.categoria,
    SUM(v.quantidade) as quantidade_vendida,
    SUM(v.total) as faturamento
FROM produtos p
INNER JOIN vendas v ON p.id = v.produto_id
GROUP BY p.id, p.nome, p.categoria
ORDER BY quantidade_vendida DESC;

-- Query 3: Vendas por mês
SELECT 
    MONTH(data_venda) as mes,
    SUM(total) as faturamento_mensal
FROM vendas
GROUP BY mes
ORDER BY mes;

-- Query 4: Clientes por cidade  
SELECT 
    cidade,
    COUNT(*) as total_clientes
FROM clientes
GROUP BY cidade
ORDER BY total_clientes DESC;

-- Query 5: Ticket médio
SELECT 
    ROUND(AVG(total), 2) as ticket_medio,
    COUNT(*) as total_vendas,
    SUM(total) as faturamento_total
FROM vendas;

-- Query 6: Clientes que compraram eletrônicos
SELECT DISTINCT
    c.nome as cliente,
    p.categoria
FROM clientes c
INNER JOIN vendas v ON c.id = v.cliente_id
INNER JOIN produtos p ON v.produto_id = p.id
WHERE p.categoria = 'Eletrônicos';

-- Query 7: Vendas acima da média 
SELECT 
    c.nome as cliente,
    p.nome as produto,
    v.total
FROM vendas v
INNER JOIN produtos p ON v.produto_id = p.id
INNER JOIN clientes c ON c.id = v.cliente_id
WHERE v.total > (SELECT AVG(total) FROM vendas);

-- Query 8: Produtos por faturamento
SELECT 
    p.nome as produto,
    p.categoria,
    SUM(v.total) as faturamento_total,
    SUM(v.quantidade) as quantidade_vendida
FROM produtos p
INNER JOIN vendas v ON p.id = v.produto_id
GROUP BY p.id, p.nome, p.categoria
ORDER BY faturamento_total DESC;

-- 9. Produtos nunca vendidos
SELECT 
    p.nome as produto_nao_vendido,
    p.categoria,
    p.preco
FROM produtos p
LEFT JOIN vendas v ON p.id = v.produto_id
WHERE v.id IS NULL;