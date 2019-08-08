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

/************首页主体图片****************/
CREATE TABLE racoon_index_section(
  hid INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(128),
  title VARCHAR(128), 
  subtitle VARCHAR(128), 
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


/************首页主体图片****************/
INSERT INTO racoon_index_section VALUES
(NULL,'img/fj-img/section/huanxiong.png',NULL,NULL,NULL),
(NULL,'img/fj-img/section/jingxuan_huodong.png',"查看更多",NULL,NULL),
(NULL,'img/fj-img/section/section11.jpg',NULL,NULL,NULL),
(NULL,'img/fj-img/section/section12.jpg',"个护主会场","99选15件起",NULL),
(NULL,'img/fj-img/section/section13.jpg',"会员福利","无门槛88折",NULL),
(NULL,'img/fj-img/section/section14.jpg',"洗发护发","熊野油脂洗发水29/瓶",NULL),
(NULL,'img/fj-img/section/section14.jpg',"身体护理","芭克修复膏228",NULL),
(NULL,'img/fj-img/section/section15.jpg',"洗护日用","小林液体创可贴42/盒",NULL),
(NULL,'img/fj-img/section/section16.jpg',"宠物生活","皇家狗粮23/kg",NULL),
(NULL,'img/fj-img/section/section17.jpg',"商家精选","舒客亮白牙贴11/组",NULL),
(NULL,'img/fj-img/section/section18.jpg',"大牌限时购","9.9元秒杀",NULL),
(NULL,'img/fj-img/section/section21.jpg',NULL,NULL,NULL),
(NULL,'img/fj-img/section/section22.jpg',"VERSACE COLLECTION","美杜莎腰带399",NULL),
(NULL,'img/fj-img/section/section23.jpg',"new balance","全场2.8折起",NULL),
(NULL,'img/fj-img/section/section24.jpg',"GIVENCHY 纪梵希","大牌平价三折清仓",NULL),
(NULL,'img/fj-img/section/section25.jpg',"Mark Fairwhale 马克华菲","牛仔裤低至75元",NULL),
(NULL,'img/fj-img/section/section26.jpg',"Hush Puppies 暇步士","爆款T恤低至39",NULL),
(NULL,'img/fj-img/section/section27.jpg',"sylphlike loli 暴走的萝莉","全场1.8折起",NULL),
(NULL,'img/fj-img/section/section28.jpg',"delsey  法国大使","全场低至1.5折起",NULL),
(NULL,'img/fj-img/section/section29.jpg',"wonderbra","超模文胸99元2件",NULL),
(NULL,'img/fj-img/section/section31.jpg',NULL,NULL,NULL),
(NULL,'img/fj-img/section/section32.jpg',"HERB健康本铺"," DOKKAN",NULL),
(NULL,'img/fj-img/section/section33.jpg',"ISDG  夜间","酵素232 1",NULL),
(NULL,'img/fj-img/section/section34.jpg',"【吸附油脂 辅助","纤体】Esth",NULL),
(NULL,'img/fj-img/section/section35.jpg',"【吴昕同款 逆龄","美肌】Esth",NULL),
(NULL,'img/fj-img/section/section36.jpg',"【美肤滋养】Tw","inLotus",NULL),
(NULL,'img/fj-img/section/section37.jpg',"Kinohimi","tsu 木之秘",NULL),
(NULL,'img/fj-img/section/section38.jpg',"PILLBOX ","onaka 葛",NULL),
(NULL,'img/fj-img/section/section39.jpg',"东阿阿胶 桃花姬"," 即食阿胶糕 ",NULL),
(NULL,'img/fj-img/section/section41.jpg',NULL,NULL,NULL),
(NULL,'img/fj-img/section/section42.jpg',"奢品超值预定","范思哲T恤3件699",NULL),
(NULL,'img/fj-img/section/section43.jpg',"奢品榜单","蔻驰爆款链包769起",NULL),
(NULL,'img/fj-img/section/section44.jpg',"轻奢潮包","love燕子包799起",NULL),
(NULL,'img/fj-img/section/section45.jpg',"重奢名包","Gucci印花包3444",NULL),
(NULL,'img/fj-img/section/section46.jpg',"服饰配件","虎头情侣款T恤599起",NULL),
(NULL,'img/fj-img/section/section47.jpg',"时尚鞋靴","双G皮革便鞋4199",NULL),
(NULL,'img/fj-img/section/section48.jpg',"奢品预付","蔻驰预付立减500",NULL),
(NULL,'img/fj-img/section/section49.jpg',"816预付精选","预付最高立减6000",NULL),
(NULL,'img/fj-img/section/section51.jpg',NULL,NULL,NULL),
(NULL,'img/fj-img/section/section52.jpg',"美妆粉丝节","娇韵诗双萃立减50",NULL),
(NULL,'img/fj-img/section/section53.jpg',"潮流彩妆礼","YSL黑鸦片428起",NULL),
(NULL,'img/fj-img/section/section54.jpg',"预付定金礼","后水妍预付立减110",NULL),
(NULL,'img/fj-img/section/section55.jpg',"会员粉丝礼","SK-II大红瓶789起",NULL),
(NULL,'img/fj-img/section/section61.jpg',NULL,NULL,NULL),
(NULL,'img/fj-img/section/section62.jpg',"会员专享","会员特价叠2件减60",NULL),
(NULL,'img/fj-img/section/section63.jpg',"施华洛世奇","经典天鹅项链368",NULL),
(NULL,'img/fj-img/section/section64.jpg',"816手表提前购","阿玛尼满天星买赠音响",NULL),
(NULL,'img/fj-img/section/section65.jpg',"眼镜烟具自营","Gucci倪妮同款1999",NULL),
(NULL,'img/fj-img/section/section66.jpg',"黄金珠宝","每满1000减150",NULL),
(NULL,'img/fj-img/section/section67.jpg',"新商家盛典","珠宝5折限量抢",NULL),
(NULL,'img/fj-img/section/section68.jpg',"臻爱礼遇","潘多拉低至5折起",NULL),
(NULL,'img/fj-img/section/section69.jpg',"卡西欧","部分满799减200",NULL);



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