-- ============================================
-- AULA 07 - Ordenando e Limitando
-- Arquivo 03: Exercicio - Praticando ORDER BY, LIMIT, OFFSET
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-07/03_exercicio_ordenacao.sql
-- ============================================

-- ----------------------------------------
-- DESAFIO 1: Todos os alunos ordenados por idade
--            (mais novo primeiro)
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome          | idade
-- Julia Santos  | 19
-- Ana Silva     | 20
-- Pedro Lima    | 21
-- Carlos Souza  | 22
-- Maria Costa   | 23

-- ----------------------------------------
-- DESAFIO 2: Os 2 cursos mais caros
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome              | preco
-- Programacao Web   | 699.90
-- Banco de Dados    | 499.90

-- ----------------------------------------
-- DESAFIO 3: Pagina 2 dos alunos (2 por pagina, ordenado por nome)
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome          | idade
-- Julia Santos  | 19
-- Maria Costa   | 23

-- ----------------------------------------
-- DESAFIO 4: Alunos ativos, ordenados por nome DESC, limitado a 3
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome          | ativo
-- Maria Costa   | true
-- Julia Santos  | true
-- Carlos Souza  | true

-- ----------------------------------------
-- DESAFIO 5: Todos os cursos ordenados por carga_horaria DESC,
--            depois por nome ASC (em caso de empate)
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome              | carga_horaria
-- Programacao Web   | 80
-- Banco de Dados    | 60
-- Design UI/UX      | 50
-- Redes             | 40

-- ========================================
-- GABARITO (so olhe depois de tentar!)
-- ========================================

-- DESAFIO 1:
-- SELECT nome, idade FROM alunos ORDER BY idade ASC;

-- DESAFIO 2:
-- SELECT nome, preco FROM cursos ORDER BY preco DESC LIMIT 2;

-- DESAFIO 3:
-- SELECT nome, idade FROM alunos ORDER BY nome LIMIT 2 OFFSET 2;

-- DESAFIO 4:
-- SELECT nome, ativo FROM alunos WHERE ativo = TRUE ORDER BY nome DESC LIMIT 3;

-- DESAFIO 5:
-- SELECT nome, carga_horaria FROM cursos ORDER BY carga_horaria DESC, nome ASC;
