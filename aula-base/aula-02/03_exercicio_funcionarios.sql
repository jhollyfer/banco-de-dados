-- ============================================
-- AULA 02 - Tipos de Dados
-- Arquivo 03: Exercicio - Tabela Completa
-- ============================================
-- Execute com: psql -U seu_usuario -d escola -f aula-02/03_exercicio_funcionarios.sql
-- ============================================

-- Exercicio da aula: criar uma tabela "funcionarios"
-- usando pelo menos 6 tipos diferentes.

-- Resumo dos tipos usados:
-- SERIAL       -> id auto-incrementado
-- VARCHAR(n)   -> texto com limite (nome, email, cpf)
-- DECIMAL(p,s) -> numero com casas decimais (salario)
-- INT          -> numero inteiro (numero de filhos)
-- BOOLEAN      -> verdadeiro/falso (ativo)
-- TEXT         -> texto longo (biografia)
-- DATE         -> data (admissao, nascimento)
-- TIMESTAMP    -> data + hora (criado_em)
-- CHAR(n)      -> texto fixo (UF do estado)

CREATE TABLE funcionarios (
    id              SERIAL          PRIMARY KEY,
    nome            VARCHAR(100)    NOT NULL,
    cpf             CHAR(11)        UNIQUE NOT NULL,    -- CPF sempre tem 11 digitos
    email           VARCHAR(255),
    salario         DECIMAL(10, 2)  NOT NULL,
    numero_filhos   INT             DEFAULT 0,
    ativo           BOOLEAN         DEFAULT TRUE,
    biografia       TEXT,
    data_nascimento DATE,
    data_admissao   DATE            NOT NULL,
    uf              CHAR(2),
    criado_em       TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
);

-- Inserindo funcionarios com todos os tipos
INSERT INTO funcionarios
    (nome, cpf, email, salario, numero_filhos, ativo, biografia, data_nascimento, data_admissao, uf)
VALUES
    ('Maria Souza', '12345678901', 'maria@empresa.com', 5500.00, 2, TRUE,
     'Formada em Ciencia da Computacao pela UFAM. Trabalha com banco de dados ha 5 anos.',
     '1990-05-15', '2020-01-10', 'AM'),

    ('Joao Santos', '98765432100', 'joao@empresa.com', 4200.50, 0, TRUE,
     'Recem formado em Sistemas de Informacao. Primeiro emprego na area de TI.',
     '1998-11-20', '2024-02-01', 'AM'),

    ('Paula Lima', '11122233344', 'paula@empresa.com', 8900.00, 1, FALSE,
     NULL,  -- biografia pode ser NULL (nao e NOT NULL)
     '1985-03-08', '2015-06-15', 'SP');

-- ----------------------------------------
-- Verificando os dados e tipos
-- ----------------------------------------

-- Todos os funcionarios
SELECT nome, cpf, salario, ativo, data_admissao FROM funcionarios;

-- Apenas ativos
SELECT nome, salario FROM funcionarios WHERE ativo;

-- Salarios formatados
SELECT nome, TO_CHAR(salario, 'R$ 999,999.99') AS salario_formatado
FROM funcionarios;

-- Funcionarios com filhos
SELECT nome, numero_filhos FROM funcionarios
WHERE numero_filhos > 0;

-- Funcionarios do Amazonas admitidos depois de 2020
SELECT nome, data_admissao FROM funcionarios
WHERE uf = 'AM' AND data_admissao >= '2020-01-01';

-- ========================================
-- TESTE VOCE MESMO
-- ========================================
-- 1) Adicione 2 novos funcionarios com dados completos
-- 2) Busque funcionarios com salario acima de 5000
-- 3) Busque funcionarios ativos do estado 'AM'
-- 4) Use EXTRACT para mostrar o ano de admissao de cada funcionario

-- ----------------------------------------
-- Limpeza (opcional)
-- ----------------------------------------
-- Se quiser limpar tudo que foi criado nesta aula:
-- DROP TABLE IF EXISTS funcionarios;
-- DROP TABLE IF EXISTS logs;
-- DROP TABLE IF EXISTS eventos;
-- DROP TABLE IF EXISTS usuarios;
-- DROP TABLE IF EXISTS postagens;
-- DROP TABLE IF EXISTS contatos;
-- DROP TABLE IF EXISTS estados;
-- DROP TABLE IF EXISTS produtos_precos;
-- DROP TABLE IF EXISTS produtos;
