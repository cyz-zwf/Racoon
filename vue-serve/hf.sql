SET NAMES UTF8;
DROP DATABASE IF EXISTS hf;
CREATE DATABASE hf  CHARSET=UTF8;
USE hf;


/****首页商品****/
CREATE TABLE hf_index_product(
  hid INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(128),
  href VARCHAR(128)
);




/******************/
/*****数据导入*****/
/******************/
/*****首页商品*****/
INSERT INTO hf_index_product VALUE
(NULL,'img/nav.webp',NULL),
(NULL,'img/head1.png',NULL),
(NULL,'img/head2.png',NULL),
(NULL,'img/head3.gif',NULL),
(NULL,'img/head4.png',NULL),
(NULL,'img/head5.png',NULL),
(NULL,'img/head6.png',NULL),
(NULL,'img/head7.png',NULL),
(NULL,'img/head8.png',NULL),
(NULL,'img/head9.png',NULL),
(NULL,'img/head10.png',NULL),
(NULL,'img/section1.gif',NULL),
(NULL,'img/section2.gif',NULL),
(NULL,'img/section3.gif',NULL),
(NULL,'img/section4.gif',NULL),
(NULL,'img/section5.gif',NULL),
(NULL,'img/section6.gif',NULL),
(NULL,'img/section7.png',NULL),
(NULL,'img/section8.webp',NULL),
(NULL,'img/section9.webp',NULL),
(NULL,'img/section10.webp',NULL),
(NULL,'img/section11.webp',NULL),
(NULL,'img/section12.webp',NULL),
(NULL,'img/section13.webp',NULL);