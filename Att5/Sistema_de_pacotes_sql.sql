/* Lógico_2: */

CREATE TABLE Destinatario (
    endereco VARCHAR,
    id INTEGER PRIMARY KEY,
    nome VARCHAR,
    email VARCHAR,
    contato VARCHAR(14),
    fk_Entregadores_id INTEGER,
    cpf INTEGER
);


CREATE TABLE Remetente (
    id INTEGER PRIMARY KEY,
    nome_empresa VARCHAR,
    contato VARCHAR,
    email VARCHAR,
    cnpj VARCHAR(18)
);

CREATE TABLE Entregadores (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    contato VARCHAR(14),
    placa_veiculo VARCHAR(7),
    cpf INTEGER,
    modelo_veiculo VARCHAR
);

CREATE TABLE Pacote (
    id_pacote INTEGER PRIMARY KEY,
    nome VARCHAR,
    data_hora TIMESTAMP,
    descricao VARCHAR,
    destino VARCHAR,
    fk_Entregadores_id INTEGER,
    fk_Remetente_id INTEGER,
    fk_Destinatario_id INTEGER
);
 
ALTER TABLE Destinatario ADD CONSTRAINT FK_Destinatario_2
    FOREIGN KEY (fk_Entregadores_id)
    REFERENCES Entregadores (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Pacote ADD CONSTRAINT FK_Pacote_2
    FOREIGN KEY (fk_Entregadores_id)
    REFERENCES Entregadores (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Pacote ADD CONSTRAINT FK_Pacote_3
    FOREIGN KEY (fk_Remetente_id)
    REFERENCES Remetente (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Pacote ADD CONSTRAINT FK_Pacote_4
    FOREIGN KEY (fk_Destinatario_id)
    REFERENCES Destinatario (id)
    ON DELETE RESTRICT;