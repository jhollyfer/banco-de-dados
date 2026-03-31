-- ============================================
-- SETUP COMPARTILHADO - Base de Dados Escola
-- ============================================
-- Execute ANTES de iniciar as aulas do Modulo 2 (aulas 04-09).
-- Este arquivo cria as tabelas e insere dados para praticar.
-- Execute com: psql -U seu_usuario -d escola -f _setup_escola.sql
-- ============================================

-- Limpar tudo para comecar do zero
DROP TABLE IF EXISTS matriculas;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS alunos;

-- ----------------------------------------
-- Tabela: alunos
-- ----------------------------------------
CREATE TABLE alunos (
    id              SERIAL          PRIMARY KEY,
    nome            VARCHAR(100)    NOT NULL,
    email           VARCHAR(255)    UNIQUE NOT NULL,
    idade           INT,
    ativo           BOOLEAN         DEFAULT TRUE,
    criado_em       TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------------------
-- Tabela: cursos
-- ----------------------------------------
CREATE TABLE cursos (
    id             SERIAL         PRIMARY KEY,
    nome           VARCHAR(100)   NOT NULL,
    descricao      TEXT,
    carga_horaria  INT            NOT NULL,
    preco          DECIMAL(10, 2) NOT NULL
);

-- ----------------------------------------
-- Tabela: matriculas (conecta alunos <-> cursos)
-- ----------------------------------------
CREATE TABLE matriculas (
    id              SERIAL      PRIMARY KEY,
    aluno_id        INT         NOT NULL,
    curso_id        INT         NOT NULL,
    data_matricula  DATE        DEFAULT CURRENT_DATE,
    status          VARCHAR(20) DEFAULT 'ativa',

    FOREIGN KEY (aluno_id) REFERENCES alunos (id),
    FOREIGN KEY (curso_id) REFERENCES cursos (id)
);

-- ----------------------------------------
-- Inserindo alunos (5 registros)
-- ----------------------------------------
INSERT INTO alunos (nome, email, idade, ativo) VALUES
    ('Ana Silva',     'ana@email.com',    20, TRUE),
    ('Carlos Souza',  'carlos@email.com', 22, TRUE),
    ('Julia Santos',  'julia@email.com',  19, TRUE),
    ('Pedro Lima',    'pedro@email.com',  21, FALSE),  -- inativo de proposito
    ('Maria Costa',   'maria@email.com',  23, TRUE);

-- ----------------------------------------
-- Inserindo cursos (4 registros)
-- ----------------------------------------
INSERT INTO cursos (nome, descricao, carga_horaria, preco) VALUES
    ('Banco de Dados',    'Fundamentos de SQL e modelagem',  60, 499.90),
    ('Programacao Web',   'HTML, CSS, JavaScript e Node.js', 80, 699.90),
    ('Redes',             'Infraestrutura e protocolos',     40, 349.90),
    ('Design UI/UX',      'Figma, prototipacao e usabilidade', 50, 449.90);

-- ----------------------------------------
-- Inserindo matriculas (6 registros)
-- ----------------------------------------
INSERT INTO matriculas (aluno_id, curso_id, data_matricula) VALUES
    (1, 1, '2024-03-01'),  -- Ana em Banco de Dados
    (1, 2, '2024-03-05'),  -- Ana em Programacao Web
    (2, 1, '2024-03-02'),  -- Carlos em Banco de Dados
    (3, 2, '2024-03-01'),  -- Julia em Programacao Web
    (3, 4, '2024-03-10'),  -- Julia em Design UI/UX
    (5, 1, '2024-03-15');  -- Maria em Banco de Dados

-- ----------------------------------------
-- Verificando os dados
-- ----------------------------------------
SELECT '=== ALUNOS ===' AS info;
SELECT * FROM alunos;

SELECT '=== CURSOS ===' AS info;
SELECT * FROM cursos;

SELECT '=== MATRICULAS ===' AS info;
SELECT * FROM matriculas;

-- Resultado esperado:
-- 5 alunos (Pedro inativo), 4 cursos, 6 matriculas
-- Tudo pronto para as aulas 04-09!
