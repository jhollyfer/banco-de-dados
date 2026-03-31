-- ============================================
-- AULA 09 - Deletando Dados (DELETE)
-- Arquivo 02: Soft Delete (Exclusao Logica)
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-09/02_soft_delete.sql
-- ============================================

-- No mundo real, nem sempre queremos APAGAR dados de verdade.
-- As vezes queremos apenas MARCAR como deletado.
-- Isso se chama SOFT DELETE (exclusao logica).

-- ----------------------------------------
-- Hard Delete vs Soft Delete
-- ----------------------------------------

-- HARD DELETE (o que fizemos ate agora):
--   DELETE FROM alunos WHERE id = 1;
--   -> O registro DESAPARECE para sempre!

-- SOFT DELETE (marcar como deletado):
--   UPDATE alunos SET ativo = FALSE WHERE id = 1;
--   -> O registro CONTINUA no banco, mas esta "inativo".

-- ----------------------------------------
-- Metodo 1: Coluna BOOLEAN (ativo)
-- ----------------------------------------
-- Nossa tabela alunos ja tem a coluna 'ativo'!

-- "Deletar" o Pedro (soft delete):
SELECT nome, ativo FROM alunos WHERE id = 4;
-- -> Pedro Lima, false (ja esta inativo no setup)

-- Se estivesse ativo, fariamos:
-- UPDATE alunos SET ativo = FALSE WHERE id = 4;

-- Buscar apenas alunos "ativos" (nao deletados):
SELECT nome, email FROM alunos WHERE ativo = TRUE;

-- Buscar alunos "deletados":
SELECT nome, email FROM alunos WHERE ativo = FALSE;
-- -> Pedro Lima

-- "Restaurar" um aluno deletado:
UPDATE alunos SET ativo = TRUE WHERE id = 4;
SELECT nome, ativo FROM alunos WHERE id = 4;
-- -> Pedro Lima, true (restaurado!)

-- ----------------------------------------
-- Metodo 2: Coluna TIMESTAMP (deletado_em)
-- ----------------------------------------
-- Mais informativo: sabe QUANDO foi deletado.

-- Adicionar a coluna:
ALTER TABLE alunos ADD COLUMN deletado_em TIMESTAMP;

-- Soft delete com data/hora:
UPDATE alunos
SET deletado_em = CURRENT_TIMESTAMP
WHERE id = 3;

SELECT nome, deletado_em FROM alunos;

-- Resultado esperado:
-- nome          | deletado_em
-- Ana Silva     | NULL            (ativo)
-- Carlos Souza  | NULL            (ativo)
-- Julia Santos  | 2024-XX-XX ...  (deletado!)
-- Pedro Lima    | NULL            (ativo)
-- Maria Costa   | NULL            (ativo)

-- Buscar registros "ativos" (nao deletados):
SELECT nome, email FROM alunos WHERE deletado_em IS NULL;

-- Buscar registros "deletados":
SELECT nome, deletado_em FROM alunos WHERE deletado_em IS NOT NULL;
-- -> Julia Santos

-- "Restaurar":
UPDATE alunos SET deletado_em = NULL WHERE id = 3;

-- ----------------------------------------
-- Por que usar Soft Delete?
-- ----------------------------------------
-- 1. Historico: saber o que existia antes
-- 2. Recuperacao: pode restaurar dados "deletados"
-- 3. Auditoria: saber quando e quem deletou
-- 4. Compliance: leis podem exigir manter registros

-- ----------------------------------------
-- Quando usar cada um?
-- ----------------------------------------
-- | Cenario                    | Metodo         |
-- |----------------------------|----------------|
-- | Dados de teste             | Hard Delete    |
-- | Limpeza de tabela temp     | TRUNCATE       |
-- | Conta de usuario           | Soft Delete    |
-- | Pedido/compra              | Soft Delete    |
-- | Log temporario             | Hard Delete    |
-- | Dados pessoais (LGPD)      | Hard Delete*   |

-- *LGPD pode exigir exclusao REAL dos dados pessoais.

-- Limpeza da coluna extra:
ALTER TABLE alunos DROP COLUMN deletado_em;

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Faca soft delete do Carlos (id=2) usando ativo = FALSE
-- 2) Busque todos os alunos ativos
-- 3) Restaure o Carlos (ativo = TRUE)
-- 4) Adicione deletado_em na tabela cursos e faca soft delete de 'Redes'
-- 5) Busque apenas cursos nao deletados (WHERE deletado_em IS NULL)
