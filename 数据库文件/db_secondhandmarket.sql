/*
SQLyog Ultimate v12.2.6 (64 bit)
MySQL - 5.5.53 : Database - squirrel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`squirrel` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `squirrel`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL COMMENT '账号',
  `phone` bigint(25) NOT NULL,
  `password` varchar(25) NOT NULL COMMENT '密码',
  `userRole` varchar(25) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`phone`,`password`,`userRole`) values 
(1,'智慧点点',15211111111,'111111','超级管理员');

/*Table structure for table `catelog` */

DROP TABLE IF EXISTS `catelog`;

CREATE TABLE `catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '分类名',
  `number` int(11) DEFAULT '0' COMMENT '该分类下的商品数量',
  `status` tinyint(10) DEFAULT '0' COMMENT '分类状态，0正常，1暂用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `catelog` */

insert  into `catelog`(`id`,`name`,`number`,`status`) values 
(1,'闲置数码',12,1),
(2,'校园代步',4,1),
(3,'电器日用',8,1),
(4,'图书教材',9,1),
(5,'美妆衣物',11,1),
(6,'运动棋牌',5,1),
(7,'票券小物',5,1);

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

/*Data for the table `comments` */

insert  into `comments`(`id`,`user_id`,`goods_id`,`content`,`create_at`) values 
(127,1,107,'太难了','2020-03-12 04:45:11'),
(131,30,6,'东西怎么样啊','2020-04-13 09:56:25');

/*Table structure for table `focus` */

DROP TABLE IF EXISTS `focus`;

CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '外键 商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '外键 用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `focus` */

insert  into `focus`(`id`,`goods_id`,`user_id`) values 
(1,77,5),
(4,94,4),
(5,94,4),
(6,94,4),
(8,90,9),
(9,90,22),
(18,5,23),
(19,85,23),
(20,107,1),
(33,115,25),
(34,106,25),
(35,103,25),
(36,11,25),
(37,116,25),
(38,115,26),
(39,106,27),
(40,6,30),
(41,8,2);

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `catelog_id` int(11) DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` float(11,2) DEFAULT NULL COMMENT '出售价格',
  `real_price` float(11,2) DEFAULT NULL COMMENT '真实价格',
  `start_time` varchar(25) DEFAULT NULL COMMENT '发布时间',
  `polish_time` varchar(30) DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` varchar(25) DEFAULT NULL COMMENT '下架时间',
  `describle` text COMMENT '详细信息',
  `status` int(11) DEFAULT '1' COMMENT '状态 上架1 下架0',
  PRIMARY KEY (`id`),
  KEY `catelog_id` (`catelog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`catelog_id`,`user_id`,`name`,`price`,`real_price`,`start_time`,`polish_time`,`end_time`,`describle`,`status`) values 
