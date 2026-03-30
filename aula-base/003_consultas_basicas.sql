-- ============================================
-- AULA 01 - Fundamentos de SQL
-- Arquivo 003: Consultas Basicas (SELECT)
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f 003_consultas_basicas.sql
-- ============================================

-- SELECT e o comando para BUSCAR dados.
-- E o comando mais usado do SQL!

-- ----------------------------------------
-- Consultas simples
-- ----------------------------------------

-- Buscar nome e idade de todos os alunos
SELECT nome, idade FROM alunos;

-- Buscar TUDO da tabela cursos (* = todas as colunas)
SELECT * FROM cursos;

-- Buscar apenas alunos com idade maior que 19
SELECT nome, idade FROM alunos
WHERE idade > 19;

-- Buscar aluno pelo nome
SELECT * FROM alunos
WHERE nome = 'Ana';

-- ----------------------------------------
-- Consultas com relacionamentos (JOIN)
-- ----------------------------------------
-- JOIN conecta tabelas usando as chaves estrangeiras.
-- Aqui vemos o poder dos relacionamentos!

-- Quem esta matriculado em qual curso?
SELECT
    alunos.nome    AS aluno,
    cursos.nome    AS curso,
    matriculas.data_matricula
FROM matriculas
JOIN alunos ON matriculas.aluno_id = alunos.id
JOIN cursos ON matriculas.curso_id = cursos.id;

-- Resultado esperado:
-- aluno  | curso             | data_matricula
-- Ana    | Banco de Dados    | 2024-03-01
-- Carlos | Banco de Dados    | 2024-03-02
-- Julia  | Programacao Web   | 2024-03-01
-- Ana    | Programacao Web   | 2024-03-05

-- Quantos alunos cada curso tem?
SELECT
    cursos.nome       AS curso,
    COUNT(*)          AS total_alunos
FROM matriculas
JOIN cursos ON matriculas.curso_id = cursos.id
GROUP BY cursos.nome;

-- Resultado esperado:
-- curso             | total_alunos
-- Banco de Dados    | 2
-- Programacao Web   | 2
