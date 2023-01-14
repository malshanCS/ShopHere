-- Procedures
--
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_order_detail` (IN `u_ID` INT, IN `subtotal` DECIMAL(12,2))   begin
    set @c_id = 0;
select cart_id into @c_id from cart where user_id = u_ID;
insert into order_details(order_id,user_id, cart_id, payment_type) values (@c_id,u_ID,@c_id,'Card');
set @o_id = 0;
select order_id into @o_id from order_details where user_id = u_ID;
insert into billing_details(order_id, bill_total,payment_state) values (@o_id,subtotal,'Accepted');
set @reg_id = 0;
    set @loc_id = 0;
select ID into @reg_id from registered_customer where user_id = u_ID;
select location_id into @loc_id from address where registered_customer_id=@reg_id;
insert into delivery_details(order_id,reg_customer_id, delivery_state, location_id) values (@o_id,@reg_id,'On store',@loc_id);
end$$




CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_cart` (IN `u_ID` INT, IN `added_sku` VARCHAR(50))   begin
    set @crt_id = 0;
select cart_id into @crt_id from cart where user_id = u_ID;
insert into cart_item(sku, cart_id, quantity) values (added_sku,@crt_id,0);
end$$




CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_cart_item` (IN `ID` INT)   begin
    set @quantity = 0;
    set @sku=0;
select quantity into @quantity from cart_item where item_id = ID;
select sku into @sku from cart_item where item_id = ID;
delete from cart_item where item_id=ID;
update stock set avai_stock = avai_stock+@quantity where sku = @sku;
end$$




CREATE DEFINER=`root`@`localhost` PROCEDURE `get_cart_items` (IN `ID` INT)   BEGIN
	SET @cart_id = 0;
SELECT cart_id INTO @cart_id FROM cart WHERE user_id = ID;
select item_id,sku,brand,title,image,unit_price,quantity,initial_stock,avai_stock from product inner join (
    select * from product_variant inner join (
        select * from stock inner join (
            select * from cart_item where cart_id = @cart_id
        ) as crt using (sku)
    ) as stockcart using (sku)
)as varop on product.ID = varop.product_id;
end$$




CREATE DEFINER=`root`@`localhost` PROCEDURE `get_checkout_detail` (IN `u_ID` INT)   BEGIN
select first_name,last_name,email,PO_box,street,zip_code,province,city_name from registered_customer inner join (
    select * from address) as adcity on adcity.registered_customer_id = registered_customer.ID where user_id=u_ID;
end$$




CREATE DEFINER=`root`@`localhost` PROCEDURE `get_payment_detail` (IN `u_ID` INT)   BEGIN
select name_in_card,card_no,exp_year,exp_month,cvv from card_details where registered_customer_id in (select ID from registered_customer where user_id=u_ID);
end$$




CREATE DEFINER=`root`@`localhost` PROCEDURE `update_quantity` (IN `id` INT)   begin
    set @av_stock = 0;
select avai_stock into @av_stock from stock where sku in (select sku from cart_item where item_id = id);
update cart_item set quantity = if(0<@av_stock,quantity+1,quantity) where item_id = id;
update stock set avai_stock = if(avai_stock>0,avai_stock-1,avai_stock) where sku in (select sku from cart_item where item_id = id);
end$$




CREATE DEFINER=`root`@`localhost` PROCEDURE `update_quantity_dec` (IN `id` INT)   begin

update cart_item set quantity = quantity-1 where item_id = id;
update stock set avai_stock = avai_stock+1 where sku in (select sku from cart_item where item_id = id);
end$$




CREATE DEFINER=`root`@`localhost` PROCEDURE `update_quantity_new` (IN `id` INT)   begin
    set @av_stock = 0;
select avai_stock into @av_stock from stock where sku in (select sku from cart_item where item_id = id);
update cart_item set quantity = if(0<@av_stock,quantity+1,quantity) where item_id = id;
update stock set avai_stock = if(avai_stock>0,avai_stock-1,avai_stock) where sku in (select sku from cart_item where item_id = id);
end$$



DELIMITER ;