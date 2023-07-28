DELIMITER |
CREATE FUNCTION count_cep(in_CEP VARCHAR(5)) RETURNS VARCHAR(255)
BEGIN
    DECLARE cepCount INT DEFAULT 0;
    DECLARE addressID INT;
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE supermarketName VARCHAR(255);
    DECLARE supermarketList VARCHAR(255);
    
    -- define o cursor para percorrer todos os endereços com o cep especificado
    DECLARE cursorCEP CURSOR FOR  SELECT idAddress FROM address WHERE LEFT(postalCode, 5) = in_CEP;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- percorre todos os endereços com o cep e conta a quantidade de supermercados nele
    OPEN cursorCEP;
    read_loop: LOOP
        FETCH cursorCEP INTO addressID;
        IF done THEN CLOSE cursorCEP;
            LEAVE read_loop;
        END IF;
        
        -- armazena os nomes dos supermercados encontrados em uma lista //separada por vírgula para colocar na string final
        SELECT GROUP_CONCAT(name SEPARATOR ',') INTO supermarketList FROM supermarket WHERE idAddress = addressID;
        
        -- adiciona o número de supermercados encontrado na contagem total
        SET cepCount = cepCount + (SELECT COUNT(*) FROM supermarket WHERE idAddress = addressID);
        
        -- adiciona na variável de lista 'supermarketList' os nomes dos supermercados achados, se houver
        IF supermarketList IS NOT NULL THEN
            IF supermarketName IS NULL THEN
                SET supermarketName = supermarketList;
            ELSE
                SET supermarketName = CONCAT(supermarketName, ', ', supermarketList);
            END IF;
        END IF;
    END LOOP;
    
    -- constrói a mensagem de retorno, verificando se há um ou mais supermercados
    IF supermarketName IS NULL THEN
        SET supermarketName = CONCAT('Não há supermercados cadastrados para o CEP de início.', in_CEP);
    ELSEIF cepCount = 1 THEN
        SET supermarketName = CONCAT('Foi encontrado ', cepCount, ' supermercado no CEP de início ', in_CEP, ': ', supermarketName);
    ELSE
        SET supermarketName = CONCAT('Foram encontrados ', cepCount, ' supermercados no CEP de início ', in_CEP, ': ', supermarketName);
    END IF;

    RETURN supermarketName;
END |
DELIMITER ;

SELECT count_cep(13080);
SELECT count_cep(13050);

DROP FUNCTION count_cep;