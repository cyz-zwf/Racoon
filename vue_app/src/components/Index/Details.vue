<template>
  <div class="m-details">
    <header class="m-topnavwrap">
      <span class></span>
      <span>商品详情</span>
      <span class></span>
    </header>
    <div class="n-imgbox">
      <headerhbmove :msg="items"></headerhbmove>
    </div>
    <div class="n-price">
      <div class="n-price-left">
        <span>￥</span>
        <span>6699</span>
        <span>￥6188</span>
      </div>
      <div class="n-price-right">
        <div class="collect" @click="changeIcons">
          <!-- <span :class="isIconTrue?'now-span':'red-span' "></span> -->
          <span :class="isIconTrue?'icon-span gray-span':'icon-span red-span'"></span>
          <!-- <span class="red-span" v-else></span> -->
          <span>收藏</span>
        </div>
      </div>
    </div>
    <h4 class="n-title">HUAWEI 华为 MateBook X i5 13英寸 4G+256G深空灰</h4>
    <div class="n-tagbox">
      <div class="n-taginfo">
        <img src="http://127.0.0.1:5050/img/details/chinared.webp" />
        <span>中国品牌</span>
        <img src="http://127.0.0.1:5050/img/details/183cb.png" />
        <span>浣熊自营</span>
      </div>
    </div>
    <p class="v-sperate"></p>
    <ul class="n-activitybox">
      <li class="itm">
        <div class="name">请配送:</div>
        <div class="cnt">服务保障</div>
        <div class="v-linkicon"></div>
      </li>
      <li class="itm">
        <div class="name">配&nbsp;&nbsp;&nbsp;送:</div>
        <div class="cnt">
          <div class="addr">
            <p class="f-els-1">至太原市迎泽区</p>
            <div class="v-linkicon"></div>
          </div>
          <p class="f-els-2">20:30前完成支付，预计8月14日(周三)送达</p>
        </div>
      </li>
      <li class="itm">
        <div class="name">运&nbsp;&nbsp;&nbsp;费:</div>
        <div class="cnt">
          <p class="f-els-3">满88元免运费</p>
        </div>
        <div class="v-linkicon"></div>
      </li>
      <li class="itm">
        <div class="name">说&nbsp;&nbsp;&nbsp;明:</div>
        <div class="cnt">
          <div class="cnt-div">
            <ul class="descwrap">
              <li class="txt">假一赔十</li>
              <li class="txt">不支持7天无理由退货</li>
              <li class="txt">不可使用优惠卷</li>
              <li class="txt">自营国内仓发货</li>
              <li class="txt">会员96折</li>
            </ul>
          </div>
        </div>
        <div class="v-linkicon"></div>
      </li>
    </ul>
    <div class="m-listing"></div>
    <article class="m-buybar">
      <div class="skushow" v-show="isCart">
        <transition @before-enter="beforeEnter" @enter="enter" @after-enter="afterEnter">
          <div class="ball" v-show="ballFlag"></div>
        </transition>
        <div class="n-btnwrap">
          <router-link to class="customer-service a-all">客服</router-link>
          <router-link to class="customer-cart a-all">
            购物车
            <span class="cart-num-icon">1</span>
          </router-link>
          <router-link to class="customer-btn btn-1" @click.native="jumpNum">加入购物车</router-link>
          <router-link to class="customer-btn btn-2">立即购买</router-link>
        </div>
      </div>
      <!-- <div class="skushow-cart" v-show="!isCart">
        <div class="skushow-name">
          <span>数量</span>
          <span @click.native="jumpNum"></span>
        </div>
        <div class="prdbox">
          <img src="http://127.0.0.1:5050/img/details/v-img.webp" alt class="v-img" />
          <span class="v-price-span">￥6188</span>
        </div>
        <div class="cntbox">
          <div class="p-number">
            <p class="propname">数量</p>
            <div class="ctrnum-wrap">
              <span class="minus">
                <i class="num-icon minus-icon"></i>
              </span>
              <span class="infonum">
                <i class="num-icon minus-plus">1</i>
              </span>
              <span class="plus">
                <i class="num-icon plus-icon"></i>
              </span>
            </div>
          </div>
        </div>
        <div class="a-btn">
          <router-link to class="link-btn" @click.native="jumpNum">确认</router-link>
        </div>
      </div>-->
    </article>
  </div>
