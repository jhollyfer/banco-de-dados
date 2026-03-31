-- ============================================
-- AULA 04 - Inserindo Dados (INSERT INTO)
-- Arquivo 03: Erros Comuns no INSERT
-- ============================================
-- Requisito: Execute 00, 01 e 02 antes
-- Execute com: psql -U seu_usuario -d escola -f aula-04/03_erros_comuns.sql
-- ============================================

-- O banco de dados PROTEGE seus dados automaticamente
-- usando as regras que definimos (PK, FK, NOT NULL, UNIQUE).
-- Vamos testar cada protecao!

-- ----------------------------------------
-- ERRO 1: NOT NULL - campo obrigatorio vazio
-- ----------------------------------------
-- nome e NOT NULL. Se nao informar, o banco recusa.

-- Descomente para testar:
-- INSERT INTO alunos (email, idade) VALUES ('sem_nome@email.com', 25);

-- Erro esperado:
-- ERROR: null value in column "nome" violates not-null constraint

-- ----------------------------------------
-- ERRO 2: UNIQUE - valor duplicado
-- ----------------------------------------
-- email e UNIQUE. Dois alunos nao podem ter o mesmo email.

-- Descomente para testar:
-- INSERT INTO alunos (nome, email) VALUES ('Ana Maria', 'ana@email.com');

-- Erro esperado:
-- ERROR: duplicate key value violates unique constraint "alunos_email_key"
-- DETAIL: Key (email)=(ana@email.com) already exists.

-- ----------------------------------------
-- ERRO 3: PRIMARY KEY - id duplicado
-- ----------------------------------------
-- O id e gerado automaticamente, mas se forcarmos um id que ja existe:

-- Descomente para testar:
-- INSERT INTO alunos (id, nome, email) VALUES (1, 'Teste', 'teste@email.com');

-- Erro esperado:
-- ERROR: duplicate key value violates unique constraint "alunos_pkey"
-- DETAIL: Key (id)=(1) already exists.

-- ----------------------------------------
-- ERRO 4: FOREIGN KEY - referencia inexistente
-- ----------------------------------------
-- aluno_id na tabela matriculas deve existir na tabela alunos.
-- Se tentarmos matricular um aluno que nao existe:

-- Descomente para testar:
-- INSERT INTO matriculas (aluno_id, curso_id, data_matricula)
-- VALUES (999, 1, '2024-04-01');

-- Erro esperado:
-- ERROR: insert or update on table "matriculas" violates foreign key constraint
-- DETAIL: Key (aluno_id)=(999) is not present in table "alunos".

-- ----------------------------------------
-- ERRO 5: Tipo de dado errado
-- ----------------------------------------
-- idade e INT. Se tentarmos colocar texto:

-- Descomente para testar:
-- INSERT INTO alunos (nome, email, idade) VALUES ('Teste', 'x@email.com', 'vinte');

-- Erro esperado:
-- ERROR: invalid input syntax for type integer: "vinte"

-- ----------------------------------------
-- Resumo dos erros
-- ----------------------------------------
-- | Constraint    | O que protege              | Quando dispara                |
-- |---------------|----------------------------|-------------------------------|
-- | NOT NULL      | Campos obrigatorios        | Valor ausente ou NULL         |
-- | UNIQUE        | Valores sem repeticao      | Valor ja existe na coluna     |
-- | PRIMARY KEY   | Identidade unica (PK)      | Id duplicado                  |
-- | FOREIGN KEY   | Referencias validas (FK)   | Id referenciado nao existe    |
-- | Tipo de dado  | Formato correto            | Texto em coluna INT, etc.     |

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- Descomente cada INSERT acima, um por vez, e execute.
-- Observe o erro que aparece e compare com o erro esperado.
-- Depois comente novamente para o proximo teste.
--
-- Desafio extra: tente causar um erro que NAO esta listado acima!
