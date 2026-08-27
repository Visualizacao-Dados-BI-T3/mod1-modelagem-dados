-- select é só visualização
-- operadores comparativos: <, >, <=, >=, <>
-- operadores lógicos: and, or, not
-- and: os dois tem que ser verdade
-- or: pelo menos um
-- not: negação
-- % diz "qualquer coisa": '%Silva' significa que a busca vai tentar encontrar Silva no fim
-- LIKE | ILIKE (case sensitive)


-- selecionando coluna específica
select data_venda from vendas_loja;


-- selecionando todas as colunas
select * from vendas_loja  -- no total, 50 registros
  

-- mostra valores únicos (sem duplicados)
SELECT DISTINCT data_venda from vendas_loja; 
SELECT DISTINCT valor_unitario from vendas_loja; 


-- seleção com condicional WHERE (onde)
SELECT valor_unitario FROM vendas_loja WHERE valor_unitario > 100;

-- seleção com condicional composta (ambas sendo verdade)
select valor_unitario, data_venda
  from vendas_loja 
  where not data_venda > '2026-01-06'
  and valor_unitario > 1000;

-- seleção com condicional composta (uma das duas sendo verdade)
select valor_unitario, data_venda
  from vendas_loja 
  where not data_venda > '2026-01-06'
  or valor_unitario > 1000;


-- busca por texto parcial
select produto from vendas_loja where produto LIKE '%Fone%';

select cliente from vendas_loja where cliente LIKE '%Silva%';


-- busca temporal
-- as duas queries fazem a mesma coisa, mas uma com verificação manual e outra com between
select valor_unitario, data_venda
  from vendas_loja 
  where data_venda >= '2026-01-06'
  and data_venda <= '2026-01-10'

select valor_unitario, data_venda
  from vendas_loja 
  where data_venda BETWEEN '2026-01-06' AND '2026-01-10'


-- busca em uma lista de valores
select cliente, estado_cliente
  FROM vendas_loja 
  where estado_cliente in ('SC', 'SP', 'ES', 'PI')


-- IS NOT NULL: vê o que não está nulo
-- IS NULL: vê o que está nulo
SELECT cliente FROM vendas_loja WHERE quantidade IS NOT NULL


-- limitar a quantidade de linhas no retorno
select * from vendas_loja limit 10


-- desc é decrescente (maior pro menor)
-- se não especificar, será considerando asc (ascendente, menor pro maior)
select valor_unitario from vendas_loja ORDER BY valor_unitario desc


-- exemplo com tudo
select * -- quero visualizar essas colunas
  from vendas_loja  -- elas estão nessa tabela
  where data_venda BETWEEN '2026-01-06' AND '2026-01-10'  -- meu filtro
  order by valor_unitario desc -- minha ordenação
  limit 1 -- limite a quantidade de resultados


-- truncar: levar a data para o início do ano/década, mês
-- se era 2026-08-22, fica 2026-08-01 no caso de month
-- se era 2026-08-22, fica 2026-01-01 no caso de year
-- se era 2026-08-22, fica 2020-01-01 no caso de decade
select data_venda, DATE_TRUNC('year', data_venda) from vendas_loja


-- extari ano, mes, dia para colunas separadas
SELECT
  EXTRACT (YEAR FROM data_venda) as ano, EXTRACT (MONTH FROM data_venda) as mes 
  from vendas_loja