</template>
<script>
import headerhbmove from "./HeaderLbMove";
export default {
  data() {
    return {
      items: [
        {
          href: "http://google.com",
          url: "http://127.0.0.1:5050/img/details/a_1.jpg"
        },
        {
          href: "http://baidu.com",
          url: "http://127.0.0.1:5050/img/details/a1_2.webp"
        },
        {
          href: "http://baidu.com",
          url: "http://127.0.0.1:5050/img/details/a1_3.webp"
        },
        {
          href: "http://baidu.com",
          url: "http://127.0.0.1:5050/img/details/a1_4.webp"
        },
        {
          href: "http://baidu.com",
          url: "http://127.0.0.1:5050/img/details/a1_5.webp"
        },
        {
          href: "http://baidu.com",
          url: "http://127.0.0.1:5050/img/details/a1_6.png"
        }
      ],
      isIconTrue: true,
      ballFlag: false,
      isCart: true
    };
  },
  components: {
    // 注册子组件
    headerhbmove
  },
  methods: {
    changeIcons() {
      this.isIconTrue = !this.isIconTrue;
    },
    appBallShow() {
      this.ballFlag = !this.ballFlag;
    },
    beforeEnter(el) {
      el.style.transform = "translate3d(0px,0px,0px)";
    },
    enter(el, done) {
      el.offsetWidth;
      el.style.animation = "ball-in 1s";
      done();
    },
    afterEnter(el) {
      this.ballFlag = !this.ballFlag;
    },
    jumpNum() {
      //   this.isCart = !this.isCart;
      this.appBallShow();
    }
  }
};
</script>

<style>
* {
  margin: 0;
}
.m-details {
  position: relative;
}
.m-topnavwrap {
  display: flex;
  justify-content: space-between;
  position: fixed;
  width: 100%;
  top: 0px;
  height: 45px;
  background-color: #ddd;
  box-sizing: border-box;
  text-align: center;
  z-index: 100;
}
.m-topnavwrap span:first-child {
  background: url("../../assets/productall.png") no-repeat 0 8px;
}
.m-topnavwrap span:last-child {
  background: url("../../assets/productall.png") no-repeat -28px 8px;
}
.m-topnavwrap span:first-child,
.m-topnavwrap span:last-child {
  display: inline-block;
  width: 45px;
  height: 45px;
  margin-left: 0px;
  background-size: 200px;
}
.m-topnavwrap span:nth-child(2) {
  font-size: 22px;
  color: #333333;
  line-height: 45px;
}

/* 修改轮播图样式 */
.n-imgbox .headermore .mint-swipe {
  margin-top: 45px;
  height: 300px;
}
.n-imgbox .hederlb-img {
  width: 300px;
  height: 300px;
}
/* 修改标点样式 */
.n-imgbox .mint-swipe-indicator {
  opacity: 1;
}
.n-imgbox .mint-swipe-indicator.is-active {
  border: 1px solid #000;
}