(1,6,1,'精美吉他',130.00,160.00,'2019-05-13','2019-05-13','2019-05-23','自用二手吉他，9成新，低价出售，有意者联系。',1),
(2,2,1,'山地车',1520.00,890.00,'2019-05-13','2019-05-13','2019-05-23','八成新山地车，无损坏，喜欢Call我。',1),
(3,3,1,'无线鼠标',23.00,48.00,'2019-05-13','2019-05-13','2019-05-23','罗技无线鼠标，自用一个月，9成新，手感好，反应灵敏。',1),
(5,1,2,'数码相机',580.00,1350.00,'2019-05-14','2019-05-14','2019-05-24','自用的数码相机，一年前购买，非常爱好，无磕碰。可议价。',0),
(6,1,2,'笔记本电脑',690.00,2300.00,'2019-05-14','2019-05-14','2019-05-24','7成新14寸笔记本电脑，商务本，适合办公，2G内存。',0),
(7,3,2,'收纳盒',15.00,36.00,'2019-05-14','2019-05-14','2019-05-24','3层塑料物品收纳盒，毕业了，低价出售。',0),
(8,3,1,'台灯',32.00,58.00,'2019-05-14','2019-05-14','2019-05-24','考研时购买的台灯，可插USB接口。',1),
(9,5,2,'女鞋',35.00,86.00,'2017-05-14','2019-05-14','2019-05-24','学生女鞋',0),
(11,1,3,'无线传呼机',230.00,370.00,'2017-05-14','2019-04-14','2019-05-24','一对无线传呼机，带有充电器，可以传呼2公里。',1),
(12,1,3,'手提女包',36.00,89.00,'2017-05-14','2019-04-14','2019-05-24','手提女包，自用了几天。',1),
(13,5,1,'手提包',15.00,23.00,'2017-05-14','2019-05-14','2019-05-24','自用手提包，8成新，便宜出。',1),
(16,6,2,'耐克运动书包',56.00,198.00,'2017-05-14','2019-05-14','2019-05-24','去年年底购买的耐克书包，8成新，无损坏，可以装电脑，很漂亮，有意者联系。',1),
(17,4,2,'二手小说',10.00,65.00,'2017-05-14','2019-05-14','2019-05-24','毕业季，一书架小说，便宜出售。',1),
(18,4,2,'公务员考试资料',35.00,79.00,'2017-05-14','2019-05-14','2019-05-24','刚刚考完公务员的复习资料。淘宝购买，低价出售。',1),
(78,1,3,'大学生用计算器。',10.00,15.00,'2019-04-14','2019-04-14','2019-04-24','用一两次过，但没怎么用过。基本全新的',0),
(79,1,3,'出HTC M9ET 3+32G',1500.00,2888.00,'2019-04-14','2019-04-14','2019-04-24','自用，自认为九成新，除了边角磕碰，其他都好，无暗病',1),
(94,3,1,'烧水壶',22.00,50.00,'2019-04-14','2019-04-14','2019-04-24','烧水壶功能一切都好，请放心使用',1),
(95,3,1,'桌面吸尘器',28.00,59.00,'2019-04-14','2019-04-14','2019-04-24','桌面吸尘器，可以清洁键盘、吸纸屑、头发、灰尘，有蓝色和白色两款',1),
(96,7,3,'纯手工绘画，来图定制，提供绘画过程图，追女友神器',108.00,NULL,'2019-04-14','2019-04-14','2019-04-24','纯手工绘画，来图定制，提供绘画过程，实木相框装裱，A4大小与12寸，64801606',1),
(121,1,30,'二手笔记本',1000.00,1200.00,'2020-04-13','2020-04-13','2020-04-23','东西很赞',1);

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `goods_id` int(11) NOT NULL COMMENT '商品外键',
  `img_url` text NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

/*Data for the table `image` */

insert  into `image`(`id`,`goods_id`,`img_url`) values 
(1,1,'nopic1.png'),
(2,2,'nopic2.png'),
(3,3,'nopic3.png'),
(4,4,'nopic4.png'),
(5,5,'nopic5.png'),
(6,6,'nopic6.png'),
(7,7,'nopic7.png'),
(8,8,'nopic8.png'),
(9,9,'nopic9.png'),
(11,11,'nopic11.png'),
(12,12,'nopic12.png'),
(13,13,'nopic13.png'),
(16,16,'nopic16.png'),
(17,17,'nopic17.png'),
(18,18,'nopic18.png'),
(20,20,'nopic20.png'),
(21,77,'4f320b75-427a-484e-b725-a2f5d066af6f.jpg'),
(78,78,'599629aa-9440-435c-8185-42e34a862470.jpg'),
(79,79,'266abea1-a202-47f2-b5c4-095e96c10473.jpg'),
(80,80,'4d472617-d430-4540-a510-f7606861dde0.jpg'),
(81,81,'e62acc43-8122-421a-940b-a68e6aeadd30.jpg'),
(82,82,'67a5f2ee-a09a-488d-9e7a-87ac6d8ab9c4.jpg'),
(83,83,'110456d4-cc20-4fe2-b0a6-217b023d7dd6.jpg'),
(84,84,'499afa59-53bc-4d23-99ef-5d0f9d60de69.jpg'),
(85,85,'23f242e3-6dbf-4d46-a1b2-a620918908d9.jpg'),
(86,86,'ae1097a5-736d-4850-9552-b5901ad6d84b.jpg'),
(87,87,'95daa308-8011-4e0c-b5bd-8cd151830c32.jpg'),
(88,88,'5c212d57-d8a4-4cc0-8853-dba957fba3d5.jpg'),
(89,89,'ec5369f6-7c87-43db-98aa-112efa91c8c6.JPG'),
(90,90,'fd680315-9ac8-4268-803e-7da7b492e8b0.JPG'),
(91,91,'455e9ee5-92a7-4c7c-aa94-55f4373a16ee.JPG'),
(92,92,'33434fa2-8bf3-4fbc-b1d9-d1e67202e2f2.jpg'),
(93,93,'dc4f9591-bd1a-4eac-b1ea-be6412296fb6.png'),
(94,94,'7eb89aaa-56c0-4283-893f-bd5718301d80.jpg'),
(95,95,'6664b320-87d4-4d37-b14f-fc5dba41f529.PNG'),
(96,96,'451c3aa2-529d-449d-b69f-b8771af1d806.jpg'),
(97,97,'ee6e735c-6479-40bb-b45f-69888c42862e.jpg'),
(98,98,'2f92136b-af5b-45f4-902d-7bb1d0ad0809.png'),
(99,99,'022fe88a-5328-4b42-8333-10b782d39373.png'),
(100,100,'a1f11b39-490b-42ef-a8e1-44285c4a80d4.png'),
(101,101,'0f022547-b2cb-45fe-ab86-fb8b6d70adbc.jpg'),
(102,102,''),
(103,103,'b0933eb3-1ccb-43e1-80a4-1d50902916db.jpg'),
(104,104,''),
(105,105,'504d47df-32b0-4195-b63c-10d1562896cc.jpg'),
(106,106,'a634ca2b-70cc-404d-95cb-fc4166fe6706.jpg'),
(107,107,'1ba8f318-fbf3-42f6-b8d9-0baa7e678cec.jpg'),
(108,108,'afd57674-338c-414f-98ae-78e0d25b12f8.jpg'),
(109,109,'330a9a46-6434-4d04-a72b-a91a14035229.jpg'),
(110,110,'0583cb1e-6acd-46da-bebc-4a9f1d6c3ac7.jpg'),
(111,111,'ce18c0f4-dc10-454e-9791-e1992164a384.jpg'),
(112,112,'854dff80-d049-4381-ae40-d1d23cd0e88b.jpg'),
(113,113,''),
(114,114,''),
(115,115,'d75711a2-ce0d-487b-afc7-49fe94e75c54.jpg'),
(116,116,'f0983943-2dea-4a19-a96f-989d6ee70780.png'),
(117,117,'26e50470-05c1-4c6d-9f84-591889776f80.jpg'),
(118,118,''),
(119,119,'1991a008-3074-4756-aa45-1149f054e533.jpg'),
(120,120,'d2e85138-2a09-4af9-9671-d51c7b76fbb6.jpg'),
(121,121,'f930c7e0-fdff-46d7-bd52-1bc7c7d1c2fc.jpg');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统信息主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `context` text COMMENT '信息内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '推送信息时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0未读，1已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `order_num` bigint(25) DEFAULT NULL COMMENT '订单编号',
  `order_price` float(11,0) DEFAULT NULL COMMENT '订单价格',
  `order_state` int(11) DEFAULT '1' COMMENT '订单状态 1待发货 2待收货 3已完成',
  `order_information` varchar(50) DEFAULT NULL,
  `order_date` varchar(50) DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`user_id`,`goods_id`,`order_num`,`order_price`,`order_state`,`order_information`,`order_date`) values 
