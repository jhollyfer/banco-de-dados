-- ============================================
-- AULA 06 - Filtrando com WHERE
-- Arquivo 02: IS NULL, AND, OR e NOT
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-06/02_is_null_and_or.sql
-- ============================================

-- ----------------------------------------
-- IS NULL / IS NOT NULL
-- ----------------------------------------
-- NULL significa "sem valor" ou "desconhecido".
-- IMPORTANTE: Voce NAO pode usar = NULL. Use IS NULL!

-- ERRADO (nao funciona!):
SELECT * FROM alunos WHERE idade = NULL;
-- -> Nenhum resultado, MESMO que existam NULLs!

-- CERTO:
SELECT * FROM alunos WHERE idade IS NULL;
-- -> Alunos sem idade cadastrada (se houver)

-- Alunos COM idade cadastrada:
SELECT nome, idade FROM alunos WHERE idade IS NOT NULL;
-- -> Todos os 5 alunos (todos tem idade no nosso setup)

-- ----------------------------------------
-- AND -- todas as condicoes devem ser verdadeiras
-- ----------------------------------------

-- Alunos ativos E com mais de 20 anos:
SELECT nome, idade, ativo FROM alunos
WHERE ativo = TRUE AND idade > 20;

-- Resultado esperado:
-- nome          | idade | ativo
-- Carlos Souza  | 22    | true
-- Maria Costa   | 23    | true

-- Pedro tem 21 anos mas ativo = FALSE, entao nao aparece!

-- Cursos com mais de 50h E preco abaixo de 500:
SELECT nome, carga_horaria, preco FROM cursos
WHERE carga_horaria > 50 AND preco < 500;

-- Resultado esperado:
-- nome            | carga_horaria | preco
-- Banco de Dados  | 60            | 499.90

-- ----------------------------------------
-- OR -- pelo menos UMA condicao deve ser verdadeira
-- ----------------------------------------

-- Alunos com menos de 20 anos OU mais de 22:
SELECT nome, idade FROM alunos
WHERE idade < 20 OR idade > 22;

-- Resultado esperado:
-- nome          | idade
-- Julia Santos  | 19
-- Maria Costa   | 23

-- Cursos de 40 ou 80 horas:
SELECT nome, carga_horaria FROM cursos
WHERE carga_horaria = 40 OR carga_horaria = 80;

-- ----------------------------------------
-- NOT -- inverte a condicao
-- ----------------------------------------

-- Alunos que NAO estao ativos:
SELECT nome, ativo FROM alunos WHERE NOT ativo;
-- -> Pedro Lima

-- No PostgreSQL, WHERE NOT ativo e igual a WHERE ativo = FALSE.

-- Alunos cujo nome NAO comeca com 'A':
SELECT nome FROM alunos WHERE nome NOT LIKE 'A%';
-- -> Carlos, Julia, Pedro, Maria

-- ----------------------------------------
-- Combinando AND, OR e parenteses
-- ----------------------------------------
-- CUIDADO! AND tem prioridade sobre OR (como * tem sobre + na matematica).
-- Use parenteses para deixar claro!

-- SEM parenteses (AND executa primeiro):
SELECT nome, idade, ativo FROM alunos
WHERE idade > 20 OR ativo = FALSE AND idade < 22;

-- O banco interpreta como:
-- idade > 20 OR (ativo = FALSE AND idade < 22)
-- Pode dar resultado inesperado!

-- COM parenteses (intencao clara):
SELECT nome, idade, ativo FROM alunos
WHERE (idade > 20 OR ativo = FALSE) AND nome LIKE '%a%';

-- Resultado esperado:
-- nome          | idade | ativo
-- Carlos Souza  | 22    | true    (idade > 20 E nome tem 'a')
-- Maria Costa   | 23    | true    (idade > 20 E nome tem 'a')

-- DICA: Na duvida, SEMPRE use parenteses!

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Busque alunos que sao ativos AND tem idade >= 20
-- 2) Busque cursos com preco < 400 OR carga_horaria > 60
-- 3) Busque alunos que NAO tem o nome 'Ana Silva'
-- 4) Busque alunos com (idade > 20 OR ativo = FALSE) AND email LIKE '%@email.com'
