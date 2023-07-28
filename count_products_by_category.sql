DELIMITER |
CREATE FUNCTION count_products_by_category(in_categoryName VARCHAR(60))
RETURNS INT
BEGIN
    DECLARE productCount INT DEFAULT 0;
    DECLARE productId INT;
    DECLARE done BOOLEAN DEFAULT FALSE;
    
    -- Define o cursor para percorrer todos os produtos da categoria
    DECLARE cursorCategory CURSOR FOR
			SELECT idProduct FROM product WHERE category IN (SELECT idCategory FROM category WHERE type = in_categoryName);
   
   DECLARE CONTINUE HANDLER FOR NOT FOUND 
		SET done = TRUE;
    
    -- Percorre todos os produtos da categoria e conta a quantidade de produtos
    OPEN cursorCategory;
    read_loop: LOOP
        FETCH cursorCategory INTO productId;
        IF done THEN
            CLOSE cursorCategory;
            LEAVE read_loop;
        END IF;
        
        SET productCount = productCount + (SELECT COUNT(*) FROM registerProduct WHERE idProduct = productId);
    END LOOP;
    
    -- Retorna a quantidade total de produtos da categoria
    RETURN productCount;
END |
DELIMITER ;

SELECT count_products_by_category('Bebidas');

