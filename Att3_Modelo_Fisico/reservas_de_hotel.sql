CREATE TABLE tb_hotel (
	ID_hotel SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	localizacao VARCHAR(255) NOT NULL,
	classificacao INTEGER CHECK (classificacao BETWEEN 1 AND 5) -- De 1 a 5 estrelas
);

CREATE TABLE tb_hospede (
	ID_hospede SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	contato VARCHAR(15) NOT NULL UNIQUE,
	cpf CHAR(11) NOT NULL UNIQUE,
	preferencia_quarto VARCHAR(50)
);

CREATE TABLE tb_quarto (
	ID_quarto SERIAL PRIMARY KEY,
	tipo VARCHAR(50) NOT NULL,
	capacidade INTEGER NOT NULL CHECK (capacidade > 0),
	preco_diaria DECIMAL(15,2) NOT NULL,
	status VARCHAR(20) CHECK (status IN ('disponível', 'ocupado', 'manutenção')) DEFAULT 'disponível',
	fk_hotel_ID_hotel INTEGER NOT NULL,
	FOREIGN KEY (fk_hotel_ID_hotel) REFERENCES tb_hotel(ID_hotel) ON DELETE CASCADE
);

CREATE TABLE tb_reserva (
	ID_reserva SERIAL PRIMARY KEY,
	data_entrada TIMESTAMP NOT NULL,
	data_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	data_saida TIMESTAMP NOT NULL,
	status VARCHAR(20) CHECK (status IN ('confirmada', 'cancelada', 'concluída')) DEFAULT 'confirmada',
	fk_hospede_ID_hospede INTEGER NOT NULL,
	fk_hotel_ID_hotel INTEGER NOT NULL,
	FOREIGN KEY (fk_hospede_ID_hospede) REFERENCES tb_hospede(ID_hospede) ON DELETE CASCADE,
	FOREIGN KEY (fk_hotel_ID_hotel) REFERENCES tb_hotel(ID_hotel) ON DELETE CASCADE
);

CREATE TABLE tb_hospede_reserva (
	fk_reserva_ID_reserva INTEGER NOT NULL,
	fk_hospede_ID_hospede INTEGER NOT NULL,
	PRIMARY KEY (fk_reserva_ID_reserva, fk_hospede_ID_hospede),
	FOREIGN KEY (fk_reserva_ID_reserva) REFERENCES tb_reserva(ID_reserva) ON DELETE CASCADE,
	FOREIGN KEY (fk_hospede_ID_hospede) REFERENCES tb_hospede(ID_hospede) ON DELETE CASCADE
);

CREATE TABLE tb_quarto_reserva (
	fk_reserva_ID_reserva INTEGER NOT NULL,
	fk_quarto_ID_quarto INTEGER NOT NULL,
	PRIMARY KEY (fk_reserva_ID_reserva, fk_quarto_ID_quarto),
	FOREIGN KEY (fk_reserva_ID_reserva) REFERENCES tb_reserva(ID_reserva) ON DELETE CASCADE,
	FOREIGN KEY (fk_quarto_ID_quarto) REFERENCES tb_quarto(ID_quarto) ON DELETE CASCADE
);
