CREATE TABLE `address` (
                           `location_id` int(11) NOT NULL,
                           `is_home_address` tinyint(1) DEFAULT NULL,
                           `PO_box` varchar(20) DEFAULT NULL,
                           `street` varchar(50) DEFAULT NULL,
                           `zip_code` int(11) DEFAULT NULL,
                           `registered_customer_id` int(11) DEFAULT NULL,
                           `province` varchar(50) DEFAULT NULL,
                           `city_name` varchar(50) DEFAULT NULL
);

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`location_id`, `is_home_address`, `PO_box`, `street`, `zip_code`, `registered_customer_id`, `province`, `city_name`) VALUES
    (1, 1, '254', 'Katubedda', 4000, 1, 'Western', 'Moratuwa');

-- --------------------------------------------------------

--
-- Table structure for table `belongs`
--

CREATE TABLE `belongs` (
                           `product_id` int(11) NOT NULL,
                           `cat_id` int(11) NOT NULL,
                           `sub_cat_id` int(11) NOT NULL
);

--
-- Dumping data for table `belongs`
--

INSERT INTO `belongs` (`product_id`, `cat_id`, `sub_cat_id`) VALUES
                                                                 (1, 1, 1),
                                                                 (2, 1, 1),
                                                                 (3, 1, 1),
                                                                 (4, 1, 1),
                                                                 (5, 2, 5),
                                                                 (6, 2, 5),
                                                                 (7, 2, 6),
                                                                 (8, 3, 6),
                                                                 (9, 6, 13),
                                                                 (10, 6, 11),
                                                                 (11, 6, 12),
                                                                 (12, 6, 12),
                                                                 (13, 6, 11),
                                                                 (14, 4, 7),
                                                                 (15, 4, 7),
                                                                 (16, 4, 8),
                                                                 (17, 1, 3),
                                                                 (18, 2, 5),
                                                                 (19, 2, 5),
                                                                 (20, 2, 4),
                                                                 (21, 2, 4),
                                                                 (22, 3, 6),
                                                                 (23, 3, 6),
                                                                 (24, 3, 6),
                                                                 (25, 7, 14),
                                                                 (26, 7, 14),
                                                                 (27, 9, 17),
                                                                 (28, 9, 17),
                                                                 (29, 9, 17),
                                                                 (30, 5, 9),
                                                                 (31, 5, 10),
                                                                 (32, 5, 10),
                                                                 (33, 8, 16),
                                                                 (34, 8, 16),
                                                                 (35, 8, 16),
                                                                 (36, 8, 15),
                                                                 (37, 10, 18),
                                                                 (38, 10, 18),
                                                                 (39, 1, 2),
                                                                 (40, 8, 15),
                                                                 (41, 3, 19);

-- --------------------------------------------------------

--
-- Table structure for table `billing_details`
--

