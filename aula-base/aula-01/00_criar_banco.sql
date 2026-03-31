-- ============================================
-- AULA 01 - O que e SQL
-- Arquivo 00: Criar o Banco de Dados
-- ============================================
-- Execute com: psql -U seu_usuario -f aula-01/00_criar_banco.sql
-- ============================================

-- Um banco de dados e como um arquivo de escritorio grande.
-- Dentro dele, vamos guardar nossas "gavetas" (tabelas).

-- Primeiro, vamos ver quais bancos ja existem:
-- (descomente a linha abaixo se quiser listar)
-- SELECT datname FROM pg_database;

-- Criando o banco de dados "escola"
CREATE DATABASE escola;

-- Pronto! Agora o banco "escola" existe.
-- Os proximos arquivos devem ser executados conectado a esse banco:
--   psql -U seu_usuario -d escola -f aula-01/01_criar_tabelas_simples.sql
