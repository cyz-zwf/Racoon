SET NAMES UTF8;
DROP DATABASE IF EXISTS racoon;
CREATE DATABASE racoon  CHARSET=UTF8;
USE racoon;


/****首页商品****/
CREATE TABLE racoon_index_product(
  hid INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(128),
  href VARCHAR(128)
);




/******************/
/*****数据导入*****/
/******************/
/*****首页商品*****/
INSERT INTO racoon_index_product VALUES
(NULL,'img/fj-img/nav.webp',NULL),
(NULL,'img/fj-img/head1.png',NULL),
(NULL,'img/fj-img/head2.png',NULL),
(NULL,'img/fj-img/head3.gif',NULL),
(NULL,'img/fj-img/head4.png',NULL),
(NULL,'img/fj-img/head5.png',NULL),
(NULL,'img/fj-img/head6.png',NULL),
(NULL,'img/fj-img/head7.png',NULL),
(NULL,'img/fj-img/head8.png',NULL),
(NULL,'img/fj-img/head9.png',NULL),
(NULL,'img/fj-img/head10.png',NULL),
(NULL,'img/fj-img/section1.gif',NULL),
(NULL,'img/fj-img/section2.gif',NULL),
(NULL,'img/fj-img/section3.gif',NULL),
(NULL,'img/fj-img/section4.gif',NULL),
(NULL,'img/fj-img/section5.gif',NULL),
(NULL,'img/fj-img/section6.gif',NULL),
(NULL,'img/fj-img/section7.png',NULL),
(NULL,'img/fj-img/section8.png',NULL),
(NULL,'img/fj-img/section9.png',NULL),
(NULL,'img/fj-img/section10.png',NULL),
(NULL,'img/fj-img/section11.png',NULL),
(NULL,'img/fj-img/section8.webp',NULL),
(NULL,'img/fj-img/section9.webp',NULL),
(NULL,'img/fj-img/section10.webp',NULL),
(NULL,'img/fj-img/section11.webp',NULL),
(NULL,'img/fj-img/section12.webp',NULL),
(NULL,'img/fj-img/section13.webp',NULL),
(NULL,'img/fj-img/section14.webp',NULL),
(NULL,'img/fj-img/section15.webp',NULL),
(NULL,'img/fj-img/section7.gif',NULL),
(NULL,'img/fj-img/section16.webp',NULL),
(NULL,'img/fj-img/section17.webp',NULL),
(NULL,'img/fj-img/section18.webp',NULL),
(NULL,'img/fj-img/section19.webp',NULL),
(NULL,'img/fj-img/section20.webp',NULL),
(NULL,'img/fj-img/section21.webp',NULL),
(NULL,'img/fj-img/section21.webp',NULL),
(NULL,'img/fj-img/section8.gif',NULL),
(NULL,'img/fj-img/section9.gif',NULL),
(NULL,'img/fj-img/section10.gif',NULL),
(NULL,'img/fj-img/section22.webp',NULL);





/*************购物车*************/
CREATE TABLE racoon_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,
  img_url VARCHAR(25),
  price DECIMAL(10,2),
  title VARCHAR(255),
  spec VARCHAR(25),
  count INT,
  uid INT
);
INSERT INTO racoon_cart VALUES
(null,247,"dior-perfume.webp",738,"Dior 迪奥 迪奥小姐花漾女士淡香水","100毫升",1,1),
(null,181,"skii-cream.webp",1069,"SK-II 青春露 护肤精华露（神仙水）","230毫升",1,1),
(null,951,"lamer-cream.webp",1999,"LA MER 海蓝之谜 精华乳霜","60毫升",1,1),
(null,437,"gucci-perfume.webp",738,"GUCCI 古驰 花朵盛开淡香精","50毫升",1,1),
(null,486,"lancome-lip.webp",259,"LANCÔME 兰蔻 菁纯丝绒雾面哑光唇膏","#196",1,1),
(null,015,"pinko-bag.webp",1499,"PINKO 品高 MINI LOVE系列 女士铆钉装饰燕子包 斜挎包 迷你","黑色",1,1),
(null,350,"kiehls-cream.webp",359,"Kiehl's 科颜氏 高保湿面霜","125毫升",1,1),
(null,146,"switch.webp",2499,"任天堂（Nintendo）Switch 皮卡丘主题限定款便携掌上游戏机 Switch NS","黑色",1,1);