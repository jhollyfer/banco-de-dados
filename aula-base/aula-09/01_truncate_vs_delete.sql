-- ============================================
-- AULA 09 - Deletando Dados (DELETE)
-- Arquivo 01: TRUNCATE vs DELETE
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-09/01_truncate_vs_delete.sql
-- ============================================

-- Existem duas formas de apagar dados: DELETE e TRUNCATE.
-- Vamos entender a diferenca!

-- ----------------------------------------
-- Preparando uma tabela de teste
-- ----------------------------------------
-- Vamos criar uma tabela separada para testar com seguranca.

CREATE TABLE teste_delete (
    id   SERIAL PRIMARY KEY,
    nome VARCHAR(50)
);

INSERT INTO teste_delete (nome) VALUES
    ('Item 1'),
    ('Item 2'),
    ('Item 3'),
    ('Item 4'),
    ('Item 5');

SELECT * FROM teste_delete;

-- ----------------------------------------
-- DELETE -- remove linha por linha
-- ----------------------------------------

-- Pode usar WHERE para deletar linhas especificas:
DELETE FROM teste_delete WHERE id = 3;
SELECT * FROM teste_delete;
-- -> 4 registros (Item 3 foi removido)

-- Pode deletar TUDO (sem WHERE):
DELETE FROM teste_delete;
SELECT * FROM teste_delete;
-- -> 0 registros

-- Inserir novos dados depois do DELETE:
INSERT INTO teste_delete (nome) VALUES ('Novo Item');
SELECT * FROM teste_delete;
-- -> id = 6! O SERIAL continua de onde parou (nao volta para 1)

-- ----------------------------------------
-- TRUNCATE -- apaga tudo de uma vez
-- ----------------------------------------

-- Primeiro, vamos popular a tabela de novo:
INSERT INTO teste_delete (nome) VALUES
    ('Item A'),
    ('Item B'),
    ('Item C');

SELECT * FROM teste_delete;
-- -> ids: 6, 7, 8, 9 (SERIAL continua crescendo)

-- TRUNCATE apaga TUDO e RESETA o SERIAL:
TRUNCATE TABLE teste_delete RESTART IDENTITY;

SELECT * FROM teste_delete;
-- -> 0 registros

-- Inserir depois do TRUNCATE:
INSERT INTO teste_delete (nome) VALUES ('Primeiro');
SELECT * FROM teste_delete;
-- -> id = 1! O SERIAL voltou para 1!

-- ----------------------------------------
-- Comparacao: DELETE vs TRUNCATE
-- ----------------------------------------

-- | Caracteristica       | DELETE              | TRUNCATE                |
-- |----------------------|---------------------|-------------------------|
-- | Usa WHERE?           | SIM                 | NAO (apaga tudo)        |
-- | Velocidade           | Lento (linha a linha)| Rapido (instantaneo)   |
-- | Reseta SERIAL?       | NAO                 | SIM (com RESTART)       |
-- | Pode desfazer?       | SIM (com ROLLBACK)  | SIM (com ROLLBACK)      |
-- | Ativa triggers?      | SIM                 | NAO                     |
-- | Quando usar?         | Apagar registros    | Limpar tabela inteira   |
-- |                      | especificos         | (testes, reset)         |

-- Limpeza:
DROP TABLE teste_delete;

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Crie uma tabela 'teste_truncate' com id SERIAL e nome VARCHAR(50)
-- 2) Insira 5 registros
-- 3) Use DELETE para remover os 2 primeiros
-- 4) Insira mais 1 registro e veja qual id ele recebeu
-- 5) Use TRUNCATE RESTART IDENTITY para limpar tudo
-- 6) Insira mais 1 registro e veja qual id ele recebeu agora
-- 7) Apague a tabela com DROP TABLE
