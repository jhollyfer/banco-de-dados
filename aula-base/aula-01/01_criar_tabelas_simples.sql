-- ============================================
-- AULA 01 - O que e SQL
-- Arquivo 01: Criar Tabelas Simples
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f aula-01/01_criar_tabelas_simples.sql
-- ============================================

-- Cada tabela e como uma "gaveta" do nosso arquivo.
-- Dentro dela temos colunas (campos) e linhas (registros).

-- ----------------------------------------
-- TABELA: alunos
-- ----------------------------------------
-- id        -> Chave Primaria (PRIMARY KEY) - identifica cada aluno de forma unica
-- SERIAL    -> O PostgreSQL gera o numero automaticamente (1, 2, 3...)
-- NOT NULL  -> O campo nao pode ficar vazio

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
-- Inserindo dados para testar
-- ----------------------------------------
-- Nao precisamos informar o id porque ele e SERIAL (automatico).

INSERT INTO alunos (nome, idade, email) VALUES
    ('Ana',    20, 'ana@email.com'),
    ('Carlos', 22, 'carlos@email.com'),
    ('Julia',  19, 'julia@email.com');

-- Resultado esperado:
-- id | nome   | idade | email
-- 1  | Ana    | 20    | ana@email.com
-- 2  | Carlos | 22    | carlos@email.com
-- 3  | Julia  | 19    | julia@email.com

INSERT INTO cursos (nome, carga_horaria) VALUES
    ('Banco de Dados',        60),
    ('Programacao Web',       80),
    ('Redes de Computadores', 40);

-- Resultado esperado:
-- id | nome                    | carga_horaria
-- 1  | Banco de Dados          | 60
-- 2  | Programacao Web         | 80
-- 3  | Redes de Computadores   | 40

-- Verificar os dados
SELECT * FROM alunos;
SELECT * FROM cursos;

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Adicione um 4o aluno com seu proprio nome
-- 2) Adicione um 4o curso chamado 'Design Grafico' com 45 horas
-- 3) Execute SELECT * FROM alunos; para ver se funcionou
