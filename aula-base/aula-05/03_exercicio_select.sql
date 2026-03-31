-- ============================================
-- AULA 05 - Buscando Dados (SELECT)
-- Arquivo 03: Exercicio - Praticando SELECT
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-05/03_exercicio_select.sql
-- ============================================

-- Resolva os desafios abaixo usando SELECT, AS, DISTINCT e COUNT.
-- Escreva suas queries abaixo de cada desafio!

-- ----------------------------------------
-- DESAFIO 1: Mostre apenas nome e email de todos os alunos
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome          | email
-- Ana Silva     | ana@email.com
-- Carlos Souza  | carlos@email.com
-- Julia Santos  | julia@email.com
-- Pedro Lima    | pedro@email.com
-- Maria Costa   | maria@email.com

-- ----------------------------------------
-- DESAFIO 2: Mostre cursos com nome renomeado para "curso"
--            e carga_horaria renomeada para "horas"
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- curso             | horas
-- Banco de Dados    | 60
-- Programacao Web   | 80
-- Redes             | 40
-- Design UI/UX      | 50

-- ----------------------------------------
-- DESAFIO 3: Mostre as idades distintas dos alunos
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado (5 idades diferentes):
-- idade
-- 20, 22, 19, 21, 23

-- ----------------------------------------
-- DESAFIO 4: Conte o total de cursos
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- total_cursos
-- 4

-- ----------------------------------------
-- DESAFIO 5: Mostre nome e preco dos cursos,
--            com preco renomeado para "valor"
--            e uma coluna calculada "valor_parcelado_3x"
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome              | valor  | valor_parcelado_3x
-- Banco de Dados    | 499.90 | 166.63
-- Programacao Web   | 699.90 | 233.30
-- Redes             | 349.90 | 116.63
-- Design UI/UX      | 449.90 | 149.97

-- ========================================
-- GABARITO (so olhe depois de tentar!)
-- ========================================
-- Descomente para ver as respostas:

-- DESAFIO 1:
-- SELECT nome, email FROM alunos;

-- DESAFIO 2:
-- SELECT nome AS curso, carga_horaria AS horas FROM cursos;

-- DESAFIO 3:
-- SELECT DISTINCT idade FROM alunos;

-- DESAFIO 4:
-- SELECT COUNT(*) AS total_cursos FROM cursos;

-- DESAFIO 5:
-- SELECT nome, preco AS valor, ROUND(preco / 3, 2) AS valor_parcelado_3x FROM cursos;
