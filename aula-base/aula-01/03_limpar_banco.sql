-- ============================================
-- AULA 01 - O que e SQL
-- Arquivo 03: Limpar Banco de Dados
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f aula-01/03_limpar_banco.sql
-- ============================================

-- !! CUIDADO !! --
-- Os comandos abaixo APAGAM dados de forma IRREVERSIVEL.
-- So execute se realmente quiser limpar tudo.

-- ----------------------------------------
-- Deletar tabelas
-- ----------------------------------------
-- A ORDEM IMPORTA quando ha chaves estrangeiras!
-- Neste caso nao temos FK, entao qualquer ordem funciona.

DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS alunos;

-- ----------------------------------------
-- Deletar o banco de dados (opcional)
-- ----------------------------------------
-- Para apagar o banco inteiro, voce precisa estar conectado
-- a OUTRO banco (nao pode apagar o banco que esta usando).
--
-- Execute no terminal:
--   psql -U seu_usuario -d postgres -c "DROP DATABASE escola;"
