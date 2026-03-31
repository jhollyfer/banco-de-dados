-- ============================================
-- AULA 02 - Tipos de Dados
-- Arquivo 01: Tipos de Texto
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f aula-02/01_tipos_texto.sql
-- ============================================

-- ----------------------------------------
-- VARCHAR(n) -- texto com limite
-- ----------------------------------------
-- Para textos curtos e de tamanho previsivel.
-- O numero entre parenteses e o MAXIMO de caracteres.
-- Se o texto for menor, o banco so armazena o que precisa (nao desperdica).

CREATE TABLE contatos (
    id       SERIAL PRIMARY KEY,
    nome     VARCHAR(100),     -- ate 100 caracteres
    email    VARCHAR(255),     -- ate 255 caracteres
    telefone VARCHAR(20)       -- ate 20 caracteres
);

INSERT INTO contatos (nome, email, telefone) VALUES
    ('Ana Silva',    'ana@email.com',    '92 99999-0001'),
    ('Carlos Lima',  'carlos@email.com', '92 99999-0002');

SELECT * FROM contatos;

-- ----------------------------------------
-- TEXT -- texto longo, sem limite pratico
-- ----------------------------------------
-- Para textos grandes: descricoes, biografias, artigos.
-- No PostgreSQL, TEXT pode armazenar ate 1 GB de texto!

-- Nota: PostgreSQL NAO tem MEDIUMTEXT nem LONGTEXT (esses sao do MySQL).
-- No PostgreSQL, TEXT ja cobre tudo.

CREATE TABLE postagens (
    id        SERIAL PRIMARY KEY,
    titulo    VARCHAR(200),
    conteudo  TEXT              -- texto longo
);

INSERT INTO postagens (titulo, conteudo) VALUES
    ('Meu primeiro post',
     'Este e o conteudo do meu primeiro post. Pode ser um texto bem grande, '
     'com varios paragrafos, sem se preocupar com limite de caracteres.'),
    ('Dicas de SQL',
     'SQL e a linguagem padrao para bancos de dados relacionais. '
     'Nesta postagem vamos ver varias dicas uteis para o dia a dia.');

SELECT titulo, LENGTH(conteudo) AS tamanho_texto FROM postagens;

-- ----------------------------------------
-- CHAR(n) vs VARCHAR(n)
-- ----------------------------------------
-- CHAR(n)    -> tamanho FIXO. Sempre ocupa n caracteres (preenche com espacos).
-- VARCHAR(n) -> tamanho VARIAVEL. Ocupa so o que precisa.

-- Exemplo: CHAR(10) sempre usa 10 bytes, mesmo para "Ana" (preenche com espacos).
--          VARCHAR(10) usa apenas 3 bytes para "Ana".

-- Quando usar CHAR? Para codigos de tamanho fixo:
--   UF do estado: CHAR(2) -> 'AM', 'SP', 'RJ'
--   Codigo do pais: CHAR(3) -> 'BRA', 'USA'

CREATE TABLE estados (
    sigla  CHAR(2) PRIMARY KEY,  -- sempre 2 caracteres
    nome   VARCHAR(50)
);

INSERT INTO estados (sigla, nome) VALUES
    ('AM', 'Amazonas'),
    ('SP', 'Sao Paulo'),
    ('RJ', 'Rio de Janeiro');

SELECT sigla, nome FROM estados;

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Adicione mais 2 contatos na tabela contatos
-- 2) Crie uma postagem com titulo 'Minha Bio' e conteudo longo
-- 3) Adicione o estado 'PA' (Para) na tabela estados
-- 4) Use LENGTH() para ver o tamanho do titulo de cada postagem
