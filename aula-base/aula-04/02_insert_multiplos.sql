-- ============================================
-- AULA 04 - Inserindo Dados (INSERT INTO)
-- Arquivo 02: INSERT Multiplos Registros
-- ============================================
-- Requisito: Execute 00 e 01 antes
-- Execute com: psql -U seu_usuario -d escola -f aula-04/02_insert_multiplos.sql
-- ============================================

-- ----------------------------------------
-- Inserindo varios registros de uma vez
-- ----------------------------------------
-- Em vez de fazer um INSERT por linha, podemos usar uma lista de VALUES.
-- Isso e mais rapido e mais limpo!

-- Um INSERT por linha (funciona, mas e lento):
-- INSERT INTO cursos (...) VALUES (...);
-- INSERT INTO cursos (...) VALUES (...);
-- INSERT INTO cursos (...) VALUES (...);

-- Multi-row INSERT (melhor!):
INSERT INTO cursos (nome, descricao, carga_horaria, preco) VALUES
    ('Redes',        'Infraestrutura e protocolos',      40, 349.90),
    ('Design UI/UX', 'Figma, prototipacao e usabilidade', 50, 449.90);

SELECT * FROM cursos;

-- ----------------------------------------
-- Inserindo matriculas (usando chaves estrangeiras)
-- ----------------------------------------
-- aluno_id e curso_id devem existir nas respectivas tabelas.
-- aluno_id = 1 e a Ana, curso_id = 1 e Banco de Dados, etc.

INSERT INTO matriculas (aluno_id, curso_id, data_matricula) VALUES
    (1, 1, '2024-03-01'),  -- Ana em Banco de Dados
    (2, 1, '2024-03-02'),  -- Carlos em Banco de Dados
    (3, 2, '2024-03-01');  -- Julia em Programacao Web

-- Usando DEFAULT para data_matricula (preenche com a data de hoje):
INSERT INTO matriculas (aluno_id, curso_id) VALUES
    (1, 2),  -- Ana em Programacao Web (data = hoje)
    (5, 1);  -- Maria em Banco de Dados (data = hoje)

SELECT * FROM matriculas;

-- Resultado esperado:
-- id | aluno_id | curso_id | data_matricula | status
-- 1  | 1        | 1        | 2024-03-01     | ativa
-- 2  | 2        | 1        | 2024-03-02     | ativa
-- 3  | 3        | 2        | 2024-03-01     | ativa
-- 4  | 1        | 2        | (data de hoje) | ativa
-- 5  | 5        | 1        | (data de hoje) | ativa

-- ----------------------------------------
-- INSERT sem especificar colunas (CUIDADO!)
-- ----------------------------------------
-- Voce PODE omitir a lista de colunas, mas NAO e recomendado.
-- Os valores precisam estar na ordem exata das colunas da tabela.

-- INSERT INTO alunos VALUES (DEFAULT, 'Teste', 'teste@email.com', 25, TRUE, DEFAULT);

-- Por que NAO fazer isso?
-- 1. Se alguem adicionar uma coluna na tabela, seu INSERT quebra
-- 2. Fica dificil saber qual valor vai para qual coluna
-- 3. Voce precisa informar TODOS os campos, inclusive DEFAULT

-- SEMPRE especifique as colunas. E mais seguro e legivel!

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Insira 3 novos alunos em um unico INSERT
-- 2) Matricule o Carlos (id=2) no curso de Redes (id=3)
-- 3) Matricule a Julia (id=3) no Design UI/UX (id=4) com data de hoje
