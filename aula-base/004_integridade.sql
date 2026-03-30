-- ============================================
-- AULA 01 - Fundamentos de SQL
-- Arquivo 004: Integridade dos Dados
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f 004_integridade.sql
-- ============================================

-- O banco de dados PROTEGE seus dados automaticamente
-- usando as regras que definimos (PK, FK, NOT NULL).
-- Vamos testar cada uma dessas protecoes!

-- ----------------------------------------
-- TESTE 1: Chave Estrangeira (FOREIGN KEY)
-- ----------------------------------------
-- Tentar matricular um aluno que NAO existe (aluno_id = 999)
-- ISSO VAI FALHAR! O banco recusa porque nao existe aluno com id 999.

INSERT INTO matriculas (aluno_id, curso_id, data_matricula)
VALUES (999, 1, '2024-04-01');

-- Erro esperado:
-- ERROR: insert or update on table "matriculas" violates foreign key constraint
-- DETAIL: Key (aluno_id)=(999) is not present in table "alunos".

-- ----------------------------------------
-- TESTE 2: Chave Primaria (PRIMARY KEY) - Unicidade
-- ----------------------------------------
-- Tentar inserir um aluno com id que ja existe (id = 1 ja e da Ana)
-- ISSO VAI FALHAR! A chave primaria nao permite valores duplicados.

INSERT INTO alunos (id, nome, idade, email)
VALUES (1, 'Pedro', 25, 'pedro@email.com');

-- Erro esperado:
-- ERROR: duplicate key value violates unique constraint "alunos_pkey"
-- DETAIL: Key (id)=(1) already exists.

-- ----------------------------------------
-- TESTE 3: NOT NULL
-- ----------------------------------------
-- Tentar inserir um aluno sem nome (nome e NOT NULL)
-- ISSO VAI FALHAR! O campo nome nao pode ser vazio.

INSERT INTO alunos (nome, idade, email)
VALUES (NULL, 25, 'teste@email.com');

-- Erro esperado:
-- ERROR: null value in column "nome" violates not-null constraint

-- ----------------------------------------
-- TESTE 4: Inserir sem informar o id (funciona!)
-- ----------------------------------------
-- O SERIAL gera o id automaticamente. Isso funciona perfeitamente.

INSERT INTO alunos (nome, idade, email)
VALUES ('Pedro', 25, 'pedro@email.com');

-- Verificar que o Pedro foi inserido com id automatico:
SELECT * FROM alunos WHERE nome = 'Pedro';

-- Resultado esperado:
-- id | nome  | idade | email
-- 4  | Pedro | 25    | pedro@email.com