(14,30,6,85060023,690,3,'1000-690','2020-04-13 09:57:43');

/*Table structure for table `purse` */

DROP TABLE IF EXISTS `purse`;

CREATE TABLE `purse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钱包id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `balance` float(11,0) unsigned zerofill DEFAULT '00000000000' COMMENT '总钱数',
  `recharge` float(11,0) DEFAULT NULL COMMENT '充值钱数',
  `withdrawals` float(11,0) DEFAULT NULL COMMENT '提现钱数',
  `state` int(11) DEFAULT NULL COMMENT '状态 0未审核   已审核（1不通过 2通过）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `purse` */

insert  into `purse`(`id`,`user_id`,`balance`,`recharge`,`withdrawals`,`state`) values 
(25,30,00000000310,NULL,NULL,2);

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `atuser_id` int(11) DEFAULT NULL,
  `commet_id` int(11) DEFAULT NULL COMMENT '评论，外键',
  `content` text COMMENT '回复内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reply` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '即时通讯',
  `create_at` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) DEFAULT '0' COMMENT '发布过的物品数量',
  `power` int(10) unsigned zerofill DEFAULT '0000000100' COMMENT '信用分，普通用户默认为100',
  `last_login` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '账号是否冻结，默认0未冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`phone`,`username`,`password`,`QQ`,`create_at`,`goods_num`,`power`,`last_login`,`status`) values 
(1,'15211111111','user1','8B119459242727E19DBE572ED4710019','1420527913','2020-05-09 02:15',3,0000000100,NULL,1),
(2,'15222222222','user2','E10ADC3949BA59ABBE56E057F20F883E','1420527913','2020-01-10 10:30',2,0000000100,NULL,1),
(3,'15233333333','user3','C4CA4238A0B923820DCC509A6F75849B','1420527913','2020-05-17 10:35',2,0000000100,NULL,1),
(30,'15244444444','用户4','E10ADC3949BA59ABBE56E057F20F883E',NULL,'2020-04-13 21:54',1,0000000100,NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