CREATE TABLE `billing_details` (
                                   `bill_id` int(11) NOT NULL,
                                   `order_id` int(11) DEFAULT NULL,
                                   `bill_total` decimal(12,2) DEFAULT NULL,
                                   `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
                                   `payment_state` enum('Rejected','Accepted','Pending') DEFAULT NULL
);

--
-- Dumping data for table `billing_details`
--

INSERT INTO `billing_details` (`bill_id`, `order_id`, `bill_total`, `date_time`, `payment_state`) VALUES
    (5, 1, '17440.00', '2023-01-13 18:09:12', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `card_details`
--

CREATE TABLE `card_details` (
                                `card_id` int(11) NOT NULL,
                                `registered_customer_id` int(11) DEFAULT NULL,
                                `bank` varchar(50) DEFAULT NULL,
                                `is_verified` tinyint(1) DEFAULT NULL,
                                `name_in_card` varchar(50) DEFAULT NULL,
                                `cvv` varchar(3) DEFAULT NULL,
                                `exp_month` varchar(2) DEFAULT NULL,
                                `exp_year` varchar(4) DEFAULT NULL,
                                `card_no` varchar(19) DEFAULT NULL
);

--
-- Dumping data for table `card_details`
--

INSERT INTO `card_details` (`card_id`, `registered_customer_id`, `bank`, `is_verified`, `name_in_card`, `cvv`, `exp_month`, `exp_year`, `card_no`) VALUES
    (1, 1, 'BOC', 1, 'Malshan Keerthichandra', '890', '02', '2025', '1111-2222-3333-4444');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
                        `cart_id` int(11) NOT NULL,
                        `user_id` int(11) DEFAULT NULL,
                        `total` decimal(10,2) DEFAULT NULL,
                        `state` varchar(50) DEFAULT NULL,
                        `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `total`, `state`, `created`) VALUES
                                                                           (1, 1, NULL, NULL, '2023-01-11 10:44:40'),
                                                                           (2, 2, NULL, NULL, '2023-01-13 16:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
                             `item_id` int(11) NOT NULL,
                             `sku` varchar(50) DEFAULT NULL,
                             `cart_id` int(11) DEFAULT NULL,
                             `quantity` int(11) DEFAULT NULL
);

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`item_id`, `sku`, `cart_id`, `quantity`) VALUES
                                                                      (14, 'PowerSkinPowerBank20 ', 1, 0),
                                                                      (15, 'IP14PLUS6G64G ', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
                            `cat_id` int(11) NOT NULL,
                            `name` varchar(20) DEFAULT NULL,
                            `description` varchar(50) DEFAULT NULL
);

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `name`, `description`) VALUES
                                                             (1, 'Mobile-Phones', 'Mobile phones only'),
                                                             (2, 'Headphones', 'Headphones only'),
                                                             (3, 'Accessories', 'Accessories only'),
                                                             (4, 'Routers', '4g 3g 5g and wifi routers'),
                                                             (5, 'Power-banks', 'Power banks only'),
                                                             (6, 'Portable-Speakers', 'Portable Speakers only'),
                                                             (7, 'RC-Toys', 'All RC toys'),
                                                             (8, 'Storage-Devices', 'Storage Devices'),
                                                             (9, 'Outdoor-toys', 'Outdoor toys only'),
                                                             (10, 'TV', 'TVs only');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
                        `city_id` int(11) NOT NULL,
                        `city_name` varchar(50) DEFAULT NULL
);

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
                                                (1, 'Colombo'),
                                                (2, 'Gampaha'),
                                                (3, 'Kalutara'),
                                                (4, 'Anuradhapura'),
                                                (5, 'Polonnaruwa'),
                                                (6, 'Galle'),
                                                (7, 'Matara'),
                                                (8, 'Hambanthota'),
                                                (9, 'Rathnapura'),
                                                (10, 'Kegalle'),
                                                (11, 'Kandy'),
                                                (12, 'Nuwaraeliya'),
                                                (13, 'Matale'),
                                                (14, 'Trincomalee'),
                                                (15, 'Batticaloa'),
                                                (16, 'Ampara'),
                                                (17, 'Jaffna'),
                                                (18, 'Vavuniya'),
                                                (19, 'Mulativ'),
                                                (20, 'Kilinochchi'),
                                                (21, 'Mannar'),
                                                (22, 'Puttalam'),
                                                (23, 'Kurunegala'),
                                                (24, 'Badulla'),
                                                (25, 'Monaragala');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_details`
--

CREATE TABLE `delivery_details` (
                                    `delivery_id` int(11) NOT NULL,
                                    `order_id` int(11) DEFAULT NULL,
                                    `del_person_id` int(11) DEFAULT NULL,
                                    `reg_customer_id` int(11) DEFAULT NULL,
                                    `delivery_state` enum('Delivered','On store','Picked up') DEFAULT NULL,
                                    `location_id` int(11) DEFAULT NULL
);

--
-- Dumping data for table `delivery_details`
--

INSERT INTO `delivery_details` (`delivery_id`, `order_id`, `del_person_id`, `reg_customer_id`, `delivery_state`, `location_id`) VALUES
    (4, 1, NULL, 1, 'On store', 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_person`
--

CREATE TABLE `delivery_person` (
                                   `del_person_id` int(11) NOT NULL,
                                   `name` varchar(50) DEFAULT NULL,
                                   `contact_number` varchar(10) DEFAULT NULL CHECK (char_length(`contact_number`) = 10)
);

--
-- Dumping data for table `delivery_person`
--

INSERT INTO `delivery_person` (`del_person_id`, `name`, `contact_number`) VALUES
                                                                              (1, 'Kumara', '0798767543'),
                                                                              (2, 'Saman', '0778998987');

-- --------------------------------------------------------

--
-- Table structure for table `mobile`
--

CREATE TABLE `mobile` (
                          `mobile_id` int(11) NOT NULL,
                          `registered_customer_id` int(11) DEFAULT NULL,
                          `mobile_number` varchar(10) DEFAULT NULL CHECK (char_length(`mobile_number`) = 10)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
                                 `order_id` int(11) NOT NULL,
                                 `user_id` int(11) DEFAULT NULL,
                                 `cart_id` int(11) DEFAULT NULL,
                                 `payment_type` enum('On delivery','Card','Paypal') DEFAULT NULL
);

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `user_id`, `cart_id`, `payment_type`) VALUES
    (1, 1, 1, 'Card');

-- --------------------------------------------------------

