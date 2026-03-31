-- ============================================
-- AULA 08 - Atualizando Dados (UPDATE)
-- Arquivo 02: UPDATE com WHERE Complexo
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-08/02_update_com_where.sql
-- ============================================

-- ----------------------------------------
-- UPDATE com condicoes complexas
-- ----------------------------------------

-- Inativar alunos com menos de 20 anos:
SELECT nome, idade, ativo FROM alunos WHERE idade < 20;
-- -> Julia Santos, 19, true

UPDATE alunos SET ativo = FALSE WHERE idade < 20;

SELECT nome, idade, ativo FROM alunos WHERE nome = 'Julia Santos';
-- -> Julia Santos, 19, false

-- Reativar:
UPDATE alunos SET ativo = TRUE WHERE nome = 'Julia Santos';

-- ----------------------------------------
-- UPDATE com AND, OR, IN, BETWEEN, LIKE
-- ----------------------------------------

-- Dar desconto nos cursos com mais de 60h E preco acima de 500:
SELECT nome, carga_horaria, preco FROM cursos
WHERE carga_horaria > 60 AND preco > 500;

UPDATE cursos SET preco = preco * 0.90
WHERE carga_horaria > 60 AND preco > 500;

-- Mudar status de matriculas especificas usando IN:
SELECT * FROM matriculas WHERE id IN (1, 2, 3);

UPDATE matriculas SET status = 'confirmada'
WHERE id IN (1, 2, 3);

SELECT id, status FROM matriculas;

-- Mudar nome de alunos cujo email contem 'email.com':
-- (todos no nosso caso, mas em producao seria diferente)
-- SELECT nome, email FROM alunos WHERE email LIKE '%@email.com';

-- ----------------------------------------
-- O CENARIO DESASTRE: UPDATE sem WHERE
-- ----------------------------------------
-- O que acontece se voce esquecer o WHERE?

-- !! NAO EXECUTE ISSO !!
-- UPDATE alunos SET idade = 25;
-- -> TODOS os alunos ficam com idade 25!

-- !! NAO EXECUTE ISSO !!
-- UPDATE cursos SET preco = 0;
-- -> TODOS os cursos ficam com preco 0!

-- Por isso a regra: SEMPRE faca SELECT antes para ver o que sera afetado.

-- ----------------------------------------
-- Workflow seguro para UPDATE
-- ----------------------------------------

-- 1) SELECT para ver o que sera afetado:
SELECT nome, idade FROM alunos WHERE idade > 22;

-- 2) Verificar se sao os registros certos
-- (neste caso: Maria Costa, idade 23)

-- 3) Copiar o WHERE para o UPDATE:
UPDATE alunos SET idade = 24 WHERE idade > 22;

-- 4) SELECT novamente para confirmar:
SELECT nome, idade FROM alunos WHERE nome = 'Maria Costa';
-- -> Maria Costa, 24

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Selecione matriculas com aluno_id IN (1, 3). Depois mude o status para 'ativa'
-- 2) Aumente em 15% o preco dos cursos com carga_horaria BETWEEN 50 AND 70
-- 3) Mude o email de alunos cujo nome comeca com 'P' (LIKE 'P%')
-- 4) Desafio: como voce DESFARIA um UPDATE errado? (Pense antes de olhar abaixo)
--
-- Resposta: no SQL basico, NAO tem como desfazer!
-- Por isso o SELECT antes e tao importante.
-- Em producao, usamos TRANSACTIONS (BEGIN/ROLLBACK) para isso.
