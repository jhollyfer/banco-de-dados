-- ============================================
-- AULA 01 - O que e SQL
-- Arquivo 02: Verificar Estrutura e Consultas Basicas
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f aula-01/02_verificar_estrutura.sql
-- ============================================

-- ----------------------------------------
-- Ver quais tabelas existem no banco
-- ----------------------------------------
-- Equivalente ao SHOW TABLES do MySQL:
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

-- ----------------------------------------
-- Ver a estrutura de uma tabela
-- ----------------------------------------
-- Equivalente ao DESCRIBE do MySQL:
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'alunos'
ORDER BY ordinal_position;

-- ----------------------------------------
-- Consultas simples com SELECT
-- ----------------------------------------

-- Buscar TUDO da tabela alunos (* = todas as colunas)
SELECT * FROM alunos;

-- Buscar apenas nome e idade
SELECT nome, idade FROM alunos;

-- Buscar alunos com idade maior que 19
SELECT nome, idade FROM alunos
WHERE idade > 19;

-- Resultado esperado:
-- nome   | idade
-- Ana    | 20
-- Carlos | 22

-- Buscar aluno pelo nome
SELECT * FROM alunos
WHERE nome = 'Ana';

-- Resultado esperado:
-- id | nome | idade | email
-- 1  | Ana  | 20    | ana@email.com

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Escreva um SELECT que mostre apenas os emails dos alunos
-- 2) Escreva um SELECT que busque cursos com carga_horaria > 50
-- 3) Busque o aluno 'Carlos' pelo nome
