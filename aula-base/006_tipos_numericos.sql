-- ============================================
-- AULA 02 - Tipos de Dados
-- Arquivo 006: Tipos Numericos
-- ============================================
-- Conecte no banco "escola" pelo seu client SQL e execute este arquivo.
-- ============================================

-- Por que tipos importam?
-- 1. Economizam espaco (INT ocupa menos que TEXT)
-- 2. Validam dados (o banco rejeita texto numa coluna INT)
-- 3. Melhoram performance nas buscas

-- ----------------------------------------
-- INT e suas variacoes
-- ----------------------------------------
-- Para numeros sem casa decimal: idade, quantidade, ano.

-- No PostgreSQL, as variacoes sao:
-- SMALLINT  → -32.768 a 32.767            (2 bytes)
-- INT       → -2 bilhoes a 2 bilhoes      (4 bytes)
-- BIGINT   → -9 quintilhoes a 9 quintilhoes (8 bytes)

-- Nota: PostgreSQL NAO tem TINYINT nem UNSIGNED. Use SMALLINT no lugar.

CREATE TABLE produtos (
    id                  SERIAL PRIMARY KEY,
    quantidade_estoque  INT,
    ano_lancamento      SMALLINT,       -- ano cabe em SMALLINT
    visualizacoes       BIGINT          -- pode ser um numero enorme
);

INSERT INTO produtos (quantidade_estoque, ano_lancamento, visualizacoes) VALUES
    (150,  2023, 1000000),
    (0,    2024, 50),
    (42,   2020, 999999999);

SELECT * FROM produtos;

-- ----------------------------------------
-- DECIMAL / NUMERIC -- numeros com casas decimais
-- ----------------------------------------
-- Para valores que precisam de PRECISAO EXATA, como dinheiro.
-- DECIMAL(precisao, escala)
--   precisao = total de digitos
--   escala   = digitos depois do ponto

-- No PostgreSQL, DECIMAL e NUMERIC sao a mesma coisa.

CREATE TABLE produtos_precos (
    id     SERIAL PRIMARY KEY,
    nome   VARCHAR(100) NOT NULL,
    preco  DECIMAL(10, 2)    -- de -99999999.99 ate 99999999.99
);

INSERT INTO produtos_precos (nome, preco) VALUES
    ('Notebook',     3499.90),
    ('Mouse',          49.90),
    ('Monitor 27"',  1899.00);

SELECT nome, preco FROM produtos_precos;

-- ----------------------------------------
-- CUIDADO: FLOAT/DOUBLE vs DECIMAL
-- ----------------------------------------
-- NUNCA use FLOAT ou DOUBLE PRECISION para dinheiro!
-- Eles tem erros de arredondamento.

-- Veja o problema na pratica:
SELECT 0.1::FLOAT + 0.2::FLOAT AS resultado_float;
-- → 0.30000000000000004  (ERRADO!)

SELECT 0.1::DECIMAL + 0.2::DECIMAL AS resultado_decimal;
-- → 0.3  (CORRETO!)
