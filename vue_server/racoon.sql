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
INSERT INTO racoon_index_product VALUE
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