# Procedure addCustomer
DELIMITER |
CREATE PROCEDURE addCustomer (IN in_customer VARCHAR(255), IN in_email VARCHAR(200), 
				IN in_street VARCHAR(255), IN in_number INT, IN in_district VARCHAR(100), 
                IN in_city VARCHAR(200), IN in_state CHAR(2), IN in_cep CHAR(10))
BEGIN
    IF EXISTS (SELECT email FROM customer WHERE email = in_email)
    THEN
		SIGNAL SQLSTATE '23000' 
        SET MESSAGE_TEXT = 'Esse usuário já foi cadastrado!';
	ELSE
		INSERT INTO address(street, number, district, city, state, postalCode)
		VALUES(in_street, in_number, in_district, in_city, in_state, in_cep);

		INSERT INTO customer(name, email, idAddress)
		VALUES (in_customer, in_email, last_insert_id());   
    END IF;
END |
DELIMITER ;

call addCustomer('Fulano da Silva', 'fulano12@gmail.com', 'Av Sta. Isabel', '234', 'Barão Geraldo', 'Campinas', 'SP', '13084-012');

drop procedure addCustomer;