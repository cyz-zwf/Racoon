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
      isIconTrue: true
    };
  },
  components: {
    // 注册子组件
    headerhbmove
  },
  methods: {
    changeIcons() {
      this.isIconTrue = !this.isIconTrue;
    }
  }
};
</script>

<style>
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
  width: 355px;
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
.n-activitybox {
  width: 355px;
}
</style>