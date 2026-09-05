import sqlite3
con = sqlite3.connect("streaming.db") # criar o arquivo .db

cur = con.cursor() 

cur.execute(
"""
    CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100),
    plano VARCHAR(20)        -- 'Free', 'Premium', 'Familia'
);
"""
) # criacao de nova table

cur.execute(
"""
    CREATE TABLE artistas (
    id_artista INT PRIMARY KEY,
    nome VARCHAR(100),
    pais VARCHAR(50)
);
""") # criacao de nova table

cur.execute(
"""
    CREATE TABLE albuns (
    id_album INT PRIMARY KEY,
    id_artista INT REFERENCES artistas(id_artista),
    titulo VARCHAR(100),
    ano_lancamento INT
);
""") # criacao de nova table

cur.execute(
"""
    CREATE TABLE musicas (
    id_musica INT PRIMARY KEY,
    id_album INT REFERENCES albuns(id_album),
    titulo VARCHAR(100),
    duracao_segundos INT,
    genero VARCHAR(30)
);
""") # criacao de nova table

cur.execute(
"""
    CREATE TABLE reproducoes (
    id_reproducao INT PRIMARY KEY,
    id_usuario INT REFERENCES usuarios(id_usuario),
    id_musica INT REFERENCES musicas(id_musica),
    data_reproducao DATE
);
""")

cur.execute(
"""
    INSERT INTO artistas (id_artista, nome, pais) VALUES
    (1, 'Coldplay', 'Reino Unido'),
    (2, 'Anitta', 'Brasil'),
    (3, 'Djavan', 'Brasil'),
    (4, 'Daft Punk', 'Franca'),
    (5, 'Adele', 'Reino Unido'),
    (6, 'BTS', 'Coreia do Sul'),
    (7, 'Metallica', 'Estados Unidos'),
    (8, 'Ivete Sangalo', 'Brasil');
""") # inserir uma linha na tabela

con.commit()

# Fecha a conexão após terminar
con.close()