DELIMITER $$
CREATE TRIGGER `avai_stock_verify` BEFORE INSERT ON `stock` FOR EACH ROW if new.avai_stock > new.initial_stock then set new.avai_stock = new.initial_stock;
end if
$$
DELIMITER ;