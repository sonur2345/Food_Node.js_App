-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2022 at 08:32 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `products_ids` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `cost`, `name`, `email`, `status`, `city`, `address`, `phone`, `date`, `products_ids`) VALUES
(1, '39.99', 'sonu', 'sonu9098839901@gmail.com', 'not paid', 'Raipur', 'Krishna nagar Raipur, Raipur', '8085761394', '2022-09-14 18:49:20', ''),
(2, '39.99', 'sonu', 'sonu9098839901@gmail.com', 'not paid', 'Raipur', 'Krishna nagar Raipur, Raipur', '8085761394', '2022-09-14 18:49:55', ''),
(1663171834138, '39.99', 'Sonu', 'sonu9098839901@gmail.com', 'not paid', 'Raipur', 'Krishna nagar Raipur, Raipur', '8085761394', '2022-09-14 21:40:34', ',1'),
(1663171947105, '39.99', 'Sonu', 'sonu9098839901@gmail.com', 'not paid', 'Raipur', 'Krishna nagar Raipur, Raipur', '+91 8085761394', '2022-09-14 21:42:27', ',1'),
(1663171982265, '39.99', 'Sonu', 'sonu9098839901@gmail.com', 'not paid', 'Raipur', 'Krishna nagar Raipur, Raipur', '+91 8085761394', '2022-09-14 21:43:02', ',1'),
(1663172642838, '39.99', 'Sonu sahu', 'sonu9098839901@gmail.com', 'not paid', 'Raipur', 'Krishna nagar Raipur, Raipur', '+91 8085761394', '2022-09-14 21:54:02', ',1'),
(1663172789687, '39.99', 'Sonu', 'sonu9098839901@gmail.com', 'paid', 'Raipur', 'Krishna nagar Raipur, Raipur', '80857 61394', '2022-09-14 21:56:29', ',1'),
(1663173738790, '49.99', 'rahul', 'sonu9098839901@gmail.com', 'paid', 'Raipur', 'Krishna nagar Raipur, Raipur', '+91 8085761394', '2022-09-14 22:12:18', ',2'),
(1663175762975, '39.99', 'syamu', 'sonu9098839901@gmail.com', 'paid', 'Raipur', 'Krishna nagar Raipur, Raipur', '6532215487', '2022-09-14 22:46:02', ',1'),
(1663176387670, '39.99', 'ram', 'sonu9098839901@gmail.com', 'paid', 'Raipur', 'Krishna nagar Raipur, Raipur', '896532215', '2022-09-14 22:56:27', ',1');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_image`, `product_quantity`, `order_date`) VALUES
(1, 1663175762975, 1, 'Cheese Burger', '39.99', 'f2.png', 1, '2022-09-14'),
(2, 1663176387670, 1, 'Cheese Burger', '39.99', 'f2.png', 1, '2022-09-14');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `transaction_id` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `transaction_id`, `date`) VALUES
(1, 1663176387670, '3J268908DW9843515', '2022-09-14 22:56:43');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` float(8,2) NOT NULL,
  `sale_price` float(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `image` text NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `sale_price`, `quantity`, `image`, `category`, `type`) VALUES
(1, 'Cheese Burger', 'Cheese Burger', 39.99, NULL, 0, 'f2.png', 'burger', 'non-veg'),
(2, 'Pizza', 'Pizza', 49.99, NULL, 0, 'f3.png', 'Pizza', 'non-veg'),
(3, 'Pasta', 'Pasta with vegetables', 59.99, NULL, 0, 'f4.png', 'pasta ', 'veg'),
(4, 'fries', 'fries', 29.99, NULL, 0, 'f5.png', 'fries', 'veg'),
(5, 'Pizza with meat', 'pizza with meat', 49.99, NULL, 0, 'f6.png', 'pizza', 'veg'),
(6, 'Chicken burger', 'Chiken burger', 49.99, NULL, 0, 'f7.png', 'burger', 'non-veg'),
(7, 'Cheese Burger', 'Cheese Burger', 39.99, NULL, 0, 'f2.png', 'burger', 'non-veg'),
(8, 'pizza roti', 'pizza roti', 29.99, NULL, 0, 'f1.png', 'pizza', 'veg'),
(9, 'veg burger', 'veg verger', 19.99, NULL, 0, '', 'burger', 'veg'),
(15, 'pasta', 'pasta', 9.99, NULL, 0, 'f9.png', 'pasta', 'veg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1663176387671;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
