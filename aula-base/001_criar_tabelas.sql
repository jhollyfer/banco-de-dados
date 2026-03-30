-- ============================================
-- AULA 01 - Fundamentos de SQL
-- Arquivo 001: Criar Tabelas
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f 001_criar_tabelas.sql
-- ============================================

-- Cada tabela e como uma "gaveta" do nosso arquivo.
-- Dentro dela temos colunas (campos) e linhas (registros).

-- ----------------------------------------
-- TABELA: alunos
-- ----------------------------------------
-- id        → Chave Primaria (PRIMARY KEY) - identifica cada aluno de forma unica
-- SERIAL    → O PostgreSQL gera o numero automaticamente (1, 2, 3...)
-- NOT NULL  → O campo nao pode ficar vazio

CREATE TABLE IF NOT EXISTS alunos (
    id    SERIAL       PRIMARY KEY,
    nome  VARCHAR(100) NOT NULL,
    idade INT,
    email VARCHAR(150)
);

-- ----------------------------------------
-- TABELA: cursos
-- ----------------------------------------

CREATE TABLE IF NOT EXISTS cursos (
    id             SERIAL       PRIMARY KEY,
    nome           VARCHAR(100) NOT NULL,
    carga_horaria  INT
);

-- ----------------------------------------
-- TABELA: matriculas
-- ----------------------------------------
-- Esta tabela CONECTA alunos a cursos usando chaves estrangeiras (FOREIGN KEY).
-- aluno_id aponta para alunos.id
-- curso_id aponta para cursos.id
--
-- Se voce tentar inserir um aluno_id que nao existe na tabela alunos,
-- o banco vai RECUSAR a operacao. Isso garante a integridade dos dados.

CREATE TABLE IF NOT EXISTS matriculas (
    id              SERIAL  PRIMARY KEY,
    aluno_id        INT     NOT NULL,
    curso_id        INT     NOT NULL,
    data_matricula  DATE    NOT NULL,

    FOREIGN KEY (aluno_id) REFERENCES alunos (id),
    FOREIGN KEY (curso_id) REFERENCES cursos (id)
);

-- Resumo da estrutura criada:
--
-- Banco de Dados (escola)
-- ├── Tabela: alunos
-- │   ├── id (PK)
-- │   ├── nome
-- │   ├── idade
-- │   └── email
-- ├── Tabela: cursos
-- │   ├── id (PK)
-- │   ├── nome
-- │   └── carga_horaria
-- └── Tabela: matriculas
--     ├── id (PK)
--     ├── aluno_id (FK → alunos.id)
--     ├── curso_id (FK → cursos.id)
--     └── data_matricula
