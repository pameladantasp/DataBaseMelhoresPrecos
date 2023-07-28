# trigger quantity_products 
DELIMITER |
CREATE TRIGGER add_quantity_products AFTER INSERT ON registerProduct
FOR EACH ROW
BEGIN 
	IF (SELECT COUNT(*) FROM registerProduct 
        WHERE idSupermarket = NEW.idSupermarket AND idProduct = NEW.idProduct AND price = NEW.price) > 1 
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Produto já cadastrado com esse preço.';
    ELSE
        UPDATE supermarket 
        SET quantity_products = quantity_products + 1 WHERE idSupermarket = NEW.idSupermarket;
    END IF;
END |
DELIMITER ;

INSERT INTO registerproduct (`idCustomer`, `idSupermarket`, `idProduct`, `price`, `dateRegister`)
VALUES ('42', '7', '1', 9.87, '2023-04-17');

