-- Funções de agregação: count, media (avg), soma (sum), min, max

SELECT * FROM dim_produto;

select * from fato_vendas;


SELECT COUNT(*) FROM dim_produto;

SELECT MAX(id_produto) FROM dim_produto; -- essa consulta funciona mas não é significativa, soma de IDs não nos diz nada

SELECT sum(preco_unitario) FROM dim_produto;

SELECT avg(preco_unitario) FROM dim_produto;



SELECT * from  dim_cliente;

SELECT estado
FROM dim_cliente
GROUP BY estado; -- agrupa estados, traz o mesmo resultado que DISTINCT

SELECT DISTINCT estado from dim_cliente;



SELECT estado, COUNT(*) as qtd_clientes
FROM dim_cliente
GROUP BY estado; -- Conta clientes de acordo com o estado



select * from dim_produto;

SELECT categoria, sum(preco_unitario)
FROM dim_produto
GROUP BY categoria -- Soma o valor de cada categoria
ORDER BY categoria DESC;


SELECT p.categoria, AVG(f.valor_venda) 
from fato_vendas f
INNER JOIN dim_produto p
ON p.id_produto = f.id_produto
where f.id_loja = 1
GROUP by categoria
-- HAVING categoria = 'Móveis' -- espécie de where, mas após o group by
-- having AVG(f.valor_venda) > 720
