-- ============================================
-- AULA 06 - Filtrando com WHERE
-- Arquivo 00: Operadores de Comparacao
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-06/00_operadores_comparacao.sql
-- ============================================

-- WHERE filtra os resultados do SELECT.
-- So retorna as linhas que atendem a condicao.
-- Sintaxe: SELECT ... FROM ... WHERE condicao;

-- ----------------------------------------
-- = (igual)
-- ----------------------------------------

SELECT * FROM alunos WHERE nome = 'Ana Silva';

-- Resultado: apenas a Ana

SELECT * FROM cursos WHERE carga_horaria = 60;

-- Resultado: apenas Banco de Dados

-- ----------------------------------------
-- != ou <> (diferente)
-- ----------------------------------------
-- Ambos funcionam da mesma forma.

SELECT nome, ativo FROM alunos WHERE ativo != TRUE;

-- Resultado: Pedro Lima (o unico inativo)

SELECT nome, preco FROM cursos WHERE preco <> 499.90;

-- Resultado: todos menos Banco de Dados

-- ----------------------------------------
-- > (maior que) e < (menor que)
-- ----------------------------------------

SELECT nome, idade FROM alunos WHERE idade > 20;

-- Resultado esperado:
-- nome          | idade
-- Carlos Souza  | 22
-- Pedro Lima    | 21
-- Maria Costa   | 23

SELECT nome, preco FROM cursos WHERE preco < 450;

-- Resultado esperado:
-- nome     | preco
-- Redes    | 349.90
-- Design UI/UX | 449.90

-- ----------------------------------------
-- >= (maior ou igual) e <= (menor ou igual)
-- ----------------------------------------

SELECT nome, idade FROM alunos WHERE idade >= 21;

-- Resultado esperado:
-- nome          | idade
-- Carlos Souza  | 22
-- Pedro Lima    | 21
-- Maria Costa   | 23

SELECT nome, carga_horaria FROM cursos WHERE carga_horaria <= 50;

-- Resultado esperado:
-- nome         | carga_horaria
-- Redes        | 40
-- Design UI/UX | 50

-- ----------------------------------------
-- WHERE com texto
-- ----------------------------------------

-- Texto usa aspas simples e e case-sensitive:
SELECT * FROM alunos WHERE nome = 'ana silva';
-- -> Nenhum resultado! (o correto e 'Ana Silva' com maiusculas)

SELECT * FROM alunos WHERE nome = 'Ana Silva';
-- -> Encontrou!

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Busque cursos com preco maior que 400
-- 2) Busque alunos com idade menor ou igual a 20
-- 3) Busque cursos com carga_horaria diferente de 80
-- 4) Busque o aluno com email = 'carlos@email.com'
