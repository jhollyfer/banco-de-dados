-- ============================================
-- AULA 01 - Fundamentos de SQL
-- Arquivo 005: Limpar Banco de Dados
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f 005_limpar_banco.sql
-- ============================================

-- !! CUIDADO !! --
-- Os comandos abaixo APAGAM dados de forma IRREVERSIVEL.
-- So execute se realmente quiser limpar tudo.

-- ----------------------------------------
-- Deletar tabelas
-- ----------------------------------------
-- A ORDEM IMPORTA! Precisamos apagar primeiro as tabelas que
-- possuem chaves estrangeiras (matriculas depende de alunos e cursos).
-- Se tentarmos apagar "alunos" primeiro, o banco vai recusar
-- porque "matriculas" ainda faz referencia a ela.

DROP TABLE IF EXISTS matriculas;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS alunos;

-- ----------------------------------------
-- Deletar o banco de dados
-- ----------------------------------------
-- Para apagar o banco inteiro, voce precisa estar conectado
-- a OUTRO banco (nao pode apagar o banco que esta usando).
--
-- Execute no terminal:
--   psql -U seu_usuario -d postgres -c "DROP DATABASE escola;"
--
-- Ou descomente a linha abaixo e rode este arquivo conectado ao banco "postgres":
-- DROP DATABASE escola;
