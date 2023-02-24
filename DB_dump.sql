CREATE DATABASE  IF NOT EXISTS `ds_assignment`;
USE `ds_assignment`;

CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES ('0aeb3ac9-14e5-4e8e-80ef-c9f34b56b29f','ana2@mail.com','ana','ana','$2a$10$Bs/dPU7hI1WPWSbw0UkoOOU8/jyrzASk8jPE8hB2/Ou5Lb2EHOktq','0772033587','ROLE_CUSTOMER','ana2'),('6608f4cd-7047-4b60-b77e-4f572ec2c501','ana4@email.com','ana4','ana4','$2a$10$gaSwpMzhOhwdej4SOG4aL.yKgbgb3NEwcpdI6roLKgOHptBWOVrUO','1234567890','ROLE_CUSTOMER','ana4'),('8b7f9bef-de22-41a3-ab40-6ab74d1c50af','ana@mail.com','ana','maria','$2a$10$AgqcF6dKdlHGqRV1Jy5xa.m9DdByXohAYtNIOegc4mCk7k0tXd4re','0772033587','ROLE_CUSTOMER','ana'),('9dae1153-a9fd-4955-b672-f574823f25cc','ana5@email.com','ana5','ana5','$2a$10$O4wb6AubpywJYwQqAasZVOqAU/y5jJzW6P/HwPB83ksiUA2EJfHcy',NULL,'ROLE_CUSTOMER','ana5'),('fa29cb1c-9811-4243-9c90-d65dcfcc68cd','admin@mail.com','admin','admin','$2a$10$xtVe0IMJD.Fy6p.v7.9f/eMB8iVXlkcmlLkSkn5xheFkcEW5.HWNu','0772033587','ROLE_ADMINISTRATOR','admin');
UNLOCK TABLES;

CREATE TABLE IF NOT EXISTS `address` (
  `id` varchar(255) NOT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `address` WRITE;
INSERT INTO `address` VALUES ('282159f6-967f-403a-b6eb-60b9ba4cce95','wtretet','ertet'),('34dad6e2-f1ea-408e-8d1f-85287eb03925','Str. Caracal',NULL),('395ced7a-687a-44dc-a67c-4ecf76dc661c','1111','1111'),('401af3b6-8fb1-4892-aeb6-5836fcec2d80','22','22'),('4ca8dd2b-7916-4c06-94c6-3d89842d10c6','Stra ','whatever'),('5f6e0905-a09e-4988-b9da-7ccbbb079f5a','Str. Caracal',NULL),('61967df3-ed64-423c-b234-3cc32a11a9af','23','32'),('666b5080-6e5a-466b-9fe8-93a4b4944cca','ana5','ewrw'),('8f22aeae-e1be-4cc9-bbc3-cf03ab44bda2','Str. Caracal',NULL),('b006e9e4-52b4-4ca8-9978-143192d4ee97','Str. Caracal',NULL),('ca682cfd-8b7b-4865-93ed-ff67647e8e54','Str. Caracal',NULL),('ff3af7c7-f5d4-400a-b271-4589571c9bb3','Str. Caracal',NULL);
UNLOCK TABLES;

CREATE TABLE IF NOT EXISTS `device` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `maximum_hourly_consumption` double DEFAULT NULL,
  `address_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrvigwiai0bkv1gmykxb4qkqae` (`address_id`),
  KEY `FKd5p2880363wxxqbnlhwwwe12k` (`user_id`),
  CONSTRAINT `FKd5p2880363wxxqbnlhwwwe12k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrvigwiai0bkv1gmykxb4qkqae` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `device` WRITE;
INSERT INTO `device` VALUES ('043d6d07-9f8f-4f22-b860-880f2adf5601','test test tese',333,'4ca8dd2b-7916-4c06-94c6-3d89842d10c6','fa29cb1c-9811-4243-9c90-d65dcfcc68cd'),('11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb','test edit',50,'282159f6-967f-403a-b6eb-60b9ba4cce95','8b7f9bef-de22-41a3-ab40-6ab74d1c50af'),('7ba204d8-543a-459b-b051-61d6ed440066','ere',333,'395ced7a-687a-44dc-a67c-4ecf76dc661c','fa29cb1c-9811-4243-9c90-d65dcfcc68cd');
UNLOCK TABLES;

CREATE TABLE IF NOT EXISTS `energy_consumption` (
  `id` varchar(255) NOT NULL,
  `energy_consumption` double DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `associated_device` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9ptpawk71yklwgyuie3kyqib3` (`associated_device`),
  CONSTRAINT `FK9ptpawk71yklwgyuie3kyqib3` FOREIGN KEY (`associated_device`) REFERENCES `device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `energy_consumption` WRITE;
INSERT INTO `energy_consumption` VALUES ('0ce4500c-5387-453e-8989-499e0a8b30e9',22,'2022-11-22 10:30:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb'),('1079f64b-e111-48de-846c-8144e1fcfe85',33,'2022-11-22 11:51:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb'),('3511ac15-1824-4eeb-a06f-e1341421ee4c',33,'2022-11-22 14:30:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb'),('5970c8f9-2672-4fb0-a118-74ce5700ec4f',22,'2022-11-22 18:50:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb'),('5fa6f0c5-4bdb-4b8e-8fd8-bf5fe886f45b',33,'2022-11-22 05:30:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb'),('76ee1eba-0dcc-41de-bdb2-707689dd3ca7',77,'2022-11-23 07:30:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb'),('85de26e6-9f8d-476e-af45-883b54911d7e',33,'2022-11-22 12:30:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb'),('980e0486-9412-474e-9f10-bd72efb73769',55,'2022-11-22 20:30:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb'),('c08dc610-4b21-4c5d-b81d-e7dbee03c91f',33,'2022-11-22 22:30:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb'),('d149d5bd-1dd8-46ab-b6fc-1b079bac2aea',11,'2022-11-22 01:30:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb'),('f2b49a18-0ce3-469e-b297-3f7eceabefa3',22,'2022-11-22 04:30:00.000000','11b5217b-a3fe-4d7f-b8fe-c90cb887fdfb');
UNLOCK TABLES;