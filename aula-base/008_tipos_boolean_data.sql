-- ============================================
-- AULA 02 - Tipos de Dados
-- Arquivo 008: BOOLEAN e Tipos de Data/Hora
-- ============================================
-- Conecte no banco "escola" pelo seu client SQL e execute este arquivo.
-- ============================================

-- ----------------------------------------
-- BOOLEAN -- verdadeiro ou falso
-- ----------------------------------------
-- Para valores binarios: ativo/inativo, sim/nao, publicado/rascunho.
-- No PostgreSQL, BOOLEAN e um tipo de verdade (nao e TINYINT como no MySQL).
-- Valores aceitos: TRUE/FALSE, 't'/'f', 'yes'/'no', 1/0

CREATE TABLE usuarios (
    id    SERIAL PRIMARY KEY,
    nome  VARCHAR(100) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO usuarios (nome, ativo) VALUES
    ('Ana',    TRUE),
    ('Carlos', FALSE),
    ('Julia',  TRUE);

-- Buscar apenas usuarios ativos
SELECT nome FROM usuarios WHERE ativo = TRUE;
-- → Ana, Julia

-- Buscar inativos
SELECT nome FROM usuarios WHERE ativo = FALSE;
-- → Carlos

-- No PostgreSQL, voce pode simplificar:
SELECT nome FROM usuarios WHERE ativo;       -- mesmo que ativo = TRUE
SELECT nome FROM usuarios WHERE NOT ativo;   -- mesmo que ativo = FALSE

-- ----------------------------------------
-- DATE -- apenas data
-- ----------------------------------------
-- Formato: 'YYYY-MM-DD' (ano-mes-dia)

CREATE TABLE eventos (
    id          SERIAL PRIMARY KEY,
    nome        VARCHAR(100),
    data_evento DATE NOT NULL
);

INSERT INTO eventos (nome, data_evento) VALUES
    ('Aula inaugural',   '2024-03-01'),
    ('Prova 1',          '2024-04-15'),
    ('Formatura',        '2024-12-20');

-- Buscar eventos depois de abril
SELECT nome, data_evento FROM eventos
WHERE data_evento > '2024-04-01';

-- ----------------------------------------
-- TIMESTAMP -- data + hora
-- ----------------------------------------
-- Formato: 'YYYY-MM-DD HH:MM:SS'
-- CURRENT_TIMESTAMP preenche automaticamente com a data/hora atual.

CREATE TABLE logs (
    id        SERIAL PRIMARY KEY,
    acao      VARCHAR(100) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserindo sem informar criado_em (preenche sozinho!)
INSERT INTO logs (acao) VALUES ('Usuario logou');
INSERT INTO logs (acao) VALUES ('Usuario criou postagem');

-- Inserindo com data/hora especifica
INSERT INTO logs (acao, criado_em) VALUES
    ('Sistema iniciou', '2024-03-15 08:00:00');

SELECT acao, criado_em FROM logs;

-- ----------------------------------------
-- Funcoes uteis de data no PostgreSQL
-- ----------------------------------------

-- Data/hora atual
SELECT CURRENT_DATE     AS hoje;
SELECT CURRENT_TIME     AS hora_atual;
SELECT CURRENT_TIMESTAMP AS agora;

-- Extrair partes da data
SELECT
    nome,
    data_evento,
    EXTRACT(YEAR FROM data_evento)  AS ano,
    EXTRACT(MONTH FROM data_evento) AS mes,
    EXTRACT(DAY FROM data_evento)   AS dia
FROM eventos;

-- Diferenca entre datas (em dias)
SELECT
    nome,
    data_evento,
    CURRENT_DATE - data_evento AS dias_atras
FROM eventos;
