-- ============================================
-- AULA 05 - Buscando Dados (SELECT)
-- Arquivo 02: COUNT - Contando Registros
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-05/02_count_basico.sql
-- ============================================

-- COUNT() conta quantos registros existem.
-- E a primeira "funcao de agregacao" que vamos aprender.

-- ----------------------------------------
-- COUNT(*) -- contar todos os registros
-- ----------------------------------------

SELECT COUNT(*) AS total_alunos FROM alunos;
-- -> 5

SELECT COUNT(*) AS total_cursos FROM cursos;
-- -> 4

SELECT COUNT(*) AS total_matriculas FROM matriculas;
-- -> 6

-- ----------------------------------------
-- COUNT com WHERE -- contar registros filtrados
-- ----------------------------------------

-- Quantos alunos estao ativos?
SELECT COUNT(*) AS alunos_ativos FROM alunos
WHERE ativo = TRUE;
-- -> 4

-- Quantos alunos tem mais de 20 anos?
SELECT COUNT(*) AS maiores_de_20 FROM alunos
WHERE idade > 20;
-- -> 3 (Carlos 22, Pedro 21, Maria 23)

-- Quantos cursos custam mais de R$ 400?
SELECT COUNT(*) AS cursos_caros FROM cursos
WHERE preco > 400;
-- -> 3

-- ----------------------------------------
-- COUNT(coluna) vs COUNT(*)
-- ----------------------------------------
-- COUNT(*) conta TODAS as linhas (mesmo com NULL).
-- COUNT(coluna) conta apenas linhas onde a coluna NAO e NULL.

-- Se algum aluno tiver idade NULL:
SELECT COUNT(*) AS total, COUNT(idade) AS com_idade FROM alunos;
-- Se todos tem idade preenchida, ambos dao o mesmo resultado.

-- ----------------------------------------
-- Combinando COUNT com DISTINCT
-- ----------------------------------------

-- Quantos alunos DIFERENTES tem matricula?
SELECT COUNT(DISTINCT aluno_id) AS alunos_matriculados FROM matriculas;
-- -> 4 (Ana, Carlos, Julia, Maria - Pedro nao tem matricula)

-- Quantos cursos DIFERENTES tem alunos?
SELECT COUNT(DISTINCT curso_id) AS cursos_com_alunos FROM matriculas;
-- -> 3 (Banco de Dados, Programacao Web, Design UI/UX)

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Conte quantos alunos tem idade menor que 21
-- 2) Conte quantos cursos tem carga_horaria >= 50
-- 3) Conte quantos aluno_id distintos existem em matriculas
-- 4) Conte quantas matriculas a Ana (aluno_id = 1) tem
