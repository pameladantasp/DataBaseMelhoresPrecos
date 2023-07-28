CREATE VIEW user_profile AS
SELECT
    customer.idCustomer,
    customer.name 'Usuário',
    customer.email 'e-mail',
    CONCAT(adCust.street,', ', adCust.number,', ', adCust.district,' - ',adCust.city,'/', adCust.state) 'Address - Customer',
    MAX(adCust.postalCode) 'CEP',
    COUNT(r.idRegister) 'Número de registro de produtos desse usuário - Últimos 30 dias'
FROM 
    registerProduct r
    INNER JOIN customer ON customer.idCustomer = r.idCustomer
    INNER JOIN product p ON p.idProduct = r.idProduct
    INNER JOIN category c ON c.idCategory = p.category
    INNER JOIN supermarket s ON s.idSupermarket = r.idSupermarket
    INNER JOIN address adCust ON adCust.idAddress = customer.idAddress

WHERE customer.name = customer.name 

AND r.dateRegister >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY customer.idCustomer;

SELECT * FROM user_profile where usuário = 'Isabela Alves';
