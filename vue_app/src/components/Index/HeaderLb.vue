<template>
  <div class="headerlb">
    <div class="header-search">
      <div class="header-input">
        <span class="header-span-search"></span>
        <span class="header-span-info">七夕日,爱的日</span>
      </div>
      <div>
        <mt-button size="small" plain class="header-btn" @click="loginIn" :style="loginBtn">登录</mt-button>
        <i class="login-su" :style="loginIcon" @click="myhuanxiong"></i>
      </div>
      <!-- 购物车a链接 -->
      <a href="javascript:;" class="header-cart-a"></a>
    </div>

    <mt-swipe :auto="3000">
      <mt-swipe-item v-for="(item,i) of items" :key="i">
        <a :href="item.href">
          <img :src="item.url" class="hederlb-img" />
        </a>
      </mt-swipe-item>
    </mt-swipe>
  </div>
</template>

<script>
import { Swipe, SwipeItem } from "mint-ui";
import "mint-ui/lib/style.css";
export default {
  components: {
    "mt-swipe": Swipe,
    "mt-swipe-item": SwipeItem
  },
  data() {
    return {
      items: [
        {
          href: "http://google.com",
          url: "http://127.0.0.1:5050/img/haderimg/f2.webp"
        },
        {
          href: "http://baidu.com",
          url: "http://127.0.0.1:5050/img/haderimg/f3.webp"
        },
        {
          href: "http://baidu.com",
          url: "http://127.0.0.1:5050/img/haderimg/f4.webp"
        },
        {
          href: "http://baidu.com",
          url: "http://127.0.0.1:5050/img/haderimg/f5.webp"
        },
        {
          href: "http://baidu.com",
          url: "http://127.0.0.1:5050/img/haderimg/f6.webp"
        }
      ],
      loginBtn: { display: "block" },
      loginIcon: { display: "none" }
    };
  },
  methods: {
    loginIn() {
      this.$router.push("/Login");
    },
    loadMoreLogin(e) {
      // 发送ajax请求session数据
      this.axios.get("sessinfo").then(result => {
        // this.uname = result.data;
        if (result.data.code == 1) {
          this.loginBtn.display = "none";
          this.loginIcon.display = "block";
        } else {
          this.loginBtn.display = "block";
          this.loginIcon.display = "none";
        }
      });
    },
    // 跳转我的主页
    myhuanxiong() {
      this.$router.push("/MyRacoon");
    }
  },
  created() {
    this.loadMoreLogin();
  },
  mounted() {
    // 关闭浏览器窗口的时候清空浏览器缓存在localStorage的数据
    // window.onbeforeunload = function(e) {
    //   var storage = window.localStorage;
    //   storage.clear();
    // };
  }
};
</script>

<style>
@import url("../../assets/css/headerlb.css");
</style>