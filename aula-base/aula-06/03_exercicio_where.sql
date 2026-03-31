-- ============================================
-- AULA 06 - Filtrando com WHERE
-- Arquivo 03: Exercicio - Praticando WHERE
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-06/03_exercicio_where.sql
-- ============================================

-- Resolva os desafios usando WHERE com os operadores aprendidos!

-- ----------------------------------------
-- DESAFIO 1: Busque alunos com idade exatamente 20
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome      | idade
-- Ana Silva | 20

-- ----------------------------------------
-- DESAFIO 2: Busque cursos com preco BETWEEN 400 AND 600
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome              | preco
-- Banco de Dados    | 499.90
-- Design UI/UX      | 449.90

-- ----------------------------------------
-- DESAFIO 3: Busque alunos cujo nome contem "Silva"
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome
-- Ana Silva

-- ----------------------------------------
-- DESAFIO 4: Busque alunos ativos com mais de 19 anos
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome          | idade | ativo
-- Ana Silva     | 20    | true
-- Carlos Souza  | 22    | true
-- Maria Costa   | 23    | true

-- ----------------------------------------
-- DESAFIO 5: Busque cursos com carga_horaria IN (40, 60, 80)
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado:
-- nome              | carga_horaria
-- Banco de Dados    | 60
-- Programacao Web   | 80
-- Redes             | 40

-- ----------------------------------------
-- DESAFIO 6: Busque matriculas de marco de 2024
--            (entre '2024-03-01' e '2024-03-31')
-- ----------------------------------------

-- Sua query aqui:


-- Resultado esperado: todas as 6 matriculas

-- ========================================
-- GABARITO (so olhe depois de tentar!)
-- ========================================

-- DESAFIO 1:
-- SELECT nome, idade FROM alunos WHERE idade = 20;

-- DESAFIO 2:
-- SELECT nome, preco FROM cursos WHERE preco BETWEEN 400 AND 600;

-- DESAFIO 3:
-- SELECT nome FROM alunos WHERE nome LIKE '%Silva%';

-- DESAFIO 4:
-- SELECT nome, idade, ativo FROM alunos WHERE ativo = TRUE AND idade > 19;

-- DESAFIO 5:
-- SELECT nome, carga_horaria FROM cursos WHERE carga_horaria IN (40, 60, 80);

-- DESAFIO 6:
-- SELECT * FROM matriculas WHERE data_matricula BETWEEN '2024-03-01' AND '2024-03-31';
