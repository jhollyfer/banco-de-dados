-- ============================================
-- AULA 03 - Criando Tabelas
-- Arquivo 01: Sistema Completo de Escola
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f aula-03/01_sistema_escola.sql
-- ============================================

-- Mini sistema com 3 tabelas relacionadas.
-- Vamos recriar tudo do zero para ficar limpo.

DROP TABLE IF EXISTS matriculas;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS alunos;

-- ----------------------------------------
-- Tabela: alunos
-- ----------------------------------------
CREATE TABLE alunos (
    id              SERIAL          PRIMARY KEY,
    nome            VARCHAR(100)    NOT NULL,
    email           VARCHAR(255)    UNIQUE NOT NULL,
    data_nascimento DATE,
    ativo           BOOLEAN         DEFAULT TRUE,
    criado_em       TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------------------
-- Tabela: cursos
-- ----------------------------------------
CREATE TABLE cursos (
    id             SERIAL         PRIMARY KEY,
    nome           VARCHAR(100)   NOT NULL,
    descricao      TEXT,
    carga_horaria  INT            NOT NULL,
    preco          DECIMAL(10, 2) NOT NULL
);

-- ----------------------------------------
-- Tabela: matriculas (conecta alunos <-> cursos)
-- ----------------------------------------
-- FOREIGN KEY garante que aluno_id e curso_id existam nas tabelas originais.
-- Se voce tentar inserir um aluno_id que nao existe, o banco RECUSA.

CREATE TABLE matriculas (
    id              SERIAL      PRIMARY KEY,
    aluno_id        INT         NOT NULL,
    curso_id        INT         NOT NULL,
    data_matricula  DATE        DEFAULT CURRENT_DATE,
    status          VARCHAR(20) DEFAULT 'ativa',

    FOREIGN KEY (aluno_id) REFERENCES alunos (id),
    FOREIGN KEY (curso_id) REFERENCES cursos (id)
);

-- Relacao:
-- alunos.id  <--  matriculas.aluno_id
-- cursos.id  <--  matriculas.curso_id

-- ----------------------------------------
-- Inserindo dados
-- ----------------------------------------

INSERT INTO alunos (nome, email, data_nascimento) VALUES
    ('Ana Silva',    'ana@email.com',    '2004-05-15'),
    ('Carlos Lima',  'carlos@email.com', '2002-11-20'),
    ('Julia Santos', 'julia@email.com',  '2005-03-08');

INSERT INTO cursos (nome, descricao, carga_horaria, preco) VALUES
    ('Banco de Dados',    'Fundamentos de SQL e modelagem',  60, 499.90),
    ('Programacao Web',   'HTML, CSS, JavaScript e Node.js', 80, 699.90),
    ('Redes',             'Infraestrutura e protocolos',     40, 349.90);

-- data_matricula e status usam DEFAULT (data de hoje e 'ativa')
INSERT INTO matriculas (aluno_id, curso_id) VALUES
    (1, 1),  -- Ana em Banco de Dados
    (1, 2),  -- Ana em Programacao Web
    (2, 1),  -- Carlos em Banco de Dados
    (3, 2);  -- Julia em Programacao Web

-- ----------------------------------------
-- Verificando a estrutura (PostgreSQL)
-- ----------------------------------------

-- Ver colunas de uma tabela (equivalente ao DESCRIBE do MySQL):
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'alunos'
ORDER BY ordinal_position;

-- Listar todas as tabelas do banco (equivalente ao SHOW TABLES do MySQL):
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

-- Ver constraints de uma tabela:
SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'matriculas';

-- Verificar os dados com JOIN
SELECT
    a.nome  AS aluno,
    c.nome  AS curso,
    m.data_matricula,
    m.status
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Adicione um 4o aluno e matricule-o em 'Redes'
-- 2) Tente inserir uma matricula com aluno_id = 999. O que acontece?
-- 3) Use information_schema para ver as colunas da tabela cursos
