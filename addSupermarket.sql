# Procedure addSupermarket
DELIMITER |
CREATE PROCEDURE addSupermarket (IN in_supermarket VARCHAR(255), IN in_street VARCHAR(255), 
				IN in_number INT, IN in_district VARCHAR(100), 
                IN in_city VARCHAR(200), IN in_state CHAR(2), IN in_cep CHAR(10))
BEGIN
    IF EXISTS (SELECT s.name FROM supermarket s
			INNER JOIN address a ON a.idAddress = s.idAddress
			WHERE s.name = in_supermarket AND a.street = in_street AND a.number = in_number 
            AND a.district = in_district AND a.city = in_city AND a.state = in_state AND a.postalCode = in_cep)
    THEN
		SIGNAL SQLSTATE '23000' 
        SET MESSAGE_TEXT = 'Esse mercado já foi cadastrado!';
	ELSE
		INSERT INTO address(street, number, district, city, state, postalCode)
        VALUES(in_street, in_number, in_district, in_city, in_state, in_cep);
		INSERT INTO supermarket(name, idAddress) VALUES (in_supermarket, last_insert_id());   
    END IF;
END |
DELIMITER ;

call addSupermarket('Paguemenos', 'Av Jean Nassif', '255', 'Barão Geraldo', 'Campinas', 'SP', '13084-070');
call addSupermarket('Tenda', 'Rodovia Dom Pedro', 140, ' Jardim Santa Monica', 'Campinas', 'SP', '13080-395');
call addSupermarket('Atacadão', 'Rodovia Dom Pedro', 9, ' Jardim Santa Monica', 'Campinas', 'SP', '13080-395');


drop procedure addsupermarket;