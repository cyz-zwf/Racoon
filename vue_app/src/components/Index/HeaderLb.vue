<template>
  <div class="headerlb">
    <div class="header-search">
      <div class="header-input">
        <span class="header-span-search"></span>
        <span class="header-span-info">七夕日,爱的日</span>
      </div>
      <mt-button size="small" plain class="header-btn">登录</mt-button>
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
      ]
    };
  }
};
</script>

<style>
@import url("../../assets/css/headerlb.css");
</style>