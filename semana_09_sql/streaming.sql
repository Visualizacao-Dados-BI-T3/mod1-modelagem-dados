CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100),
    plano VARCHAR(20)        -- 'Free', 'Premium', 'Familia'
);

CREATE TABLE artistas (
    id_artista INT PRIMARY KEY,
    nome VARCHAR(100),
    pais VARCHAR(50)
);

CREATE TABLE albuns (
    id_album INT PRIMARY KEY,
    id_artista INT REFERENCES artistas(id_artista),
    titulo VARCHAR(100),
    ano_lancamento INT
);

CREATE TABLE musicas (
    id_musica INT PRIMARY KEY,
    id_album INT REFERENCES albuns(id_album),
    titulo VARCHAR(100),
    duracao_segundos INT,
    genero VARCHAR(30)
);

CREATE TABLE reproducoes (
    id_reproducao INT PRIMARY KEY,
    id_usuario INT REFERENCES usuarios(id_usuario),
    id_musica INT REFERENCES musicas(id_musica),
    data_reproducao DATE
);