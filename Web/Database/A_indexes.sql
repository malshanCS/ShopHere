--
-- Indexes for table `address`
--
ALTER TABLE `address`
    ADD PRIMARY KEY (`location_id`),
  ADD KEY `registered_customer_id` (`registered_customer_id`);

--
-- Indexes for table `belongs`
--
ALTER TABLE `belongs`
    ADD PRIMARY KEY (`product_id`,`cat_id`,`sub_cat_id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `sub_cat_id` (`sub_cat_id`);

--
-- Indexes for table `billing_details`
--
ALTER TABLE `billing_details`
    ADD PRIMARY KEY (`bill_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `card_details`
--
ALTER TABLE `card_details`
    ADD PRIMARY KEY (`card_id`),
  ADD KEY `registered_customer_id` (`registered_customer_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
    ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
    ADD PRIMARY KEY (`item_id`),
  ADD KEY `sku` (`sku`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
    ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
    ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `delivery_details`
--
ALTER TABLE `delivery_details`
    ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `del_person_id` (`del_person_id`),
  ADD KEY `reg_customer_id` (`reg_customer_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `delivery_person`
--
ALTER TABLE `delivery_person`
    ADD PRIMARY KEY (`del_person_id`);

--
-- Indexes for table `mobile`
--
ALTER TABLE `mobile`
    ADD PRIMARY KEY (`mobile_id`),
  ADD KEY `registered_customer_id` (`registered_customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
    ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
    ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product_combination`
--
ALTER TABLE `product_combination`
    ADD PRIMARY KEY (`product_detail_id`),
  ADD KEY `product_variants_id` (`product_variants_id`),
  ADD KEY `value_id` (`value_id`);

--
-- Indexes for table `product_variant`
--
ALTER TABLE `product_variant`
    ADD PRIMARY KEY (`product_Variants_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `sku` (`sku`);

--
-- Indexes for table `registered_customer`
--
ALTER TABLE `registered_customer`
    ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `password` (`password`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
    ADD PRIMARY KEY (`sku`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
    ADD PRIMARY KEY (`sub_cat_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variant`
--
ALTER TABLE `variant`
    ADD PRIMARY KEY (`variant_id`);

--
-- Indexes for table `variant_value`
--
ALTER TABLE `variant_value`
    ADD PRIMARY KEY (`value_id`),
  ADD KEY `variant_id` (`variant_id`);
