SET NAMES UTF8;
DROP DATABASE IF EXISTS racoon;
CREATE DATABASE racoon  CHARSET=UTF8;
USE racoon;

/****用户登录****/
CREATE TABLE racoon_login(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(50),
    upwd VARCHAR(32)
);
INSERT INTO racoon_login VALUES 
(null,'aaa',md5('123')),
(null,'bbb',md5('456'));



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
(NULL,'img/fj-img/nav.png',NULL),
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
(null,951,"lamer-cream.webp",1999,"LA MER 海蓝之谜 精华乳霜 触手即化，轻若无物","60毫升",1,1),
(null,437,"gucci-perfume.webp",738,"GUCCI 古驰 花朵盛开淡香精 30毫升/50毫升/100毫升","50毫升",1,1),
(null,486,"lancome-lip.webp",259,"LANCOME 兰蔻 菁纯丝绒雾面哑光唇膏","#196",1,1),
(null,015,"pinko-bag.webp",1499,"PINKO 品高 MINI LOVE系列 女士铆钉装饰燕子包 斜挎包 迷你","黑色",1,1),
(null,350,"kiehls-cream.webp",359,"Kiehl's 科颜氏 高保湿面霜","125毫升",1,1),
(null,146,"switch.webp",2499,"任天堂（Nintendo）Switch 皮卡丘主题限定款便携掌上游戏机 Switch NS","黑色",1,1);


/*************为你推荐*************/
CREATE TABLE racoon_recommend(
  id INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,
  img_url VARCHAR(25),
  price DECIMAL(10,2),
  title VARCHAR(255)
);
INSERT INTO racoon_recommend VALUES
(null,563,"estee-water.webp",979,"ESTEE LAUDER 雅诗兰黛 小棕瓶面部精华 特润修护肌透精华露 100毫升"),
(null,564,"skii-bulb.webp",1469,"SK-II 肌因光蕴环采钻白精华露 50毫升 人称'小灯泡'的亮白神器"),
(null,565,"skii-red.webp",799,"SK-II 大红瓶面霜 R.N.A微肌因赋活修护精华霜 80g（滋润版）"),
(null,566,"gucci-bag.webp",11999,"GUCCI 古驰 GG Marmont系列 女士绗缝金属双G盖式链条单肩斜挎包 迷你款"),
(null,567,"sonyPlay.webp",3199,"Sony 索尼【PS4 Pro 国行游戏机】PlayStation 4 Pro 电脑娱乐游戏主机 2TB"),
(null,568,"ipsa.webp",719,"ipsa 茵芙莎流金水自律循环乳液水乳套装 补水保湿 美丽加乘"),
(null,569,"skii-mask.webp",769,"SK-II 前男友面膜 护肤面膜 10片装"),
(null,570,"ysl-lip.webp",183,"YSL圣罗兰 黑管唇釉 5.5毫升 #401 #402 #403 #404 #405 #406"),
(null,571,"lancome-black.webp",989,"LANCOME 兰蔻 小黑瓶精华肌底液 100毫升"),
(null,572,"tiffany-doudou.webp",5000,"TIFFANY & CO. 蒂芙尼 Bean豆豆 18K玫瑰金豆豆吊坠项链 情人节生日礼物"),
(null,247,"dior-perfume.webp",738,"Dior 迪奥 迪奥小姐花漾女士淡香水"),
(null,181,"skii-cream.webp",1069,"SK-II 青春露 护肤精华露（神仙水）"),
(null,951,"lamer-cream.webp",1999,"LA MER 海蓝之谜 精华乳霜 触手即化，轻若无物"),
(null,437,"gucci-perfume.webp",738,"GUCCI 古驰 花朵盛开淡香精 30毫升/50毫升/100毫升"),
(null,486,"lancome-lip.webp",259,"LANCOME 兰蔻 菁纯丝绒雾面哑光唇膏"),
(null,015,"pinko-bag.webp",1499,"PINKO 品高 MINI LOVE系列 女士铆钉装饰燕子包 斜挎包 迷你"),
(null,350,"kiehls-cream.webp",359,"Kiehl's 科颜氏 高保湿面霜"),
(null,146,"switch.webp",2499,"任天堂（Nintendo）Switch 皮卡丘主题限定款便携掌上游戏机 Switch NS");




/*************分页*************/
CREATE TABLE racoon_list(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(25),
  title VARCHAR(255)
);
INSERT INTO racoon_list VALUES
(null,"xs.webp","香水"),
(null,"xs.webp","香水"),
(null,"xs.webp","香水"),
(null,"xs.webp","香水"),
(null,"xs.webp","香水"),
(null,"xs.webp","香水"),
(null,"xs.webp","香水"),
(null,"xs.webp","香水"),
(null,"xs.webp","香水"),
(null,"xs.webp","香水"),
(null,"xs.webp","香水");