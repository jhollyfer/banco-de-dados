-- ============================================
-- AULA 08 - Atualizando Dados (UPDATE)
-- Arquivo 01: UPDATE com Multiplos Campos e Expressoes
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-08/01_update_multiplos_campos.sql
-- ============================================

-- ----------------------------------------
-- Atualizando multiplos campos de uma vez
-- ----------------------------------------
-- Separe os campos com virgula no SET.

SELECT * FROM alunos WHERE id = 1;

UPDATE alunos
SET nome = 'Ana Maria Silva',
    email = 'ana.maria@email.com',
    idade = 21
WHERE id = 1;

SELECT * FROM alunos WHERE id = 1;

-- Resultado:
-- id | nome             | email               | idade | ativo
-- 1  | Ana Maria Silva  | ana.maria@email.com | 21    | true

-- ----------------------------------------
-- UPDATE com expressoes (calculos)
-- ----------------------------------------
-- Voce pode usar o valor atual da coluna no calculo!

-- Aumentar preco em 10%:
SELECT nome, preco FROM cursos;

UPDATE cursos SET preco = preco * 1.10 WHERE id = 1;

SELECT nome, preco FROM cursos WHERE id = 1;
-- Banco de Dados: 499.90 -> 549.89

-- Dar desconto de 5% no curso mais caro:
UPDATE cursos SET preco = preco * 0.95 WHERE id = 2;

SELECT nome, preco FROM cursos WHERE id = 2;
-- Programacao Web: 699.90 -> 664.91 (aprox.)

-- Aumentar carga horaria em 10 horas:
UPDATE cursos SET carga_horaria = carga_horaria + 10 WHERE id = 3;

SELECT nome, carga_horaria FROM cursos WHERE id = 3;
-- Redes: 40 -> 50

-- ----------------------------------------
-- UPDATE com expressoes em multiplos campos
-- ----------------------------------------

-- Reajuste geral: aumentar preco em 5% e adicionar 5h de carga:
UPDATE cursos
SET preco = preco * 1.05,
    carga_horaria = carga_horaria + 5
WHERE id = 4;

SELECT nome, preco, carga_horaria FROM cursos WHERE id = 4;
-- Design UI/UX: preco + 5%, carga_horaria + 5

-- ----------------------------------------
-- Mudar o status de uma matricula
-- ----------------------------------------

SELECT * FROM matriculas WHERE id = 1;

UPDATE matriculas
SET status = 'concluida'
WHERE id = 1;

SELECT * FROM matriculas WHERE id = 1;
-- status: ativa -> concluida

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Mude o nome e email do Pedro (id=4) de uma vez
-- 2) Aumente o preco de TODOS os cursos em 3% (cuidado: sem WHERE!)
--    Neste caso, QUEREMOS afetar todos. Use: UPDATE cursos SET preco = preco * 1.03;
-- 3) Aumente a idade de todos os alunos em 1 ano
-- 4) Mude o status de todas as matriculas do aluno_id = 1 para 'cancelada'
