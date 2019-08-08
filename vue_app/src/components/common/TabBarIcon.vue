<template>
  <div>
    <!-- 底部导航图片组件 -->
    <img :src="focused? selectedImage : normalImage" alt class="imgstyle" />
  </div>
</template>
<script>
export default {
  props: {
    focused: false,
    selectedImage: { default: "" },
    normalImage: { default: "" }
  }
};
</script>
<style>
.imgstyle {
  width: 25px;
  height: 25px;
}
.mint-tabbar.is-fixed {
  width: 100%;
  border-top: 1px solid #e5e5e5;
}
</style>