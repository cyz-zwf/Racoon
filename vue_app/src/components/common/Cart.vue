<template>
  <div>
    <!-- Cart.vue组件 -->
    <header class="top_nav">
      <div class="">
        <span class="top_title">
          <span>购物车</span>
        </span>
        <div class="top_btn">
          <router-link to="/Message" title="消息中心" class="toMsg"></router-link>
        </div>
      </div>
    </header>
  </div>
</template>
<script>
export default {
  
}
</script>
<style scoped>
.top_nav{
  width: 100%;
  height: 48px;
  display: fiex;
  position: fixed;
}
</style>