.n-price {
  width: 100%;
  box-sizing: border-box;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.n-price-left {
  width: 85%;
  height: 50px;
  /* background-color: #ddd; */
  color: #e31436;
  display: flex;
  /* justify-content: space-between; */
  align-items: center;
}
.n-price-left span:first-child {
  font-size: 15px;
  margin-top: 6px;
}
.n-price-left span:nth-child(2) {
  font-size: 27px;
  font-weight: 700;
}
.n-price-left span:last-child {
  font-size: 13px;
  color: #999;
  margin: 9px 0 0 9px;
  text-decoration: line-through;
}

.n-price-right {
  width: 15%;
  height: 50px;
  /* background-color: #ddd; */
}
.n-price-right .collect {
  font-size: 9px;
  color: #666;
  text-decoration: none;
}

.collect .icon-span {
  display: block;
  width: 24px;
  height: 20px;
  margin: 0 auto;
  background: url("../../assets/productall.png") no-repeat;
  background-size: 200px;
  margin-top: 8px;
}
.collect .gray-span {
  background-position: -176px -128px;
}
.collect .red-span {
  background-position: -174px -173px;
}
.collect span:last-child {
  display: block;
  font-weight: 700;
  margin-top: 3px;
}

.m-details .n-title {
  display: block;
  width: 355px;
  font-size: 14px;
  color: #333;
  margin: 0 auto;
  padding-top: 12px;
  border-top: 1px solid #f0f0f0;
}

.n-tagbox {
  margin-top: 15px;
}
.n-tagbox .n-taginfo::after {
  content: "";
  display: block;
  clear: both;
}
.n-tagbox .n-taginfo {
  display: block;
  width: 345px;
  margin: 0 auto;
  padding: 10px 0 10px 10px;
  background-color: #f7f7f7;
}
.n-taginfo img {
  width: 16px;
  height: 16px;
  vertical-align: middle;
  float: left;
  margin-right: 5px;
}
.n-taginfo span {
  font-size: 12px;
  color: #666;
  float: left;
  margin-top: 3px;
  margin-right: 10px;
}
.m-details .v-sperate {
  display: block;
  width: 100%;
  height: 10px;
  background: #f1f1f1;
  margin: 0;
  margin-top: 10px;
}
.n-activitybox {
  width: 100%;
  list-style: none;
  box-sizing: border-box;
  padding: 0 10px;
}
.n-activitybox .itm {
  position: relative;
  font-size: 12px;
  color: #333;
  border-bottom: 1px solid #f0f0f0;
  padding: 9px 0;
}
.n-activitybox .itm::after {
  content: "";
  display: block;
  clear: both;
}
.n-activitybox .itm .name {
  height: 24px;
  line-height: 24px;
  font-size: 13px;
  float: left;
}
.n-activitybox .itm .cnt {
  float: left;
  line-height: 24px;
  margin-left: 5px;
}
.n-activitybox .itm .v-linkicon {
  position: absolute;
  width: 10px;
  height: 10px;
  top: 16px;
  right: 0px;
  background: url("../../assets/productall.png") no-repeat -64px -89px;
  background-size: 200px;
}
.f-els-1,
.f-els-2 {
  float: left;
}
.f-els-1::after,
.cnt .descwrap::after {
  content: "";
  display: block;
  clear: both;
}
.cnt .descwrap {
  list-style: none;
  padding: 0;
}
.cnt .descwrap .txt {
  position: relative;
  float: left;
  line-height: 22px;
  margin: 0 10px;
}
.cnt .descwrap .txt::after {
  position: absolute;
  top: 7px;
  left: -10px;
  content: "";
  display: block;
  width: 7px;
  height: 7px;
  border-radius: 50%;
  background-color: #ff8587;
}

.cnt-div {
  width: 284px;
  /* height: 67px; */
}

.m-details .m-buybar {
  position: fixed;
  bottom: 0;
  width: 100%;
  /* height: 50px; */
}

.m-buybar .n-btnwrap {
  width: 100%;
  height: 50px;
  background-color: #eee;
}
.m-listing {
  display: block;
  box-sizing: border-box;
  width: 100%;
  height: 300px;
  background: #999;
}
.n-btnwrap .a-all {
  display: block;
  float: left;
  height: 35px;
  line-height: 50px;
  text-decoration: none;
  color: #666;
  font-size: 12px;
  text-align: center;
  position: relative;
  margin-top: 15px;
  /* background-color: #e31436; */
}
.n-btnwrap .customer-service {
  width: 40px;
}
.n-btnwrap .customer-cart {
  width: 55px;
}
.n-btnwrap .a-all::after {
  content: "";
  display: block;
  width: 24px;
  height: 20px;
  position: absolute;
  top: -5px;
  left: 10px;
}
.cart-num-icon {
  position: absolute;
  top: -13px;
  right: 12px;
  display: block;
  min-width: 15px;
  height: 15px;
  border-radius: 50%;
  background: #f00;
  color: #fff;
  font-size: 12px;
  line-height: 15px;
  text-align: center;
}
.n-btnwrap .customer-service::after {
  background: url("http://127.0.0.1:5050/img/details/service.png") no-repeat;
  background-size: 20px;
}
.n-btnwrap .customer-cart::after {
  background: url("../../assets/productall.png") no-repeat -175px -34px;
  background-size: 200px;
  height: 22px;
}
.n-btnwrap .customer-btn {
  display: block;
  float: left;
  width: 140px;
  height: 50px;
  font-size: 15px;
  color: #fff;
  line-height: 50px;
  text-decoration: none;
  border-radius: 0px;
  box-sizing: border-box;
}
.n-btnwrap .btn-1 {
  background-color: #404040;
}
.n-btnwrap .btn-2 {
  background-image: linear-gradient(225deg, #ff3163 15%, red 85%);
}
.ball {
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background-color: #f00;
  position: absolute;
  z-index: 999;
  bottom: 19px;
  left: 156px;
  transform: translate3d(0, 0, 0);

  animation: ball-in 1s;
}

@keyframes ball-in {
  0% {
    transform: translate3d(0px, 0px, 0px);
  }
  10% {
    transform: translate3d(-5px, -10px, 0px);
  }
  20% {
    transform: translate3d(-8px, -20px, 0px);
  }
  30% {
    transform: translate3d(-10px, -30px, 0px);
  }
  30% {
    transform: translate3d(-12px, -40px, 0px);
  }
  40% {
    transform: translate3d(-14px, -50px, 0px);
  }
  50% {
    transform: translate3d(-16px, -70px, 0px);
  }
  60% {
    transform: translate3d(-40px, -50px, 0px);
  }
  70% {
    transform: translate3d(-50px, -40px, 0px);
  }
  80% {
    transform: translate3d(-55px, -30px, 0px);
  }
  90% {
    transform: translate3d(-60px, -20px, 0px);
  }
  100% {
    transform: translate3d(-88px, -15px, 0px);
  }
}

.m-buybar .skushow-cart {
  display: block;
  width: 100%;
  height: 395px;
  background-color: #fff;
}
.skushow-name {
  display: flex;
  box-sizing: border-box;
  height: 44px;
  justify-content: space-between;
  align-items: center;
  padding: 0 10px;
  background-color: #fcf9f8;
}
.skushow-name span:first-child {
  font-size: 14px;
  color: #000;
}
.skushow-name span:last-child {
  display: block;
  width: 35px;
  height: 35px;
  background: url("../../assets/productall.png") no-repeat -30px -98px;
  background-size: 200px;
  margin-right: -7px;
}
.skushow-cart .prdbox {
  padding: 10px 10px 0 10px;
}
.skushow-cart .prdbox::after {
  content: "";
  display: block;
  clear: both;
}
.prdbox .v-img {
  width: 75px;
  height: 75px;
  float: left;
}
.prdbox .v-price-span {
  display: block;
  font-size: 14px;
  color: #e31436;
  float: left;
}
.skushow-cart .cntbox {
  padding: 0 10px;
}
.p-number .propname {
  display: block;
  height: 40px;
  font-size: 14px;
  color: #999;
  line-height: 40px;
  text-align: left;
}
.p-number .ctrnum-wrap {
  text-align: left;
}
.ctrnum-wrap .minus,
.ctrnum-wrap .plus,
.ctrnum-wrap .infonum {
  display: inline-block;
  width: 35px;
  height: 30px;
  background: #fff;
  border: 1px solid #999;
  position: relative;
}
.ctrnum-wrap .minus {
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
}
.ctrnum-wrap .plus {
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
}
.ctrnum-wrap .infonum {
  border-left: 0px;
  border-right: 0px;
  font-size: 14px;
}
.ctrnum-wrap .num-icon {
  display: block;
  position: absolute;
  top: 8px;
  left: 10px;
  width: 14px;
  height: 14px;
}
.minus .minus-icon {
  background: url("http://127.0.0.1:5050/img/details/kkae.png") no-repeat;
  background-position: -83px -406px;
  background-size: 500px;
}
.plus .plus-icon {
  background: url("http://127.0.0.1:5050/img/details/kkae.png") no-repeat;
  background-position: -52px -406px;
  background-size: 500px;
}
.infonum .minus-plus {
  text-align: center;
  font-style: normal;
  font-weight: 700;
}

.a-btn .link-btn {
  display: block;
  width: 100%;
  height: 50px;
  box-sizing: border-box;
  color: #fff;
  text-decoration: none;
  font-size: 15px;
  background: #404040;
  text-align: center;
  line-height: 50px;
  margin-top: 133px;
}
</style>