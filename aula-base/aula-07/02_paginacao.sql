-- ============================================
-- AULA 07 - Ordenando e Limitando
-- Arquivo 02: Paginacao
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-07/02_paginacao.sql
-- ============================================

-- Paginacao e dividir resultados em "paginas", como o Google.
-- Imagina um site mostrando 2 alunos por pagina.

-- ----------------------------------------
-- Formula da paginacao
-- ----------------------------------------
-- OFFSET = (pagina - 1) * itens_por_pagina
--
-- Pagina 1: OFFSET = (1-1) * 2 = 0
-- Pagina 2: OFFSET = (2-1) * 2 = 2
-- Pagina 3: OFFSET = (3-1) * 2 = 4

-- ----------------------------------------
-- Exemplo: 2 alunos por pagina, ordenados por nome
-- ----------------------------------------

-- PAGINA 1:
SELECT nome, idade FROM alunos
ORDER BY nome
LIMIT 2 OFFSET 0;

-- Resultado:
-- nome          | idade
-- Ana Silva     | 20
-- Carlos Souza  | 22

-- PAGINA 2:
SELECT nome, idade FROM alunos
ORDER BY nome
LIMIT 2 OFFSET 2;

-- Resultado:
-- nome          | idade
-- Julia Santos  | 19
-- Maria Costa   | 23

-- PAGINA 3:
SELECT nome, idade FROM alunos
ORDER BY nome
LIMIT 2 OFFSET 4;

-- Resultado:
-- nome          | idade
-- Pedro Lima    | 21

-- (so 1 registro na ultima pagina, porque temos 5 alunos)

-- ----------------------------------------
-- Paginacao com filtro
-- ----------------------------------------
-- Voce pode combinar WHERE + ORDER BY + LIMIT/OFFSET!

-- Alunos ativos, pagina 1, 2 por pagina:
SELECT nome, idade FROM alunos
WHERE ativo = TRUE
ORDER BY nome
LIMIT 2 OFFSET 0;

-- Resultado:
-- nome          | idade
-- Ana Silva     | 20
-- Carlos Souza  | 22

-- Alunos ativos, pagina 2, 2 por pagina:
SELECT nome, idade FROM alunos
WHERE ativo = TRUE
ORDER BY nome
LIMIT 2 OFFSET 2;

-- Resultado:
-- nome          | idade
-- Julia Santos  | 19
-- Maria Costa   | 23

-- ----------------------------------------
-- Contar total de paginas
-- ----------------------------------------
-- Para saber quantas paginas existem, use COUNT:

SELECT COUNT(*) AS total_alunos FROM alunos;
-- -> 5

-- Com 2 por pagina: 5 / 2 = 2.5, arredonda para cima = 3 paginas

SELECT CEIL(COUNT(*)::DECIMAL / 2) AS total_paginas FROM alunos;
-- -> 3

-- Com filtro:
SELECT CEIL(COUNT(*)::DECIMAL / 2) AS total_paginas
FROM alunos WHERE ativo = TRUE;
-- -> 2

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- Usando a tabela cursos com 3 itens por pagina:
-- 1) Escreva a query da pagina 1 (ordenado por nome)
-- 2) Escreva a query da pagina 2
-- 3) Calcule quantas paginas existem (com 3 por pagina)
--
-- Agora com 1 item por pagina nos alunos:
-- 4) Escreva as queries para paginas 1, 2, 3, 4 e 5
