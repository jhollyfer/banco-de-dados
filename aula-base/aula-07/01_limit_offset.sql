-- ============================================
-- AULA 07 - Ordenando e Limitando
-- Arquivo 01: LIMIT e OFFSET
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-07/01_limit_offset.sql
-- ============================================

-- LIMIT restringe quantos registros o SELECT retorna.
-- OFFSET pula registros antes de comecar a retornar.

-- ----------------------------------------
-- LIMIT -- limitar quantidade de resultados
-- ----------------------------------------

-- Apenas os 3 primeiros alunos (por id):
SELECT nome, idade FROM alunos ORDER BY id LIMIT 3;

-- Resultado esperado:
-- nome          | idade
-- Ana Silva     | 20
-- Carlos Souza  | 22
-- Julia Santos  | 19

-- Apenas 2 cursos:
SELECT nome, preco FROM cursos ORDER BY preco LIMIT 2;

-- Resultado esperado:
-- nome    | preco
-- Redes   | 349.90
-- Design UI/UX | 449.90

-- ----------------------------------------
-- Top-N: os maiores / menores / melhores
-- ----------------------------------------

-- Os 2 cursos mais caros:
SELECT nome, preco FROM cursos
ORDER BY preco DESC
LIMIT 2;

-- Resultado esperado:
-- nome              | preco
-- Programacao Web   | 699.90
-- Banco de Dados    | 499.90

-- Os 3 alunos mais novos:
SELECT nome, idade FROM alunos
ORDER BY idade ASC
LIMIT 3;

-- Resultado esperado:
-- nome          | idade
-- Julia Santos  | 19
-- Ana Silva     | 20
-- Pedro Lima    | 21

-- O curso mais barato:
SELECT nome, preco FROM cursos
ORDER BY preco ASC
LIMIT 1;

-- Resultado: Redes - 349.90

-- ----------------------------------------
-- OFFSET -- pular registros
-- ----------------------------------------
-- OFFSET diz quantos registros pular antes de comecar.

-- Pular os 2 primeiros alunos, retornar o resto:
SELECT nome, idade FROM alunos
ORDER BY id
OFFSET 2;

-- Resultado esperado:
-- nome          | idade
-- Julia Santos  | 19
-- Pedro Lima    | 21
-- Maria Costa   | 23

-- ----------------------------------------
-- LIMIT + OFFSET juntos
-- ----------------------------------------

-- Pular 2, pegar os proximos 2:
SELECT nome, idade FROM alunos
ORDER BY id
LIMIT 2 OFFSET 2;

-- Resultado esperado:
-- nome          | idade
-- Julia Santos  | 19
-- Pedro Lima    | 21

-- !! IMPORTANTE !!
-- LIMIT sem ORDER BY da resultados IMPREVISIVEIS!
-- O banco pode retornar qualquer ordem.
-- SEMPRE use ORDER BY junto com LIMIT.

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Busque os 2 alunos mais velhos (ORDER BY idade DESC LIMIT 2)
-- 2) Busque o curso mais caro (LIMIT 1)
-- 3) Pule os 3 primeiros alunos e mostre o resto
-- 4) Busque o 2o e 3o curso mais barato (LIMIT 2 OFFSET 1)
