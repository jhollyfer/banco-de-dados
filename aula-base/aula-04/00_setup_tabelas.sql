-- ============================================
-- AULA 04 - Inserindo Dados (INSERT INTO)
-- Arquivo 00: Setup - Tabelas Vazias
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f aula-04/00_setup_tabelas.sql
-- ============================================

-- Esta aula e sobre INSERT. As tabelas estao VAZIAS de proposito!
-- Voce vai preenche-las nos proximos arquivos.

DROP TABLE IF EXISTS matriculas;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS alunos;

-- ----------------------------------------
-- Tabela: alunos (vazia)
-- ----------------------------------------
CREATE TABLE alunos (
    id              SERIAL          PRIMARY KEY,
    nome            VARCHAR(100)    NOT NULL,
    email           VARCHAR(255)    UNIQUE NOT NULL,
    idade           INT,
    ativo           BOOLEAN         DEFAULT TRUE,
    criado_em       TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------------------
-- Tabela: cursos (vazia)
-- ----------------------------------------
CREATE TABLE cursos (
    id             SERIAL         PRIMARY KEY,
    nome           VARCHAR(100)   NOT NULL,
    descricao      TEXT,
    carga_horaria  INT            NOT NULL,
    preco          DECIMAL(10, 2) NOT NULL
);

-- ----------------------------------------
-- Tabela: matriculas (vazia)
-- ----------------------------------------
CREATE TABLE matriculas (
    id              SERIAL      PRIMARY KEY,
    aluno_id        INT         NOT NULL,
    curso_id        INT         NOT NULL,
    data_matricula  DATE        DEFAULT CURRENT_DATE,
    status          VARCHAR(20) DEFAULT 'ativa',

    FOREIGN KEY (aluno_id) REFERENCES alunos (id),
    FOREIGN KEY (curso_id) REFERENCES cursos (id)
);

-- Verificar que as tabelas estao vazias
SELECT 'alunos:' AS tabela, COUNT(*) AS registros FROM alunos
UNION ALL
SELECT 'cursos:', COUNT(*) FROM cursos
UNION ALL
SELECT 'matriculas:', COUNT(*) FROM matriculas;

-- Resultado esperado:
-- tabela       | registros
-- alunos:      | 0
-- cursos:      | 0
-- matriculas:  | 0

-- Tudo vazio! Agora va para o arquivo 01_insert_basico.sql
