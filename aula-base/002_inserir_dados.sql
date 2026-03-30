-- ============================================
-- AULA 01 - Fundamentos de SQL
-- Arquivo 002: Inserir Dados
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f 002_inserir_dados.sql
-- ============================================

-- Agora vamos preencher nossas tabelas com dados.
-- INSERT INTO e o comando para adicionar registros (linhas).

-- ----------------------------------------
-- Inserindo alunos
-- ----------------------------------------
-- Nao precisamos informar o id porque ele e SERIAL (automatico).

INSERT INTO alunos (nome, idade, email) VALUES
    ('Ana',    20, 'ana@email.com'),
    ('Carlos', 22, 'carlos@email.com'),
    ('Julia',  19, 'julia@email.com');

-- Resultado na tabela alunos:
-- id | nome   | idade | email
-- 1  | Ana    | 20    | ana@email.com
-- 2  | Carlos | 22    | carlos@email.com
-- 3  | Julia  | 19    | julia@email.com

-- ----------------------------------------
-- Inserindo cursos
-- ----------------------------------------

INSERT INTO cursos (nome, carga_horaria) VALUES
    ('Banco de Dados',    60),
    ('Programacao Web',   80),
    ('Redes de Computadores', 40);

-- Resultado na tabela cursos:
-- id | nome                    | carga_horaria
-- 1  | Banco de Dados          | 60
-- 2  | Programacao Web         | 80
-- 3  | Redes de Computadores   | 40

-- ----------------------------------------
-- Inserindo matriculas
-- ----------------------------------------
-- Aqui usamos as chaves estrangeiras para conectar alunos a cursos.
-- aluno_id = 1 e a Ana, curso_id = 1 e Banco de Dados, etc.

INSERT INTO matriculas (aluno_id, curso_id, data_matricula) VALUES
    (1, 1, '2024-03-01'),  -- Ana em Banco de Dados
    (2, 1, '2024-03-02'),  -- Carlos em Banco de Dados
    (3, 2, '2024-03-01'),  -- Julia em Programacao Web
    (1, 2, '2024-03-05');  -- Ana tambem em Programacao Web

-- Resultado na tabela matriculas:
-- id | aluno_id | curso_id | data_matricula
-- 1  | 1        | 1        | 2024-03-01
-- 2  | 2        | 1        | 2024-03-02
-- 3  | 3        | 2        | 2024-03-01
-- 4  | 1        | 2        | 2024-03-05
