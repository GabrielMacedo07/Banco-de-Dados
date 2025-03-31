-- Criação da tabela clientes
CREATE TABLE tb_clientes (
	id serial PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255),
	data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	ativo BOOLEAN DEFAULT true
);

INSERT INTO tb_clientes (
	nome,
	email,
	ativo
)	VALUES 
('Gabriel Macedo Costa Santos','santosgabrielmacedo@gmail.com',TRUE),
('Wesley', 'desconhecido@gmail.com', FALSE),
('João', 'joão@gmail.com', FALSE),
('Daniel', 'daniel@gmail.com', FALSE),
('Carlos', 'carlos@gmail.com', TRUE);

SELECT * FROM tb_clientes

-- Criação da tabela produtos
CREATE TABLE tb_produtos (
	id serial PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	preco NUMERIC (10,2) DEFAULT 0.00 NOT NULL,
	estoque INTEGER DEFAULT 0 NOT NULL,
	categoria VARCHAR(50) NOT NULL
)

INSERT INTO tb_produtos (
	nome,
	preco,
	estoque,
	categoria
) VALUES 
('Dell G15', 7498.00, 15, 'Eletrônicos'),
('Lenovo LOQ', 8500.50, 20, 'Eletrônicos'),
('Asus TUF', 5379.00, 10, 'Eletrônicos'),
('Acer Nitro 5', 3499.01, 12, 'Eletrônicos');

SELECT * FROM tb_produtos

-- aumento do preço em 10% de todos os eletrônicos 
UPDATE tb_produtos SET preco = preco * 1.10 WHERE categoria = 'Eletrônicos';


-- Criação da tabela pedidos , carregando as chaves estrangeiras
CREATE TABLE tb_pedidos(
	id SERIAL PRIMARY KEY,
    fk_id_clientes INTEGER NOT NULL REFERENCES tb_clientes(id),
    fk_id_produtos INTEGER NOT NULL REFERENCES tb_produtos(id),
    quantidade INTEGER NOT NULL DEFAULT 1 CHECK (quantidade > 0),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total NUMERIC(10,2) NOT NULL
)
-- Inserindo pedidos para clientes ativos e inativos
INSERT INTO tb_pedidos (fk_id_clientes, fk_id_produtos, quantidade, valor_total)
VALUES
    (1, 1, 1, (SELECT preco FROM tb_produtos WHERE id = 1)),  -- Gabriel (ativo) comprou 1 Dell G15
    (5, 2, 1, (SELECT preco FROM tb_produtos WHERE id = 2)),  -- Carlos (ativo) comprou 1 Lenovo LOQ
    (2, 3, 2, 2 * (SELECT preco FROM tb_produtos WHERE id = 3)),  -- Wesley (inativo) comprou 2 Asus TUF
    (3, 4, 1, (SELECT preco FROM tb_produtos WHERE id = 4)),  -- João (inativo) comprou 1 Acer Nitro 5
    (4, 1, 1, (SELECT preco FROM tb_produtos WHERE id = 1));  -- Daniel (inativo) comprou 1 Dell G15

--deletando todos os pedidos de clientes inativos 
DELETE FROM tb_pedidos
WHERE fk_id_clientes IN (SELECT id FROM tb_clientes WHERE ativo = FALSE);

--visualização dos pedidos que restaram depois da exclusão dos pedidos de clientes inativos.
SELECT * FROM tb_pedidos;