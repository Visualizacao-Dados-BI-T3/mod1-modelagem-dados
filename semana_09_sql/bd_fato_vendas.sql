select * from dim_loja;

select DISTINCT id_loja from fato_vendas;

select count(id_cliente) from dim_cliente;

-- insert into dim_produto VALUES (55, 'teste', 'teste', 'x', 5);

SELECT * from dim_produto;

-- EXERCÍCIO DO SLIDE
-- Liste todas as informações da tabela dim_produto
select * from dim_produto;

-- Mostre apenas o nome e a categoria dos produtos
select nome, categoria from dim_produto;

-- Liste todas as vendas cujo valor seja superior a R$ 1.000
select id_produto, valor_venda from fato_vendas where valor_venda > 1000;

-- Mostre os clientes da cidade de Teresina em ordem alfabética
SELECT nome_cliente 
from dim_cliente 
where LOWER(cidade) = 'teresina'
ORDER BY nome_cliente;

-- ILIKE: ignora case sensitive (letras maiusculas e minusculas)
-- LOWER() | UPPER()

-- Liste as dez maiores vendas cadastradas no banco
SELECT * FROM fato_vendas ORDER BY valor_venda DESC LIMIT 10

-- Liste o nome dos produtos cujo valor de venda seja superior a R$ 1.000
select cliente.nome_cliente, fato_vendas.valor_venda 
from fato_vendas 
INNER JOIN dim_cliente as cliente
ON cliente.id_cliente = fato_vendas.id_cliente;

select dim_produto.nome, fato_vendas.valor_venda
from fato_vendas 
INNER JOIN dim_produto
ON dim_produto.id_produto = fato_vendas.id_produto;

select c.nome_cliente, l.nome_loja, p.nome as nome_produto, f.valor_venda
from fato_vendas f
INNER JOIN dim_produto p
ON p.id_produto = f.id_produto
INNER JOIN dim_cliente c
ON c.id_cliente = f.id_cliente
INNER JOIN dim_loja l
ON l.id_loja = f.id_loja;

select dim_produto.nome, fato_vendas.valor_venda
from dim_produto 
LEFT JOIN fato_vendas
ON dim_produto.id_produto = fato_vendas.id_produto;

select dim_cliente.nome_cliente, fato_vendas.valor_venda
from fato_vendas 
LEFT JOIN dim_cliente
ON dim_cliente.id_cliente = fato_vendas.id_produto;
