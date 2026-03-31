-- ============================================
-- AULA 07 - Ordenando e Limitando
-- Arquivo 00: ORDER BY
-- ============================================
-- Requisito: Execute _setup_escola.sql antes
-- Execute com: psql -U seu_usuario -d escola -f aula-07/00_order_by.sql
-- ============================================

-- ORDER BY organiza os resultados em ordem.
-- Sem ORDER BY, o banco retorna os dados em qualquer ordem!

-- ----------------------------------------
-- ORDER BY ASC (crescente) -- padrao
-- ----------------------------------------
-- ASC = ascending = crescente (A->Z, 1->9, menor->maior)
-- E o padrao, entao nao precisa escrever ASC (mas pode).

-- Alunos em ordem alfabetica:
SELECT nome, idade FROM alunos ORDER BY nome;

-- Resultado esperado:
-- nome          | idade
-- Ana Silva     | 20
-- Carlos Souza  | 22
-- Julia Santos  | 19
-- Maria Costa   | 23
-- Pedro Lima    | 21

-- Alunos do mais novo ao mais velho:
SELECT nome, idade FROM alunos ORDER BY idade;

-- Resultado esperado:
-- nome          | idade
-- Julia Santos  | 19
-- Ana Silva     | 20
-- Pedro Lima    | 21
-- Carlos Souza  | 22
-- Maria Costa   | 23

-- ----------------------------------------
-- ORDER BY DESC (decrescente)
-- ----------------------------------------
-- DESC = descending = decrescente (Z->A, 9->1, maior->menor)

-- Alunos do mais velho ao mais novo:
SELECT nome, idade FROM alunos ORDER BY idade DESC;

-- Resultado esperado:
-- nome          | idade
-- Maria Costa   | 23
-- Carlos Souza  | 22
-- Pedro Lima    | 21
-- Ana Silva     | 20
-- Julia Santos  | 19

-- Cursos do mais caro ao mais barato:
SELECT nome, preco FROM cursos ORDER BY preco DESC;

-- Resultado esperado:
-- nome              | preco
-- Programacao Web   | 699.90
-- Banco de Dados    | 499.90
-- Design UI/UX      | 449.90
-- Redes             | 349.90

-- ----------------------------------------
-- ORDER BY com multiplas colunas
-- ----------------------------------------
-- Ordena pela primeira coluna. Se houver empate, usa a segunda.

-- Ordenar por ativo (ativos primeiro), depois por nome:
SELECT nome, ativo FROM alunos ORDER BY ativo DESC, nome ASC;

-- Resultado esperado:
-- nome          | ativo
-- Ana Silva     | true
-- Carlos Souza  | true
-- Julia Santos  | true
-- Maria Costa   | true
-- Pedro Lima    | false

-- Cursos por carga_horaria DESC, depois por nome ASC:
SELECT nome, carga_horaria, preco FROM cursos
ORDER BY carga_horaria DESC, nome ASC;

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Ordene cursos por carga_horaria crescente
-- 2) Ordene alunos por nome em ordem decrescente (Z->A)
-- 3) Ordene cursos por preco crescente, depois por nome decrescente
