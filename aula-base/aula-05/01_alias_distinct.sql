-- ============================================
-- AULA 05 - Buscando Dados (SELECT)
-- Arquivo 01: Alias (AS) e DISTINCT
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-05/01_alias_distinct.sql
-- ============================================

-- ----------------------------------------
-- AS (Alias) -- renomear colunas no resultado
-- ----------------------------------------
-- AS nao muda a tabela. So muda o nome que aparece no resultado.

SELECT nome AS aluno, email AS contato FROM alunos;

-- Resultado esperado:
-- aluno         | contato
-- Ana Silva     | ana@email.com
-- Carlos Souza  | carlos@email.com
-- ...

-- Util para cursos tambem:
SELECT nome AS curso, carga_horaria AS horas, preco AS valor FROM cursos;

-- Resultado esperado:
-- curso             | horas | valor
-- Banco de Dados    | 60    | 499.90
-- Programacao Web   | 80    | 699.90
-- ...

-- ----------------------------------------
-- Colunas calculadas com AS
-- ----------------------------------------
-- Voce pode criar colunas que nao existem na tabela!

-- Idade no proximo ano:
SELECT nome, idade, idade + 1 AS idade_proximo_ano FROM alunos;

-- Preco com desconto de 10%:
SELECT nome, preco, preco * 0.90 AS preco_com_desconto FROM cursos;

-- Resultado esperado:
-- nome              | preco  | preco_com_desconto
-- Banco de Dados    | 499.90 | 449.91
-- Programacao Web   | 699.90 | 629.91
-- ...

-- Preco formatado em reais:
SELECT nome, TO_CHAR(preco, 'R$ 999,999.99') AS preco_formatado FROM cursos;

-- ----------------------------------------
-- DISTINCT -- valores unicos (sem repeticao)
-- ----------------------------------------
-- Remove linhas duplicadas do resultado.

-- Quais idades existem? (sem repetir)
SELECT DISTINCT idade FROM alunos;

-- Resultado esperado:
-- idade
-- 20
-- 22
-- 19
-- 21
-- 23

-- Quais valores de "ativo" existem?
SELECT DISTINCT ativo FROM alunos;

-- Resultado esperado:
-- ativo
-- true
-- false

-- Quais alunos tem matricula? (sem repetir o mesmo aluno)
SELECT DISTINCT aluno_id FROM matriculas;

-- Sem DISTINCT, o aluno_id = 1 (Ana) apareceria 2 vezes
-- porque ela tem 2 matriculas.

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Use AS para renomear 'carga_horaria' para 'duracao' na tabela cursos
-- 2) Crie uma coluna calculada que mostre o preco dos cursos com 20% de desconto
-- 3) Use DISTINCT para ver quais curso_id diferentes existem em matriculas
-- 4) Use DISTINCT para ver quais status existem em matriculas
