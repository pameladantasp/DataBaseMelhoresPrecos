DELIMITER ||
    CREATE TRIGGER update_product_price_range AFTER INSERT ON registerProduct
FOR EACH ROW
BEGIN
  UPDATE product
  SET minPrice = IFNULL((SELECT MIN(price) FROM registerProduct WHERE idProduct = NEW.idProduct), 0),
      maxPrice = IFNULL((SELECT MAX(price) FROM registerProduct WHERE idProduct = NEW.idProduct), 0)
  WHERE idProduct = NEW.idProduct;
END ||
DELIMITER ;
