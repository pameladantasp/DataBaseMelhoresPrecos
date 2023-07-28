# Procedure addProduct
DELIMITER |
CREATE PROCEDURE addProduct (IN in_customer VARCHAR(255), IN in_product VARCHAR(100), 
IN in_category VARCHAR(100), IN in_price DOUBLE, IN in_supermarket VARCHAR(255))
BEGIN
	DECLARE customerId INT; DECLARE supermarketId INT;
    DECLARE productId INT; DECLARE categoryId INT;
        
	SELECT idCustomer INTO customerId FROM customer WHERE name = in_customer;
	SELECT idsupermarket INTO supermarketId FROM supermarket WHERE name = in_supermarket;
    SELECT idProduct INTO productId FROM product WHERE name = in_product;
    SELECT idCategory INTO categoryId FROM category WHERE type = in_category LIMIT 1;
	
    IF customerId IS NULL THEN SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Erro: Esse usuário não foi encontrado. Tente novamente ou crie um usuário.';
	END IF;
	
    IF supermarketId IS NULL THEN SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Erro: Esse supermercado não foi encontrado. Tente novamente ou insira um supermercado.';
    END IF;
    
	IF productId IS NULL THEN
		INSERT INTO product(name, category) VALUES (in_product, categoryId);
		SET productId = LAST_INSERT_ID();
	END IF;

	IF NOT EXISTS (SELECT * FROM registerProduct WHERE idSupermarket = supermarketId
						AND idProduct = productId AND ROUND(price, 2) = ROUND(in_price, 2))
		THEN INSERT INTO registerProduct(idCustomer, idSupermarket, idProduct, price, dateRegister)
			VALUES(customerId, supermarketId, productId, in_price, curdate());
	ELSE
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Erro: Produto já cadastrado com o mesmo preço para o mesmo supermercado. Insira outro!';
	END IF;
END |
DELIMITER ;

-- utilizando a procedure addProduct
call addProduct('Pamela Dantas', 'Doritos', 'Petiscos', 12.50, 'Mercado Econômico');
call addProduct('Matheus Silva', 'Doritos', 'Petiscos', 11.88, 'Mercado Econômico');
		-- rode-os mais uma vez para ver a mensagem de erro!
        
-- as call's abaixo retornam mensagem para Usuário não encontrado e Supermercado não encontrado.
call addProduct('Silviano Pereira', 'Guarana Antartica', 'Bebidas', 7.99, 'Dia Supermercado');
call addProduct('Pamela Dantas', 'Doritos', 'Petiscos', 11.88, 'Mercadinho do Zé');
