	SET SQL_SAFE_UPDATES = 0;
	SET GLOBAL log_bin_trust_function_creators = 1;

	drop schema if exists melhores_precos ;
	create schema melhores_precos;
	use melhores_precos;

	CREATE TABLE address (
		idAddress INT PRIMARY KEY AUTO_INCREMENT,
		street VARCHAR(90) NOT NULL,
		number VARCHAR(90) NOT NULL,
		district VARCHAR(90) NOT NULL,
		city VARCHAR(90) NOT NULL,
		state VARCHAR(90) NOT NULL,
		postalCode VARCHAR(10) NOT NULL
	);

	CREATE TABLE customer (
		idCustomer INT PRIMARY KEY AUTO_INCREMENT,
		name VARCHAR(90) NOT NULL,
		email VARCHAR(90) NOT NULL UNIQUE,
		idAddress INT NOT NULL,
		FOREIGN KEY (idAddress) REFERENCES address (idAddress)
			ON UPDATE CASCADE
	);

	CREATE TABLE supermarket (
		idSupermarket INT PRIMARY KEY AUTO_INCREMENT,
		Name VARCHAR(90) NOT NULL,
		quantity_products INT NOT NULL DEFAULT(0),
		idAddress INT NOT NULL,
		FOREIGN KEY (idaddress) REFERENCES address (idAddress)
			ON DELETE CASCADE
	);

	CREATE TABLE category (
		idCategory INT PRIMARY KEY AUTO_INCREMENT,
		type VARCHAR(90) NOT NULL
	);

	CREATE TABLE product (
		idProduct INT PRIMARY KEY AUTO_INCREMENT,
		name VARCHAR(90) NOT NULL,
		category INT NOT NULL,
		minPrice FLOAT NULL,
		maxPrice FLOAT NULL,
		FOREIGN KEY (category) REFERENCES category (idCategory)
	);

	CREATE TABLE registerProduct (
		idRegister INT PRIMARY KEY AUTO_INCREMENT,
		idCustomer INT NOT NULL,
		FOREIGN KEY (idCustomer)
			REFERENCES customer (idCustomer)
			ON DELETE RESTRICT,
		idSupermarket INT NOT NULL,
		FOREIGN KEY (idSupermarket)
			REFERENCES supermarket (idSupermarket)
			ON DELETE CASCADE,
		idProduct INT NOT NULL,
		FOREIGN KEY (idProduct)
			REFERENCES product (idProduct)
			ON DELETE CASCADE,    
		price FLOAT NOT NULL,
		dateRegister DATE NOT NULL);

