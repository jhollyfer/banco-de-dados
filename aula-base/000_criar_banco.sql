-- ============================================
-- AULA 01 - Fundamentos de SQL
-- Arquivo 000: Criar o Banco de Dados
-- ============================================
-- Execute com: psql -U seu_usuario -f 000_criar_banco.sql
-- ============================================

-- Um banco de dados e como um arquivo de escritorio grande.
-- Dentro dele, vamos guardar nossas "gavetas" (tabelas).

-- Primeiro, vamos ver quais bancos ja existem:
-- (descomente a linha abaixo se quiser listar)
-- SELECT datname FROM pg_database;

-- Criando o banco de dados "escola"
CREATE DATABASE escola;

-- Pronto! Agora o banco "escola" existe.
-- Os proximos arquivos (001 em diante) devem ser executados
-- conectado a esse banco:
--   psql -U seu_usuario -d escola -f 001_criar_tabelas.sql
