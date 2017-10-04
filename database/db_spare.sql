-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2017 at 08:35 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spare`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch_stock`
--

CREATE TABLE `branch_stock` (
  `b_stock_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_stock`
--

INSERT INTO `branch_stock` (`b_stock_id`, `branch_id`, `product_id`, `stock`) VALUES
(1, 3, 1, 8),
(2, 3, 2, 12),
(3, 3, 13, 12),
(4, 3, 14, 10),
(5, 3, 15, 10),
(6, 3, 16, 9),
(7, 3, 17, 20),
(8, 3, 18, 10),
(9, 3, 19, 10),
(10, 3, 20, 10),
(11, 3, 21, 10),
(12, 3, 22, 10),
(13, 3, 23, 10),
(14, 3, 24, 10),
(15, 3, 25, 10),
(16, 3, 26, 8),
(17, 3, 27, 8),
(18, 3, 28, 15),
(19, 3, 29, 14),
(20, 3, 30, 15),
(21, 3, 31, 15),
(22, 3, 32, 9),
(23, 3, 33, 9),
(24, 3, 34, 10),
(25, 3, 35, 10),
(26, 3, 36, 10),
(27, 3, 37, 10),
(28, 3, 38, 10),
(29, 3, 39, 10),
(30, 3, 40, 10),
(31, 3, 41, 10),
(32, 3, 42, 10),
(33, 4, 1, 2),
(34, 4, 2, 5),
(35, 4, 13, 10),
(36, 4, 14, 10),
(37, 4, 15, 10),
(38, 4, 16, 9),
(39, 4, 17, 10),
(40, 4, 18, 19),
(41, 4, 19, 15),
(42, 4, 20, 15),
(43, 4, 21, 8),
(44, 4, 22, 8),
(45, 4, 23, 10),
(46, 4, 24, 10),
(47, 4, 25, 10),
(48, 4, 26, 10),
(49, 4, 27, 10),
(50, 4, 28, 10),
(51, 4, 29, 10),
(52, 4, 30, 10),
(53, 4, 31, 10),
(54, 4, 32, 10),
(55, 4, 33, 10),
(56, 4, 35, 10),
(57, 4, 36, 10),
(58, 5, 1, 2),
(59, 5, 2, 5),
(60, 5, 13, 10),
(61, 5, 14, 10),
(62, 5, 17, 10),
(63, 5, 18, 10),
(64, 5, 19, 4),
(65, 5, 20, 5),
(66, 5, 22, 6),
(67, 5, 28, 10),
(68, 5, 30, 10),
(69, 5, 32, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_branch`
--

CREATE TABLE `tbl_branch` (
  `b_id` int(11) NOT NULL,
  `b_name` varchar(100) NOT NULL,
  `b_regno` varchar(30) NOT NULL,
  `b_address` varchar(100) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `b_place` varchar(100) NOT NULL,
  `b_state` varchar(50) NOT NULL,
  `b_pin` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_branch`
--

INSERT INTO `tbl_branch` (`b_id`, `b_name`, `b_regno`, `b_address`, `mobile`, `phone`, `b_place`, `b_state`, `b_pin`) VALUES
(3, 'Adoor', 'rno2456', 'Mg Buliding Adoor', '9876545656', '04734298987', 'Adoor', 'Kerala', 675645),
(4, 'Enathu', 'rno7668', 'Kalinga complex Enathu', '9089876765', '04756787656', 'Enathu', 'Kerala', 698912),
(5, 'Kadampanad', 'rno7564', 'Central plaza Kadampanad', '8765456765', '04567252645', 'Kadampanad', 'Kerala', 691523);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`id`, `user_id`, `product_id`, `quantity`, `amount`, `discount`) VALUES
(29, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `username` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `usertype` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`username`, `user_id`, `password`, `usertype`) VALUES
('admin', 0, 'password', 1),
('manu@gmail.com', 22, 'password', 3),
('rahul@gmail.com', 1, 'rahul', 3),
('ttt@gmal.dd', 21, 'tttyyyy', 3),
('USR15278', 5, 'PWD44571', 2),
('USR15636', 4, 'PWD35847', 2),
('USR16594', 3, 'PWD22310', 2),
('USR18193', 6, 'PWD22373', 2),
('vishnu@gmail.com', 20, 'password', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `amount` int(6) NOT NULL,
  `status` int(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`id`, `order_id`, `branch_id`, `product_id`, `user_id`, `quantity`, `amount`, `status`, `date`) VALUES
(9, 'ORD17930', 3, 1, 1, 1, 1098, 1, '2017-05-12'),
(10, 'ORD17930', 3, 33, 1, 1, 420, 1, '2017-05-12'),
(11, 'ORD17930', 3, 29, 1, 1, 880, 1, '2017-05-12'),
(15, 'ORD13842', 3, 18, 1, 1, 1900, 0, '2017-05-12'),
(16, 'ORD13842', 3, 23, 1, 1, 410, 0, '2017-05-12'),
(17, 'ORD16655', 4, 16, 1, 1, 790, 1, '2017-05-12'),
(18, 'ORD16655', 4, 18, 1, 1, 1900, 1, '2017-05-12'),
(19, 'ORD12768', 5, 3, 1, 1, 5294, 1, '2017-05-12'),
(20, 'ORD12768', 5, 34, 1, 1, 750, 1, '2017-05-12'),
(21, 'ORD14599', 3, 35, 20, 1, 800, 0, '2017-05-12'),
(22, 'ORD14599', 3, 33, 20, 1, 420, 0, '2017-05-12'),
(23, 'ORD14599', 3, 3, 20, 1, 5294, 0, '2017-05-12'),
(24, 'ORD18008', 4, 29, 20, 1, 880, 0, '2017-05-12'),
(25, 'ORD18008', 4, 18, 20, 1, 1900, 0, '2017-05-12'),
(26, 'ORD18869', 5, 25, 20, 1, 2800, 0, '2017-05-12'),
(27, 'ORD18869', 5, 38, 20, 1, 550, 0, '2017-05-12'),
(28, 'ORD18869', 5, 21, 20, 1, 4300, 0, '2017-05-12'),
(29, 'ORD10252', 3, 16, 22, 1, 790, 0, '2017-05-12'),
(30, 'ORD10252', 3, 31, 22, 1, 1800, 0, '2017-05-12'),
(31, 'ORD10252', 3, 2, 22, 1, 1380, 0, '2017-05-12'),
(32, 'ORD10896', 4, 25, 22, 1, 2800, 0, '2017-05-12'),
(33, 'ORD10896', 4, 14, 22, 1, 2870, 0, '2017-05-12'),
(34, 'ORD15821', 5, 30, 22, 1, 1150, 0, '2017-05-12'),
(35, 'ORD15821', 5, 17, 22, 1, 2330, 0, '2017-05-12'),
(36, 'ORD10181', 5, 28, 22, 1, 1330, 0, '2017-05-12'),
(37, 'ORD10181', 5, 41, 22, 1, 1050, 0, '2017-05-12'),
(38, 'ORD17229', 4, 15, 22, 1, 1760, 0, '2017-05-12'),
(39, 'ORD17229', 4, 38, 22, 1, 550, 0, '2017-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_desc` varchar(500) NOT NULL,
  `unit_price` int(6) NOT NULL,
  `discount` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `branch_stock` int(8) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`id`, `product_id`, `name`, `category_id`, `product_desc`, `unit_price`, `discount`, `stock`, `branch_stock`, `image`) VALUES
(1, 'PRDT16320', 'CEAT TYPE', 1, 'We have a wonderful support service which is available for you 7 days a week, 24...', 1200, 102, 1, 40, 'tyre.png'),
(2, 'PRDT17600', 'MRF 20092', 1, 'We have a wonderful support service which is available for you 7 days a week, 24...', 1500, 120, 3, 39, 'tyre1.png'),
(3, 'PRDT18042', 'Indicator Light', 2, 'We have a wonderful support service which is available for you 7 days a week, 24...', 5444, 150, 187, 40, '12.png'),
(13, 'PRDT11147', 'MONOSHOCK 02 [RS150] RACING + TANK 235MM', 8, 'We have a wonderful support service which is available for you 7 days a week, 24...', 1800, 100, 68, 40, '89af37ae46f795844ea4540fddc446cc-medium.jpg'),
(14, 'PRDT16175', 'ABSORBER LC135 (05) HEAVY DUTY', 8, 'We have a wonderful support service which is available for you 7 days a week, 24...', 3000, 130, 20, 39, '4087-medium.jpg'),
(15, 'PRDT12641', 'ABSORBER 340 (06) UNIVERSAL GAS CNC', 8, 'We have a wonderful support service which is available for you 7 days a week, 24...', 1800, 40, 50, 39, '4075-medium.jpg'),
(16, 'PRDT14566', 'ABSORBER LC135 210MM (02)  RM 112.00', 8, 'We have a wonderful support service which is available for you 7 days a week, 24...', 800, 10, 81, 38, '4077-medium.jpg'),
(17, 'PRDT15892', 'ABSORBER 270MM (03)  RM 119.00', 8, 'We have a wonderful support service which is available for you 7 days a week, 24...', 2400, 70, 0, 39, '4071-medium.jpg'),
(18, 'PRDT14563', 'SPORT RIM (BLACK_RED)', 9, 'We have a wonderful support service which is available for you 7 days a week, 24...', 2100, 200, 30, 37, 'f2a2d4277c366a240394674ed277e9e1-medium.jpg'),
(19, 'PRDT15059', 'MVR1-LC135(XR5)(BLACK) SPORT RIM', 9, 'We have a wonderful support service which is available for you 7 days a week, 24...', 3000, 300, 1, 40, '1944fbcf59e97717a9c90cb480bb2a06-medium.jpg'),
(20, 'PRDT15112', 'ENKAI SPORT RIM 3L (160/215) Y15ZR (ORI-W/DISC)', 9, 'We have a wonderful support service which is available for you 7 days a week, 24...', 5100, 700, 0, 40, '3a38ea9ddf18569eb258de35fa4a41ac-medium.jpg'),
(21, 'PRDT11666', 'MVR1-KRISS 1(XR6-M) SPORT RIM', 9, 'We have a wonderful support service which is available for you 7 days a week, 24...', 4500, 200, 2, 40, '4293bba7dbd6bc8cede16a8f20638ef5-medium.jpg'),
(22, 'PRDT18156', 'YTEQ SPORTS RIM-LC135(LOGO) (D-L)  RM 245.00', 9, 'We have a wonderful support service which is available for you 7 days a week, 24...', 7300, 300, 16, 40, '4827-medium.jpg'),
(23, 'PRDT18266', 'MUFFLER COVER 04 [RS150] SIDE', 10, 'We have a wonderful support service which is available for you 7 days a week, 24...', 440, 30, 70, 39, '481546ce98a491e8f15d9bb578499460-medium.jpg'),
(24, 'PRDT15055', 'EXHAUST MUFFLER BLACK COBRA Y.Y.PANG (WAVE125S)', 10, 'We have a wonderful support service which is available for you 7 days a week, 24...', 2300, 150, 10, 40, '605eb9d7230d1323bd1eb5b163c786c8-medium.jpg'),
(25, 'PRDT17584', 'CJ IPOH-FZ150 (MB)(28/32MM) MUFFLER', 10, 'We have a wonderful support service which is available for you 7 days a week, 24...', 3000, 200, 0, 39, 'b6ecc150f065351bf5292eb3fa682132-medium.jpg'),
(26, 'PRDT14879', 'EXHAUST MUFFLER SHORT Y.Y.PANG (WAVE125-SP)', 10, 'We have a wonderful support service which is available for you 7 days a week, 24...', 4000, 300, 1, 40, '052713b485ebc2d38f3e3cf84629f12a-medium.jpg'),
(27, 'PRDT12780', 'EXHAUST MUFFLER Y.Y.PANG (Y125Z-B2)', 10, 'We have a wonderful support service which is available for you 7 days a week, 24...', 6000, 500, 12, 40, 'a41ae7334f332206ddd878d8300583ee-medium.jpg'),
(28, 'PRDT10308', 'IRIS CHAIN ORING 428X132', 11, 'We have a wonderful support service which is available for you 7 days a week, 24...', 1400, 70, 35, 39, '04ce941ce89e6909f5901a05c3fd77bd-medium.jpg'),
(29, 'PRDT18289', 'CHAIN ADJUSTER MT-09 BK', 11, 'We have a wonderful support service which is available for you 7 days a week, 24...', 900, 20, 45, 39, '97746eaf5a12668d365ab3f484bb57d0-medium.jpg'),
(30, 'PRDT17047', 'REAR SPROCKET (R9) R25/K250 GOLD', 11, 'We have a wonderful support service which is available for you 7 days a week, 24...', 1200, 50, 15, 39, 'f52e7f99e08bf37fbe309e1d7f5a1bcd-medium.jpg'),
(31, 'PRDT16799', 'SPROCKET SET MVR1 ( RXZ / Y125 )', 11, 'We have a wonderful support service which is available for you 7 days a week, 24...', 2000, 200, 75, 39, '4953-medium.jpg'),
(32, 'PRDT18432', 'LC135 TIMING CHAIN (TOE)', 11, 'We have a wonderful support service which is available for you 7 days a week, 24...', 500, 20, 11, 40, '66b73f21ab3bab81520e97e2bc23697d-medium.jpg'),
(33, 'PRDT11033', 'SIDE MIRROR STANDARD MVR1 (WAVE125)', 12, 'We have a wonderful support service which is available for you 7 days a week, 24...', 450, 30, 20, 39, 'aaf82569aa1fabf5f633176177da9981-medium.jpg'),
(34, 'PRDT11329', 'SIDE MIRROR-TEQ-2639', 12, 'We have a wonderful support service which is available for you 7 days a week, 24...', 780, 30, 10, 40, '4524-medium.jpg'),
(35, 'PRDT14330', 'SIDE MIRROR YTEQ - 02', 12, 'We have a wonderful support service which is available for you 7 days a week, 24...', 900, 100, 10, 39, '1761-medium.jpg'),
(36, 'PRDT18960', 'SIDE MIRROR Y125Z', 12, 'We have a wonderful support service which is available for you 7 days a week, 24...', 599, 90, 3, 40, '478-medium.jpg'),
(37, 'PRDT13052', 'SIDE MIRROR YAMAHA Y110', 12, 'We have a wonderful support service which is available for you 7 days a week, 24...', 400, 20, 0, 40, '477-medium.jpg'),
(38, 'PRDT10519', 'DISC PLATE 77 [RS150] F/R', 13, 'We have a wonderful support service which is available for you 7 days a week, 24...', 600, 50, 40, 40, 'c6bd7da0c52580a257ec7b655e7aeae0-medium.jpg'),
(39, 'PRDT10205', 'DISC PLATE 70 [RS150] FRONT', 13, 'We have a wonderful support service which is available for you 7 days a week, 24...', 1000, 75, 50, 40, '628d3acd899d1a0ec87689b65ff515fb-medium.jpg'),
(40, 'PRDT16241', 'CALIPER PROTECTOR Y15ZR GL', 13, 'We have a wonderful support service which is available for you 7 days a week, 24...', 700, 20, 2, 40, '11bd65bba1ac7f05add44bbedf6c8422-medium.jpg'),
(41, 'PRDT15447', 'MASTER BRAKE PUMP RD', 13, 'We have a wonderful support service which is available for you 7 days a week, 24...', 1200, 150, 112, 40, '237c3e9b592f9f11a21eac04d21e9cd7-medium.jpg'),
(42, 'PRDT17606', 'MVR1 DISC PLATE XR260-1 (260MM)', 13, 'We have a wonderful support service which is available for you 7 days a week, 24...', 800, 120, 20, 40, '9d94278a82db88a5513abe83d66088ff-medium.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

CREATE TABLE `tbl_product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_category`
--

INSERT INTO `tbl_product_category` (`id`, `name`) VALUES
(1, 'Tyre'),
(8, 'ABSORBER'),
(9, 'SPORT RIM'),
(10, 'EXHAUST'),
(11, 'CHAIN SYSTEM'),
(12, 'SIDE MIRROR'),
(13, 'BRAKE SYSTEM');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `id` int(50) NOT NULL,
  `fname` varchar(40) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pin` varchar(7) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_registration`
--

INSERT INTO `tbl_registration` (`id`, `fname`, `lname`, `address`, `mobile`, `city`, `state`, `pin`, `email`) VALUES
(1, 'rahul', 'r', 'sreesailam', '9037500119', 'adoor', 'kerala', '99887', 'rahul@gmail.com'),
(20, 'vishnu', 'tt', 'Manu Bhavan', '9098887765', 'Kottarakkara', 'Kerala', '756567', 'vishnu@gmail.com'),
(22, 'manu', 'mm', 'Manu vilas', '7656565656', 'Pandalam', 'Kerala', '665565', 'manu@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `temp_cart`
--

CREATE TABLE `temp_cart` (
  `id` int(11) NOT NULL,
  `branch` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch_stock`
--
ALTER TABLE `branch_stock`
  ADD PRIMARY KEY (`b_stock_id`);

--
-- Indexes for table `tbl_branch`
--
ALTER TABLE `tbl_branch`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_cart`
--
ALTER TABLE `temp_cart`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch_stock`
--
ALTER TABLE `branch_stock`
  MODIFY `b_stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `tbl_branch`
--
ALTER TABLE `tbl_branch`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `temp_cart`
--
ALTER TABLE `temp_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
