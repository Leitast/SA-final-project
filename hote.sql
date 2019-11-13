/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.38 : Database - ssm_hotel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_hotel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm_hotel`;

/*Table structure for table `dinner_table` */

DROP TABLE IF EXISTS `dinner_table`;

CREATE TABLE `dinner_table` (
  `dId` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(50) DEFAULT NULL,
  `tableStatus` int(11) DEFAULT '2',
  `orderTime` datetime DEFAULT NULL,
  PRIMARY KEY (`dId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `dinner_table` */

insert  into `dinner_table`(`dId`,`tableName`,`tableStatus`,`orderTime`) values (1,'纽约',2,'2019-10-16 22:41:08'),(2,'巴黎',1,'2019-10-17 17:01:51'),(3,'丹麦',2,'2018-07-09 10:30:49'),(4,'伦敦',2,'2018-07-09 10:30:49'),(5,'北京',2,'2019-10-21 12:48:48'),(6,'莫斯科',1,'2018-07-09 15:13:34'),(7,'首尔',2,'2018-07-09 10:30:49'),(29,'里约',1,'2018-07-15 17:23:21'),(30,'东京',2,'2018-07-15 17:25:48');

/*Table structure for table `food` */

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `fId` int(11) NOT NULL AUTO_INCREMENT,
  `foodName` varchar(20) DEFAULT NULL,
  `foodTypeId` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `mprice` double DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fId`) USING BTREE,
  KEY `fk_food_foodType_id` (`foodTypeId`) USING BTREE,
  CONSTRAINT `fk_food_foodType_id` FOREIGN KEY (`foodTypeId`) REFERENCES `food_type` (`ftypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `food` */

insert  into `food`(`fId`,`foodName`,`foodTypeId`,`price`,`mprice`,`remark`,`img`) values (1,'白切鸡',3,58,48.9,'白切鸡以滑嫩闻名，味道鲜美。它是一道色香味俱全的两广家常菜，享誉中外。','白切鸡.jpg'),(2,'剁椒鱼头',1,28.8,21.9,'以鱼头的“味鲜”和剁辣椒的“辣”为一体，肥而不腻、肉质细嫩、鲜辣适口，风味独具一格。','剁椒鱼头.jpg'),(3,'酱猪蹄',4,32.8,26.8,'猪蹄营养丰富，含多种胶原蛋白，经常食用，对人体具有养颜、抗衰老的保健作用，加之其具有极佳的适口性和独特的风味。','酱猪蹄.jpg'),(4,'烤乳猪',2,68.8,54.8,'色泽红润，形态完整，皮酥肉嫩，肥而不腻，又鲜又嫩，入口奇香。','烤乳猪.jpg'),(6,'水煮鱼',4,46.8,38.8,'水煮鱼，肉质口感滑嫩；满目的辣椒红亮养眼，辣而不燥，麻而不苦。“麻上头，辣过瘾”是其最大特点。','水煮鱼.jpg'),(7,'香锅肉丸',3,27.8,21.9,'香嫩可口。','香锅肉丸.jpg'),(8,'锅头肉',3,33.6,24.8,'肉的表皮色泽红艳鲜亮，灿如火烧。尝上一口，竟全无油腻之感，老卤炖制，咸淡适中，表皮香脆，肥少瘦多，肥肉糯滑，瘦肉细腻，没有一丝油腻，清香无比。','锅头肉.jpg'),(9,'安东子鸡',1,58.9,48.9,'造型美观，色泽鲜艳，鸡肉肥嫩异常，味道酸辣鲜香。','安东子鸡.jpg'),(10,'鱼香肉丝',4,48,39.9,'鱼香肉丝选料精细，成菜色泽红润、富鱼香味，吃起来具有咸甜酸辣兼备的特点，肉丝质地柔滑软嫩。是下饭菜的必选。','鱼香肉丝.jpg'),(11,'青椒炒肉',1,22.9,18.2,'主料是辣椒和猪肉，主要烹饪工艺是炒。香气四溢。','青椒炒肉.jpg'),(12,'永州血鸭',1,68,58.9,'吃血鸭，最好配冰啤酒。那简直是水火交融———直冲天灵盖的烈火被百丈瀑布浇熄了，轻烟袅袅，萦荡心头，真有说不尽的痛快淋漓。','永州血鸭.jpg'),(13,'白灼虾',2,46.8,38.9,'白灼虾以鲜虾通过白灼之法烹饪而成，虾鲜嫩，美味可口，食用功效有健脾养脾、养胃健胃、补血养血、补气益气、调理肠胃、滋阴补阴、开胃消食、清热去火、抗衰老、增强抵抗力。','白灼虾.jpg'),(14,'麻辣小龙虾',1,52,44.2,'虾肉内锌、碘、硒等微量元素的含量要高于其它食品，同时，它的肌纤维细嫩，易于消化吸收。麻辣口感十足。','麻辣小龙虾.jpg'),(15,'鲫鱼汤',2,54.5,46.8,'鲫鱼汤是一道以鲫鱼、豆腐、蘑菇等作为食材制作而成的汤，含有全面而优质的蛋白质，对肌肤的弹力纤维构成能起到很好的强化作用。尤其对压力、睡眠不足 等精神因素导致的早期皱纹，有奇特的缓解功效。','鲫鱼汤.jpg'),(23,'叉烧肉',3,26.8,21.4,'味甘咸、性平，入脾、胃、肾经；补肾养血，滋阴润燥；','叉烧肉.jpg');

