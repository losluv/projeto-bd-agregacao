-- Tabela de Funcionários com Autorrelacionamento (Hierarquia)
CREATE TABLE funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    supervisor_id INTEGER REFERENCES funcionario(id)
);

-- Dependência de Existência (Entidade Fraca)
CREATE TABLE dependente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    funcionario_id INTEGER NOT NULL,
    CONSTRAINT fk_funcionario 
        FOREIGN KEY (funcionario_id) 
        REFERENCES funcionario(id) 
        ON DELETE CASCADE
);

CREATE TABLE projeto (
    id SERIAL PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL
);

-- Tabela que representa a Agregação (Relacionamento Funcionario-Projeto + Equipamento)
CREATE TABLE alocacao_equipamento (
    id SERIAL PRIMARY KEY,
    funcionario_id INTEGER,
    projeto_id INTEGER,
    nome_equipamento VARCHAR(100),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id),
    FOREIGN KEY (projeto_id) REFERENCES projeto(id)
);
