-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: ************************
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `JustDUIt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `JustDUIt`;

CREATE TABLE `role` (
	`ID` INT PRIMARY KEY,
	`name` VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `role`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Human Resource'),
(2, 'Manager'),
(3, 'Storage Management'),
(4, 'Cashier');

CREATE TABLE `product` (
	`ID` INT PRIMARY KEY,
	`name` VARCHAR(255) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`price` INT NOT NULL,
	`stock` INT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `product`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

CREATE TABLE `employee` (
	`ID` INT PRIMARY KEY,
	`roleID` INT NOT NULL REFERENCES Role(ID),
	`name` VARCHAR(255) NOT NULL,
	`username` VARCHAR(255) NOT NULL,
	`salary` VARCHAR(255) NOT NULL,
	`status` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `employee` (`id`, `roleID`, `name`, `username`, `salary`, `status`, `password`) VALUES
(1, 1, 'Administrator', 'admin', 10000000, 'Employed', 'admin');

ALTER TABLE `employee`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

CREATE TABLE `transaction`(
	`ID` INT PRIMARY KEY,
	`purchaseDate` DATE NOT NULL,
	`employeeID` INT REFERENCES Employee(ID),
	`paymentType` VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `transaction`
  ADD KEY `employeeID` (`employeeID`);
  
ALTER TABLE `transaction`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

CREATE TABLE `cartitem` (
	`productID` INT REFERENCES Product(ID),
	`quantity` INT
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE transactionitem (
	`transactionID` INT REFERENCES Transaction(ID),
	`productID` INT REFERENCES Product(ID),
	`quantity` INT
);

ALTER TABLE `transactionitem`
  ADD KEY `transactionID` (`transactionID`),
  ADD KEY `productID` (`productID`);

ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`id`);

ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`id`);
  
ALTER TABLE `transactionitem`
  ADD CONSTRAINT `transactionitem_ibfk_1` FOREIGN KEY (`transactionID`) REFERENCES `transaction` (`id`),
  ADD CONSTRAINT `transactionitem_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;