-- insert Address
INSERT INTO address (street, number, district, city, state, postalCode) VALUES 
('Rua do Rosário', 123, 'Centro', 'Belo Horizonte', 'MG', '30130-000'),
('Rua da Bahia', 456, 'Centro', 'Belo Horizonte', 'MG', '30160-010'),
('Rua dos Tupinambás', 1000, 'Centro', 'Belo Horizonte', 'MG', '30190-060'),
('Avenida Afonso Pena', 345, 'Centro', 'Belo Horizonte', 'MG', '30130-000'),
('Rua Pernambuco', 678, 'Funcionários', 'Belo Horizonte', 'MG', '30130-150'),
('Rua Paraíba', 234, 'Funcionários', 'Belo Horizonte', 'MG', '30130-151'),
('Rua dos Timbiras', 567, 'Funcionários', 'Belo Horizonte', 'MG', '30140-061'),
('Rua Alagoas', 890, 'Funcionários', 'Belo Horizonte', 'MG', '30130-160'),
('Rua Bernardo Guimarães', 1234, 'Funcionários', 'Belo Horizonte', 'MG', '30140-082'),
('Rua dos Goitacazes', 345, 'Centro', 'Belo Horizonte', 'MG', '30190-060'),
('Rua Guajajaras', 678, 'Centro', 'Belo Horizonte', 'MG', '30180-100'),
('Rua São Paulo', 987, 'Centro', 'Belo Horizonte', 'MG', '30170-120'),
('Rua dos Caetés', 234, 'Centro', 'Belo Horizonte', 'MG', '30120-080'),
('Rua dos Guaranis', 567, 'Centro', 'Belo Horizonte', 'MG', '30120-041'),
('Rua Espírito Santo', 890, 'Centro', 'Belo Horizonte', 'MG', '30160-030'),
('Rua Rio Grande do Sul', 1234, 'Funcionários', 'Belo Horizonte', 'MG', '30130-131'),
('Rua Timbiras', 345, 'Lourdes', 'Belo Horizonte', 'MG', '30140-061'),
('Rua São Domingos do Prata', 678, 'Santo Antônio', 'Belo Horizonte', 'MG', '30330-480'),
('Rua Curitiba', 987, 'Centro', 'Belo Horizonte', 'MG', '30170-120'),
('Rua Guarani', 123, 'Centro', 'São Paulo', 'SP', '01023-001'),
('Rua da Consolação', 456, 'Consolação', 'São Paulo', 'SP', '01301-000'),
('Rua Augusta', 1000, 'Consolação', 'São Paulo', 'SP', '01304-001'),
('Rua Barão de Itapetininga', 345, 'República', 'São Paulo', 'SP', '01044-000'),
('Rua 25 de Março', 678, 'Centro', 'São Paulo', 'SP', '01021-000'),
('Rua Oscar Freire', 987, 'Jardim Paulista', 'São Paulo', 'SP', '01426-001'),
('Rua Haddock Lobo', 234, 'Cerqueira César', 'São Paulo', 'SP', '01414-001'),
('Rua da Mooca', 567, 'Mooca', 'São Paulo', 'SP', '03103-000'),
('Rua Vergueiro', 890, 'Vila Mariana', 'São Paulo', 'SP', '04101-000'),
('Rua Pamplona', 1234, 'Jardim Paulista', 'São Paulo', 'SP', '01405-002'),
('Rua Teodoro Sampaio', 345, 'Pinheiros', 'São Paulo', 'SP', '05406-200'),
('Rua José Paulino', 678, 'Bom Retiro', 'São Paulo', 'SP', '01120-000'),
('Rua Vinte e Cinco de Março', 987, 'Brás', 'São Paulo', 'SP', '03010-000'),
('Rua da Lapa', 234, 'Lapa', 'São Paulo', 'SP', '05072-000'),
('Avenida Faria Lima', 567, 'Pinheiros', 'São Paulo', 'SP', '05426-000'),
('Rua dos Pinheiros', 890, 'Pinheiros', 'São Paulo', 'SP', '05422-000'),
('Rua Antônio de Godói', 1234, 'República', 'São Paulo', 'SP', '01034-001'),
('Rua Libero Badaró', 345, 'Centro', 'São Paulo', 'SP', '01009-000'),
('Rua Xavier de Toledo', 678, 'República', 'São Paulo', 'SP', '01048-001'),
('Rua Augusta', 987, 'Consolação', 'São Paulo', 'SP', '01305-001'),
('Rua Frei Caneca', 234, 'Consolação', 'São Paulo', 'SP', '01307-001'),
('Rua da Glória', 567, 'Liberdade', 'São Paulo', 'SP', '01510-001'),
('Rua do Gasômetro', 890, 'Brás', 'São Paulo', 'SP', '03004-000'),
('Rua dos Ipês', 123, 'Jardim Olímpico', 'Pouso Alegre', 'MG', '37550-000'),
('Rua dos Girassóis', 456, 'Jardim Yara', 'Pouso Alegre', 'MG', '37550-010'),
('Rua das Margaridas', 1000, 'Jardim Europa', 'Pouso Alegre', 'MG', '37550-020'),
('Avenida Vicente Simões', 345, 'São João', 'Pouso Alegre', 'MG', '37550-030'),
('Rua Professor José Inácio de Souza', 678, 'Fátima', 'Pouso Alegre', 'MG', '37550-040'),
('Rua Doutor Jose Paulino da Costa', 234, 'Jardim São Paulo', 'Pouso Alegre', 'MG', '37550-050'),
('Rua Padre Anchieta', 567, 'Centro', 'Pouso Alegre', 'MG', '37550-060'),
('Rua Silviano Brandão', 890, 'Belvedere', 'Pouso Alegre', 'MG', '37550-070'),
('Rua Santo Antônio', 1234, 'Jardim dos Estados', 'Pouso Alegre', 'MG', '37550-080'),
('Rua Coronel José Inácio', 345, 'Centro', 'Pouso Alegre', 'MG', '37550-090'),
('Rua Comendador José Garcia', 678, 'Centro', 'Pouso Alegre', 'MG', '37550-100'),
('Rua Capitão Vicente Soares', 987, 'Cristina', 'Pouso Alegre', 'MG', '37550-110'),
('Rua Marechal Deodoro', 234, 'Centro', 'Pouso Alegre', 'MG', '37550-120'),
('Rua José Alves Ribeiro', 567, 'Santo Antônio', 'Pouso Alegre', 'MG', '37550-130'),
('Rua Dona Olinda', 890, 'Jardim São Vicente', 'Pouso Alegre', 'MG', '37550-140'),
('Rua Padre Dehon', 1234, 'Fátima', 'Pouso Alegre', 'MG', '37550-150'),
('Rua das Orquídeas', 345, 'Jardim Europa', 'Pouso Alegre', 'MG', '37550-160'),
('Rua Coronel José Inácio', 678, 'Centro', 'Pouso Alegre', 'MG', '37550-170');
UPDATE address SET `city` = 'Campinas', `state` = 'SP' WHERE (`idAddress` = '45');
UPDATE address SET `city` = 'São Paulo', `state` = 'SP' WHERE (`idAddress` = '46');
UPDATE address  SET `city` = 'Belo Horizonte' WHERE (`idAddress` = '48');
UPDATE address SET `city` = 'Campinas', `state` = 'SP' WHERE (`idAddress` = '51');
UPDATE address SET `city` = 'Campinas', `state` = 'SP' WHERE (`idAddress` = '52');
UPDATE address SET `city` = 'São Paulo', `state` = 'SP' WHERE (`idAddress` = '53');
UPDATE address SET `city` = 'São Paulo', `state` = 'SP' WHERE (`idAddress` = '54');
UPDATE address SET `city` = 'Belo Horizonte' WHERE (`idAddress` = '56');
UPDATE address SET `city` = 'Campinas', `state` = 'SP' WHERE (`idAddress` = '57');
UPDATE address SET`city` = 'Campinas', `state` = 'SP' WHERE (`idAddress` = '58');
UPDATE address SET`city` = 'São Paulo', `state` = 'SP' WHERE (`idAddress` = '59');
UPDATE address SET `city` = 'São Paulo', `state` = 'SP' WHERE (`idAddress` = '60');
UPDATE address SET `city` = 'Campinas', `state` = 'SP' WHERE (`idAddress` = '50');
UPDATE address SET `city` = 'Campinas' WHERE (`idAddress` = '42');
UPDATE `address` SET `postalCode` = '13750-070' WHERE (`idAddress` = '50');
UPDATE `address` SET `postalCode` = '13550-080' WHERE (`idAddress` = '51');
UPDATE `address` SET `postalCode` = '13550-090' WHERE (`idAddress` = '52');
UPDATE `address` SET `postalCode` = '13550-140' WHERE (`idAddress` = '57');
UPDATE `address` SET `postalCode` = '13550-150' WHERE (`idAddress` = '58');
UPDATE address SET postalcode = '13050-970' WHERE postalcode LIKE '13550%';

    
-- insert Customer 
INSERT INTO customer (name, email, idAddress) VALUES 
('Maria da Silva', 'mariadasilva@gmail.com', 1),
('José Santos', 'josesantos@hotmail.com', 2),
('Fernanda Oliveira', 'fernandaoliveira@gmail.com', 3),
('Rafaela Souza', 'rafaelasouza@gmail.com', 4),
('Lucas Silva', 'lucassilva@hotmail.com', 5),
('Carlos Eduardo', 'carloseduardo@gmail.com', 6),
('Amanda Silva', 'amandasilva@gmail.com', 7),
('Gabriela Santos', 'gabrielasantos@gmail.com', 8),
('Pedro Henrique', 'pedrohenrique@gmail.com', 9),
('Mariana Ferreira', 'marianaferreira@hotmail.com', 10),
('Thiago Pereira', 'thiagopereira@gmail.com', 11),
('Bruna Alves', 'brunaalves@gmail.com', 12),
('Juliana Oliveira', 'julianaoliveira@gmail.com', 13),
('Victor Fernandes', 'victorfernandes@gmail.com', 14),
('Camila Rodrigues', 'camilarodrigues@gmail.com', 15),
('Gustavo Silva', 'gustavosilva@gmail.com', 16),
('Letícia Souza', 'leticiasouza@gmail.com', 17),
('Marcelo Oliveira', 'marcelooliveira@gmail.com', 18),
('Carla Santos', 'carlasantos@gmail.com', 19),
('Diego Pereira', 'diegopereira@gmail.com', 20),
('Isabela Alves', 'isabelaalves@gmail.com', 21),
('Fábio Costa', 'fabiocosta@gmail.com', 22),
('Raquel Rodrigues', 'raquelrodrigues@gmail.com', 23),
('Lívia Fernandes', 'liviafernandes@gmail.com', 24),
('Fernando Silva', 'fernandosilva@hotmail.com', 25),
('Aline Souza', 'alinesouza@gmail.com', 26),
('Henrique Oliveira', 'henriqueoliveira@gmail.com', 27),
('Larissa Santos', 'larissasantos@gmail.com', 28),
('Vinícius Pereira', 'viniciuspereira@hotmail.com', 29),
('Bianca Alves', 'biancaalves@gmail.com', 30),
('Ricardo Costa', 'ricardocosta@gmail.com', 31),
('Mariana Rodrigues', 'marianarodrigues@outlook.com', 32),
('Thales Fernandes', 'thalesfernandes@outlook.com', 33),
('Ana Clara Silva', 'anaclarasilva@gmail.com', 34),
('Guilherme Souza', 'guilhermesouza@gmail.com', 35),
('Vanessa Oliveira', 'vanessaoliveira@hotmail.com', 36),
('Luiz Santos', 'luizsantos@gmail.com', 37),
('Carol Pereira', 'carolpereira@gmail.com', 38),
('Matheus Alves', 'matheusalves@gmail.com', 39),
('Fernanda Costa', 'fernandacosta@gmail.com', 40),
('Gustavo Rodrigues', 'gustav@hotmail.com', 41),
('Pamela Dantas', 'pamdantas@hotmail.com', 42),
('Matheus Silva', 'matheussilvat@hotmail.com', 43);

