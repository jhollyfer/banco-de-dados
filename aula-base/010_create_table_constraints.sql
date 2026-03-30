-- ============================================
-- AULA 03 - Criando Tabelas
-- Arquivo 010: CREATE TABLE e Constraints
-- ============================================
-- Execute no banco "escola" pelo seu client SQL.
-- ============================================

-- CREATE TABLE define a estrutura de uma tabela:
-- quais colunas, tipos e restricoes (constraints).

-- Vamos recriar a tabela alunos com TODAS as constraints da aula:
DROP TABLE IF EXISTS matriculas;  -- depende de alunos e cursos
DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS cursos;

CREATE TABLE alunos (
    id              SERIAL          PRIMARY KEY,        -- PK + auto-incremento
    nome            VARCHAR(100)    NOT NULL,            -- obrigatorio
    email           VARCHAR(255)    UNIQUE NOT NULL,     -- obrigatorio + sem repeticao
    data_nascimento DATE,                                -- opcional
    ativo           BOOLEAN         DEFAULT TRUE,        -- padrao: TRUE
    criado_em       TIMESTAMP       DEFAULT CURRENT_TIMESTAMP  -- padrao: agora
);

-- Vamos entender cada constraint:

-- ----------------------------------------
-- PRIMARY KEY = identidade unica
-- ----------------------------------------
-- SERIAL faz o papel do AUTO_INCREMENT no PostgreSQL.
-- O banco gera o valor automaticamente (1, 2, 3...).

INSERT INTO alunos (nome, email) VALUES ('Ana', 'ana@email.com');
-- → id = 1 (automatico)

INSERT INTO alunos (nome, email) VALUES ('Carlos', 'carlos@email.com');
-- → id = 2 (automatico)

-- Se deletar o registro 2 e inserir outro, o proximo sera 3 (nao reutiliza).

-- ----------------------------------------
-- NOT NULL = campo obrigatorio
-- ----------------------------------------

-- Isso funciona (nome preenchido):
INSERT INTO alunos (nome, email) VALUES ('Julia', 'julia@email.com');

-- Isso FALHA (nome ausente e NOT NULL):
-- INSERT INTO alunos (email) VALUES ('teste@email.com');
-- ERRO: null value in column "nome" violates not-null constraint

-- ----------------------------------------
-- UNIQUE = sem repeticoes
-- ----------------------------------------

-- Isso FALHA (email ja existe):
-- INSERT INTO alunos (nome, email) VALUES ('Ana Maria', 'ana@email.com');
-- ERRO: duplicate key value violates unique constraint "alunos_email_key"

-- PRIMARY KEY ja inclui UNIQUE automaticamente.
-- Nao precisa colocar UNIQUE na coluna que e chave primaria.

-- ----------------------------------------
-- DEFAULT = valor padrao
-- ----------------------------------------
-- Se nao informar, usa o valor padrao.

INSERT INTO alunos (nome, email) VALUES ('Pedro', 'pedro@email.com');

-- Verificar que ativo=TRUE e criado_em foram preenchidos sozinhos:
SELECT nome, ativo, criado_em FROM alunos WHERE nome = 'Pedro';

-- Mas se tentar explicitamente inserir NULL num campo NOT NULL DEFAULT, falha:
-- INSERT INTO alunos (nome, email, ativo) VALUES (NULL, 'x@email.com', TRUE);
-- ERRO: null value in column "nome" violates not-null constraint

SELECT * FROM alunos;
