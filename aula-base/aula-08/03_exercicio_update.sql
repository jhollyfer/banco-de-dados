-- ============================================
-- AULA 08 - Atualizando Dados (UPDATE)
-- Arquivo 03: Exercicio - Praticando UPDATE
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-08/03_exercicio_update.sql
-- ============================================

-- LEMBRE-SE: Faca SELECT antes de cada UPDATE!

-- ----------------------------------------
-- DESAFIO 1: Atualize o email da Ana (id=1)
--            para 'ana.silva@gmail.com'
-- ----------------------------------------

-- SELECT antes:

-- Seu UPDATE aqui:

-- SELECT depois:


-- ----------------------------------------
-- DESAFIO 2: Aumente a carga_horaria de 'Redes' em 20 horas
-- ----------------------------------------

-- SELECT antes:

-- Seu UPDATE aqui:

-- SELECT depois:


-- ----------------------------------------
-- DESAFIO 3: Ative todos os alunos inativos
-- ----------------------------------------

-- SELECT antes (quem esta inativo?):

-- Seu UPDATE aqui:

-- SELECT depois:


-- ----------------------------------------
-- DESAFIO 4: Aplique 15% de desconto nos cursos com preco > 500
-- ----------------------------------------

-- SELECT antes:

-- Seu UPDATE aqui:

-- SELECT depois:


-- ----------------------------------------
-- DESAFIO 5: Primeiro veja quais alunos tem idade < 21,
--            depois mude o status das matriculas deles para 'revisao'
-- ----------------------------------------

-- SELECT para encontrar os alunos:

-- SELECT para ver as matriculas desses alunos:

-- Seu UPDATE aqui:

-- SELECT depois:


-- ========================================
-- GABARITO (so olhe depois de tentar!)
-- ========================================

-- DESAFIO 1:
-- SELECT * FROM alunos WHERE id = 1;
-- UPDATE alunos SET email = 'ana.silva@gmail.com' WHERE id = 1;
-- SELECT * FROM alunos WHERE id = 1;

-- DESAFIO 2:
-- SELECT nome, carga_horaria FROM cursos WHERE nome = 'Redes';
-- UPDATE cursos SET carga_horaria = carga_horaria + 20 WHERE nome = 'Redes';
-- SELECT nome, carga_horaria FROM cursos WHERE nome = 'Redes';

-- DESAFIO 3:
-- SELECT nome, ativo FROM alunos WHERE ativo = FALSE;
-- UPDATE alunos SET ativo = TRUE WHERE ativo = FALSE;
-- SELECT nome, ativo FROM alunos;

-- DESAFIO 4:
-- SELECT nome, preco FROM cursos WHERE preco > 500;
-- UPDATE cursos SET preco = preco * 0.85 WHERE preco > 500;
-- SELECT nome, preco FROM cursos;

-- DESAFIO 5:
-- SELECT id, nome, idade FROM alunos WHERE idade < 21;
-- SELECT * FROM matriculas WHERE aluno_id IN (SELECT id FROM alunos WHERE idade < 21);
-- UPDATE matriculas SET status = 'revisao' WHERE aluno_id IN (SELECT id FROM alunos WHERE idade < 21);
-- SELECT * FROM matriculas;
