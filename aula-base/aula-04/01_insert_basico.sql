-- ============================================
-- AULA 04 - Inserindo Dados (INSERT INTO)
-- Arquivo 01: INSERT Basico
-- ============================================
-- Requisito: Execute 00_setup_tabelas.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-04/01_insert_basico.sql
-- ============================================

-- INSERT INTO e o comando para ADICIONAR registros (linhas) em uma tabela.
-- Sintaxe: INSERT INTO tabela (colunas) VALUES (valores);

-- ----------------------------------------
-- Inserindo um unico registro
-- ----------------------------------------

-- O mapeamento e posicional:
--   coluna:  nome          email              idade
--   valor:   'Ana Silva'   'ana@email.com'    20

INSERT INTO alunos (nome, email, idade)
VALUES ('Ana Silva', 'ana@email.com', 20);

-- Verificar que foi inserido:
SELECT * FROM alunos;

-- Resultado esperado:
-- id | nome      | email          | idade | ativo | criado_em
-- 1  | Ana Silva | ana@email.com  | 20    | true  | (data/hora atual)

-- Note que:
-- id       -> gerado automaticamente (SERIAL)
-- ativo    -> preenchido com TRUE (DEFAULT)
-- criado_em -> preenchido com data/hora atual (DEFAULT)

-- ----------------------------------------
-- Inserindo mais registros, um por um
-- ----------------------------------------

INSERT INTO alunos (nome, email, idade)
VALUES ('Carlos Souza', 'carlos@email.com', 22);

INSERT INTO alunos (nome, email, idade)
VALUES ('Julia Santos', 'julia@email.com', 19);

SELECT * FROM alunos;

-- Resultado esperado:
-- id | nome          | email             | idade | ativo
-- 1  | Ana Silva     | ana@email.com     | 20    | true
-- 2  | Carlos Souza  | carlos@email.com  | 22    | true
-- 3  | Julia Santos  | julia@email.com   | 19    | true

-- ----------------------------------------
-- Omitindo colunas opcionais
-- ----------------------------------------
-- Colunas que aceitam NULL ou tem DEFAULT podem ser omitidas.

-- Sem idade (fica NULL):
INSERT INTO alunos (nome, email)
VALUES ('Pedro Lima', 'pedro@email.com');

-- Com ativo = FALSE (sobrescreve o DEFAULT):
INSERT INTO alunos (nome, email, idade, ativo)
VALUES ('Maria Costa', 'maria@email.com', 23, FALSE);

SELECT * FROM alunos;

-- Pedro: idade = NULL, ativo = TRUE (default)
-- Maria: idade = 23, ativo = FALSE (informado)

-- ----------------------------------------
-- Inserindo um curso
-- ----------------------------------------

INSERT INTO cursos (nome, descricao, carga_horaria, preco)
VALUES ('Banco de Dados', 'Fundamentos de SQL e modelagem', 60, 499.90);

SELECT * FROM cursos;

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Insira um aluno com seu proprio nome e email
-- 2) Insira um curso 'Programacao Web' com 80h e R$ 699.90
-- 3) Faca um SELECT para ver se ambos foram inseridos
