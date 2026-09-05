-- Criar uma nova tabela particionada por intervalo de datas
create table fato_vendas_2 (
  id_venda INTEGER,
  data_venda DATE,
  valor_total NUMERIC
) PARTITION BY RANGE (data_venda)


-- Criar as partições (2025 vai de 1/1/2025 até 1/1/2026 - 1 | lembrar de RANGE)
create table fato_venda_2025 
  partition of fato_vendas_2
for values from ('2025-01-01') to ('2026-01-01')


-- Criar as partições (2026 vai de 1/1/2026 até 1/1/2027 - 1 | lembrar de RANGE)
create table fato_venda_2026
  partition of fato_vendas_2
for values from ('2026-01-01') to ('2027-01-01')


-- Criar as partições (2025 vai de 1/1/2025 até 1/1/2026 - 1 | lembrar de RANGE)
create table fato_venda_2024
partition of fato_vendas_2
for values from ('2024-01-01') to ('2025-01-01')


-- Inserção de valores aleatórios. Eles têm datas sequenciais, todas em 2025
-- Tentar inserir datas nas quais não existem partições dá erro
-- `ERROR: no partition of relation "fato_vendas_2" found for row (SQLSTATE 23514)`
INSERT INTO fato_vendas_2 (
    id_venda,
    data_venda,
    valor_total
)
SELECT
    n AS id_venda,
    DATE '2025-01-01' + (n % 365)::INTEGER AS data_venda,
    ROUND((10 + ((n * 17) % 990))::NUMERIC, 2) AS valor_total
FROM generate_series(1, 500000) AS numeros(n)