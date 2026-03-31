-- ============================================
-- AULA 03 - Criando Tabelas
-- Arquivo 02: ALTER TABLE e DROP TABLE
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f aula-03/02_alter_drop_table.sql
-- Rode DEPOIS do 01 (precisa das tabelas criadas la).
-- ============================================

-- ----------------------------------------
-- ALTER TABLE -- modificar tabelas existentes
-- ----------------------------------------

-- Adicionar coluna
ALTER TABLE alunos ADD COLUMN telefone VARCHAR(20);

-- Verificar que a coluna foi adicionada
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'alunos'
ORDER BY ordinal_position;

-- Atualizar dados com a nova coluna
UPDATE alunos SET telefone = '92 99999-0001' WHERE nome = 'Ana Silva';
UPDATE alunos SET telefone = '92 99999-0002' WHERE nome = 'Carlos Lima';

SELECT nome, telefone FROM alunos;

-- Mudar o tipo de uma coluna (no PostgreSQL usa ALTER COLUMN ... TYPE)
ALTER TABLE alunos ALTER COLUMN nome TYPE VARCHAR(200);

-- Renomear coluna
ALTER TABLE alunos RENAME COLUMN nome TO nome_completo;

-- Verificar a mudanca
SELECT nome_completo, email FROM alunos;

-- Desfazer a renomeacao para nao quebrar os proximos exemplos
ALTER TABLE alunos RENAME COLUMN nome_completo TO nome;

-- Remover a coluna telefone
ALTER TABLE alunos DROP COLUMN telefone;

-- ----------------------------------------
-- Adicionar constraint depois da criacao
-- ----------------------------------------

-- Adicionar UNIQUE em uma coluna existente
ALTER TABLE cursos ADD CONSTRAINT cursos_nome_unique UNIQUE (nome);

-- Testar: inserir curso com nome duplicado FALHA
-- INSERT INTO cursos (nome, carga_horaria, preco) VALUES ('Banco de Dados', 40, 299.90);
-- ERRO: duplicate key value violates unique constraint "cursos_nome_unique"

-- ----------------------------------------
-- DROP TABLE -- deletar tabelas
-- ----------------------------------------

-- IF EXISTS evita erro se a tabela nao existir
DROP TABLE IF EXISTS matriculas;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS alunos;

-- CUIDADO! DROP TABLE e irreversivel.
-- A ORDEM importa: delete primeiro as tabelas com FK
-- (matriculas depende de alunos e cursos, entao sai primeiro).

-- Verificar que as tabelas foram removidas
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- Recrie a tabela alunos (simples, com id, nome, email)
-- 1) Adicione uma coluna 'cidade' VARCHAR(100)
-- 2) Renomeie 'cidade' para 'municipio'
-- 3) Remova a coluna 'municipio'
-- 4) Apague a tabela
