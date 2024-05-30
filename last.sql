SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `cart`;
DROP TABLE IF EXISTS `cart_product`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `order_product`;
DROP TABLE IF EXISTS `paymentmethod`;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `role` VARCHAR(255) DEFAULT 'USER' NOT NULL  ,
    `cartId` INTEGER NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `product` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `price` DOUBLE NOT NULL,
    `imageUrl` VARCHAR(255) NOT NULL,
    `categoryId` INTEGER NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `cart` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `cart_product` (
    `cartId` INTEGER NOT NULL,
    `productId` INTEGER NOT NULL,
    `quantity` INTEGER NOT NULL,
    PRIMARY KEY (`cartId`, `productId`)
);

CREATE TABLE `category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `order` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME NOT NULL,
    `userId` INTEGER NOT NULL,
    `paymentMethodId` INTEGER NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `totalPrice` DOUBLE NOT NULL,
    `status` VARCHAR(255) DEFAULT "BEKLIYOR",
    PRIMARY KEY (`id`)
);

CREATE TABLE `order_product` (
    `orderId` INTEGER NOT NULL,
    `productId` INTEGER NOT NULL,
    `quantity` INTEGER NOT NULL,
    PRIMARY KEY (`orderId`, `productId`)
);

CREATE TABLE `paymentmethod` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `methodName` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

ALTER TABLE `user` ADD FOREIGN KEY (`cartId`) REFERENCES `cart`(`id`);
ALTER TABLE `product` ADD FOREIGN KEY (`categoryId`) REFERENCES `category`(`id`);
ALTER TABLE `cart_product` ADD FOREIGN KEY (`cartId`) REFERENCES `cart`(`id`);
ALTER TABLE `cart_product` ADD FOREIGN KEY (`productId`) REFERENCES `product`(`id`);
ALTER TABLE `order` ADD FOREIGN KEY (`userId`) REFERENCES `user`(`id`);
ALTER TABLE `order` ADD FOREIGN KEY (`paymentMethodId`) REFERENCES `paymentmethod`(`id`);
ALTER TABLE `order_product` ADD FOREIGN KEY (`orderId`) REFERENCES `order`(`id`);
ALTER TABLE `order_product` ADD FOREIGN KEY (`productId`) REFERENCES `product`(`id`);

-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Insert data into `user`
INSERT INTO `user` (`name`, `email`, `password`, `role`, `cartId`) VALUES
('John Doe', 'john@example.com', 'password123', 'customer', 1),
('Jane Smith', 'jane@example.com', 'password456', 'customer', 2);

-- Insert data into `category`
INSERT INTO `category` (`name`) VALUES
('Elektronik'),
('Moda'),
('Ev'),
('Spor'),
('Kozmetik'),
('Süpermarket');

-- Insert data into `product`
INSERT INTO `product` (`name`, `price`, `imageUrl`, `categoryId`, `description`) VALUES
('Laptop', 999.99, 'laptop.jpg', 1, 'A high performance laptop.'),
('Smartphone', 499.99, 'smartphone.jpg', 1, 'A latest model smartphone.'),
('Novel', 19.99, 'novel.jpg', 2, 'A best-selling novel.'),
('T-shirt', 14.99, 'tshirt.jpg', 3, 'A comfortable cotton T-shirt.');

-- Insert data into `cart`
INSERT INTO `cart` VALUES (NULL);
INSERT INTO `cart` VALUES (NULL);

-- Insert data into `cart_product`
INSERT INTO `cart_product` (`cartId`, `productId`, `quantity`) VALUES
(1, 1, 1),
(1, 3, 2);

-- Insert data into `order`
INSERT INTO `order` (`createdAt`, `userId`, `paymentMethodId`, `address` , `totalPrice`) VALUES
('2023-01-01 10:00:00', 1, 1, '123 Main St', 360),
('2023-02-01 12:00:00', 2, 2, '456 Oak St',360);

-- Insert data into `order_product`
INSERT INTO `order_product` (`orderId`, `productId` , `quantity`) VALUES
(1, 1,5),
(1, 3,4);

-- Insert data into `paymentmethod`
INSERT INTO `paymentmethod` (`methodName`) VALUES
('Credit Card'),
('PayPal');

-- Enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
