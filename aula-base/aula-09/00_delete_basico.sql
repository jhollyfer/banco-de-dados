-- ============================================
-- AULA 09 - Deletando Dados (DELETE)
-- Arquivo 00: DELETE Basico
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-09/00_delete_basico.sql
-- ============================================

-- DELETE remove registros de uma tabela.
-- Sintaxe: DELETE FROM tabela WHERE condicao;

-- !! REGRA DE OURO !!
-- NUNCA execute DELETE sem WHERE!
-- Sem WHERE, o DELETE apaga TODOS os registros da tabela.

-- ----------------------------------------
-- Tecnica: SELECT antes de DELETE
-- ----------------------------------------
-- Igual ao UPDATE: VEJA o que vai ser deletado antes!

-- PASSO 1: Ver o que sera deletado
SELECT * FROM alunos WHERE id = 4;

-- Resultado:
-- id | nome       | email           | idade | ativo
-- 4  | Pedro Lima | pedro@email.com | 21    | false

-- PASSO 2: Deletar (o WHERE e o mesmo do SELECT!)
DELETE FROM alunos WHERE id = 4;

-- PASSO 3: Confirmar que foi deletado
SELECT * FROM alunos WHERE id = 4;
-- -> Nenhum resultado (Pedro foi removido)

SELECT * FROM alunos;
-- -> 4 alunos restantes (Ana, Carlos, Julia, Maria)

-- ----------------------------------------
-- DELETE com condicoes
-- ----------------------------------------

-- Primeiro, vamos ver as matriculas:
SELECT * FROM matriculas;

-- Deletar uma matricula especifica:
DELETE FROM matriculas WHERE id = 5;

-- Deletar matriculas de um aluno especifico:
-- (Primeiro veja quais sao)
SELECT * FROM matriculas WHERE aluno_id = 3;
-- -> Matriculas da Julia

DELETE FROM matriculas WHERE aluno_id = 3;

SELECT * FROM matriculas;

-- ----------------------------------------
-- RETURNING -- ver o que foi deletado (PostgreSQL)
-- ----------------------------------------
-- RETURNING mostra os registros no momento da exclusao.
-- Muito util para confirmar o que foi apagado!

DELETE FROM matriculas WHERE id = 6
RETURNING *;

-- Resultado: mostra o registro deletado antes de sumir

-- ----------------------------------------
-- O CENARIO DESASTRE: DELETE sem WHERE
-- ----------------------------------------

-- !! NAO EXECUTE ISSO !!
-- DELETE FROM alunos;
-- -> TODOS os alunos sao apagados!

-- !! NAO EXECUTE ISSO !!
-- DELETE FROM matriculas;
-- -> TODAS as matriculas sao apagadas!

-- Por isso: SEMPRE faca SELECT antes com o mesmo WHERE!

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Faca SELECT para ver todas as matriculas restantes
-- 2) Delete a matricula com id = 2 (use RETURNING para ver o que deletou)
-- 3) Faca SELECT para confirmar que foi deletada
-- 4) Tente deletar um aluno que tem matriculas. O que acontece?
--    (Dica: a FOREIGN KEY vai proteger os dados!)
