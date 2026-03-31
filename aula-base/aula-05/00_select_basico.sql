-- ============================================
-- AULA 05 - Buscando Dados (SELECT)
-- Arquivo 00: SELECT Basico
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-05/00_select_basico.sql
-- ============================================

-- SELECT e o comando mais usado do SQL!
-- Ele BUSCA dados das tabelas.

-- ----------------------------------------
-- SELECT * (todas as colunas)
-- ----------------------------------------
-- O asterisco (*) significa "todas as colunas".

SELECT * FROM alunos;

-- Resultado esperado:
-- id | nome          | email             | idade | ativo | criado_em
-- 1  | Ana Silva     | ana@email.com     | 20    | true  | ...
-- 2  | Carlos Souza  | carlos@email.com  | 22    | true  | ...
-- 3  | Julia Santos  | julia@email.com   | 19    | true  | ...
-- 4  | Pedro Lima    | pedro@email.com   | 21    | false | ...
-- 5  | Maria Costa   | maria@email.com   | 23    | true  | ...

SELECT * FROM cursos;

-- Resultado esperado:
-- id | nome              | descricao                          | carga_horaria | preco
-- 1  | Banco de Dados    | Fundamentos de SQL e modelagem     | 60            | 499.90
-- 2  | Programacao Web   | HTML, CSS, JavaScript e Node.js    | 80            | 699.90
-- 3  | Redes             | Infraestrutura e protocolos        | 40            | 349.90
-- 4  | Design UI/UX      | Figma, prototipacao e usabilidade  | 50            | 449.90

-- ----------------------------------------
-- Colunas especificas
-- ----------------------------------------
-- Em vez de *, liste as colunas que voce quer.

SELECT nome, email FROM alunos;

-- Resultado esperado:
-- nome          | email
-- Ana Silva     | ana@email.com
-- Carlos Souza  | carlos@email.com
-- Julia Santos  | julia@email.com
-- Pedro Lima    | pedro@email.com
-- Maria Costa   | maria@email.com

-- A ordem das colunas no SELECT define a ordem no resultado:
SELECT email, nome, idade FROM alunos;

-- Resultado:
-- email             | nome          | idade
-- ana@email.com     | Ana Silva     | 20
-- carlos@email.com  | Carlos Souza  | 22
-- ...

-- ----------------------------------------
-- Selecionar de tabelas diferentes
-- ----------------------------------------

SELECT nome, carga_horaria, preco FROM cursos;

SELECT aluno_id, curso_id, data_matricula FROM matriculas;

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Escreva um SELECT que mostre apenas o nome e a idade dos alunos
-- 2) Escreva um SELECT que mostre nome e preco dos cursos
-- 3) Escreva um SELECT com * da tabela matriculas