-- insert category
INSERT INTO category (`type`) VALUES ('Bebidas');
INSERT INTO category (`type`) VALUES ('Congelados');
INSERT INTO category (`type`) VALUES ('Frios');
INSERT INTO category (`type`) VALUES ('Frutas');
INSERT INTO category (`type`) VALUES ('Carnes');
INSERT INTO category (`type`) VALUES ('Veganos');
INSERT INTO category (`type`) VALUES ('Padaria');
INSERT INTO category (`type`) VALUES ('Higiene Pessoal');
INSERT INTO category (`type`) VALUES ('Produtos de Limpeza');
INSERT INTO category (`type`) VALUES ('Papelaria');
INSERT INTO category (`type`) VALUES ('Temperos');
INSERT INTO category (`type`) VALUES ('Utilidades');
INSERT INTO category (`type`) VALUES ('Laticínios');
INSERT INTO category(`type`) VALUES ('Grãos');
INSERT INTO category (`type`) VALUES ('Petiscos');
INSERT INTO category (`type`) VALUES ('Peixes');
INSERT INTO category (`type`) VALUES ('Verduras');

-- insert product
INSERT INTO product (name, category) VALUES 
("Coca-Cola", 1),
("Beyond Burger", 6),
("Picanha", 5),
("Presunto", 3),
("Lasanha", 2),
("Maçã", 4),
("Alface", 17),
("Sabonete", 8),
("Pão francês", 7),
("Batata frita", 15),
("Caneta", 10),
("Sal rosa do Himalaia", 11),
("Escova de dentes", 12),
("Queijo Minas", 13),
("Arroz integral", 14),
("Salmão", 16),
("Sabão em pó", 9);