/*Table structure for table `food_type` */

DROP TABLE IF EXISTS `food_type`;

CREATE TABLE `food_type` (
  `ftypeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ftypeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `food_type` */

insert  into `food_type`(`ftypeId`,`typeName`) values (1,'湘菜'),(2,'粤菜'),(3,'东北菜'),(4,'川菜'),(5,'苏菜');

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `odetailId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `foodId` int(11) DEFAULT NULL,
  `foodCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`odetailId`) USING BTREE,
  KEY `fk_orderDetail_order_id` (`orderId`) USING BTREE,
  KEY `fk_orderDetail_food_id` (`foodId`) USING BTREE,
  CONSTRAINT `fk_orderDetail_food_id` FOREIGN KEY (`foodId`) REFERENCES `food` (`fId`),
  CONSTRAINT `fk_orderDetail_order_id` FOREIGN KEY (`orderId`) REFERENCES `orders` (`oId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `order_detail` */

insert  into `order_detail`(`odetailId`,`orderId`,`foodId`,`foodCount`) values (1,1,3,1),(2,1,4,1),(3,2,8,1),(4,3,10,1),(5,3,15,1),(6,3,23,1),(7,3,7,2),(8,3,12,1),(9,4,8,2),(10,4,11,2),(11,4,14,1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oId` int(11) NOT NULL AUTO_INCREMENT,
  `tableId` int(11) DEFAULT NULL,
  `orderTime` datetime DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  `orderStatus` int(11) DEFAULT '1',
  PRIMARY KEY (`oId`) USING BTREE,
  KEY `fk_order_table_id` (`tableId`) USING BTREE,
  CONSTRAINT `fk_order_table_id` FOREIGN KEY (`tableId`) REFERENCES `dinner_table` (`dId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `orders` */

insert  into `orders`(`oId`,`tableId`,`orderTime`,`totalPrice`,`orderStatus`) values (1,5,'2019-10-16 21:13:12',586,1),(2,6,'2019-10-16 21:13:29',666,3),(3,2,'2019-10-17 17:02:02',10,2),(4,29,'2019-10-17 17:02:26',2,2),(5,3,NULL,20191022151959,0),(6,2,'2019-10-22 20:50:44',130.4,2),(7,3,'2019-10-23 09:20:47',95.2,2),(8,3,'2019-10-23 09:23:31',138.4,2);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `uId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `userPass` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `root` int(11) DEFAULT '0',
  PRIMARY KEY (`uId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tb_user` */

insert  into `tb_user`(`uId`,`userName`,`userPass`,`email`,`phone`,`root`) values (1,'tom','tom11','tom@qq.com','13177777777',0),(2,'jack','jack11','jack@qq.com','13188888888',0),(6,'123','123','didi@qq.com','13170362639',1),(7,'12','12','didi@qq.com','13170362639',0),(8,'66','66','12@qq.com','123123',0),(9,'test','1','11@qq.com','123123',0),(10,'test1','1','11@qq.com','123123',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
