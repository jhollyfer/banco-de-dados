-- ============================================
-- AULA 06 - Filtrando com WHERE
-- Arquivo 01: BETWEEN, IN e LIKE
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-06/01_between_in_like.sql
-- ============================================

-- ----------------------------------------
-- BETWEEN -- entre dois valores (inclusive)
-- ----------------------------------------
-- Equivale a: coluna >= valor1 AND coluna <= valor2

-- Alunos com idade entre 19 e 21:
SELECT nome, idade FROM alunos
WHERE idade BETWEEN 19 AND 21;

-- Resultado esperado:
-- nome          | idade
-- Ana Silva     | 20
-- Julia Santos  | 19
-- Pedro Lima    | 21

-- Cursos com preco entre 400 e 600:
SELECT nome, preco FROM cursos
WHERE preco BETWEEN 400 AND 600;

-- Resultado esperado:
-- nome              | preco
-- Banco de Dados    | 499.90
-- Design UI/UX      | 449.90

-- BETWEEN com datas:
SELECT * FROM matriculas
WHERE data_matricula BETWEEN '2024-03-01' AND '2024-03-05';

-- ----------------------------------------
-- IN -- lista de valores permitidos
-- ----------------------------------------
-- Equivale a: coluna = valor1 OR coluna = valor2 OR coluna = valor3

-- Buscar alunos especificos:
SELECT nome, email FROM alunos
WHERE nome IN ('Ana Silva', 'Carlos Souza', 'Maria Costa');

-- Resultado esperado:
-- nome          | email
-- Ana Silva     | ana@email.com
-- Carlos Souza  | carlos@email.com
-- Maria Costa   | maria@email.com

-- Cursos com carga horaria de 40 ou 80:
SELECT nome, carga_horaria FROM cursos
WHERE carga_horaria IN (40, 80);

-- Resultado esperado:
-- nome              | carga_horaria
-- Programacao Web   | 80
-- Redes             | 40

-- NOT IN (excluir valores):
SELECT nome, idade FROM alunos
WHERE idade NOT IN (19, 23);

-- Resultado: Ana (20), Carlos (22), Pedro (21)

-- ----------------------------------------
-- LIKE -- busca por padrao (pattern matching)
-- ----------------------------------------
-- % = qualquer sequencia de caracteres (0 ou mais)
-- _ = exatamente UM caractere

-- Nomes que comecam com 'A':
SELECT nome FROM alunos WHERE nome LIKE 'A%';
-- -> Ana Silva

-- Nomes que comecam com 'J':
SELECT nome FROM alunos WHERE nome LIKE 'J%';
-- -> Julia Santos

-- Nomes que terminam com 'a':
SELECT nome FROM alunos WHERE nome LIKE '%a';
-- -> Ana Silva, Maria Costa

-- Nomes que contem 'ar':
SELECT nome FROM alunos WHERE nome LIKE '%ar%';
-- -> Carlos Souza, Maria Costa

-- Emails do dominio @email.com:
SELECT nome, email FROM alunos WHERE email LIKE '%@email.com';

-- O underscore (_) representa UM caractere:
-- Nomes com exatamente 3 letras antes de um espaco:
SELECT nome FROM alunos WHERE nome LIKE '___% %';
-- -> Ana Silva, Pedro Lima (3 letras + espaco + sobrenome)

-- ILIKE (PostgreSQL) -- LIKE sem diferenciar maiusculas/minusculas:
SELECT nome FROM alunos WHERE nome ILIKE 'ana%';
-- -> Ana Silva (funciona mesmo com 'ana' minusculo!)

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Busque cursos com carga_horaria BETWEEN 50 AND 80
-- 2) Busque alunos com idade IN (19, 20, 21)
-- 3) Busque alunos cujo nome comeca com 'M'
-- 4) Busque cursos cujo nome contem 'de'
-- 5) Busque alunos cujo email contem 'santos'
