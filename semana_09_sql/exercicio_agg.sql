-- 1. Faturamento por Estado:
-- Qual foi o faturamento total (tabela fato) agrupado por estado do cliente (tabela cliente)?

select dim_cliente.estado, sum(fato_vendas.valor_venda) -- select
from fato_vendas -- tabela principal 
INNER JOIN dim_cliente -- tabela dim
ON dim_cliente.id_cliente = fato_vendas.id_cliente -- junta onde ID for igual
GROUP BY estado; -- group by


-- 2. Vendas por Loja
-- Quantas vendas foram realizadas em cada estabelecimento?
select dim_loja.nome_loja, COUNT(*) as qtd
from fato_vendas  
INNER JOIN dim_loja 
ON dim_loja.id_loja = fato_vendas.id_loja
GROUP BY dim_loja.nome_loja
ORDER BY qtd DESC ;


-- 3. Ticket Médio por Categoria
-- Qual o valor médio das vendas por categoria de produto? Quais valores médios ultrapassam 500?
select dim_produto.categoria, AVG(fato_vendas.valor_venda) -- select
from fato_vendas -- tabela principal 
INNER JOIN dim_produto -- tabela dim
ON dim_produto.id_produto = fato_vendas.id_produto -- junta onde ID for igual
GROUP BY dim_produto.categoria; -- group by



-- 4. Clientes e Compras
-- Liste o nome dos clientes e o valor de suas respectivas compras.
select dim_cliente.nome_cliente, sum(fato_vendas.valor_venda) -- select
from fato_vendas -- tabela principal 
INNER JOIN dim_cliente -- tabela dim
ON dim_cliente.id_cliente = fato_vendas.id_cliente -- junta onde ID for igual
GROUP BY dim_cliente.nome_cliente; -- group by


-- 5. Produtos Não Vendidos
-- Quais produtos cadastrados ainda não possuem vendas registradas?
-- tres opcoes :)

select dim_produto.id_produto, dim_produto.nome -- select
from dim_produto -- tabela principal 
LEFT JOIN fato_vendas 
ON dim_produto.id_produto = fato_vendas.id_produto -- junta onde ID for igual
where fato_vendas.id_venda is NULL;

select  fato.nome, vendas.quantidade
from dim_produto as fato
LEFT JOIN fato_vendas as vendas
ON fato.id_produto = vendas.id_produto
where quantidade is null;

SELECT
  p.nome
FROM dim_produto p
WHERE id_produto NOT IN (SELECT id_produto FROM fato_vendas);

SELECT * from fato_vendas