-- insert supermarket
INSERT INTO supermarket (name, idAddress) VALUES 
("Mercado do João", 44),("Supermercado ABC", 45),("Compre Bem", 46),("Mercadinho do José", 47),("Pão de Açúcar", 48),("Supermercado Central", 49),("Mercado Econômico", 50),("Carrefour", 51),("Supermercado Popular", 52),("Extra", 53),("Bretas", 54),("Mercado Bom Preço", 55),("Dia Supermercado", 56),("Mercado do Amigo", 57),("Supermercado do Povo", 58),("Mercado do Bairro", 59),("Supermercado da Família", 60);
UPDATE `supermarket` SET `quantity_products` = '1554' WHERE (`idSupermarket` = '7');

-- insert registerProduct
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (2, 8, 1, 4.50, '2023-02-25'), (7, 4, 1, 4.25, '2023-03-10'), (16, 1, 1, 4.00, '2023-03-16'), (23, 7, 1, 4.35, '2023-04-01'), (31, 14, 1, 4.75, '2023-04-08');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (1, 3, 2, 11.50, '2023-02-27'), (8, 11, 2, 11.75, '2023-03-12'), (17, 16, 2, 12.00, '2023-03-18'), (32, 12, 2, 11.50, '2023-04-09');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (3, 14, 3, 44.50, '2023-02-28'), (11, 2, 3, 43.75, '2023-03-14'), (19, 7, 3, 45.00, '2023-03-20'), (25, 13, 3, 42.25, '2023-04-02'), (34, 5, 3, 43.50, '2023-04-10');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (4, 5, 5, 14.50, '2023-03-02'), (12, 9, 5, 13.75, '2023-03-17'),  (21, 13, 5, 15.00, '2023-03-23'),(29, 4, 5, 12.25, '2023-04-05'), (38, 11, 5, 13.50, '2023-04-12');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (1, 10, 6, 3.50, '2023-03-01'),(9, 3, 6, 3.75, '2023-03-16'),(18, 15, 6, 3.25, '2023-03-22'),(26, 7, 6, 3.90, '2023-04-03'),(34, 16, 6, 3.60, '2023-04-10');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (2, 1, 7, 1.50, '2023-03-03'), (10, 6, 7, 1.75, '2023-03-18'),(19, 14, 7, 2.00, '2023-03-24'), (27, 5, 7, 1.25, '2023-04-04'), (35, 12, 7, 1.60, '2023-04-11');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (3, 7, 8, 2.50, '2023-03-04'),(11, 2, 8, 2.75, '2023-03-19'),(20, 12, 8, 3.00, '2023-03-25'),(28, 4, 8, 2.25, '2023-04-05'), (36, 11, 8, 2.60, '2023-04-12');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (4, 8, 9, 0.50, '2023-03-05'), (12, 13, 9, 0.75, '2023-03-06'), (21, 2, 9, 0.80, '2023-03-26'),(29, 6, 9, 0.60, '2023-04-06'), (37, 14, 9, 0.90, '2023-04-13');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (5, 3, 10, 6.00, '2023-03-06'), (13, 15, 10, 5.50, '2023-03-20'),(22, 7, 10, 5.75, '2023-03-27'), (30, 16, 10, 6.50, '2023-04-07'),(38, 4, 10, 5.25, '2023-04-14');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (6, 6, 11, 2.00, '2023-03-07'),(14, 14, 11, 2.50, '2023-03-21'),(23, 5, 11, 1.75, '2023-03-28'), (31, 12, 11, 2.20, '2023-04-08'), (39, 1, 11, 1.90, '2023-04-15');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (7, 2, 12, 10.00, '2023-03-08'), (15, 7, 12, 11.50, '2023-03-22'), (24, 16, 12, 12.00, '2023-03-29'),(32, 4, 12, 9.50, '2023-04-23'), (40, 11, 12, 11.00, '2023-04-16');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (8, 8, 13, 3.00, '2023-03-09'), (16, 2, 13, 2.50, '2023-03-23'), (25, 12, 13, 2.75, '2023-03-30'), (33, 5, 13, 3.50, '2023-04-09'), (41, 14, 13, 3.25, '2023-04-17');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (9, 6, 14, 18.00, '2023-03-10'), (17, 15, 14, 16.50, '2023-03-24'), (26, 4, 14, 17.25, '2023-03-31'), (34, 11, 14, 19.00, '2023-04-10'), (42, 1, 14, 15.75, '2023-04-18');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (10, 7, 15, 5.00, '2023-03-11'), (18, 16, 15, 4.50, '2023-03-25'),(27, 3, 15, 4.75, '2023-04-01'),(35, 13, 15, 5.50, '2023-04-11'), (43, 5, 15, 5.25, '2023-04-19');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (10, 11, 6, 2.99, '2023-04-02');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (11, 4, 6, 3.25, '2023-03-15');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (13, 8, 6, 2.75, '2023-01-27');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (18, 16, 6, 2.89, '2023-02-20');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (29, 2, 6, 2.99, '2023-04-05');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (1, 10, 7, 0.99, '2023-03-01');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (6, 7, 7, 1.15, '2023-02-18');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (11, 14, 7, 1.25, '2023-03-12');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (19, 5, 7, 1.05, '2023-01-05');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (30, 11, 7, 1.09, '2023-04-08');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (2, 9, 8, 2.99, '2023-03-02');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (7, 12, 8, 3.25, '2023-02-22');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (14, 3, 8, 2.75, '2023-03-18');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (21, 15, 8, 2.89, '2023-02-14');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (31, 1, 8, 2.99, '2023-04-09');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (3, 7, 9, 0.49, '2023-03-05');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES (8, 10, 9, 0.65, '2023-02-28');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (17, 5, 5, 19.90, '2023-02-07'), (18, 6, 5, 18.50, '2023-04-09'), (19, 7, 5, 20.80, '2023-01-18'), (20, 8, 5, 21.40, '2023-03-02'), (21, 9, 5, 22.10, '2023-04-06');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (22, 10, 6, 2.50, '2023-02-22'), (23, 11, 6, 1.90, '2023-04-02'), (24, 12, 6, 2.20, '2023-01-05'), (25, 13, 6, 2.60, '2023-03-11'), (26, 14, 6, 2.30, '2023-04-08');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (27, 15, 7, 1.30, '2023-02-15'), (28, 16, 7, 1.20, '2023-04-03'), (29, 1, 7, 1.40, '2023-01-10'), (30, 2, 7, 1.25, '2023-03-20'), (31, 3, 7, 1.50, '2023-04-01');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (32, 4, 8, 3.90, '2023-02-12'), (33, 5, 8, 3.50, '2023-04-05'), (34, 6, 8, 4.20, '2023-01-22'), (35, 7, 8, 4.10, '2023-03-08'), (36, 8, 8, 3.80, '2023-04-09');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (37, 9, 9, 0.35, '2023-02-03'), (38, 10, 9, 0.30, '2023-04-07'), (39, 11, 9, 0.40, '2023-01-15'), (40, 12, 9, 0.45, '2023-03-28'), (41, 13, 9, 0.50, '2023-04-02');
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister)VALUES (42, 14, 10, 8.50, '2023-02-18'), (43, 15, 10, 8.20, '2023-04-10');
INSERT INTO category (type) VALUES ('Alimentos'), ('Bebidas'), ('Higiene Pessoal'), ('Limpeza');
INSERT INTO product (name, category, minPrice, maxPrice) VALUES ('Arroz', 1, 15.50, 20.00), ('Feijão', 1, 8.00, 12.00), ('Refrigerante', 2, 5.50, 8.00), ('Sabonete', 3, 2.00, 3.50), ('Detergente', 4, 3.50, 4.50);
INSERT INTO address (street, number, district, city, state, postalCode) VALUES ('Rua A', '123', 'Centro', 'São Paulo', 'SP', '01234-567'),('Rua B', '456', 'Jardins', 'Rio de Janeiro', 'RJ', '02345-678');
INSERT INTO supermarket (Name, quantity_products, idAddress) VALUES('Supermercado A', 2000, 1),('Supermercado B', 3000, 2);
INSERT INTO customer (name, email, idAddress) VALUES('Maria Silva', 'maria@exemplo.com', 1),('João Souza', 'joao@exemplo.com', 2);
INSERT INTO registerProduct (idCustomer, idSupermarket, idProduct, price, dateRegister) VALUES(1, 1, 1, 16.00, '2022-01-01'),(1, 2, 1, 15.50, '2022-01-02'),(1, 2, 2, 9.50, '2022-01-03'),(2, 2, 3, 5.75, '2022-01-04'),(2, 1, 4, 2.50, '2022-01-05'),(2, 2, 5, 3.75, '2022-01-06');
UPDATE `registerproduct` SET `dateRegister` = '2023-03-31' WHERE (`idRegister` = '37');
UPDATE `registerproduct` SET `dateRegister` = '2023-04-23' WHERE (`idRegister` = '17');
UPDATE `registerproduct` SET `dateRegister` = '2023-02-05' WHERE (`idRegister` = '83');
UPDATE `registerproduct` SET `dateRegister` = '2023-04-07' WHERE (`idRegister` = '91');
