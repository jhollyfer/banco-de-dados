-- ============================================
-- AULA 08 - Atualizando Dados (UPDATE)
-- Arquivo 00: UPDATE Basico
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-08/00_update_basico.sql
-- ============================================

-- UPDATE modifica dados que JA EXISTEM na tabela.
-- Sintaxe: UPDATE tabela SET coluna = valor WHERE condicao;

-- !! REGRA DE OURO !!
-- NUNCA execute UPDATE sem WHERE!
-- Sem WHERE, o UPDATE muda TODOS os registros da tabela.
-- Sempre use WHERE para especificar QUAIS registros mudar.

-- ----------------------------------------
-- Tecnica: SELECT antes de UPDATE
-- ----------------------------------------
-- Antes de alterar, VEJA o que vai ser alterado.
-- Isso evita erros!

-- PASSO 1: Ver o registro atual
SELECT * FROM alunos WHERE id = 1;

-- Resultado:
-- id | nome      | email          | idade | ativo
-- 1  | Ana Silva | ana@email.com  | 20    | true

-- PASSO 2: Fazer o UPDATE
UPDATE alunos
SET email = 'ana.nova@email.com'
WHERE id = 1;

-- PASSO 3: Confirmar a alteracao
SELECT * FROM alunos WHERE id = 1;

-- Resultado:
-- id | nome      | email              | idade | ativo
-- 1  | Ana Silva | ana.nova@email.com | 20    | true

-- ----------------------------------------
-- Mais exemplos de UPDATE basico
-- ----------------------------------------

-- Mudar a idade do Carlos:
SELECT nome, idade FROM alunos WHERE id = 2;
-- -> Carlos Souza, 22

UPDATE alunos SET idade = 23 WHERE id = 2;

SELECT nome, idade FROM alunos WHERE id = 2;
-- -> Carlos Souza, 23

-- Reativar o Pedro (que estava inativo):
SELECT nome, ativo FROM alunos WHERE id = 4;
-- -> Pedro Lima, false

UPDATE alunos SET ativo = TRUE WHERE id = 4;

SELECT nome, ativo FROM alunos WHERE id = 4;
-- -> Pedro Lima, true

-- Mudar o preco de um curso:
SELECT nome, preco FROM cursos WHERE id = 3;
-- -> Redes, 349.90

UPDATE cursos SET preco = 379.90 WHERE id = 3;

SELECT nome, preco FROM cursos WHERE id = 3;
-- -> Redes, 379.90

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Mude o email do Carlos (id=2) para 'carlos.novo@email.com'
--    (faca SELECT antes e depois para confirmar)
-- 2) Mude a idade da Julia (id=3) para 20
-- 3) Mude a carga_horaria do curso 'Design UI/UX' para 60