--
-- Stand-in structure for view `prodcat`
-- (See below for the actual view)
--
CREATE TABLE `prodcat` (
                           `ID` int(11)
    ,`title` varchar(50)
    ,`base` decimal(8,2)
    ,`image` blob
    ,`name` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
                           `ID` int(11) NOT NULL,
                           `title` varchar(50) DEFAULT NULL,
                           `brand` varchar(50) DEFAULT NULL,
                           `image` blob DEFAULT NULL,
                           `base` decimal(8,2) DEFAULT NULL,
                           `reg_data` datetime DEFAULT NULL,
                           `weight` varchar(20) DEFAULT NULL
);

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `title`, `brand`, `image`, `base`, `reg_data`, `weight`) VALUES
                                                                                          (1, 'Iphone 13 mini', 'Apple', 0x6173736574732f70726f64756374732f6970686f6e6531336d696e692e6a7067, '120000.00', '2022-12-31 11:11:11', '250g'),
                                                                                          (2, 'Iphone 13 pro', 'Apple', 0x6173736574732f70726f64756374732f6970686f6e65313370726f2e6a7067, '175000.00', '2022-12-31 11:11:11', '400g'),
                                                                                          (3, 'Iphone 14 plus', 'Apple', 0x6173736574732f70726f64756374732f6970686f6e653134706c75732e6a7067, '250000.00', '2022-12-31 11:11:11', '450g'),
                                                                                          (4, 'Iphone 14', 'Apple', 0x6173736574732f70726f64756374732f6970686f6e6531342e6a7067, '200000.00', '2022-12-31 11:11:11', '400g'),
                                                                                          (5, 'Sony WX-2000', 'Sony', 0x6173736574732f70726f64756374732f736f6e796865616470686f6e65312e706e67, '75000.00', '2022-12-31 11:11:11', '150g'),
                                                                                          (6, 'Sony MX-45', 'Sony', 0x6173736574732f70726f64756374732f736f6e796865616470686f6e65322e706e67, '50000.00', '2022-12-31 11:11:11', '120g'),
                                                                                          (7, 'Green mini wireless Mic', 'Green', 0x6173736574732f70726f64756374732f477265656e4d696e69576972656c6573734d6963726f70686f6e652e706e67, '10000.00', '2022-12-31 11:11:11', '50g'),
                                                                                          (8, 'Powerlogy Compact power bank', 'Powerlogy', 0x6173736574732f70726f64756374732f506f7765726f6c6f6779436f6d706163742e706e67, '15000.00', '2022-12-31 11:11:11', '150g'),
                                                                                          (9, 'Anker-Soundcore-Motion-Boom-Plus-Portable-Waterpro', 'ANKER', 0x6173736574732f70726f64756374732f416e6b65722d536f756e64636f72652d4d6f74696f6e2d426f6f6d2d506c75732d506f727461626c652d576174657270726f6f662d4f7574646f6f722d537065616b65722e706e67, '72000.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (10, 'JBL-Flip-6.jpg', 'JBL', 0x6173736574732f70726f64756374732f4a424c2d466c69702d362e6a7067, '45999.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (11, 'Sony-XP500-X-Series-Portable-Wireless-Speaker', 'SONY', 0x6173736574732f70726f64756374732f536f6e792d58503530302d582d5365726965732d506f727461626c652d576972656c6573732d537065616b65722e6a7067, '165000.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (12, 'Sony-XB13-EXTRA-BASS-Portable-Wireless-Speaker', 'SONY', 0x6173736574732f70726f64756374732f416e6b65722d536f756e64636f72652d4d6f74696f6e2d426f6f6d2d506c75732d506f727461626c652d576174657270726f6f662d4f7574646f6f722d537065616b65722e706e67, '38000.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (13, 'Jbl-wind-2-1', 'JBL', 0x6173736574732f70726f64756374732f4a626c2d77696e642d322d312e706e67, '24999.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (14, 'Dialog 4g Huawei-B315', 'Dialog', 0x6173736574732f70726f64756374732f4469616c6f672d4875617765692d423331352e706e67, '2900.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (15, 'mobitel s10', 'Mobitel', 0x6173736574732f70726f64756374732f6d6f626974656c207331302e6a7067, '4900.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (16, 'Netgear AC SL1000 5G', 'Netgear', 0x6173736574732f70726f64756374732f4e6574676561725f41435f534c313030302e6a7067, '186000.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (17, 'Lively Phone', 'Lively', 0x6173736574732f70726f64756374732f427574746f6e5f6c6976656c792e6a7067, '3999.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (18, 'Logitech-H370-USB-Computer-Headset', 'Logitech', 0x6173736574732f70726f64756374732f4c6f6769746563682d483337302d5553422d436f6d70757465722d486561647365742e6a7067, '18570.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (19, 'Hyperx b324 wired', 'HyperX', 0x6173736574732f70726f64756374732f4879706572785f623332345f77697265642e6a7067, '27499.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (20, 'Lenovo HX106 Wireless Bluetooth Headset.jpg', 'Lenovo', 0x6173736574732f70726f64756374732f4c656e6f766f2d48583130362d576972656c6573732d426c7565746f6f74682d486561647365742e6a7067, '5600.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (21, 'Bose-QuietControl-30-Wireless-Headphones', 'BOSE', 0x6173736574732f70726f64756374732f426f73652d5175696574436f6e74726f6c2d33302d576972656c6573732d4865616470686f6e65732e6a7067, '98999.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (22, 'Green Lion Compact', 'Green lion', 0x6173736574732f70726f64756374732f477265656e4c696f6e436f6d706163742e6a7067, '3450.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (23, 'Samsung Galaxy A23 Tempered Glass', 'Samsung', 0x6173736574732f70726f64756374732f53616d73756e672047616c617879204132332054656d706572656420476c6173732e706e67, '1299.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (24, 'Microsoft-8WV-0008-Surface-Slim-Pen-2', 'Microsoft', 0x6173736574732f70726f64756374732f4d6963726f736f66742d3857562d303030382d537572666163652d536c696d2d50656e2d322e706e67, '58656.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (25, 'TecnokRC 4WD', 'Teknok', 0x6173736574732f70726f64756374732f5465636e6f6b5243333234322e6a7067, '12400.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (26, 'Drone with 1080P Camera for Adults and Kids, Folda', 'Verflew', 0x6173736574732f70726f64756374732f566572666c65772052382e6a7067, '22999.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (27, 'Atlas-Cricket-Ball', 'Atlas', 0x6173736574732f70726f64756374732f41746c61732d437269636b65742d42616c6c2e6a7067, '320.00', '2022-12-28 11:12:00', '120g'),
                                                                                          (28, 'GM-ZELOS Leather Bat', 'GM', 0x6173736574732f70726f64756374732f474d2d5a454c4f532d315f5f39313234372e6a7067, '45999.00', '2022-12-28 11:12:00', '3200g'),
                                                                                          (29, 'Callaway Golf Club Set', 'Callaway', 0x6173736574732f70726f64756374732f43616c6c6177617920476f6c6620436c7562205365742e6a7067, '267999.00', '2022-12-28 11:12:00', '250g'),
                                                                                          (30, 'Promate SolarTank-20PDCi', 'Promate', 0x6173736574732f70726f64756374732f50726f6d61746520536f6c617254616e6b2d3230504443692e6a7067, '22000.00', '2022-12-31 11:11:11', '198g'),
                                                                                          (31, 'Xiaomi-Mi-PB1022ZM-3-Ultra-Compact-Power-Bank', 'Xiamoi', 0x6173736574732f70726f64756374732f5869616f6d692d4d692d5042313032325a4d2d332d556c7472612d436f6d706163742d31303030306d41682d506f7765722d42616e6b2e6a7067, '23000.00', '2022-12-31 11:11:11', '198g'),
                                                                                          (32, 'PowerSkin-Power-Bank', 'Energizer', 0x6173736574732f70726f64756374732f506f776572536b696e2d506f7765722d42616e6b2d505556504230312d31303030306d41682d30322e6a7067, '11999.00', '2022-12-31 11:11:11', '300g'),
                                                                                          (33, 'Kingston NV1', 'Kingston', 0x6173736574732f70726f64756374732f4b696e6773746f6e4e56312e706e67, '12999.00', '2022-12-31 11:11:11', '50'),
                                                                                          (34, 'Transcend NVME', 'Transcend', 0x6173736574732f70726f64756374732f5472616e7363656e6420313130532e706e67, '12999.00', '2022-12-31 11:11:11', '300g'),
                                                                                          (35, 'SAMSUNG 870 EVO', 'Samsung', 0x6173736574732f70726f64756374732f53414d53554e47203837302045564f2e706e67, '24999.00', '2022-12-31 11:11:11', '300g'),
                                                                                          (36, 'SANDISK ULTRA DUAL DRIVE USB', 'sandisk', 0x6173736574732f70726f64756374732f53414e4449534b20554c545241204455414c204452495645205553422e706e67, '8999.00', '2022-12-31 11:11:11', '300g'),
                                                                                          (37, 'TOSHIBA LED TV', 'Thoshiba', 0x6173736574732f70726f64756374732f544f534849424120333220496e6368204c45442054562e706e67, '68999.00', '2022-12-31 11:11:11', '300g'),
                                                                                          (38, 'Sony LED TV', 'Sony', 0x6173736574732f70726f64756374732f736f6e796c656435352e6a7067, '199999.00', '2022-12-31 11:11:11', '2.8KG'),
                                                                                          (39, 'GALAXY TAB A8 2022 LTE (BLACK)', 'Samsung', 0x6173736574732f70726f64756374732f736f6e796c656435352e6a706747414c415859205441422041382032303232204c54452e6a7067, '85990.00', '2022-12-31 11:11:11', '560g'),
                                                                                          (40, 'IMATION DUAL DRIVE USB', 'IMATION', 0x6173736574732f70726f64756374732f696d6174696f6e62657275622e6a7067, '3499.00', '2022-12-31 11:11:11', '300g'),
                                                                                          (41, 'Dell Pro Wireless Keyboard And Mouse US English - ', 'DELL', 0x6173736574732f70726f64756374732f44656c6c204b6579626f61726420416e64204d6f7573652e6a7067, '4200.00', '2022-12-30 11:11:11', '459g');

-- --------------------------------------------------------

--
-- Table structure for table `product_combination`
--

CREATE TABLE `product_combination` (
                                       `product_detail_id` int(11) NOT NULL,
                                       `product_variants_id` int(11) DEFAULT NULL,
                                       `value_id` int(11) DEFAULT NULL
);

--
-- Dumping data for table `product_combination`
--

INSERT INTO `product_combination` (`product_detail_id`, `product_variants_id`, `value_id`) VALUES
                                                                                               (1, 1, 1),
                                                                                               (2, 1, 6),
                                                                                               (3, 2, 2),
                                                                                               (4, 2, 7),
                                                                                               (5, 3, 1),
                                                                                               (6, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `product_variant`
--

CREATE TABLE `product_variant` (
                                   `product_Variants_id` int(11) NOT NULL,
                                   `product_id` int(11) DEFAULT NULL,
                                   `productVariantName` varchar(50) DEFAULT NULL,
                                   `sku` varchar(50) DEFAULT NULL,
                                   `unit_price` decimal(8,2) DEFAULT NULL
);

--
-- Dumping data for table `product_variant`
--

INSERT INTO `product_variant` (`product_Variants_id`, `product_id`, `productVariantName`, `sku`, `unit_price`) VALUES
                                                                                                                   (1, 2, 'RED_6GB', 'IP13PROR6', '325000.00'),
                                                                                                                   (2, 2, 'BLACK_8GB', 'IP13PROB8', '350000.00'),
                                                                                                                   (3, 2, 'RED_8GB', 'IP13PROR8', '355000.00'),
                                                                                                                   (16, 9, 'DEFAULT', 'ANKER_SND_PORT', '72000.00'),
                                                                                                                   (17, 10, 'DEFAULT', 'JBL_FLIP_6', '45999.00'),
                                                                                                                   (18, 11, 'DEFAULT', 'SONY_XP500', '165000.00'),
                                                                                                                   (19, 12, 'DEFAULT', 'SONY_XB13', '38000.00'),
                                                                                                                   (20, 13, 'DEFAULT', 'JBL_WIND2', '24999.00'),
                                                                                                                   (21, 14, 'DEFAULT', 'Dialog_B315.png', '2900.00'),
                                                                                                                   (22, 15, 'DEFAULT', 'MOBITEL_S10', '4900.00'),
                                                                                                                   (23, 16, 'DEFAULT', 'Netgear_AC_SL1000', '186000.00'),
                                                                                                                   (24, 17, 'DEFAULT', 'Button_lively', '3999.00'),
                                                                                                                   (25, 18, 'DEFAULT', 'Logitech_H370', '18570.00'),
                                                                                                                   (26, 19, 'DEFAULT', 'Hyperx_b324_wired', '27499.00'),
                                                                                                                   (27, 20, 'DEFAULT', 'Lenovo_HX106', '5600.00'),
                                                                                                                   (28, 21, 'DEFAULT', 'Bose_Quiet_30', '98999.00'),
                                                                                                                   (29, 22, 'DEFAULT', 'Green_Lion_852', '3450.00'),
                                                                                                                   (30, 23, 'DEFAULT', 'Samsung_A23_Temp', '1299.00'),
                                                                                                                   (31, 24, 'DEFAULT', 'Microsoft_8WV0008', '58656.00'),
                                                                                                                   (32, 25, 'DEFAULT', 'TecnokRC3242', '12400.00'),
                                                                                                                   (33, 26, 'DEFAULT', 'Verflew_R8', '22999.00'),
                                                                                                                   (34, 27, 'DEFAULT', 'Atlas_CrBll', '320.00'),
                                                                                                                   (35, 28, 'DEFAULT', 'BAT_GM_ZELOS', '45999.00'),
                                                                                                                   (36, 29, 'DEFAULT', 'Callaway_B67', '267999.00'),
                                                                                                                   (37, 30, '10000mah', 'PromateSolarTank-10mah', '22000.00'),
                                                                                                                   (38, 30, '20000mah', 'PromateSolarTank-20mah', '35000.00'),
                                                                                                                   (39, 31, '10000mah', 'Xiaomi-Mi-PB1022ZM10', '23000.00'),
                                                                                                                   (40, 31, '20000mah', 'Xiaomi-Mi-PB1022ZM20', '45000.00'),
                                                                                                                   (41, 32, '5000mah', 'PowerSkinPowerBank5', '11999.00'),
                                                                                                                   (42, 32, '20000mah', 'PowerSkinPowerBank20', '48000.00'),
                                                                                                                   (43, 33, '128GB', 'KingstonNV1128', '12999.00'),
                                                                                                                   (44, 33, '256GB', 'KingstonNV1256', '16999.00'),
                                                                                                                   (45, 33, '512GB', 'KingstonNV1512', '19999.00'),
                                                                                                                   (46, 34, '128GB', 'Transcend 110S128', '12999.00'),
                                                                                                                   (47, 34, '1TB', 'Transcend 110S1TB', '48000.00'),
                                                                                                                   (48, 35, '128GB', 'SAMSUNG 870 EVO128', '24999.00'),
                                                                                                                   (49, 35, '512GB', 'SAMSUNG 870 EVO512', '64999.00'),
                                                                                                                   (50, 36, '64GB', 'snd64', '8999.00'),
                                                                                                                   (51, 36, '240GB', 'snd240', '14999.00'),
                                                                                                                   (52, 37, '32 INCH', 'toshiba32', '68999.00'),
                                                                                                                   (53, 37, '48 INCH', 'toshiba48', '79899.00'),
                                                                                                                   (54, 38, '55 INCH', 'sonyled55', '199999.00'),
                                                                                                                   (55, 38, '32 INCH', 'sonyled32', '79899.00'),
                                                                                                                   (56, 39, '4GB-64GB', 'galtab464', '85990.00'),
                                                                                                                   (57, 39, '8GB-256GB', 'galtab8256', '112500.00'),
                                                                                                                   (58, 40, '64GB', 'imt64', '3499.00'),
                                                                                                                   (59, 40, '128GB', 'imt128', '18999.00'),
                                                                                                                   (60, 41, 'DEFAULT', 'DELL_KB6347', '4200.00'),
                                                                                                                   (61, 5, 'DEFAULT', 'Sony WX-2000RE', '75000.00'),
                                                                                                                   (62, 6, 'DEFAULT', 'Sony MX-45_745', '50000.00'),
                                                                                                                   (63, 7, 'DEFAULT', 'Green-mini-wireless-Mic', '10000.00'),
                                                                                                                   (64, 8, 'DEFAULT', 'Powerlogy4534r324', '15000.00'),
                                                                                                                   (65, 1, '4GB 64GB', 'IP13MINI4G64G', '325000.00'),
                                                                                                                   (66, 1, '4GB 128GB', 'IP13MINI4G128G', '355000.00'),
                                                                                                                   (67, 1, '4GB 256GB', 'IP13MINI4G256G', '425000.00'),
                                                                                                                   (68, 3, '4GB 64GB', 'IP14PLUS4G64G', '425000.00'),
                                                                                                                   (69, 3, '4GB 128GB', 'IP14PLUS4G128G', '355000.00'),
                                                                                                                   (70, 3, '6GB 256GB', 'IP14PLUS6G64G', '425000.00'),
                                                                                                                   (71, 4, 'RED 6GB 64GB', 'IP14RED6G64G', '325000.00'),
                                                                                                                   (72, 4, 'RED 4GB 128GB', 'IP14RED4G64G', '379000.00'),
                                                                                                                   (73, 4, 'BLACK 6GB 64GB', 'IP14BLACK6G64G', '315000.00'),
                                                                                                                   (74, 4, 'BLACK 4GB 128GB', 'IP14BLACK4G128G', '395000.00');

-- --------------------------------------------------------

--
-- Table structure for table `registered_customer`
--

CREATE TABLE `registered_customer` (
                                       `ID` int(11) NOT NULL,
                                       `user_id` int(11) DEFAULT NULL,
                                       `first_name` varchar(50) DEFAULT NULL,
                                       `last_name` varchar(50) DEFAULT NULL,
                                       `email` varchar(60) DEFAULT NULL,
                                       `password` varchar(50) NOT NULL
);

--
-- Dumping data for table `registered_customer`
--

INSERT INTO `registered_customer` (`ID`, `user_id`, `first_name`, `last_name`, `email`, `password`) VALUES
    (1, 1, 'Malshan', 'Keerthichandra', 'malshanacc@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
                         `sku` varchar(50) NOT NULL,
                         `initial_stock` int(11) DEFAULT NULL,
                         `avai_stock` int(11) DEFAULT NULL
);

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`sku`, `initial_stock`, `avai_stock`) VALUES
                                                               ('ANKER_SND_PORT', 20, 13),
                                                               ('Atlas_CrBll', 200, 193),
                                                               ('BAT_GM_ZELOS', 40, 38),
                                                               ('Bose_Quiet_30', 35, 33),
                                                               ('Button_lively', 25, 0),
                                                               ('Callaway_B67', 5, 0),
                                                               ('DELL_KB6347', 41, 41),
                                                               ('Dialog_B315.png', 100, 98),
                                                               ('galtab464', 22, 22),
                                                               ('galtab8256', 30, 30),
                                                               ('Green-mini-wireless-Mic', 32, 32),
                                                               ('Green_Lion_852', 150, 146),
                                                               ('Hyperx_b324_wired', 40, 38),
                                                               ('imt128', 92, 92),
                                                               ('imt64', 40, 40),
                                                               ('IP13MINI4G128G', 20, 20),
                                                               ('IP13MINI4G256G', 15, 15),
                                                               ('IP13MINI4G64G', 25, 25),
                                                               ('IP13PROB8', 20, 18),
                                                               ('IP13PROR6', 10, 1),
                                                               ('IP13PROR8', 5, 0),
                                                               ('IP14BLACK4G128G', 28, 28),
                                                               ('IP14BLACK6G64G', 25, 25),
                                                               ('IP14PLUS4G128G', 20, 20),
                                                               ('IP14PLUS4G64G', 25, 25),
                                                               ('IP14PLUS6G64G', 15, 15),
                                                               ('IP14RED4G64G', 20, 20),
                                                               ('IP14RED6G64G', 25, 25),
                                                               ('JBL_FLIP_6', 30, 28),
                                                               ('JBL_WIND2', 70, 68),
                                                               ('KingstonNV1128', 62, 62),
                                                               ('KingstonNV1256', 70, 70),
                                                               ('KingstonNV1512', 80, 80),
                                                               ('Lenovo_HX106', 30, 22),
                                                               ('Logitech_H370', 12, 10),
                                                               ('Microsoft_8WV0008', 5, 3),
                                                               ('MOBITEL_S10', 50, 48),
                                                               ('Netgear_AC_SL1000', 6, 4),
                                                               ('Powerlogy4534r324', 52, 52),
                                                               ('PowerSkinPowerBank20', 99, 99),
                                                               ('PowerSkinPowerBank5', 62, 62),
                                                               ('PromateSolarTank-10mah', 50, 50),
                                                               ('PromateSolarTank-20mah', 50, 50),
                                                               ('SAMSUNG 870 EVO128', 20, 20),
                                                               ('SAMSUNG 870 EVO512', 23, 23),
                                                               ('Samsung_A23_Temp', 100, 98),
                                                               ('snd240', 30, 30),
                                                               ('snd64', 20, 20),
                                                               ('Sony MX-45_745', 12, 12),
                                                               ('Sony WX-2000RE', 23, 23),
                                                               ('sonyled32', 30, 30),
                                                               ('sonyled55', 17, 17),
                                                               ('SONY_XB13', 15, 13),
                                                               ('SONY_XP500', 20, 18),
                                                               ('TecnokRC3242', 16, 14),
                                                               ('toshiba32', 20, 20),
                                                               ('toshiba48', 30, 30),
                                                               ('Transcend 110S128', 20, 20),
                                                               ('Transcend 110S1TB', 10, 10),
                                                               ('Verflew_R8', 7, 5),
                                                               ('Xiaomi-Mi-PB1022ZM10', 30, 30),
                                                               ('Xiaomi-Mi-PB1022ZM20', 28, 28);

--
-- Triggers `stock`
--
DELIMITER $$
CREATE TRIGGER `avai_stock_verify` BEFORE INSERT ON `stock` FOR EACH ROW if new.avai_stock > new.initial_stock then set new.avai_stock = new.initial_stock;
end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
                               `sub_cat_id` int(11) NOT NULL,
                               `cat_id` int(11) DEFAULT NULL,
                               `name` varchar(20) DEFAULT NULL
);

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`sub_cat_id`, `cat_id`, `name`) VALUES
                                                               (1, 1, 'Smart Phones'),
                                                               (2, 1, 'Tablets'),
                                                               (3, 1, 'Button Phones'),
                                                               (4, 2, 'Wireless Headset'),
                                                               (5, 2, 'Wired Headset'),
                                                               (6, 3, 'Phone Accessories'),
                                                               (7, 4, '4g ROUTERS'),
                                                               (8, 4, '5G WIFI routers'),
                                                               (9, 5, 'Solar power banks'),
                                                               (10, 5, 'Normal power banks'),
                                                               (11, 6, 'JBL'),
                                                               (12, 6, 'Sony'),
                                                               (13, 6, 'Anker'),
                                                               (14, 7, 'default'),
                                                               (15, 8, 'USB Flash Drive'),
                                                               (16, 8, 'SSD'),
                                                               (17, 9, 'default'),
                                                               (18, 10, 'LED TV'),
                                                               (19, 3, 'Computer-accesories');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
                        `id` int(11) NOT NULL,
                        `type` enum('Registered','Guest') DEFAULT NULL
);

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `type`) VALUES
                                      (1, 'Registered'),
                                      (2, 'Registered');

-- --------------------------------------------------------

--
-- Table structure for table `variant`
--

CREATE TABLE `variant` (
                           `variant_id` int(11) NOT NULL,
                           `variant` varchar(50) DEFAULT NULL
);

--
-- Dumping data for table `variant`
--

INSERT INTO `variant` (`variant_id`, `variant`) VALUES
                                                    (1, 'Color'),
                                                    (2, 'RAM'),
                                                    (3, 'Storage'),
                                                    (4, 'Display Size');

-- --------------------------------------------------------

--
-- Table structure for table `variant_value`
--

CREATE TABLE `variant_value` (
                                 `value_id` int(11) NOT NULL,
                                 `variant_id` int(11) DEFAULT NULL,
                                 `value_name` varchar(50) DEFAULT NULL
);

--
-- Dumping data for table `variant_value`
--

INSERT INTO `variant_value` (`value_id`, `variant_id`, `value_name`) VALUES
                                                                         (1, 1, 'red'),
                                                                         (2, 1, 'black'),
                                                                         (3, 1, 'white'),
                                                                         (4, 1, 'Blue'),
                                                                         (5, 2, '4GB'),
                                                                         (6, 2, '6GB'),
                                                                         (7, 2, '8GB'),
                                                                         (8, 3, '64GB'),
                                                                         (9, 3, '128GB'),
                                                                         (10, 3, '256GB'),
                                                                         (11, 4, '32INCH'),
                                                                         (12, 4, '48INCH'),
                                                                         (13, 4, '55INCH');



--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
    MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billing_details`
--
ALTER TABLE `billing_details`
    MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `card_details`
--
ALTER TABLE `card_details`
    MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
    MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
    MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
    MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
    MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `delivery_details`
--
ALTER TABLE `delivery_details`
    MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mobile`
--
ALTER TABLE `mobile`
    MODIFY `mobile_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
    MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
    MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product_combination`
--
ALTER TABLE `product_combination`
    MODIFY `product_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_variant`
--
ALTER TABLE `product_variant`
    MODIFY `product_Variants_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `registered_customer`
--
ALTER TABLE `registered_customer`
    MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
    MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `variant`
--
ALTER TABLE `variant`
    MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `variant_value`
--
ALTER TABLE `variant_value`
    MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
    ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`registered_customer_id`) REFERENCES `registered_customer` (`ID`);

--
-- Constraints for table `belongs`
--
ALTER TABLE `belongs`
    ADD CONSTRAINT `belongs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`ID`),
    ADD CONSTRAINT `belongs_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`),
    ADD CONSTRAINT `belongs_ibfk_3` FOREIGN KEY (`sub_cat_id`) REFERENCES `subcategory` (`sub_cat_id`);

--
-- Constraints for table `billing_details`
--
ALTER TABLE `billing_details`
    ADD CONSTRAINT `billing_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`order_id`),
    ADD CONSTRAINT `billing_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`order_id`),
    ADD CONSTRAINT `billing_details_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`order_id`);

--
-- Constraints for table `card_details`
--
ALTER TABLE `card_details`
    ADD CONSTRAINT `card_details_ibfk_1` FOREIGN KEY (`registered_customer_id`) REFERENCES `registered_customer` (`ID`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
    ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
    ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`sku`) REFERENCES `stock` (`sku`),
    ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`);

--
-- Constraints for table `delivery_details`
--
ALTER TABLE `delivery_details`
    ADD CONSTRAINT `delivery_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`order_id`),
    ADD CONSTRAINT `delivery_details_ibfk_2` FOREIGN KEY (`del_person_id`) REFERENCES `delivery_person` (`del_person_id`),
    ADD CONSTRAINT `delivery_details_ibfk_3` FOREIGN KEY (`reg_customer_id`) REFERENCES `registered_customer` (`ID`),
    ADD CONSTRAINT `delivery_details_ibfk_4` FOREIGN KEY (`location_id`) REFERENCES `address` (`location_id`);

--
-- Constraints for table `mobile`
--
ALTER TABLE `mobile`
    ADD CONSTRAINT `mobile_ibfk_1` FOREIGN KEY (`registered_customer_id`) REFERENCES `registered_customer` (`ID`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
    ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `registered_customer` (`ID`),
    ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`);

--
-- Constraints for table `product_combination`
--
ALTER TABLE `product_combination`
    ADD CONSTRAINT `product_combination_ibfk_1` FOREIGN KEY (`product_variants_id`) REFERENCES `product_variant` (`product_Variants_id`),
    ADD CONSTRAINT `product_combination_ibfk_2` FOREIGN KEY (`value_id`) REFERENCES `variant_value` (`value_id`);

--
-- Constraints for table `product_variant`
--
ALTER TABLE `product_variant`
    ADD CONSTRAINT `product_variant_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`ID`),
    ADD CONSTRAINT `product_variant_ibfk_2` FOREIGN KEY (`sku`) REFERENCES `stock` (`sku`);

--
-- Constraints for table `registered_customer`
--
ALTER TABLE `registered_customer`
    ADD CONSTRAINT `registered_customer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
    ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `variant_value`
--
ALTER TABLE `variant_value`
    ADD CONSTRAINT `variant_value_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`variant_id`);
COMMIT;