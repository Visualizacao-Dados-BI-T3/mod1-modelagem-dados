-- 1) Criação da tabela

CREATE TABLE fato_vendas (
    id_venda INTEGER PRIMARY KEY,
    data_venda DATE NOT NULL,
    id_cliente INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    id_loja INTEGER NOT NULL,
    valor_total NUMERIC(12,2) NOT NULL
);

-- 2) Inserção de 500.000 registros fictícios
-- ⚠️ IMPORTANTE: rodar o INSERT e o SELECT juntos, como um único comando

INSERT INTO fato_vendas (
    id_venda,
    data_venda,
    id_cliente,
    id_produto,
    id_loja,
    valor_total
)
SELECT
    n AS id_venda,
    DATE '2024-01-01' + (n % 1000)::INTEGER AS data_venda,
    (n % 5000) + 1 AS id_cliente,
    (n % 1000) + 1 AS id_produto,
    (n % 50) + 1 AS id_loja,
    ROUND((10 + ((n * 17) % 990))::NUMERIC, 2) AS valor_total
FROM generate_series(1, 500000) AS numeros(n);

-- 3) Conferir quantos registros foram inseridos

SELECT COUNT(*) AS quantidade
FROM fato_vendas;

-- 4) Atualizar estatísticas da tabela para o otimizador do Postgres

ANALYZE fato_vendas;


-- Criar índice para coluna de cliente
create index idx_cliente on fato_vendas(id_cliente)

-- Remover índice
-- drop index idx_cliente

-- Selecionar cliente para analisar velocidade da consulta
select * from fato_vendas where id_cliente = 2005