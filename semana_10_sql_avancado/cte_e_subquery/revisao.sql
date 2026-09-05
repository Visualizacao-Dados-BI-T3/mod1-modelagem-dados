-- Mostre todas as músicas.
SELECT * from musicas

-- Mostre somente o título das músicas.
SELECT titulo from musicas

-- Mostre o título e o gênero das músicas.

SELECT titulo, genero from musicas

-- Mostre o nome e o plano de todos os usuários.
SELECT nome, plano FROM usuarios

-- Mostre o nome e o país de todos os artistas.
SELECT nome, pais FROM artistas

-- Mostre somente as músicas do gênero 'Rock'.
SELECT titulo, genero from musicas WHERE genero = 'Rock'

-- Mostre os usuários do plano 'Premium'.
SELECT nome, plano FROM usuarios WHERE plano LIKE 'prem%'

SELECT nome, plano FROM usuarios WHERE plano like lower('prem%') 


-- Mostre as músicas com duração maior que 240 segundos.
SELECT titulo, duracao_segundos from musicas where duracao_segundos > 240


-- Mostre os álbuns lançados depois de 2020.
-- como colocar no ranking das mais antigas? (to do)
SELECT * from albuns WHERE ano_lancamento < 2020 order by ano_lancamento 


-- Mostre as músicas de Rock com duração maior que 240 segundos.
SELECT titulo, genero, duracao_segundos from musicas WHERE genero = 'Rock'
and duracao_segundos > 240
-- and or not


-- Mostre as músicas da menor para a maior duração.
SELECT * from musicas ORDER BY duracao_segundos 

-- Mostre as músicas da maior para a menor duração.
SELECT * from musicas ORDER BY duracao_segundos desc


-- Mostre os usuários em ordem alfabética.
SELECT nome from usuarios ORDER BY nome


-- Mostre as músicas organizadas primeiro por gênero e depois por título.
SELECT titulo, genero from musicas ORDER BY genero, titulo


-- Conte quantas músicas existem.
-- SUM, AVG, MIN, MAX
SELECT COUNT(id_musica) as qtd from musicas 


-- Calcule a soma da duração de todas as músicas.
SELECT SUM(duracao_segundos) duracao FROM musicas

-- Calcule a duração média das músicas.
SELECT AVG(duracao_segundos) duracao FROM musicas


-- Mostre a menor e a maior duração.
SELECT 
MIN(duracao_segundos) duracao_minima, 
MAX(duracao_segundos) duracao_maxima
FROM musicas


-- Conte quantas reproduções foram registradas.
SELECT COUNT(*) FROM reproducoes


-- Conte quantas músicas existem em cada gênero.
SELECT COUNT(*), genero from musicas GROUP BY genero ORDER BY COUNT(*)

-- Calcule a duração média das músicas de cada gênero.
SELECT round(avg(duracao_segundos), 2) media, genero from musicas GROUP BY genero


-- Mostre a menor e a maior duração de cada gênero.
SELECT min(duracao_segundos), max(duracao_segundos), genero from musicas GROUP BY genero


-- Conte quantos usuários existem em cada plano.
SELECT COUNT(*), plano from usuarios GROUP BY plano ORDER BY COUNT(*)


-- Conte quantos álbuns foram lançados em cada ano e ordene pelo ano.
SELECT COUNT(*), ano_lancamento from albuns GROUP BY ano_lancamento ORDER BY ano_lancamento


-- Mostre somente os gêneros que possuem mais de três músicas.
-- subquery? cte? having?
SELECT count(*), genero from musicas GROUP BY genero HAVING count(*) > 3 ORDER BY count(*)


-- Mostre os gêneros cuja duração média é maior que 240 segundos.
SELECT avg(duracao_segundos), genero from musicas GROUP BY genero HAVING avg(duracao_segundos) > 240


-- Mostre os planos que possuem pelo menos dois usuários.
SELECT plano, count(*) from usuarios group by plano HAVING count(*) >= 2 


-- Mostre cada álbum e o nome do seu artista.
select album.titulo, artista.nome from albuns album join artistas artista
on artista.id_artista = album.id_artista


-- Mostre cada música e o título do seu álbum.
select a.titulo titulo_album, m.titulo titulo_musica from albuns a join musicas m
on a.id_album = m.id_album


-- Mostre cada reprodução com o nome do usuário.
select * from reproducoes r join usuarios u
on r.id_usuario = u.id_usuario


-- Mostre o usuário, a música e a data de cada reprodução.
SELECT 
u.nome usuario, m.titulo musica, r.data_reproducao
from reproducoes r
join usuarios u
on r.id_usuario =  u.id_usuario
join musicas m 
on r.id_musica = m.id_musica