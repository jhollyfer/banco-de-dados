-- ============================================
-- AULA 03 - Criando Tabelas
-- Arquivo 013: Exercicio - Sistema de Biblioteca
-- ============================================
-- Execute no banco "escola" pelo seu client SQL.
-- ============================================

-- Exercicio: criar um mini sistema de biblioteca
-- com 3 tabelas: livros, leitores e emprestimos.

-- ----------------------------------------
-- Tabela: livros
-- ----------------------------------------
CREATE TABLE livros (
    id          SERIAL          PRIMARY KEY,
    titulo      VARCHAR(200)    NOT NULL,
    autor       VARCHAR(100)    NOT NULL,
    isbn        CHAR(13)        UNIQUE,         -- ISBN tem 13 digitos fixos
    ano_publicacao INT,
    disponivel  BOOLEAN         DEFAULT TRUE,
    criado_em   TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------------------
-- Tabela: leitores
-- ----------------------------------------
CREATE TABLE leitores (
    id          SERIAL          PRIMARY KEY,
    nome        VARCHAR(100)    NOT NULL,
    email       VARCHAR(255)    UNIQUE NOT NULL,
    telefone    VARCHAR(20),
    ativo       BOOLEAN         DEFAULT TRUE,
    criado_em   TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------------------
-- Tabela: emprestimos (conecta livros ←→ leitores)
-- ----------------------------------------
CREATE TABLE emprestimos (
    id              SERIAL      PRIMARY KEY,
    livro_id        INT         NOT NULL,
    leitor_id       INT         NOT NULL,
    data_emprestimo DATE        DEFAULT CURRENT_DATE,
    data_devolucao  DATE,                           -- NULL = ainda nao devolveu
    status          VARCHAR(20) DEFAULT 'ativo',    -- 'ativo', 'devolvido', 'atrasado'

    FOREIGN KEY (livro_id)  REFERENCES livros (id),
    FOREIGN KEY (leitor_id) REFERENCES leitores (id)
);

-- ----------------------------------------
-- Populando dados
-- ----------------------------------------

INSERT INTO livros (titulo, autor, isbn, ano_publicacao) VALUES
    ('O Senhor dos Aneis',    'J.R.R. Tolkien',       '9780261103252', 1954),
    ('Clean Code',            'Robert C. Martin',      '9780132350884', 2008),
    ('O Pequeno Principe',    'Antoine de Saint-Exupery', '9780156012195', 1943),
    ('Banco de Dados',        'Abraham Silberschatz',  '9780078022159', 2019);

INSERT INTO leitores (nome, email, telefone) VALUES
    ('Marcos Souza',  'marcos@email.com',  '92 99999-1001'),
    ('Leticia Alves', 'leticia@email.com', '92 99999-1002'),
    ('Rafael Costa',  'rafael@email.com',  NULL);  -- telefone opcional

INSERT INTO emprestimos (livro_id, leitor_id) VALUES
    (1, 1),  -- Marcos pegou O Senhor dos Aneis
    (2, 2),  -- Leticia pegou Clean Code
    (3, 1);  -- Marcos tambem pegou O Pequeno Principe

-- Marcar um livro como devolvido
UPDATE emprestimos
SET data_devolucao = CURRENT_DATE, status = 'devolvido'
WHERE livro_id = 1 AND leitor_id = 1;

-- ----------------------------------------
-- Consultas
-- ----------------------------------------

-- Todos os emprestimos com nomes
SELECT
    l.titulo    AS livro,
    le.nome     AS leitor,
    e.data_emprestimo,
    e.data_devolucao,
    e.status
FROM emprestimos e
JOIN livros l   ON e.livro_id  = l.id
JOIN leitores le ON e.leitor_id = le.id;

-- Emprestimos ainda ativos (nao devolvidos)
SELECT
    l.titulo AS livro,
    le.nome  AS leitor,
    e.data_emprestimo
FROM emprestimos e
JOIN livros l   ON e.livro_id  = l.id
JOIN leitores le ON e.leitor_id = le.id
WHERE e.status = 'ativo';

-- Quantos livros cada leitor pegou emprestado?
SELECT
    le.nome           AS leitor,
    COUNT(*)          AS total_emprestimos
FROM emprestimos e
JOIN leitores le ON e.leitor_id = le.id
GROUP BY le.nome;
