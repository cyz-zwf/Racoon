<template>
  <div class="headermore">
    <mt-swipe :auto="3000">
      <mt-swipe-item v-for="(item,i) of msg" :key="i">
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
    return {};
  },
  props: {
    msg: {
      type: Array,
      default: function() {
        return [
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
        ];
      }
    }
  }
};
</script>

<style>
@import url("../../assets/css/headerlb.css");
</style>