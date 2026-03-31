-- ============================================
-- AULA 09 - Deletando Dados (DELETE)
-- Arquivo 03: Exercicio - Praticando DELETE
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-09/03_exercicio_delete.sql
-- ============================================

-- LEMBRE-SE: Faca SELECT antes de cada DELETE!

-- ----------------------------------------
-- DESAFIO 1: Veja todas as matriculas da Ana (aluno_id = 1),
--            depois delete-as
-- ----------------------------------------

-- SELECT antes:

-- Seu DELETE aqui:

-- SELECT depois:


-- ----------------------------------------
-- DESAFIO 2: Delete cursos com carga_horaria < 50
--            (SELECT primeiro para ver quais sao!)
-- ----------------------------------------

-- SELECT antes:

-- Seu DELETE aqui:

-- SELECT depois:


-- ----------------------------------------
-- DESAFIO 3: Crie uma tabela de teste, insira 5 registros
--            e use TRUNCATE para limpar tudo
-- ----------------------------------------

-- Criar tabela:

-- Inserir dados:

-- Verificar:

-- TRUNCATE:

-- Verificar novamente:

-- DROP TABLE:


-- ----------------------------------------
-- DESAFIO 4: Implemente soft delete na tabela cursos
--            (adicione coluna deletado_em, "delete" um curso)
-- ----------------------------------------

-- Adicionar coluna:

-- Soft delete de um curso:

-- Buscar cursos "ativos":

-- Buscar cursos "deletados":


-- ----------------------------------------
-- DESAFIO 5: Escreva uma query que mostre apenas cursos
--            "ativos" (nao soft-deletados) com nome e preco
-- ----------------------------------------

-- Sua query aqui:


-- ========================================
-- GABARITO (so olhe depois de tentar!)
-- ========================================

-- DESAFIO 1:
-- SELECT * FROM matriculas WHERE aluno_id = 1;
-- DELETE FROM matriculas WHERE aluno_id = 1;
-- SELECT * FROM matriculas;

-- DESAFIO 2:
-- SELECT nome, carga_horaria FROM cursos WHERE carga_horaria < 50;
-- DELETE FROM matriculas WHERE curso_id IN (SELECT id FROM cursos WHERE carga_horaria < 50);
-- DELETE FROM cursos WHERE carga_horaria < 50;
-- SELECT * FROM cursos;

-- DESAFIO 3:
-- CREATE TABLE teste (id SERIAL PRIMARY KEY, nome VARCHAR(50));
-- INSERT INTO teste (nome) VALUES ('A'), ('B'), ('C'), ('D'), ('E');
-- SELECT * FROM teste;
-- TRUNCATE TABLE teste RESTART IDENTITY;
-- SELECT * FROM teste;
-- DROP TABLE teste;

-- DESAFIO 4:
-- ALTER TABLE cursos ADD COLUMN deletado_em TIMESTAMP;
-- UPDATE cursos SET deletado_em = CURRENT_TIMESTAMP WHERE nome = 'Redes';
-- SELECT nome, preco FROM cursos WHERE deletado_em IS NULL;
-- SELECT nome, deletado_em FROM cursos WHERE deletado_em IS NOT NULL;

-- DESAFIO 5:
-- SELECT nome, preco FROM cursos WHERE deletado_em IS NULL;
